package www.erp.com;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErpController {
	
	@Autowired
	ErpService erpservice;
	
    private static final Logger logger = LoggerFactory.getLogger(ErpController.class);
	
	//사원등록
	@RequestMapping(value = "/staff_input_form.do")
	public String insertstaff(Locale locale, Model model) {
		
		logger.info("insertstaff");
		
		
		return "erp/staff_input_form";
	}
	
	
	//사원등록2
	@RequestMapping("/InsertStaffeaction.do")
	public ModelAndView insertstaffaction(Model model, StaffDTO staffdto, HttpServletRequest request) throws Exception {
		
		System.out.println("궁금 : "+staffdto.getKeyword());
		
		logger.info("insertstaffaction");
		
		erpservice.inserstaff(staffdto,request);
		ModelAndView mv = new ModelAndView("redirect:staff_search_form.do");
		
		
		return mv;
	}
	
	// 사원정보보기
	@RequestMapping("/staff_updel_form.do")
	public String staffView(@RequestParam("staff_no") int staff_no, Model model) throws Exception {

		System.out.println("staff_no controll : " + staff_no);
		
		List<StaffDTO> staffView = erpservice.staffView(staff_no);
		
		model.addAttribute("staffView", staffView);


		return "erp/staff_updel_form";
	}
	
	// 사원정보검색폼
	
	@RequestMapping(value = "/staff_search_form.do")
	public String staffList(Model model, HttpServletRequest request, @ModelAttribute("staffdto") StaffDTO staffdto)
			throws Exception {

		
		//List<StaffDTO> staffList = erpservice.staffList();

		//model.addAttribute("staffList", staffList);

		return "/erp/staff_search_form";
	}
	
	
	// 전부검색
	@RequestMapping(value = "/allSearch.do")
	@ResponseBody
	public List<StaffDTO> allSearch(Model model, HttpServletRequest request, @ModelAttribute("staffdto") StaffDTO staffdto)
			throws Exception {
		System.out.println("?????????????");
		
		List<StaffDTO> staffList = erpservice.staffList(staffdto);
	
		System.out.println("start  :"+staffdto.getStartRow());
		System.out.println(staffdto.getEndRow());
		
		model.addAttribute("staffList", staffList);

		return staffList;
	}
	
	
	// 사원삭제
	@RequestMapping("/staffDel.do")
	public ModelAndView staffDel(@RequestParam("staff_no") int staff_no) throws Exception{
		
		erpservice.staffDel(staff_no);
		
		ModelAndView mv = new ModelAndView("redirect:staff_search_form.do");
		
		
		return mv;
	}
	
	// 조건검색
	@RequestMapping("/staffSearch.do")
	@ResponseBody
	public List<StaffDTO> staffSearch(Model model, HttpServletRequest request, @ModelAttribute("staffdto") StaffDTO staffdto)
			throws Exception {
		
		System.out.println("종교 코드: "+staffdto.getReligion_code());
		System.out.println("스킬 코드: "+staffdto.getSkill_code());
		System.out.println("스쿨 코드: "+staffdto.getSchool_code());
		System.out.println("종교 코드: "+staffdto.getReligion_code());
		System.out.println("and(1), or(2) : "+ staffdto.getKeyword_no());
		System.out.println("keyword: "+ staffdto.getKeyword());
		

		List<StaffDTO> staffSearch = erpservice.staffSearch(staffdto);

		model.addAttribute("staffSearch", staffSearch);

		return staffSearch;
	} 
	
	// 사원정보 수정
	@RequestMapping("/staffUpdate.do")
	public ModelAndView staffUpdate(HttpServletRequest request, StaffDTO staffdto) throws Exception {
	
		
		System.out.println("staff_name : "+staffdto.getStaff_name()+", jumin_no1 : "+staffdto.getJumin_no1());
		System.out.println("jumin_no2 : "+staffdto.getJumin_no2());
		System.out.println("school_code : "+staffdto.getSchool_code()+", religion_code : "+staffdto.getReligion_code());
		System.out.println("graduagte_day01 : "+staffdto.getGraduate_day01());
		System.out.println("graduagte_day01 : "+staffdto.getGraduate_day01());
		
		erpservice.staffUpdate(staffdto, request);

		ModelAndView mv = new ModelAndView("redirect:staff_search_form.do");
		
		
		return mv;
	}


	// 사원 정렬
	@RequestMapping("/sort.do")
	@ResponseBody
	public List<StaffDTO> sort(Model model, HttpServletRequest request, @ModelAttribute("staffdto") StaffDTO staffdto) throws Exception {

		System.out.println("sort : "+staffdto.getSort());

		List<StaffDTO> staffSearch = erpservice.sort_No(staffdto);

		return staffSearch;
	} 
	
	
}
