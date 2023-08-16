package com.smart.home.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.BoardsDTO;
import com.smart.home.dto.BoardsFileDTO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.service.BoardsService;

@Controller
@RequestMapping("/boards")
public class BoardsController {
   @Autowired
   BoardsService service;
private BoardsFileDTO[] fileList;
   //글 목록
   @GetMapping("/boardsList")
   public String boardsList(Model model, PagingDTO pDTO) {
      //db레코드 선택하여 model에 셋팅
      pDTO.setTotalRecord(service.totalRecord(pDTO));
     
      
     model.addAttribute("list", service.getBoardsList(pDTO));
     model.addAttribute("pDTO",pDTO);
      return "boards/boardsList";
   }
   //글 등록 폼
   @GetMapping("/boardsWrite")
   public String boardsWrite() {
      return "boards/boardsWrite";
   }
   
   //글 등록 DB에
   @PostMapping("/boardsWriteOk")
   public ModelAndView boardsWriteOk(HttpServletRequest request, BoardsDTO dto) {
   //파일을 업로드 할 경로 / 업로드의 실제 주소(절대경로)
      String path=request.getSession().getServletContext().getRealPath("/upload");
       System.out.println("path->"+path);
       
       //dto -> 제목, 글 내용, session 에서 글쓴이
       // no -> 시퀀스, hit, writedate -> default값
       dto.setUserId((String)request.getSession().getAttribute("logId"));
       //---------------------------------파일업로드--------------------------
       //1. 파일업로드를 위해서는 request 객체들 multipartRequest 객체로 형변환다.
       MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
       //2. MulitpartFile 객체를 얻어오기
       List<MultipartFile> fileList = mr.getFiles("filename");
       System.out.println("fileList.size()->"+fileList.size());
       //첨부 파일이 있을 때 
       
       //업로드한 파일들을 보관할 컬렉션 
       List<BoardsFileDTO> upFileList = new ArrayList<BoardsFileDTO>();
       
       if(fileList!=null) {//첨부파일이 있을 때 if 1
          for(int i=0; i<fileList.size(); i++){//첨부 파일 수만큼 반복 수행//첨부 파일 수만큼 반복 수행
             MultipartFile mf=fileList.get(i);//첨부된 MulitipartFile 객체 얻어오기 
          
             String orgFileName=mf.getOriginalFilename();//파일명 얻어오기
             System.out.println("orgFileName->"+orgFileName);
             
             if(orgFileName!=null && !orgFileName.equals("")) {//업로드한 파일이 있으면 if 2
                File f=new File(path,orgFileName);
                if(f.exists()) {//true이면 파일이 존재, false이면 파일이 존재하지않는다.
                   //파일명 변경 
                   int point=orgFileName.lastIndexOf(".");//파일명과 확장자 분리 
                   String orgFile=orgFileName.substring(0,point);
                   String orgExt=orgFileName.substring(point+1);
                   
                   for(int renameNum=1; ;renameNum++) {//1,2,3,4,5....
                      String newFileName=orgFile + "("+renameNum+")."+orgExt;
                      f = new File(path, newFileName);//파일이 없을 대까지 만든다. 
                      if(!f.exists()) {//없을 때 
                         //새로 만들어진 파일명을 업로드할 때 사용하여야 하므로 
                         orgFileName=newFileName;
                         break;//반복 중지 
                      }
                   }//for
                   
                }
                //업로드 수행
                try {
                mf.transferTo(new File(path,orgFileName));
                }catch(Exception e) {
                e.printStackTrace();
                }
                System.out.println("업로드 된 파일명 : " + orgFileName);
                BoardsFileDTO upFileDTO = new BoardsFileDTO();
                upFileDTO.setFilename(orgFileName);
                upFileList.add(upFileDTO);
             }//if 2
          }//for 1
       }//if 1
       ModelAndView mav=new ModelAndView();
       try {
       //=========DB처리==================================================================================
       //원글 insert 수행 ▶ 생성된 시퀀스 번호를 결과로 받아야 파일명을 DB에 추가할 때 사용해야 한다. 
       int result=service.boardsInsert(dto);
       //파일명이 있는 DTO에 원글번호를 추가
       for(int i=0; i<upFileList.size(); i++) {
          upFileList.get(i).setBoardsNo(dto.getBoardsNo());
          
       }
          //파일명 DB insert
          int resultFile=service.boardsFileInsert(upFileList);
          
          //정상구현
          mav.setViewName("redirect:boardsList");
       }catch(Exception e) {
          e.printStackTrace();
          //원글 지우기(dto.no)
          service.boardsDelete(dto.getBoardsNo(),dto.getUserId());
          //파일명(DB) 지우기(dto.no)
          service.boardsFileDelete(dto.getBoardsNo());
          //파일 삭제(upFileList)
          for(int i=0; i<upFileList.size(); i++) {
             fileDelete(path,upFileList.get(i).getFilename());
          }
          //실패
          mav.setViewName("boards/boardsResult");
       }

      
      return mav;
   }
   // 게시판 글내용보기
   @GetMapping("/boardsView/{boardsNo}")
   public ModelAndView boardsView(@PathVariable("boardsNo") int boardsNo) {
      ModelAndView mav = new ModelAndView();
      // 조회수
      service.hitCount(boardsNo);
      // 해당 글선택
      mav.addObject("dto", service.boardsSelect(boardsNo));
      // 해당글의 첨부파일 선택 
      mav.addObject("fileList", service.boardsFileSelect(boardsNo));
      // 뷰페이지 
      mav.setViewName("boards/boardsView");
      return mav; 
   }
   
   //자료실 글수정 폼
   @GetMapping("/boardsEdit")
   public ModelAndView boardsEdit(int boardsNo) {
      ModelAndView mav = new ModelAndView();
      //현재글
      mav.addObject("dto", service.boardsSelect(boardsNo));
      //첨부파일선택
      mav.addObject("fileList", service.boardsFileSelect(boardsNo));
      
      mav.setViewName("boards/boardsEdit");
      return mav;
   }
   //자료실 글 수정하기 
   @PostMapping("/boardsEditOk") //no, subject, content, filename, delFile
   public ModelAndView boardsEditOk(BoardsDTO dto, HttpSession session, HttpServletRequest request) {
      
      //1. 기존에 업로드된 파일목록 DB에서 가져오기 
      List<BoardsFileDTO> orgFileList = service.boardsFileSelect(dto.getBoardsNo());
     
      
      //2. 저장위치
      String path = session.getServletContext().getRealPath("/upload");//저장 위치
      
      //3. 새로 추가한 파일업로드하기 -> MultipartHttpServletRequest(request 객체)
     MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
      
     //4. 업로드된 파일(MultipartFile)목록
      List<MultipartFile> fileList = mr.getFiles("filename");
      
      //새로업로드한 파일명들
      List<BoardsFileDTO> newFileList = new ArrayList<BoardsFileDTO>();
      
     //5. 업로드된 파일이 있으면 업로드(rename)
      if(fileList != null) {
         for(int i=0; i<fileList.size(); i++) {
            MultipartFile mf = fileList.get(i);
            //파일명구하기
            String orgFileName = mf.getOriginalFilename();
            if(orgFileName != null && !orgFileName.equals("")) { //파일명이 있으면
               File f = new File(path, orgFileName);
               if(f.exists()) {// 이미 같은 파일명이 가진 파일이 존재하면 
               //기존파일명과 중복검사 
               int p = orgFileName.lastIndexOf(".");
               String fileNoExt = orgFileName.substring(0, p);
               String ext = orgFileName.substring(p+1);
               
               for(int fileNum=1; ; fileNum++) {
                  String newFile = fileNoExt+"("+fileNum+")."+ext;
                  f = new File(path, newFile);
                  if(!f.exists()) {
                     orgFileName = newFile;
                     break;
                  }
               }//for
            }//if
            //업로드 
               try {
                  mf.transferTo(new File(path, orgFileName));
                  BoardsFileDTO fDTO = new BoardsFileDTO();
                  fDTO.setBoardsNo(dto.getBoardsNo());
                  fDTO.setFilename(orgFileName);
                  newFileList.add(fDTO);
               }catch(Exception e) {e.printStackTrace();}
         }//if
      }//for
   }//if
   //DB등록
   /*
    *  원래DB파일 -> List<DataFileDTO> orgFileList  a.gif, b.gif, c.gif
    *  새로업로드파일 -> List<DataFileDTO> newFileList d.gif
    *  삭제된 파일 ->   List<String> delFile      b.gif
    */
    // orgFileList에 새로업로드된 파일목록을 추가하기
      orgFileList.addAll(newFileList);
//      for(DataFileDTO newDTO:newFileList) {
//         orgFileList.add(newDTO);
//      }
//      
      
      
      
      
      // orgFileList에서 삭제 될 파일 객체를 지우기 
      if(dto.getDelFile()!=null) {
         for(int i=0; i<dto.getDelFile().size(); i++) {
            String del = dto.getDelFile().get(i);
            for(int idx=0; idx<orgFileList.size(); idx++) {
               BoardsFileDTO resetFile = orgFileList.get(idx);
               // b.gif              b.gif
               if(del.equals(resetFile.getFilename())) {
                  orgFileList.remove(idx);
                  break;
               }      
            }
         }
      }
      ModelAndView mav = new ModelAndView();
      try {
         //원 레코드 업데이트 
         int result = service.boardsUpdate(dto);
         //파일 목록 -> 삭제, 추가 
         service.boardsFileDelete(dto.getBoardsNo());
         System.out.println("orgFileList->"+orgFileList.size());
         service.boardsFileInsert(orgFileList);
         // 삭제한 파일을 //upload 폴더에서 제거 
         if(dto.getDelFile()!=null) {
            for(String delFilename:dto.getDelFile()) {
               fileDelete(path, delFilename);
            }
         }
         // 글내용보기
         mav.setViewName("redirect:boardsView/"+dto.getBoardsNo());
      }catch(Exception e) {
         e.printStackTrace();
         
         //새로업로드 파일 삭제
         for(BoardsFileDTO fDTO: newFileList) {
            fileDelete(path, fDTO.getFilename());
         }
         // 글내용수정
         mav.setViewName("redirect:boardsEdit?boardsNo="+dto.getBoardsNo());
      }
      return mav;
 } 
   //자료실 글 삭제하기
   @GetMapping("/boardsDel")
   public ModelAndView boardsDelete(int boardsNo, HttpSession session) {
      //파일 삭제시  경로 필요함
      String path = session.getServletContext().getRealPath("/upload");
      
      //1.삭제할 글의 첨부파일 선택보관한다. 
         List<BoardsFileDTO> fileList = service.boardsFileSelect(boardsNo);
      
      
      //2. 첨부파일 레코드를 지운다. 
      int delCount = service.boardsFileDelete(boardsNo);
      //3. 원글(DB삭제)
      int result = service.boardsDelete(boardsNo, (String)session.getAttribute("logId"));
      
      
   //4. 첨부파일삭제
      for(BoardsFileDTO dto: fileList) {
         fileDelete(path, dto.getFilename());
         
      }
      //5. 삭제시 글목록
      ModelAndView mav = new ModelAndView();
      if(result>0) {
         mav.setViewName("redirect:boardsList");
      }else {
         mav.setViewName("redirect:boardsView/"+boardsNo);
      }
      //   실패시 글내용보기
      return mav;
   }
   
   //파일 삭제하는 메소드 
   public void fileDelete(String path, String filename) {
      try {
         File f=new File(path,filename);
         f.delete();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
}
