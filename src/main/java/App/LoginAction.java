/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App;

import Controller.LoginDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Ngoc Do Minh
 */
public class LoginAction extends ActionSupport implements SessionAware{

    SessionMap<String, Object> sessionMap;
    private String email;
    private String username;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LoginAction() {
    }

    public String userLogin() throws Exception {
        LoginDataProcess loginDataProcess = new LoginDataProcess();
        if (!loginDataProcess.checkUser(email)) {
            loginDataProcess.addUser(email, username);
        }
        
        sessionMap.put("username", username);
        return "DEMOPAGE";
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }
}
