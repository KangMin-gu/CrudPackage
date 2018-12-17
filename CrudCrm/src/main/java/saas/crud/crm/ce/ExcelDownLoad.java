package saas.crud.crm.ce;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Row.MissingCellPolicy;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.ss.util.Region;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dao.CompanyDao;
import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.vc.controller.VocController;

@Controller
public class ExcelDownLoad {
	
	private static final Logger logger = LoggerFactory.getLogger(ExcelDownLoad.class);
	
	@Autowired
	private CrudEngine crud;
	@Autowired
	private CustDao custDao;
	@Autowired
	private AuDao auDao;
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private SvDao svDao;
	
	//고객목록 대용량 엑셀 다운로드
	@RequestMapping(value = "/custexcel", method = RequestMethod.GET)
	public void ccc(HttpServletRequest request, HttpServletResponse response) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Map<String, Object> searchVal = crud.searchParam(request);
		searchVal.put("infoagree", 0);
		List<Map<String, Object>> note = custDao.custList(searchVal);
		
		//SXSSF 방식 엑셀 생성 
		SXSSFWorkbook wb = new SXSSFWorkbook();
		SXSSFCell cell;
		SXSSFSheet sheet = wb.createSheet();
		SXSSFRow row = sheet.createRow(0);
		CellStyle style = wb.createCellStyle();
		CellStyle columnColor = wb.createCellStyle();
		CellStyle headerColor = wb.createCellStyle();
		
		style.setBorderBottom(CellStyle.BORDER_THIN);
		style.setBorderLeft(CellStyle.BORDER_THIN);	// 셀 좌측에 얇은 실선 적용.
		style.setBorderRight(CellStyle.BORDER_THIN);	// 셀 우측에 얇은 실선 적용.
		style.setBorderTop(CellStyle.BORDER_THIN);	// 셀 윗쪽에 얇은 실선 적용.
		columnColor.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
		columnColor.setFillPattern(CellStyle.SOLID_FOREGROUND);
		columnColor.setAlignment(CellStyle.ALIGN_CENTER);
		
		//시트이름생성
		//Sheet sh = wb.createSheet("First sheet");

		cell = row.createCell(0);
		cell.setCellValue("고객목록");
		cell.setCellStyle(columnColor);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));
		
		
		row = sheet.createRow(1);
		cell = row.createCell(0);
		cell.setCellValue("고객명");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(1);
		cell.setCellValue("부서");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(2);
		cell.setCellValue("직책");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(3);
		cell.setCellValue("휴대폰");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(4);
		cell.setCellValue("이메일");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(5);
		cell.setCellValue("담당자");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(6);
		cell.setCellValue("고객구분");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(7);
		cell.setCellValue("고객등급");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(8);
		cell.setCellValue("정보활용여부");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		cell = row.createCell(9);
		cell.setCellValue("등록일");
		cell.setCellStyle(style);
		cell.setCellStyle(columnColor);
		
		try {
		
			
			//데이터 칼럼에 맞춰 바인딩
			for (int rowNum = 1; rowNum < note.size(); rowNum++) {			
				row = sheet.createRow(rowNum+1);			
				String custName = crud.getMapValueNullCheck(note.get(rowNum), "CUSTNAME");
				String deptName = crud.getMapValueNullCheck(note.get(rowNum), "DEPTNAME");
				String duty = crud.getMapValueNullCheck(note.get(rowNum), "DUTY");
				String mobile = crud.getMapValueNullCheck(note.get(rowNum), "MOBILE");
				String email = crud.getMapValueNullCheck(note.get(rowNum), "EMAIL");
				String owner_ = crud.getMapValueNullCheck(note.get(rowNum), "OWNER_");
				String custGubun = crud.getMapValueNullCheck(note.get(rowNum), "CUSTGUBUN");
				String custGrade = crud.getMapValueNullCheck(note.get(rowNum), "CUSTGRADE");
				String infoAgree = crud.getMapValueNullCheck(note.get(rowNum), "INFOAGREE");
				String regdate = crud.getMapValueNullCheck(note.get(rowNum), "REGDATE");

				cell = row.createCell(0);
				cell.setCellValue(custName);
				cell.setCellStyle(style);
				
				cell = row.createCell(1);
				cell.setCellValue(deptName);
				cell.setCellStyle(style);

				cell = row.createCell(2);
				cell.setCellValue(duty);
				cell.setCellStyle(style);

				cell = row.createCell(3);
				cell.setCellValue(mobile);
				cell.setCellStyle(style);
				
				cell = row.createCell(4);
				cell.setCellValue(email);
				cell.setCellStyle(style);
				
				cell = row.createCell(5);
				cell.setCellValue(owner_);
				cell.setCellStyle(style);
				
				cell = row.createCell(6);
				cell.setCellValue(custGubun);
				cell.setCellStyle(style);
				
				cell = row.createCell(7);
				cell.setCellValue(custGrade);
				cell.setCellStyle(style);
				
				cell = row.createCell(8);
				if(infoAgree.equals("0")) {
					cell.setCellValue("동의"); 
				}else {
					cell.setCellValue("거부");
				}
				cell.setCellStyle(style);
				
				cell = row.createCell(9);
				cell.setCellValue(regdate);				
				cell.setCellStyle(style);
								
			}
			
				
			//여기서부터 다운로드 
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			String fileDate = crud.fileSearchKey(request);	
			String excelfileName = fileDate+"_고객목록.xlsx";
			response.setHeader("Content-Disposition", String.format("attachment; filename=\""+excelfileName+"\""));
			wb.write(response.getOutputStream());

		} catch (Exception e) {
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			
			logger.debug("error---------------떨어");
			e.printStackTrace();
			OutputStream out = null;
			try {
				out = response.getOutputStream();
				logger.debug("error---------------");
				byte[] data = new String("fail..").getBytes();
				out.write(data, 0, data.length);
			} catch (Exception ignore) {
				ignore.printStackTrace();
			} finally {
				if (out != null)
					try {
						out.close();
					} catch (Exception ignore) {
						ignore.printStackTrace();
					}
			}

		} finally {
			// 디스크 적었던 임시파일을 제거합니다.
			wb.dispose();

			try {
				wb.close();
			} catch (Exception ignore) {
				ignore.printStackTrace();
			}
		}


	}
	
	//고객목록 대용량 엑셀 다운로드
		@RequestMapping(value = "/userexcel", method = RequestMethod.GET)
		public void adUser(HttpServletRequest request, HttpServletResponse response) {
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			Map<String, Object> searchVal = crud.searchParam(request);
			
			List<Map<String, Object>> adUser = auDao.urList(searchVal);
			
			//SXSSF 방식 엑셀 생성 
			SXSSFWorkbook wb = new SXSSFWorkbook();
			SXSSFCell cell;
			SXSSFSheet sheet = wb.createSheet();
			SXSSFRow row = sheet.createRow(0);
			CellStyle style = wb.createCellStyle();
			CellStyle columnColor = wb.createCellStyle();
			CellStyle headerColor = wb.createCellStyle();
			
			style.setBorderBottom(CellStyle.BORDER_THIN);
			style.setBorderLeft(CellStyle.BORDER_THIN);	// 셀 좌측에 얇은 실선 적용.
			style.setBorderRight(CellStyle.BORDER_THIN);	// 셀 우측에 얇은 실선 적용.
			style.setBorderTop(CellStyle.BORDER_THIN);	// 셀 윗쪽에 얇은 실선 적용.
			columnColor.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
			columnColor.setFillPattern(CellStyle.SOLID_FOREGROUND);
			columnColor.setAlignment(CellStyle.ALIGN_CENTER);
			
			//시트이름생성
			//Sheet sh = wb.createSheet("First sheet");

			cell = row.createCell(0);
			cell.setCellValue("사용자목록");
			cell.setCellStyle(columnColor);
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
			
			
			row = sheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("사용자명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(1);
			cell.setCellValue("사용자ID");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(2);
			cell.setCellValue("직책");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(3);
			cell.setCellValue("입사일자");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(4);
			cell.setCellValue("등록일");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			try {
			
				
				//데이터 칼럼에 맞춰 바인딩
				for (int rowNum = 1; rowNum < adUser.size(); rowNum++) {			
					row = sheet.createRow(rowNum+1);			
					String userName = crud.getMapValueNullCheck(adUser.get(rowNum), "USERNAME");
					String userId = crud.getMapValueNullCheck(adUser.get(rowNum), "USERID");
					String userDuty = crud.getMapValueNullCheck(adUser.get(rowNum), "USERDUTY");
					String enterDate = crud.getMapValueNullCheck(adUser.get(rowNum), "ENTERDATE");
					String regDate = crud.getMapValueNullCheck(adUser.get(rowNum), "REGDATE");

					cell = row.createCell(0);
					cell.setCellValue(userName);
					cell.setCellStyle(style);
					
					cell = row.createCell(1);
					cell.setCellValue(userId);
					cell.setCellStyle(style);

					cell = row.createCell(2);
					cell.setCellValue(userDuty);
					cell.setCellStyle(style);

					cell = row.createCell(3);
					cell.setCellValue(enterDate);
					cell.setCellStyle(style);
					
					cell = row.createCell(4);
					cell.setCellValue(regDate);
					cell.setCellStyle(style);
				}
				
					
				//여기서부터 다운로드 
				response.setHeader("Set-Cookie", "fileDownload=true; path=/");
				String fileDate = crud.fileSearchKey(request);	
				String excelfileName = fileDate+"_사용자목록.xlsx";
				response.setHeader("Content-Disposition", String.format("attachment; filename=\""+excelfileName+"\""));
				wb.write(response.getOutputStream());

			} catch (Exception e) {
				response.setHeader("Set-Cookie", "fileDownload=false; path=/");
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Content-Type", "text/html; charset=utf-8");
				
				logger.debug("error---------------떨어");
				e.printStackTrace();
				OutputStream out = null;
				try {
					out = response.getOutputStream();
					logger.debug("error---------------");
					byte[] data = new String("fail..").getBytes();
					out.write(data, 0, data.length);
				} catch (Exception ignore) {
					ignore.printStackTrace();
				} finally {
					if (out != null)
						try {
							out.close();
						} catch (Exception ignore) {
							ignore.printStackTrace();
						}
				}

			} finally {
				// 디스크 적었던 임시파일을 제거합니다.
				wb.dispose();

				try {
					wb.close();
				} catch (Exception ignore) {
					ignore.printStackTrace();
				}
			}
		}
		@RequestMapping(value = "/companyexcel", method = RequestMethod.GET)
		public void companyExcel(HttpServletRequest request, HttpServletResponse response) {
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			Map<String, Object> searchVal = crud.searchParam(request);
			List<Map<String, Object>> company = companyDao.companyList(searchVal);
			
			//SXSSF 방식 엑셀 생성 
			SXSSFWorkbook wb = new SXSSFWorkbook();
			SXSSFCell cell;
			SXSSFSheet sheet = wb.createSheet();
			SXSSFRow row = sheet.createRow(0);
			CellStyle style = wb.createCellStyle();
			CellStyle columnColor = wb.createCellStyle();
			CellStyle headerColor = wb.createCellStyle();
			
			style.setBorderBottom(CellStyle.BORDER_THIN);
			style.setBorderLeft(CellStyle.BORDER_THIN);	// 셀 좌측에 얇은 실선 적용.
			style.setBorderRight(CellStyle.BORDER_THIN);	// 셀 우측에 얇은 실선 적용.
			style.setBorderTop(CellStyle.BORDER_THIN);	// 셀 윗쪽에 얇은 실선 적용.
			columnColor.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
			columnColor.setFillPattern(CellStyle.SOLID_FOREGROUND);
			columnColor.setAlignment(CellStyle.ALIGN_CENTER);
			
			//시트이름생성
			//Sheet sh = wb.createSheet("First sheet");

			cell = row.createCell(0);
			cell.setCellValue("회원사 목록");
			cell.setCellStyle(columnColor);
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));
			
			row = sheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("회원사명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(1);
			cell.setCellValue("대표자명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(2);
			cell.setCellValue("사업자번호");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(3);
			cell.setCellValue("핸드폰번호");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(4);
			cell.setCellValue("종목");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(5);
			cell.setCellValue("기업규모");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(6);
			cell.setCellValue("가입일");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(7);
			cell.setCellValue("라이센스구매갯수");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(8);
			cell.setCellValue("서비스상태");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			try {
			
				
				//데이터 칼럼에 맞춰 바인딩
				for (int rowNum = 1; rowNum < company.size(); rowNum++) {			
					row = sheet.createRow(rowNum+1);			
					String siteName = crud.getMapValueNullCheck(company.get(rowNum), "SITENAME");
					String prsdName = crud.getMapValueNullCheck(company.get(rowNum), "PRSDNAME");
					String bsNo = crud.getMapValueNullCheck(company.get(rowNum), "BSNO");
					String mobile = crud.getMapValueNullCheck(company.get(rowNum), "MOBILE");
					String bsType = crud.getMapValueNullCheck(company.get(rowNum), "BSTYPE");
					String siteSize = crud.getMapValueNullCheck(company.get(rowNum), "SITESIZE");
					String fregDate = crud.getMapValueNullCheck(company.get(rowNum), "FREGDATE");
					String buyCnt = crud.getMapValueNullCheck(company.get(rowNum), "BUYCNT");
					String isDelete = crud.getMapValueNullCheck(company.get(rowNum), "ISDELETE");

					cell = row.createCell(0);
					cell.setCellValue(siteName);
					cell.setCellStyle(style);
					
					cell = row.createCell(1);
					cell.setCellValue(prsdName);
					cell.setCellStyle(style);

					cell = row.createCell(2);
					cell.setCellValue(bsNo);
					cell.setCellStyle(style);

					cell = row.createCell(3);
					cell.setCellValue(mobile);
					cell.setCellStyle(style);
					
					cell = row.createCell(4);
					cell.setCellValue(bsType);
					cell.setCellStyle(style);
					
					cell = row.createCell(5);
					cell.setCellValue(siteSize);
					cell.setCellStyle(style);
					
					cell = row.createCell(6);
					cell.setCellValue(fregDate);
					cell.setCellStyle(style);
					
					cell = row.createCell(7);
					cell.setCellValue(buyCnt);
					cell.setCellStyle(style);
					
					cell = row.createCell(8);
					cell.setCellValue(isDelete);				
					cell.setCellStyle(style);
									
				}
				
					
				//여기서부터 다운로드 
				response.setHeader("Set-Cookie", "fileDownload=true; path=/");
				String fileDate = crud.fileSearchKey(request);	
				String excelfileName = fileDate+"_회원사목록.xlsx";
				response.setHeader("Content-Disposition", String.format("attachment; filename=\""+excelfileName+"\""));
				wb.write(response.getOutputStream());

			} catch (Exception e) {
				response.setHeader("Set-Cookie", "fileDownload=false; path=/");
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Content-Type", "text/html; charset=utf-8");
				
				logger.debug("error---------------떨어");
				e.printStackTrace();
				OutputStream out = null;
				try {
					out = response.getOutputStream();
					logger.debug("error---------------");
					byte[] data = new String("fail..").getBytes();
					out.write(data, 0, data.length);
				} catch (Exception ignore) {
					ignore.printStackTrace();
				} finally {
					if (out != null)
						try {
							out.close();
						} catch (Exception ignore) {
							ignore.printStackTrace();
						}
				}

			} finally {
				// 디스크 적었던 임시파일을 제거합니다.
				wb.dispose();

				try {
					wb.close();
				} catch (Exception ignore) {
					ignore.printStackTrace();
				}
			}


		}
		//고객목록 대용량 엑셀 다운로드
		@RequestMapping(value = "/serviceexcel", method = RequestMethod.GET)
		public void serviceExcel(HttpServletRequest request, HttpServletResponse response) {
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			Map<String, Object> searchVal = crud.searchParam(request);
			searchVal.put("infoagree", 0);
			List<Map<String, Object>> note = svDao.svList(searchVal);
			
			//SXSSF 방식 엑셀 생성 
			SXSSFWorkbook wb = new SXSSFWorkbook();
			SXSSFCell cell;
			SXSSFSheet sheet = wb.createSheet();
			SXSSFRow row = sheet.createRow(0);
			CellStyle style = wb.createCellStyle();
			CellStyle columnColor = wb.createCellStyle();
			CellStyle headerColor = wb.createCellStyle();
			
			style.setBorderBottom(CellStyle.BORDER_THIN);
			style.setBorderLeft(CellStyle.BORDER_THIN);	// 셀 좌측에 얇은 실선 적용.
			style.setBorderRight(CellStyle.BORDER_THIN);	// 셀 우측에 얇은 실선 적용.
			style.setBorderTop(CellStyle.BORDER_THIN);	// 셀 윗쪽에 얇은 실선 적용.
			columnColor.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
			columnColor.setFillPattern(CellStyle.SOLID_FOREGROUND);
			columnColor.setAlignment(CellStyle.ALIGN_CENTER);
			
			//시트이름생성
			//Sheet sh = wb.createSheet("First sheet");

			cell = row.createCell(0);
			cell.setCellValue("서비스목록");
			cell.setCellStyle(columnColor);
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));
			
			
			row = sheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("서비스명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(1);
			cell.setCellValue("접수유형");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(2);
			cell.setCellValue("접수매체");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(3);
			cell.setCellValue("고객명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(4);
			cell.setCellValue("거래처명");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(5);
			cell.setCellValue("접수일");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(6);
			cell.setCellValue("접수자");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(7);
			cell.setCellValue("담당자");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);
			
			cell = row.createCell(8);
			cell.setCellValue("처리상태");
			cell.setCellStyle(style);
			cell.setCellStyle(columnColor);

			try {
			
				
				//데이터 칼럼에 맞춰 바인딩
				for (int rowNum = 1; rowNum < note.size(); rowNum++) {			
					row = sheet.createRow(rowNum+1);			
					String rcvName = crud.getMapValueNullCheck(note.get(rowNum), "RCVNAME");
					String rcvType = crud.getMapValueNullCheck(note.get(rowNum), "RCVTYPE_");
					String rcvChannel = crud.getMapValueNullCheck(note.get(rowNum), "RCVCHANNEL_");
					String custName = crud.getMapValueNullCheck(note.get(rowNum), "CUSTNO_");
					String cliName = crud.getMapValueNullCheck(note.get(rowNum), "CLINO_");
					String rcvDate = crud.getMapValueNullCheck(note.get(rowNum), "RCVDATE_");
					String rcvOwner = crud.getMapValueNullCheck(note.get(rowNum), "RCVOWNER_");
					String ractOwner = crud.getMapValueNullCheck(note.get(rowNum), "RACTOWNER_");
					String prcState = crud.getMapValueNullCheck(note.get(rowNum), "PRCSTATE_");

					cell = row.createCell(0);
					cell.setCellValue(rcvName);
					cell.setCellStyle(style);
					
					cell = row.createCell(1);
					cell.setCellValue(rcvType);
					cell.setCellStyle(style);

					cell = row.createCell(2);
					cell.setCellValue(rcvChannel);
					cell.setCellStyle(style);

					cell = row.createCell(3);
					cell.setCellValue(custName);
					cell.setCellStyle(style);
					
					cell = row.createCell(4);
					cell.setCellValue(cliName);
					cell.setCellStyle(style);
					
					cell = row.createCell(5);
					cell.setCellValue(rcvDate);
					cell.setCellStyle(style);
					
					cell = row.createCell(6);
					cell.setCellValue(rcvOwner);
					cell.setCellStyle(style);
					
					cell = row.createCell(7);
					cell.setCellValue(ractOwner);
					cell.setCellStyle(style);
					
					cell = row.createCell(8);
					cell.setCellValue(prcState);				
					cell.setCellStyle(style);
									
				}
				
					
				//여기서부터 다운로드 
				response.setHeader("Set-Cookie", "fileDownload=true; path=/");
				String fileDate = crud.fileSearchKey(request);	
				String excelfileName = fileDate+"_서비스목록.xlsx";
				response.setHeader("Content-Disposition", String.format("attachment; filename=\""+excelfileName+"\""));
				wb.write(response.getOutputStream());

			} catch (Exception e) {
				response.setHeader("Set-Cookie", "fileDownload=false; path=/");
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Content-Type", "text/html; charset=utf-8");
				
				logger.debug("error---------------떨어");
				e.printStackTrace();
				OutputStream out = null;
				try {
					out = response.getOutputStream();
					logger.debug("error---------------");
					byte[] data = new String("fail..").getBytes();
					out.write(data, 0, data.length);
				} catch (Exception ignore) {
					ignore.printStackTrace();
				} finally {
					if (out != null)
						try {
							out.close();
						} catch (Exception ignore) {
							ignore.printStackTrace();
						}
				}

			} finally {
				// 디스크 적었던 임시파일을 제거합니다.
				wb.dispose();
				try {
					wb.close();
				} catch (Exception ignore) {
					ignore.printStackTrace();
				}
			}
		}
}
