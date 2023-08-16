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
   //�� ���
   @GetMapping("/boardsList")
   public String boardsList(Model model, PagingDTO pDTO) {
      //db���ڵ� �����Ͽ� model�� ����
      pDTO.setTotalRecord(service.totalRecord(pDTO));
     
      
     model.addAttribute("list", service.getBoardsList(pDTO));
     model.addAttribute("pDTO",pDTO);
      return "boards/boardsList";
   }
   //�� ��� ��
   @GetMapping("/boardsWrite")
   public String boardsWrite() {
      return "boards/boardsWrite";
   }
   
   //�� ��� DB��
   @PostMapping("/boardsWriteOk")
   public ModelAndView boardsWriteOk(HttpServletRequest request, BoardsDTO dto) {
   //������ ���ε� �� ��� / ���ε��� ���� �ּ�(������)
      String path=request.getSession().getServletContext().getRealPath("/upload");
       System.out.println("path->"+path);
       
       //dto -> ����, �� ����, session ���� �۾���
       // no -> ������, hit, writedate -> default��
       dto.setUserId((String)request.getSession().getAttribute("logId"));
       //---------------------------------���Ͼ��ε�--------------------------
       //1. ���Ͼ��ε带 ���ؼ��� request ��ü�� multipartRequest ��ü�� ����ȯ��.
       MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
       //2. MulitpartFile ��ü�� ������
       List<MultipartFile> fileList = mr.getFiles("filename");
       System.out.println("fileList.size()->"+fileList.size());
       //÷�� ������ ���� �� 
       
       //���ε��� ���ϵ��� ������ �÷��� 
       List<BoardsFileDTO> upFileList = new ArrayList<BoardsFileDTO>();
       
       if(fileList!=null) {//÷�������� ���� �� if 1
          for(int i=0; i<fileList.size(); i++){//÷�� ���� ����ŭ �ݺ� ����//÷�� ���� ����ŭ �ݺ� ����
             MultipartFile mf=fileList.get(i);//÷�ε� MulitipartFile ��ü ������ 
          
             String orgFileName=mf.getOriginalFilename();//���ϸ� ������
             System.out.println("orgFileName->"+orgFileName);
             
             if(orgFileName!=null && !orgFileName.equals("")) {//���ε��� ������ ������ if 2
                File f=new File(path,orgFileName);
                if(f.exists()) {//true�̸� ������ ����, false�̸� ������ ���������ʴ´�.
                   //���ϸ� ���� 
                   int point=orgFileName.lastIndexOf(".");//���ϸ�� Ȯ���� �и� 
                   String orgFile=orgFileName.substring(0,point);
                   String orgExt=orgFileName.substring(point+1);
                   
                   for(int renameNum=1; ;renameNum++) {//1,2,3,4,5....
                      String newFileName=orgFile + "("+renameNum+")."+orgExt;
                      f = new File(path, newFileName);//������ ���� ����� �����. 
                      if(!f.exists()) {//���� �� 
                         //���� ������� ���ϸ��� ���ε��� �� ����Ͽ��� �ϹǷ� 
                         orgFileName=newFileName;
                         break;//�ݺ� ���� 
                      }
                   }//for
                   
                }
                //���ε� ����
                try {
                mf.transferTo(new File(path,orgFileName));
                }catch(Exception e) {
                e.printStackTrace();
                }
                System.out.println("���ε� �� ���ϸ� : " + orgFileName);
                BoardsFileDTO upFileDTO = new BoardsFileDTO();
                upFileDTO.setFilename(orgFileName);
                upFileList.add(upFileDTO);
             }//if 2
          }//for 1
       }//if 1
       ModelAndView mav=new ModelAndView();
       try {
       //=========DBó��==================================================================================
       //���� insert ���� �� ������ ������ ��ȣ�� ����� �޾ƾ� ���ϸ��� DB�� �߰��� �� ����ؾ� �Ѵ�. 
       int result=service.boardsInsert(dto);
       //���ϸ��� �ִ� DTO�� ���۹�ȣ�� �߰�
       for(int i=0; i<upFileList.size(); i++) {
          upFileList.get(i).setBoardsNo(dto.getBoardsNo());
          
       }
          //���ϸ� DB insert
          int resultFile=service.boardsFileInsert(upFileList);
          
          //������
          mav.setViewName("redirect:boardsList");
       }catch(Exception e) {
          e.printStackTrace();
          //���� �����(dto.no)
          service.boardsDelete(dto.getBoardsNo(),dto.getUserId());
          //���ϸ�(DB) �����(dto.no)
          service.boardsFileDelete(dto.getBoardsNo());
          //���� ����(upFileList)
          for(int i=0; i<upFileList.size(); i++) {
             fileDelete(path,upFileList.get(i).getFilename());
          }
          //����
          mav.setViewName("boards/boardsResult");
       }

      
      return mav;
   }
   // �Խ��� �۳��뺸��
   @GetMapping("/boardsView/{boardsNo}")
   public ModelAndView boardsView(@PathVariable("boardsNo") int boardsNo) {
      ModelAndView mav = new ModelAndView();
      // ��ȸ��
      service.hitCount(boardsNo);
      // �ش� �ۼ���
      mav.addObject("dto", service.boardsSelect(boardsNo));
      // �ش���� ÷������ ���� 
      mav.addObject("fileList", service.boardsFileSelect(boardsNo));
      // �������� 
      mav.setViewName("boards/boardsView");
      return mav; 
   }
   
   //�ڷ�� �ۼ��� ��
   @GetMapping("/boardsEdit")
   public ModelAndView boardsEdit(int boardsNo) {
      ModelAndView mav = new ModelAndView();
      //�����
      mav.addObject("dto", service.boardsSelect(boardsNo));
      //÷�����ϼ���
      mav.addObject("fileList", service.boardsFileSelect(boardsNo));
      
      mav.setViewName("boards/boardsEdit");
      return mav;
   }
   //�ڷ�� �� �����ϱ� 
   @PostMapping("/boardsEditOk") //no, subject, content, filename, delFile
   public ModelAndView boardsEditOk(BoardsDTO dto, HttpSession session, HttpServletRequest request) {
      
      //1. ������ ���ε�� ���ϸ�� DB���� �������� 
      List<BoardsFileDTO> orgFileList = service.boardsFileSelect(dto.getBoardsNo());
     
      
      //2. ������ġ
      String path = session.getServletContext().getRealPath("/upload");//���� ��ġ
      
      //3. ���� �߰��� ���Ͼ��ε��ϱ� -> MultipartHttpServletRequest(request ��ü)
     MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
      
     //4. ���ε�� ����(MultipartFile)���
      List<MultipartFile> fileList = mr.getFiles("filename");
      
      //���ξ��ε��� ���ϸ��
      List<BoardsFileDTO> newFileList = new ArrayList<BoardsFileDTO>();
      
     //5. ���ε�� ������ ������ ���ε�(rename)
      if(fileList != null) {
         for(int i=0; i<fileList.size(); i++) {
            MultipartFile mf = fileList.get(i);
            //���ϸ��ϱ�
            String orgFileName = mf.getOriginalFilename();
            if(orgFileName != null && !orgFileName.equals("")) { //���ϸ��� ������
               File f = new File(path, orgFileName);
               if(f.exists()) {// �̹� ���� ���ϸ��� ���� ������ �����ϸ� 
               //�������ϸ�� �ߺ��˻� 
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
            //���ε� 
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
   //DB���
   /*
    *  ����DB���� -> List<DataFileDTO> orgFileList  a.gif, b.gif, c.gif
    *  ���ξ��ε����� -> List<DataFileDTO> newFileList d.gif
    *  ������ ���� ->   List<String> delFile      b.gif
    */
    // orgFileList�� ���ξ��ε�� ���ϸ���� �߰��ϱ�
      orgFileList.addAll(newFileList);
//      for(DataFileDTO newDTO:newFileList) {
//         orgFileList.add(newDTO);
//      }
//      
      
      
      
      
      // orgFileList���� ���� �� ���� ��ü�� ����� 
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
         //�� ���ڵ� ������Ʈ 
         int result = service.boardsUpdate(dto);
         //���� ��� -> ����, �߰� 
         service.boardsFileDelete(dto.getBoardsNo());
         System.out.println("orgFileList->"+orgFileList.size());
         service.boardsFileInsert(orgFileList);
         // ������ ������ //upload �������� ���� 
         if(dto.getDelFile()!=null) {
            for(String delFilename:dto.getDelFile()) {
               fileDelete(path, delFilename);
            }
         }
         // �۳��뺸��
         mav.setViewName("redirect:boardsView/"+dto.getBoardsNo());
      }catch(Exception e) {
         e.printStackTrace();
         
         //���ξ��ε� ���� ����
         for(BoardsFileDTO fDTO: newFileList) {
            fileDelete(path, fDTO.getFilename());
         }
         // �۳������
         mav.setViewName("redirect:boardsEdit?boardsNo="+dto.getBoardsNo());
      }
      return mav;
 } 
   //�ڷ�� �� �����ϱ�
   @GetMapping("/boardsDel")
   public ModelAndView boardsDelete(int boardsNo, HttpSession session) {
      //���� ������  ��� �ʿ���
      String path = session.getServletContext().getRealPath("/upload");
      
      //1.������ ���� ÷������ ���ú����Ѵ�. 
         List<BoardsFileDTO> fileList = service.boardsFileSelect(boardsNo);
      
      
      //2. ÷������ ���ڵ带 �����. 
      int delCount = service.boardsFileDelete(boardsNo);
      //3. ����(DB����)
      int result = service.boardsDelete(boardsNo, (String)session.getAttribute("logId"));
      
      
   //4. ÷�����ϻ���
      for(BoardsFileDTO dto: fileList) {
         fileDelete(path, dto.getFilename());
         
      }
      //5. ������ �۸��
      ModelAndView mav = new ModelAndView();
      if(result>0) {
         mav.setViewName("redirect:boardsList");
      }else {
         mav.setViewName("redirect:boardsView/"+boardsNo);
      }
      //   ���н� �۳��뺸��
      return mav;
   }
   
   //���� �����ϴ� �޼ҵ� 
   public void fileDelete(String path, String filename) {
      try {
         File f=new File(path,filename);
         f.delete();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
}
