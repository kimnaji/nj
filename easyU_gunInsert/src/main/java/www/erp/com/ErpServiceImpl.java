package www.erp.com;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("ERP_Service")
public class ErpServiceImpl implements ErpService{

	@Autowired
	ErpDAO erpdao;
	
	
	@Override
	@Transactional
	public void inserstaff(StaffDTO staffdto, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
		
		//주민번호
		String jumin_no1=staffdto.getJumin_no1();
		String jumin_no2=staffdto.getJumin_no2();
		String jumin_no=jumin_no1+jumin_no2;
		
		staffdto.setJumin_no(jumin_no);
		
		System.out.println(staffdto.getJumin_no());
		
		//졸업일
		String graduate_day01=staffdto.getGraduate_day01();//년
		String graduate_day02=staffdto.getGraduate_day02();//월
		String graduate_day03=staffdto.getGraduate_day03();//일
		
		if(graduate_day02.length()==1) {
			graduate_day02="0"+graduate_day02;
		}
		if(graduate_day03.length()==1) {
			graduate_day03="0"+graduate_day03;
		}
		String graduate_day=graduate_day01+graduate_day02+graduate_day03;
	
		staffdto.setGraduate_day(graduate_day);

		erpdao.insertstaff(staffdto);
		
		//기술
		StaffSkillDTO staffskilldto = new StaffSkillDTO();
		
		String [] swex = request.getParameterValues("skill_code");
		int [] sw =  new int[swex.length] ;
		
		for(int i=0; i<swex.length; i++){
			
			sw[i]=Integer.parseInt(swex[i]);
			
			staffskilldto.setSkill_code(sw[i]);
			int skill_code = staffskilldto.getSkill_code();
			erpdao.insertSkill(skill_code);
			
		}
		
	}


	@Override
	@Transactional
	public List<StaffDTO> staffView(int staff_no) throws Exception {
		// TODO Auto-generated method stub
	System.out.println(staff_no);
		return erpdao.staffView(staff_no);
	}



	@Override
	public List<StaffDTO> staffSearch(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub		
		
		
		//졸업일
				String graduate_day01=staffdto.getGraduate_day01();//년
				String graduate_day02=staffdto.getGraduate_day02();//월
				String graduate_day03=staffdto.getGraduate_day03();//일
				String graduate_day04=staffdto.getGraduate_day04();//년
				String graduate_day05=staffdto.getGraduate_day05();//월
				String graduate_day06=staffdto.getGraduate_day06();//일
				
				if(graduate_day02.length()==1) {
					graduate_day02="0"+graduate_day02;
				}
				if(graduate_day03.length()==1) {
					graduate_day03="0"+graduate_day03;
				}
				String graduate_ch1=graduate_day01+graduate_day02+graduate_day03;
			
				if(graduate_day05.length()==1) {
					graduate_day05="0"+graduate_day05;
				}
				if(graduate_day06.length()==1) {
					graduate_day06="0"+graduate_day06;
				}
				String graduate_ch2=graduate_day04+graduate_day05+graduate_day06;
			
				
				staffdto.setGraduate_ch1(graduate_ch1);
				staffdto.setGraduate_ch2(graduate_ch2);

				System.out.println("ch1,2 : "+graduate_ch1+" , "+graduate_ch2);
				System.out.println("sex : "+staffdto.getSex());
		
				//성별 검색 jumin_no.substr(6,1)
			
		return erpdao.staffSearch(staffdto);
	}


	@Override
	public String religion(int religion_code) throws Exception {
		// TODO Auto-generated method stub
		return erpdao.religion(religion_code);
	}


	@Override
	public void staffUpdate(StaffDTO staffdto, HttpServletRequest request) throws Exception {
			System.out.println("service imp");

		//주민번호
		String jumin_no1=staffdto.getJumin_no1();
		String jumin_no2=staffdto.getJumin_no2();
		String jumin_no=jumin_no1+jumin_no2;
		
		staffdto.setJumin_no(jumin_no);
		
		
		//졸업일
		String graduate_day01=staffdto.getGraduate_day01();//년
		String graduate_day02=staffdto.getGraduate_day02();//월
		String graduate_day03=staffdto.getGraduate_day03();//일
		
		if(graduate_day02.length()==1) {
			graduate_day02="0"+graduate_day02;
		}
		if(graduate_day03.length()==1) {
			graduate_day03="0"+graduate_day03;
		}
		String graduate_day=graduate_day01+graduate_day02+graduate_day03;
	
		staffdto.setGraduate_day(graduate_day);

		erpdao.staffUpdate(staffdto);
		
		//기술
		StaffSkillDTO staffskilldto = new StaffSkillDTO();
		
		String [] swex = request.getParameterValues("skill_code");
		int [] sw =  new int[swex.length] ;
		
		for(int i=0; i<swex.length; i++){
			
			sw[i]=Integer.parseInt(swex[i]);
			
			staffskilldto.setSkill_code(sw[i]);
			int skill_code = staffskilldto.getSkill_code();
			staffdto.setSkill_code(skill_code);
			erpdao.updateSkill(staffdto);
			
		}

		
		
	}


	@Override
	public List<StaffDTO> staffList(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		return erpdao.staffList(staffdto);
	}


	@Override
	public int staff_listcount(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		return erpdao.staff_listcount(staffdto);
	}


	@Override
	public void staffDel(int staff_no) throws Exception {
		// TODO Auto-generated method stub
		erpdao.staffDel(staff_no);
	}


	@Override
	public List<StaffDTO> sort_No(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		return erpdao.sort_No(staffdto);
	}
}
