package saas.crud.crm.ce;

public class EmailTemplate {
	
	//사용자 비밀번호초기화
	public StringBuffer passwordResetTemple (String nPwd, String usrName) {
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
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append("<strong>"+ usrName +"</strong>의 비밀번호가 초기화 되었습니다.");
		buf.append("</td>\r\n" + 
				"                                </tr>"+
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
	
	//사이트비밀번호초기화
	public StringBuffer sitePwdRestTemle(String nPwd, String siteName) {
		StringBuffer buf = new StringBuffer();
		buf.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + 
				"<head>\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width\" />\r\n" + 
				"    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n" + 
				"    <title>Actionable emails e.g. reset password</title>\r\n" + 
				"</head>\r\n" + 
				"<style>\r\n" + 
				" {\r\n" + 
				"    margin: 0;\r\n" + 
				"    padding: 0;\r\n" + 
				"    font-family: \"Helvetica Neue\", \"Helvetica\", Helvetica, Arial, sans-serif;\r\n" + 
				"    box-sizing: border-box;\r\n" + 
				"    font-size: 14px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"img {\r\n" + 
				"    max-width: 100%;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"body {\r\n" + 
				"    -webkit-font-smoothing: antialiased;\r\n" + 
				"    -webkit-text-size-adjust: none;\r\n" + 
				"    width: 100% !important;\r\n" + 
				"    height: 100%;\r\n" + 
				"    line-height: 1.6;\r\n" + 
				"}\r\n" + 
				"table td {\r\n" + 
				"    vertical-align: top;\r\n" + 
				"}\r\n" + 
				"body {\r\n" + 
				"    background-color: #f6f6f6;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".body-wrap {\r\n" + 
				"    background-color: #f6f6f6;\r\n" + 
				"    width: 100%;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".container {\r\n" + 
				"    display: block !important;\r\n" + 
				"    max-width: 600px !important;\r\n" + 
				"    margin: 0 auto !important;\r\n" + 
				"    clear: both !important;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content {\r\n" + 
				"    max-width: 600px;\r\n" + 
				"    margin: 0 auto;\r\n" + 
				"    display: block;\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				".main {\r\n" + 
				"    background: #fff;\r\n" + 
				"    border: 1px solid #e9e9e9;\r\n" + 
				"    border-radius: 3px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content-wrap {\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content-block {\r\n" + 
				"    padding: 0 0 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".header {\r\n" + 
				"    width: 100%;\r\n" + 
				"    margin-bottom: 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".footer {\r\n" + 
				"    width: 100%;\r\n" + 
				"    clear: both;\r\n" + 
				"    color: #999;\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				".footer a {\r\n" + 
				"    color: #999;\r\n" + 
				"}\r\n" + 
				".footer p, .footer a, .footer unsubscribe, .footer td {\r\n" + 
				"    font-size: 12px;\r\n" + 
				"}\r\n" + 
				"h1, h2, h3 {\r\n" + 
				"    font-family: \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n" + 
				"    color: #000;\r\n" + 
				"    margin: 40px 0 0;\r\n" + 
				"    line-height: 1.2;\r\n" + 
				"    font-weight: 400;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h1 {\r\n" + 
				"    font-size: 32px;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h2 {\r\n" + 
				"    font-size: 24px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h3 {\r\n" + 
				"    font-size: 18px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h4 {\r\n" + 
				"    font-size: 14px;\r\n" + 
				"    font-weight: 600;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p, ul, ol {\r\n" + 
				"    margin-bottom: 10px;\r\n" + 
				"    font-weight: normal;\r\n" + 
				"}\r\n" + 
				"p li, ul li, ol li {\r\n" + 
				"    margin-left: 5px;\r\n" + 
				"    list-style-position: inside;\r\n" + 
				"}\r\n" + 
				"a {\r\n" + 
				"    color: #1ab394;\r\n" + 
				"    text-decoration: underline;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".btn-primary {\r\n" + 
				"    text-decoration: none;\r\n" + 
				"    color: #FFF;\r\n" + 
				"    background-color: #1ab394;\r\n" + 
				"    border: solid #1ab394;\r\n" + 
				"    border-width: 5px 10px;\r\n" + 
				"    line-height: 2;\r\n" + 
				"    font-weight: bold;\r\n" + 
				"    text-align: center;\r\n" + 
				"    cursor: pointer;\r\n" + 
				"    display: inline-block;\r\n" + 
				"    border-radius: 5px;\r\n" + 
				"    text-transform: capitalize;\r\n" + 
				"}\r\n" + 
				".last {\r\n" + 
				"    margin-bottom: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".first {\r\n" + 
				"    margin-top: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".aligncenter {\r\n" + 
				"    text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".alignright {\r\n" + 
				"    text-align: right;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".alignleft {\r\n" + 
				"    text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".clear {\r\n" + 
				"    clear: both;\r\n" + 
				"}\r\n" + 
				".alert {\r\n" + 
				"    font-size: 16px;\r\n" + 
				"    color: #fff;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"    padding: 20px;\r\n" + 
				"    text-align: center;\r\n" + 
				"    border-radius: 3px 3px 0 0;\r\n" + 
				"}\r\n" + 
				".alert a {\r\n" + 
				"    color: #fff;\r\n" + 
				"    text-decoration: none;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"    font-size: 16px;\r\n" + 
				"}\r\n" + 
				".alert.alert-warning {\r\n" + 
				"    background: #f8ac59;\r\n" + 
				"}\r\n" + 
				".alert.alert-bad {\r\n" + 
				"    background: #ed5565;\r\n" + 
				"}\r\n" + 
				".alert.alert-good {\r\n" + 
				"    background: #1ab394;\r\n" + 
				"}\r\n" + 
				".invoice {\r\n" + 
				"    margin: 40px auto;\r\n" + 
				"    text-align: left;\r\n" + 
				"    width: 80%;\r\n" + 
				"}\r\n" + 
				".invoice td {\r\n" + 
				"    padding: 5px 0;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items {\r\n" + 
				"    width: 100%;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items td {\r\n" + 
				"    border-top: #eee 1px solid;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items .total td {\r\n" + 
				"    border-top: 2px solid #333;\r\n" + 
				"    border-bottom: 2px solid #333;\r\n" + 
				"    font-weight: 700;\r\n" + 
				"}\r\n" + 
				"@media only screen and (max-width: 640px) {\r\n" + 
				"    h1, h2, h3, h4 {\r\n" + 
				"        font-weight: 600 !important;\r\n" + 
				"        margin: 20px 0 5px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h1 {\r\n" + 
				"        font-size: 22px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h2 {\r\n" + 
				"        font-size: 18px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h3 {\r\n" + 
				"        font-size: 16px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .container {\r\n" + 
				"        width: 100% !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .content, .content-wrap {\r\n" + 
				"        padding: 10px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .invoice {\r\n" + 
				"        width: 100% !important;\r\n" + 
				"    }\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"</style>\r\n" + 
				"<body>\r\n" + 
				"\r\n" + 
				"<table class=\"body-wrap\">\r\n" + 
				"    <tr>\r\n" + 
				"        <td></td>\r\n" + 
				"        <td class=\"container\" width=\"600\">\r\n" + 
				"            <div class=\"content\">\r\n" + 
				"                <table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"                    <tr>\r\n" + 
				"                        <td class=\"content-wrap\">\r\n" + 
				"                            <table  cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td>\r\n" + 
				"                                        <img class=\"img-fluid\" src=\"http://www.ideacrm.co.kr/ideaimg/etop.png\"/><!--ideacrm 마크 바인딩 부분-->\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">\r\n" + 
				"                                        <h3 style=\"text-align: center\">IDEA CRM 사이트 관리자 비밀번호 초기화</h3>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append("<strong>"+siteName+"</strong> 관리계정 비밀번호가 초기화되었습니다."); //사이트이름 바인딩
		buf.append("</td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append("초기화된 비밀번호는 "+ "<strong>" +nPwd+ "</strong>"+" 입니다. "); //초기화 비밀번호
		buf.append(" </td>\r\n" + 
				"                                </tr>                                \r\n" + 
				"                              </table>\r\n" + 
				"                        </td>\r\n" + 
				"                    </tr>\r\n" + 
				"                </table>\r\n" + 
				"                <div class=\"footer\">\r\n" + 
				"                    <table width=\"100%\">\r\n" + 
				"                        <tr>\r\n" + 
				"                            <td class=\"aligncenter content-block\">Follow <a href=\"http://www.crudsystem.co.kr\">@Company</a> on IDEA CRM.</td>\r\n" + 
				"                        </tr>\r\n" + 
				"                    </table>\r\n" + 
				"                </div></div>\r\n" + 
				"        </td>\r\n" + 
				"        <td></td>\r\n" + 
				"    </tr>\r\n" + 
				"</table>\r\n" + 
				"\r\n" + 
				"</body>\r\n" + 
				"</html>");
		return buf;
	}
	
	//내부통지 템플릿
	public StringBuffer noteEmailTemle(String to, String from, String url, String subject, String content) {
		StringBuffer buf = new StringBuffer();
		buf.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + 
				"<head>\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width\" />\r\n" + 
				"    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n" + 
				"    <title>Actionable emails e.g. reset password</title>\r\n" + 
				"</head>\r\n" + 
				"<style>\r\n" + 
				" {\r\n" + 
				"    margin: 0;\r\n" + 
				"    padding: 0;\r\n" + 
				"    font-family: \"Helvetica Neue\", \"Helvetica\", Helvetica, Arial, sans-serif;\r\n" + 
				"    box-sizing: border-box;\r\n" + 
				"    font-size: 14px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"img {\r\n" + 
				"    max-width: 100%;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"body {\r\n" + 
				"    -webkit-font-smoothing: antialiased;\r\n" + 
				"    -webkit-text-size-adjust: none;\r\n" + 
				"    width: 100% !important;\r\n" + 
				"    height: 100%;\r\n" + 
				"    line-height: 1.6;\r\n" + 
				"}\r\n" + 
				"table td {\r\n" + 
				"    vertical-align: top;\r\n" + 
				"}\r\n" + 
				"body {\r\n" + 
				"    background-color: #f6f6f6;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".body-wrap {\r\n" + 
				"    background-color: #f6f6f6;\r\n" + 
				"    width: 100%;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".container {\r\n" + 
				"    display: block !important;\r\n" + 
				"    max-width: 600px !important;\r\n" + 
				"    margin: 0 auto !important;\r\n" + 
				"    clear: both !important;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content {\r\n" + 
				"    max-width: 600px;\r\n" + 
				"    margin: 0 auto;\r\n" + 
				"    display: block;\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				".main {\r\n" + 
				"    background: #fff;\r\n" + 
				"    border: 1px solid #e9e9e9;\r\n" + 
				"    border-radius: 3px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content-wrap {\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".content-block {\r\n" + 
				"    padding: 0 0 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".header {\r\n" + 
				"    width: 100%;\r\n" + 
				"    margin-bottom: 20px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".footer {\r\n" + 
				"    width: 100%;\r\n" + 
				"    clear: both;\r\n" + 
				"    color: #999;\r\n" + 
				"    padding: 20px;\r\n" + 
				"}\r\n" + 
				".footer a {\r\n" + 
				"    color: #999;\r\n" + 
				"}\r\n" + 
				".footer p, .footer a, .footer unsubscribe, .footer td {\r\n" + 
				"    font-size: 12px;\r\n" + 
				"}\r\n" + 
				"h1, h2, h3 {\r\n" + 
				"    font-family: \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n" + 
				"    color: #000;\r\n" + 
				"    margin: 40px 0 0;\r\n" + 
				"    line-height: 1.2;\r\n" + 
				"    font-weight: 400;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h1 {\r\n" + 
				"    font-size: 32px;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h2 {\r\n" + 
				"    font-size: 24px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h3 {\r\n" + 
				"    font-size: 18px;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"h4 {\r\n" + 
				"    font-size: 14px;\r\n" + 
				"    font-weight: 600;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"p, ul, ol {\r\n" + 
				"    margin-bottom: 10px;\r\n" + 
				"    font-weight: normal;\r\n" + 
				"}\r\n" + 
				"p li, ul li, ol li {\r\n" + 
				"    margin-left: 5px;\r\n" + 
				"    list-style-position: inside;\r\n" + 
				"}\r\n" + 
				"a {\r\n" + 
				"    color: #1ab394;\r\n" + 
				"    text-decoration: underline;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".btn-primary {\r\n" + 
				"    text-decoration: none;\r\n" + 
				"    color: #FFF;\r\n" + 
				"    background-color: #1ab394;\r\n" + 
				"    border: solid #1ab394;\r\n" + 
				"    border-width: 5px 10px;\r\n" + 
				"    line-height: 2;\r\n" + 
				"    font-weight: bold;\r\n" + 
				"    text-align: center;\r\n" + 
				"    cursor: pointer;\r\n" + 
				"    display: inline-block;\r\n" + 
				"    border-radius: 5px;\r\n" + 
				"    text-transform: capitalize;\r\n" + 
				"}\r\n" + 
				".last {\r\n" + 
				"    margin-bottom: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".first {\r\n" + 
				"    margin-top: 0;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".aligncenter {\r\n" + 
				"    text-align: center;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".alignright {\r\n" + 
				"    text-align: right;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".alignleft {\r\n" + 
				"    text-align: left;\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				".clear {\r\n" + 
				"    clear: both;\r\n" + 
				"}\r\n" + 
				".alert {\r\n" + 
				"    font-size: 16px;\r\n" + 
				"    color: #fff;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"    padding: 20px;\r\n" + 
				"    text-align: center;\r\n" + 
				"    border-radius: 3px 3px 0 0;\r\n" + 
				"}\r\n" + 
				".alert a {\r\n" + 
				"    color: #fff;\r\n" + 
				"    text-decoration: none;\r\n" + 
				"    font-weight: 500;\r\n" + 
				"    font-size: 16px;\r\n" + 
				"}\r\n" + 
				".alert.alert-warning {\r\n" + 
				"    background: #f8ac59;\r\n" + 
				"}\r\n" + 
				".alert.alert-bad {\r\n" + 
				"    background: #ed5565;\r\n" + 
				"}\r\n" + 
				".alert.alert-good {\r\n" + 
				"    background: #1ab394;\r\n" + 
				"}\r\n" + 
				".invoice {\r\n" + 
				"    margin: 40px auto;\r\n" + 
				"    text-align: left;\r\n" + 
				"    width: 80%;\r\n" + 
				"}\r\n" + 
				".invoice td {\r\n" + 
				"    padding: 5px 0;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items {\r\n" + 
				"    width: 100%;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items td {\r\n" + 
				"    border-top: #eee 1px solid;\r\n" + 
				"}\r\n" + 
				".invoice .invoice-items .total td {\r\n" + 
				"    border-top: 2px solid #333;\r\n" + 
				"    border-bottom: 2px solid #333;\r\n" + 
				"    font-weight: 700;\r\n" + 
				"}\r\n" + 
				"@media only screen and (max-width: 640px) {\r\n" + 
				"    h1, h2, h3, h4 {\r\n" + 
				"        font-weight: 600 !important;\r\n" + 
				"        margin: 20px 0 5px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h1 {\r\n" + 
				"        font-size: 22px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h2 {\r\n" + 
				"        font-size: 18px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    h3 {\r\n" + 
				"        font-size: 16px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .container {\r\n" + 
				"        width: 100% !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .content, .content-wrap {\r\n" + 
				"        padding: 10px !important;\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"    .invoice {\r\n" + 
				"        width: 100% !important;\r\n" + 
				"    }\r\n" + 
				"}\r\n" + 
				"\r\n" + 
				"</style>\r\n" + 
				"<body>\r\n" + 
				"\r\n" + 
				"<table class=\"body-wrap\">\r\n" + 
				"    <tr>\r\n" + 
				"        <td></td>\r\n" + 
				"        <td class=\"container\" width=\"600\">\r\n" + 
				"            <div class=\"content\">\r\n" + 
				"                <table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"                    <tr>\r\n" + 
				"                        <td class=\"content-wrap\">\r\n" + 
				"                            <table  cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td>\r\n" + 
				"                                        <img class=\"img-fluid\" src=\"http://www.ideacrm.co.kr/ideaimg/etop.png\"/><!--ideacrm 마크 바인딩 부분-->\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">\r\n" + 
				"                                        <h3 style=\"text-align: center\">");
		buf.append(subject); //제목
		buf.append("</h3>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append("To. <strong>"+to+"</strong>"); //받는이
		buf.append("</td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append(content); //내용
		buf.append(" </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block\">");
		buf.append(" FROM. <strong>"+from+"</strong>"); //보낸이
		buf.append("</td>\r\n" + 
				"                                </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class=\"content-block aligncenter\">\r\n" + 
				"                                        <a href=\"");
		buf.append(url); //url 전송
		buf.append("\" class=\"btn-primary\">자세히 보기</a>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                              </table>\r\n" + 
				"                        </td>\r\n" + 
				"                    </tr>\r\n" + 
				"                </table>\r\n" + 
				"                <div class=\"footer\">\r\n" + 
				"                    <table width=\"100%\">\r\n" + 
				"                        <tr>\r\n" + 
				"                            <td class=\"aligncenter content-block\">Follow <a href=\"http://www.crudsystem.co.kr\">@Company</a> on IDEA CRM.</td>\r\n" + 
				"                        </tr>\r\n" + 
				"                    </table>\r\n" + 
				"                </div></div>\r\n" + 
				"        </td>\r\n" + 
				"        <td></td>\r\n" + 
				"    </tr>\r\n" + 
				"</table>\r\n" + 
				"\r\n" + 
				"</body>\r\n" + 
				"</html>");
		
		return buf;
	}
	
}
