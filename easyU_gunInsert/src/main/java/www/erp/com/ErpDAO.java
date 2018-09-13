package www.erp.com;

import java.util.HashMap;
import java.util.List;

public interface ErpDAO {

	public void insertstaff(StaffDTO staffdto) throws Exception;
	
	public List<StaffDTO> staffView(int staff_no) throws Exception;
	
	public List<StaffDTO> staffList(StaffDTO staffdto) throws Exception;
	
	public int staff_listcount(StaffDTO staffdto) throws Exception;
	
	public void staffDel(int staff_no) throws Exception;
	
	public List<StaffDTO> staffSearch(StaffDTO staffdto) throws Exception;
	
	public void insertSkill(int skill_code) throws Exception;

	public String religion(int religion_code) throws Exception;
	
	public void staffUpdate(StaffDTO staffdto) throws Exception;
	
	public void updateSkill(StaffDTO staffdto) throws Exception;
	
	public List<StaffDTO> sort_No(StaffDTO staffdto) throws Exception;
	
} 
