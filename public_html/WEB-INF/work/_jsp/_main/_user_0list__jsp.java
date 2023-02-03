/*
 * JSP generated by Resin-4.0.65 (built Thu, 23 Jul 2020 12:51:29 PDT)
 */

package _jsp._main;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import dao.*;
import malgnsoft.db.*;
import malgnsoft.util.*;

public class _user_0list__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;
  private boolean _caucho_isNotModified;
  private com.caucho.jsp.PageManager _jsp_pageManager;
  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    com.caucho.jsp.PageContextImpl pageContext = _jsp_pageManager.allocatePageContext(this, _jsp_application, request, response, null, session, 8192, true, false);

    TagState _jsp_state = null;

    try {
      _jspService(request, response, pageContext, _jsp_application, session, _jsp_state);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      _jsp_pageManager.freePageContext(pageContext);
    }
  }
  
  private void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response,
              com.caucho.jsp.PageContextImpl pageContext,
              javax.servlet.ServletContext application,
              javax.servlet.http.HttpSession session,
              TagState _jsp_state)
    throws Throwable
  {
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    javax.servlet.jsp.tagext.JspTag _jsp_parent_tag = null;
    com.caucho.jsp.PageContextImpl _jsp_parentContext = pageContext;
    response.setContentType("text/html; charset=utf-8");

    out.write(_jsp_string0, 0, _jsp_string0.length);
    

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

//IP\ucc28\ub2e8

p.setRequest(request);
p.setPageContext(pageContext);
p.setWriter(out);
p.setVar("SYS_TITLE", "Demo site");
p.setBaseRoot("/home/newexam/public_html/html");

//\uc5b8\uc5b4
//String sysLocale = !m.getCookie("SITE_LANG").equals("") ? m.getCookie("SITE_LANG") : "ko";
//Message _message = new Message(sysLocale);
//m.setMessage(_message);
//p.setMessage(_message);


    

String ch = m.rs("ch", "top");


    
    if(userId == 0){
        m.jsAlert("Sign in first!!!!!");
        m.jsReplace("./index.jsp", "parent");
        return;
    }

    UserDao userDao = new UserDao();
    DataSet users = userDao.find("");

    while (users.next()){
        users.put("username", users.s("username"));
    }

    String a = " ";

    for (String key : users.get(0).keySet()){
        a +=  " key : " + key + ", " + users.get(0).get(key) + "] ";
    }

    users.put("email", users.s("email"));

    p.setLayout(ch);
    p.setBody("main.user_list");
    p.setLoop("users", users);
    p.display();

  }

  private com.caucho.make.DependencyContainer _caucho_depends
    = new com.caucho.make.DependencyContainer();

  public java.util.ArrayList<com.caucho.vfs.Dependency> _caucho_getDependList()
  {
    return _caucho_depends.getDependencies();
  }

  public void _caucho_addDepend(com.caucho.vfs.PersistentDependency depend)
  {
    super._caucho_addDepend(depend);
    _caucho_depends.add(depend);
  }

  protected void _caucho_setNeverModified(boolean isNotModified)
  {
    _caucho_isNotModified = true;
  }

  public boolean _caucho_isModified()
  {
    if (_caucho_isDead)
      return true;

    if (_caucho_isNotModified)
      return false;

    if (com.caucho.server.util.CauchoSystem.getVersionId() != -8015560415763005127L)
      return true;

    return _caucho_depends.isModified();
  }

  public long _caucho_lastModified()
  {
    return 0;
  }

  public void destroy()
  {
      _caucho_isDead = true;
      super.destroy();
    TagState tagState;
  }

  public void init(com.caucho.vfs.Path appDir)
    throws javax.servlet.ServletException
  {
    com.caucho.vfs.Path resinHome = com.caucho.server.util.CauchoSystem.getResinHome();
    com.caucho.vfs.MergePath mergePath = new com.caucho.vfs.MergePath();
    mergePath.addMergePath(appDir);
    mergePath.addMergePath(resinHome);
    com.caucho.loader.DynamicClassLoader loader;
    loader = (com.caucho.loader.DynamicClassLoader) getClass().getClassLoader();
    String resourcePath = loader.getResourcePathSpecificFirst();
    mergePath.addClassPath(resourcePath);
    com.caucho.vfs.Depend depend;
    depend = new com.caucho.vfs.Depend(appDir.lookup("main/user_list.jsp"), -7014808466604530000L, false);
    _caucho_depends.add(depend);
    loader.addDependency(depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("main/init.jsp"), -8025075245621299000L, false);
    _caucho_depends.add(depend);
    loader.addDependency(depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("init.jsp"), -8880833908526973471L, false);
    _caucho_depends.add(depend);
    loader.addDependency(depend);
  }

  final static class TagState {

    void release()
    {
    }
  }

  public java.util.HashMap<String,java.lang.reflect.Method> _caucho_getFunctionMap()
  {
    return _jsp_functionMap;
  }

  public void caucho_init(ServletConfig config)
  {
    try {
      com.caucho.server.webapp.WebApp webApp
        = (com.caucho.server.webapp.WebApp) config.getServletContext();
      init(config);
      if (com.caucho.jsp.JspManager.getCheckInterval() >= 0)
        _caucho_depends.setCheckInterval(com.caucho.jsp.JspManager.getCheckInterval());
      _jsp_pageManager = webApp.getJspApplicationContext().getPageManager();
      com.caucho.jsp.TaglibManager manager = webApp.getJspApplicationContext().getTaglibManager();
      com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.InitPageContextImpl(webApp, this);
    } catch (Exception e) {
      throw com.caucho.config.ConfigException.create(e);
    }
  }

  private final static char []_jsp_string0;
  static {
    _jsp_string0 = "\r\n".toCharArray();
  }
}
