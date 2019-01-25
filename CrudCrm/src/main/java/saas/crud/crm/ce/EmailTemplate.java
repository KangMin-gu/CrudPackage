package saas.crud.crm.ce;

public class EmailTemplate {
	
	
	public StringBuffer passwordResetTemple (String nPwd) {

		StringBuffer buf = new StringBuffer();
		
		buf.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
				"<head>\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width\">\n" + 
				"    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" + 
				"    <title>Actionable emails e.g. reset password</title>\n" + 
				"</head>\n" + 
				"<style>\n" + 
				"@media only screen and (max-width: 640px) {\n" + 
				"  h1,\n" + 
				"h2,\n" + 
				"h3,\n" + 
				"h4 {\n" + 
				"    font-weight: 600 !important;\n" + 
				"    margin: 20px 0 5px !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  h1 {\n" + 
				"    font-size: 22px !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  h2 {\n" + 
				"    font-size: 18px !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  h3 {\n" + 
				"    font-size: 16px !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  .container {\n" + 
				"    width: 100% !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  .content,\n" + 
				".content-wrap {\n" + 
				"    padding: 10px !important;\n" + 
				"  }\n" + 
				"\n" + 
				"  .invoice {\n" + 
				"    width: 100% !important;\n" + 
				"  }\n" + 
				"}\n" + 
				"</style>\n" + 
				"<body style=\"-webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; height: 100%; line-height: 1.6; background-color: #f6f6f6; width: 100%;\">\n" + 
				"\n" + 
				"<table class=\"body-wrap\" style=\"background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\n" + 
				"    <tr>\n" + 
				"        <td style=\"vertical-align: top;\" valign=\"top\"></td>\n" + 
				"        <td class=\"container\" width=\"600\" style=\"vertical-align: top; display: block; max-width: 600px; margin: 0 auto; clear: both;\" valign=\"top\">\n" + 
				"            <div class=\"content\" style=\"max-width: 600px; margin: 0 auto; display: block; padding: 20px;\">\n" + 
				"                <table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background: #fff; border: 1px solid #e9e9e9; border-radius: 3px;\">\n" + 
				"                    <tr>\n" + 
				"                        <td class=\"content-wrap\" style=\"vertical-align: top; padding: 20px;\" valign=\"top\">\n" + 
				"                            <table cellpadding=\"0\" cellspacing=\"0\">\n" + 
				"                                <tr>\n" + 
				"                                    <td style=\"vertical-align: top;\" valign=\"top\">\n" + 
				"                                        <img class=\"img-fluid\" src=\"http://www.ideacrm.co.kr/ideaimg/etop.png\"><!--ideacrm 마크 바인딩 부분-->\n" + 
				"                                    </td>\n" + 
				"                                </tr>\n" + 
				"                                <tr>\n" + 
				"                                    <td class=\"content-block\" style=\"vertical-align: top; padding: 0 0 20px;\" valign=\"top\">\n" + 
				"                                        <h3 style=\"font-family: 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; color: #000; margin: 40px 0 0; line-height: 1.2; font-weight: 400; font-size: 18px; text-align: center;\">IDEA CRM 안내 메일</h3>\n" + 
				"                                    </td>\n" + 
				"                                </tr>\n" +  
				"                                <tr>\n" + 
				"                                    <td class=\"content-block\" style=\"vertical-align: top; padding: 0 0 20px;\" valign=\"top\">");
		
		buf.append("초기화된 비밀번호는 "+ "<strong>" +nPwd+ "</strong>"+" 입니다. ");
		buf.append("</td>\n" + 
				"                                </tr>\n" + 
				"                                <tr>\n" + 
				"                                    <td class=\"content-block\" style=\"vertical-align: top; padding: 0 0 20px;\" valign=\"top\">\n" + 
				"                                        FROM. IDEA CRM\n" + 
				"                                    </td>\n" + 
				"                                </tr>                              \n" + 
				"                              </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                </table>\n" + 
				"                <div class=\"footer\" style=\"width: 100%; clear: both; color: #999; padding: 20px;\">\n" + 
				"                    <table width=\"100%\">\n" + 
				"                        <tr>\n" + 
				"                            <td class=\"aligncenter content-block\" style=\"vertical-align: top; padding: 0 0 20px; text-align: center; font-size: 12px;\" valign=\"top\" align=\"center\">Follow <a href=\"http://www.crudsystem.co.kr\" style=\"text-decoration: underline; color: #999; font-size: 12px;\">@Company</a> on IDEA CRM.</td>\n" + 
				"                        </tr>\n" + 
				"                    </table>\n" + 
				"                </div></div>\n" + 
				"        </td>\n" + 
				"        <td style=\"vertical-align: top;\" valign=\"top\"></td>\n" + 
				"    </tr>\n" + 
				"</table>\n" + 
				"</body>\n" + 
				"</html>");

		
		return buf;
	}
}
