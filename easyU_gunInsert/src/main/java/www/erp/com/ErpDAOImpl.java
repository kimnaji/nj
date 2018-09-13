package www.erp.com;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ErpDAOImpl implements ErpDAO{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertstaff(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("staff_name : "+staffdto.getStaff_name()+", jumin_no : "+staffdto.getJumin_no());
		System.out.println("school_code : "+staffdto.getSchool_code()+", religion_code : "+staffdto.getReligion_code());
		System.out.println("graduagte_day : "+staffdto.getGraduate_day());
		
		sqlsession.insert("erp.insertstaff", staffdto);
		System.out.println("keyword: "+staffdto.getKeyword());
		String keyword=staffdto.getKeyword();
		if(keyword.length()!=0) {
			sqlsession.insert("erp.insertkeyword", staffdto);
		}
	}

	@Override
	public List<StaffDTO> staffView(int staff_no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao : "+staff_no);
		return sqlsession.selectList("erp.staffView",staff_no);
	}

	@Override
	public List<StaffDTO> staffList(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("erp.staffList",staffdto);
	}

	
	
	
	@Override
	public void staffDel(int staff_no) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete("erp.staffskilldel",staff_no);
		sqlsession.delete("erp.keywordskill",staff_no);
		sqlsession.delete("erp.staffDel", staff_no);
	
	}

	@Override
	public List<StaffDTO> staffSearch(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
	System.out.println("dao ch1 : "+staffdto.getGraduate_ch1());
	System.out.println("dao ch2 : "+staffdto.getGraduate_ch2());

		return sqlsession.selectList("erp.staffSearch", staffdto);
	}

	@Override
	public void insertSkill(int skill_code) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO insert skill_code : "+skill_code);
		 sqlsession.insert("erp.insertSkill",skill_code);
	}

	@Override
	public String religion(int religion_code) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("erp.religion",religion_code);
	}

	@Override
	public void staffUpdate(StaffDTO staffdto) throws Exception {
		
		System.out.println("********************UPDATE****************");
		System.out.println("staff_name : "+staffdto.getStaff_name()+", jumin_no : "+staffdto.getJumin_no());
		System.out.println("school_code : "+staffdto.getSchool_code()+", religion_code : "+staffdto.getReligion_code());
		System.out.println("graduagte_day : "+staffdto.getGraduate_day());
		
		// TODO Auto-generated method stub

		sqlsession.update("erp.staffUpdate", staffdto);
	}

	@Override
	public void updateSkill(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("*************SKILL UPDATE*****************");
		System.out.println("skil_code : "+staffdto.getSkill_code());
		
		sqlsession.update("erp.updateSkill", staffdto);

	}

	@Override
	public int staff_listcount(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("erp.staff_listcount", staffdto);
	}

	@Override
	public List<StaffDTO> sort_No(StaffDTO staffdto) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("dao sort : "+staffdto.getSort());
		System.out.println(staffdto.getSort_type());
		return sqlsession.selectList("erp.sort_No",staffdto);
	}



	
	
}
