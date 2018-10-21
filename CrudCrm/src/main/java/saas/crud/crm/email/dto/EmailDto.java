package saas.crud.crm.email.dto;

public class EmailDto {

    private int emaillogid;
    private int siteid;
    private int cstid;
    private int caseid;
    private int userid;
    private int subjectid;
    private String fromemail;
    private String fromname;
    private String toemail;
    private String ccemail;
    private String bccemail;
    private String subject;
    private String content;
    private int fileid;
    private String stbdatetime;
    private String schdatetime;
    private String senddatetime;
    private String rltdate;
    private String rltcode;
    private String rltcodeext;
    private int owner;
    private String logdesc;
    private int ntcid;
    private int adminpass;
    private String regdate;
    private int reguser;
    private String edtdate;
    private int edtuser;
    private int chksendmail;
    private String tonameemail;
    private String ccnameemail;
    private int resendid;
    private String monthdate;
    private String isValid;
    private int year;
    private int month;
    private int date;
    private int hour;
    private int dayOfWeek;
    private String kordayOfWeek;
    private String day;
    private String today;
    private int dayvalue;
    private String senddate;

    public EmailDto() { }

    public EmailDto(int emaillogid, int siteid, int cstid, int caseid, int userid, int subjectid, String fromemail, String fromname, String toemail, String ccemail, String bccemail, String subject, String content, int fileid, String stbdatetime, String schdatetime, String senddatetime, String rltdate, String rltcode, String rltcodeext, int owner, String logdesc, int ntcid, int adminpass, String regdate, int reguser, String edtdate, int edtuser, int chksendmail, String tonameemail, String ccnameemail, int resendid, String monthdate, String isValid, int year, int month, int date, int hour, int dayOfWeek, String kordayOfWeek, String day, String today, int dayvalue, String senddate) {
        this.emaillogid = emaillogid;
        this.siteid = siteid;
        this.cstid = cstid;
        this.caseid = caseid;
        this.userid = userid;
        this.subjectid = subjectid;
        this.fromemail = fromemail;
        this.fromname = fromname;
        this.toemail = toemail;
        this.ccemail = ccemail;
        this.bccemail = bccemail;
        this.subject = subject;
        this.content = content;
        this.fileid = fileid;
        this.stbdatetime = stbdatetime;
        this.schdatetime = schdatetime;
        this.senddatetime = senddatetime;
        this.rltdate = rltdate;
        this.rltcode = rltcode;
        this.rltcodeext = rltcodeext;
        this.owner = owner;
        this.logdesc = logdesc;
        this.ntcid = ntcid;
        this.adminpass = adminpass;
        this.regdate = regdate;
        this.reguser = reguser;
        this.edtdate = edtdate;
        this.edtuser = edtuser;
        this.chksendmail = chksendmail;
        this.tonameemail = tonameemail;
        this.ccnameemail = ccnameemail;
        this.resendid = resendid;
        this.monthdate = monthdate;
        this.isValid = isValid;
        this.year = year;
        this.month = month;
        this.date = date;
        this.hour = hour;
        this.dayOfWeek = dayOfWeek;
        this.kordayOfWeek = kordayOfWeek;
        this.day = day;
        this.today = today;
        this.dayvalue = dayvalue;
        this.senddate = senddate;
    }

    public int getEmaillogid() {
        return emaillogid;
    }

    public void setEmaillogid(int emaillogid) {
        this.emaillogid = emaillogid;
    }

    public int getSiteid() {
        return siteid;
    }

    public void setSiteid(int siteid) {
        this.siteid = siteid;
    }

    public int getCstid() {
        return cstid;
    }

    public void setCstid(int cstid) {
        this.cstid = cstid;
    }

    public int getCaseid() {
        return caseid;
    }

    public void setCaseid(int caseid) {
        this.caseid = caseid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(int subjectid) {
        this.subjectid = subjectid;
    }

    public String getFromemail() {
        return fromemail;
    }

    public void setFromemail(String fromemail) {
        this.fromemail = fromemail;
    }

    public String getFromname() {
        return fromname;
    }

    public void setFromname(String fromname) {
        this.fromname = fromname;
    }

    public String getToemail() {
        return toemail;
    }

    public void setToemail(String toemail) {
        this.toemail = toemail;
    }

    public String getCcemail() {
        return ccemail;
    }

    public void setCcemail(String ccemail) {
        this.ccemail = ccemail;
    }

    public String getBccemail() {
        return bccemail;
    }

    public void setBccemail(String bccemail) {
        this.bccemail = bccemail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getFileid() {
        return fileid;
    }

    public void setFileid(int fileid) {
        this.fileid = fileid;
    }

    public String getStbdatetime() {
        return stbdatetime;
    }

    public void setStbdatetime(String stbdatetime) {
        this.stbdatetime = stbdatetime;
    }

    public String getSchdatetime() {
        return schdatetime;
    }

    public void setSchdatetime(String schdatetime) {
        this.schdatetime = schdatetime;
    }

    public String getSenddatetime() {
        return senddatetime;
    }

    public void setSenddatetime(String senddatetime) {
        this.senddatetime = senddatetime;
    }

    public String getRltdate() {
        return rltdate;
    }

    public void setRltdate(String rltdate) {
        this.rltdate = rltdate;
    }

    public String getRltcode() {
        return rltcode;
    }

    public void setRltcode(String rltcode) {
        this.rltcode = rltcode;
    }

    public String getRltcodeext() {
        return rltcodeext;
    }

    public void setRltcodeext(String rltcodeext) {
        this.rltcodeext = rltcodeext;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public String getLogdesc() {
        return logdesc;
    }

    public void setLogdesc(String logdesc) {
        this.logdesc = logdesc;
    }

    public int getNtcid() {
        return ntcid;
    }

    public void setNtcid(int ntcid) {
        this.ntcid = ntcid;
    }

    public int getAdminpass() {
        return adminpass;
    }

    public void setAdminpass(int adminpass) {
        this.adminpass = adminpass;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getReguser() {
        return reguser;
    }

    public void setReguser(int reguser) {
        this.reguser = reguser;
    }

    public String getEdtdate() {
        return edtdate;
    }

    public void setEdtdate(String edtdate) {
        this.edtdate = edtdate;
    }

    public int getEdtuser() {
        return edtuser;
    }

    public void setEdtuser(int edtuser) {
        this.edtuser = edtuser;
    }

    public int getChksendmail() {
        return chksendmail;
    }

    public void setChksendmail(int chksendmail) {
        this.chksendmail = chksendmail;
    }

    public String getTonameemail() {
        return tonameemail;
    }

    public void setTonameemail(String tonameemail) {
        this.tonameemail = tonameemail;
    }

    public String getCcnameemail() {
        return ccnameemail;
    }

    public void setCcnameemail(String ccnameemail) {
        this.ccnameemail = ccnameemail;
    }

    public int getResendid() {
        return resendid;
    }

    public void setResendid(int resendid) {
        this.resendid = resendid;
    }

    public String getMonthdate() {
        return monthdate;
    }

    public void setMonthdate(String monthdate) {
        this.monthdate = monthdate;
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getKordayOfWeek() {
        return kordayOfWeek;
    }

    public void setKordayOfWeek(String kordayOfWeek) {
        this.kordayOfWeek = kordayOfWeek;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getToday() {
        return today;
    }

    public void setToday(String today) {
        this.today = today;
    }

    public int getDayvalue() {
        return dayvalue;
    }

    public void setDayvalue(int dayvalue) {
        this.dayvalue = dayvalue;
    }

    public String getSenddate() {
        return senddate;
    }

    public void setSenddate(String senddate) {
        this.senddate = senddate;
    }
}
