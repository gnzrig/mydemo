<%@ page import="java.util.*,java.io.*,dao.*,malgnsoft.db.*,malgnsoft.util.*,java.net.*" %><%
//request.setCharacterEncoding("utf-8");

String docRoot = Config.getDocRoot();
String jndi = Config.getJndi();

//Auth

Malgn m = new Malgn(request, response, out);

Form f = new Form("form1");
try { f.setRequest(request); }
catch(Exception ex) { out.print("Overflow file size. - " + ex.getMessage()); return; }

String webUrl = request.getScheme() + "://" + request.getServerName();
int port = request.getServerPort();
if(port != 80 && port != 443) webUrl += ":" + port;

String userIp = request.getRemoteAddr();

Page p = new Page(Config.getTplRoot());


//Session login
int siteId = 1;
int userId = 0;
String loginId = "";
String loginMethod = "";
String userName = "";
String userEmail = "";
String userKind = "";
int userDeptId = 0;
String userGroups = "";
int userGroupDisc = 0;
//String aloginYn = "";
String userSessionId = "";
String sysToday = m.time("yyyyMMdd");
String sysNow = m.time();

SiteDao siteDao = new SiteDao();
DataSet siteinfo = siteDao.find("");
while (siteinfo.next()){

}

Auth auth = new Auth(request, response);
auth.loginURL = "/course/login.jsp";
auth.keyName = "MLMS14" + "7";
if(auth.isValid()) {
    userId = auth.getInt("ID");
    loginId = auth.getString("USERNAME");
    userEmail = auth.getString("EMAIL");
    userSessionId = auth.getString("SESSIONID");

    m.setSession("SESSION_ID", userSessionId);

    p.setVar("login_block", true);
}

String sysLocale = m.getCookie("SITE_LANG");
m.setCookie("SITE_LANG", siteinfo.s("locale"));
Message _message = new Message(sysLocale);
m.setMessage(_message);
p.setMessage(_message);

//IP차단

p.setRequest(request);
p.setPageContext(pageContext);
p.setWriter(out);
p.setVar("SYS_TITLE", "Demo site");
p.setBaseRoot("/home/newexam/public_html/html");

//언어
//String sysLocale = !m.getCookie("SITE_LANG").equals("") ? m.getCookie("SITE_LANG") : "ko";
//Message _message = new Message(sysLocale);
//m.setMessage(_message);
//p.setMessage(_message);

%>