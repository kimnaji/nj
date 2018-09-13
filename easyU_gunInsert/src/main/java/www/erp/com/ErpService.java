package www.erp.com;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public interface ErpService {

	public void inserstaff(StaffDTO staffdto,HttpServletRequest request) throws Exception;
	
	public List<StaffDTO> staffView(int staff_no) throws Exception;
	
	public List<StaffDTO> staffList(StaffDTO staffdto) throws Exception;
	
	public int staff_listcount(StaffDTO staffdto) throws Exception;
	
	public void staffDel(int staff_no) throws Exception;
	
	public List<StaffDTO> staffSearch(StaffDTO staffdto) throws Exception;

	public String religion(int religion_code) throws Exception;
	
	public void staffUpdate(StaffDTO staffdto, HttpServletRequest request) throws Exception;
	
	public List<StaffDTO> sort_No(StaffDTO staffdto) throws Exception;
}
