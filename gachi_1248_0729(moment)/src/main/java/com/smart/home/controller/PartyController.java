package com.smart.home.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.PartyDTO;
import com.smart.home.dto.PartyFileDTO;
import com.smart.home.service.PartyService;
import com.smart.home.service.RegisterService;
            

@RestController
@RequestMapping("/Party")
public class PartyController {
	@Autowired
	PartyService service;
	
	@Autowired
	RegisterService registerservice;
	
	@GetMapping("/PartyPage")
	 public ModelAndView partyPageOpen(PagingDTO pDTO) {
			
			//�ѷ��ڵ�� 
			pDTO.setTotalRecord(service.totalRecord(pDTO));
			
			//�ش��������� ���ڵ� ���� 
			List<PartyDTO> list = service.partyList(pDTO);
			
			//ModelAndView 
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list",list);
			mav.addObject("pDTO", pDTO);
			mav.setViewName("party/partyPage");
			return mav; //����ڰ� ���� �Խ�������
			
	}

	@GetMapping("/PartyDetail")
	 public ModelAndView partyDetailOpen(@ModelAttribute("partyNo") int partyNo, PagingDTO pDTO) {
		PartyDTO dto = new PartyDTO();
//		//��ȸ�� ���� 
//		service.hitCount(no);
		//���ڵ弱��
		dto = service.getParty(partyNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("pDTO",pDTO);
		mav.setViewName("party/partyDetail");
		System.out.println(dto);
	 return mav; //����ڰ� ���� Ȩ����
	}
	
	@PostMapping("/PartyParticipationOk")
	public ModelAndView PartyParticipationOk(HttpServletRequest request, int partyNo, PagingDTO pDTO) {
		PartyDTO dto = new PartyDTO();
		
		dto.setUserId((String)request.getSession().getAttribute("logId"));
		
		int result = 0;
		
		System.out.println(dto);
		
		try {
			result = service.PartyParticipationForm(dto);
		} catch (Exception e) {
			System.out.println("등록실패..." + e.getMessage());
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", service.getParty(partyNo));
		
		if(result > 0) {
			mav.setViewName("redirect:partyPage");
		} else {
			mav.setViewName("party/partyDetail");
		}
		
		return mav;
	}
	
	
	@GetMapping("/PartySearchOk")
	@ResponseBody
	 public List<PartyDTO> PartySearchOk(@RequestParam("id") String id, PagingDTO pDTO) {
		
		
//		PartyDTO dto = service.getParty(dto);
		pDTO.setHobby(id);
		List<PartyDTO> list = service.CategoryList(pDTO);

		
		return list;
	}
	
	
	   @GetMapping("/PartyNoSearchOk")
	   @ResponseBody
	    public List<PartyDTO> PartyNoSearchOk(@RequestParam("id") String id, PagingDTO pDTO) {
	      List<PartyDTO> list = service.partyList(pDTO);
	      System.out.println(list);
	      return list;
	   }
	   
	
	
	
//    @RequestMapping(value = "/MoimSearchOk", method = RequestMethod.GET)
//    public ResponseEntity<String> MoimSearchOk(@RequestParam("id") String id, PagingDTO pDTO) {
//        
//        //PartyDTO dto = service.getParty(dto);
//        List<PartyDTO> list = service.CategoryList(pDTO);
//        
//        //TODO: Your processing code here
//
//        return ResponseEntity.ok(pDTO.toString());
//    }

	@GetMapping("/partyForm")
	 public ModelAndView PartyFormOpen(PagingDTO pDTO) {
			
			//�ѷ��ڵ�� 
			pDTO.setTotalRecord(service.totalRecord(pDTO));
			
			//�ش��������� ���ڵ� ���� 
			List<PartyDTO> list = service.partyList(pDTO);
			
			//ModelAndView 
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list",list);
			mav.addObject("pDTO", pDTO);
			mav.setViewName("party/partyForm");
			
			return mav; //����ڰ� ���� �Խ�������
			
	}
	
	@PostMapping("/PartyFormOk")
	public ModelAndView PartyFormOk(HttpServletRequest request,PartyDTO dto) {
		// ������ ���ε��� ��� /upload�� �����ּ�
					String path = request.getSession().getServletContext().getRealPath("/upload");
				
					System.out.print("path -> " + path);
					//dto -> ����, �۳���, session���� �۾���
					//			no=>��Ŀ
					dto.setUserId((String)request.getSession().getAttribute("logId"));
					//request��ü�� session�� ���ϴ� �ڵ� 
					
					//===========���Ͼ��ε�	====================================
					// 1. ���� ���ε带 ���ؼ� request ��ü�� multipartRequest ��ü�� ����ȯ�Ѵ�.
					MultipartHttpServletRequest mr= (MultipartHttpServletRequest)request;
					
					// 2. MultipartFile ��ü�� ������. list array���� �ϳ��� �����پ��ٴ� ����. 
					List<MultipartFile> fileList= mr.getFiles("filename");  //type file ������ �����´�. 
					System.out.println("fileList.size() ->"+fileList.size());
					
					//���ε�  �ϴ� ���� ���� �̰� �ƴ� �� ����,...
					List<PartyFileDTO> upFileList= new ArrayList<PartyFileDTO>();
					
					if(fileList!=null) {//if 1
						
						
						for(int i=0 ; i<fileList.size(); i++){
							
							//÷�� ���� �� ��ŭ �ݺ� ���� for 1.  a (1) �̷� ������ ��.
							MultipartFile mf=fileList.get(i);//÷�ε� MultipartFile��ü �� 
							
							String orgFileName =mf.getOriginalFilename();
							
							System.out.println("orgFileName->" + orgFileName);
							//ddddddd\\\\\\\77777777777
							if(orgFileName != null &&  !orgFileName.equals("")) {//���ε��� ������ ������
								File f=new File(path,orgFileName);
								if(f.exists()) {//true: ������ �ִ�. false:������ ����.
									//���ϸ� ����				0123456789
									//���ϸ�� Ȯ���� �и� 	a.b.c.gif
									int point = orgFileName.lastIndexOf("."); // �������� .
									String orgFile=orgFileName.substring(0,point);
									String orgExt=orgFileName.substring(point+1); //�̰� Ȯ������ ������. 
								
									for(int renameNum=1; ;renameNum++) {//1,2,3,4.....
											String newFileName=orgFile + " ("+renameNum+")."+orgExt;
											f=new File(path, newFileName);
											//file�� ���� ������ ����.
											if(!f.exists()) {
												//���� ������� ���ϸ��� ���ε� �� �� ����Ͽ��� �ϹǷ� 
												orgFileName=newFileName;
												break; //�ݺ��� ����. 
											}
									}//for 							
									//���ε� ����.
								}	
								try {
									mf.transferTo(new File(path,orgFileName));
								} 
								catch (Exception e) {e.printStackTrace();}
								//upload�� �Ǵµ�, db�� ���ϸ��� ����ؾ��� 
								
								System.out.println("���ε�� ���ϸ�->"+orgFileName);
								System.out.println(dto);
								
								PartyFileDTO upFileDTO = new PartyFileDTO();
								upFileDTO.setFilename(orgFileName);
								upFileList.add(upFileDTO);
							} //if2
						}// for 1
					}//if 1
					//------DBó��---------------------------------////
					//���� insert -> ������ ��������ȣ�� ����� �޾ƾ� ���ϸ��� db�� �߰��� �� ����ؾ� �Ѵ�. 
					//insert -> ������ ������ ��ȣ�� ����� �޴´�. 
					ModelAndView mav=new ModelAndView();

					
						try {
							int result =service.PartyFormOk(dto);
							//���ϸ��� �ִ� dto�� ���۹�ȣ�� �߰�
							for(int i=0; i < upFileList.size(); i++) {
								
								upFileList.get(i).setPartyNo(dto.getPartyNo());
								
							}
							//�ϴ� �� ���� �����(dto�� �غ� ��)
							
							//���ϸ�DB insert  -  
							int resultFile= service.PartyFileInsert(upFileList);
							mav.setViewName("redirect:partyPage");
							//������
						}catch(Exception e) {
							e.printStackTrace();
							//���������(dto.no)
							
							////������ ��
							service.PartyDel(dto.getPartyNo(), dto.getUserId());
							//���ϸ�(DB)�����(dto.no)
							service.PartyFileDelete(dto.getPartyNo());
//							���� ����(upFileList)
							for(int i=0; i<upFileList.size();i++) {
								fileDelete(path, upFileList.get(i).getFilename());
							}
						//����....
							mav.setViewName("party/partyPage");

						}
						return mav;
	}

	//���� �����ϴ� �޼ҵ�
	public void fileDelete(String path, String filename) {
		try {
			File f = new File(path, filename);
			f.delete();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
	}
	
}
