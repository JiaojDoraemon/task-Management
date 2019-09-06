package com.mana.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mana.pojo.User;
import com.mana.pojo.Usertask;
import com.mana.svc.TaskInfoSvc;

@Controller
public class ManageAction {
	@Autowired
	private TaskInfoSvc taskInfosvc; //服务层
	
	
	@RequestMapping("backmanagemain")
	public String backmain() {
		return "management";
	}
	
	@RequestMapping("go") //实现跳转页面
	public String go() {
		return "saveuser";
	}
	
	@RequestMapping("saveu")
	public String saveUser(){
		return "saveuser";
	}
	
	@RequestMapping("inputUser")
	public String inputUser(@RequestParam String userid, @RequestParam String username, User user, HttpSession session) {
		//User user = taskInfosvc.getUserById(userid);
		
		user.setUserid(userid);
		user.setName(username);
		user.setUserpassword("abcd1234");
		taskInfosvc.insertUser(user);
		session.setAttribute("user", user);
		return "insterusersu";
		
	}
	
	@RequestMapping("getAllUser")
	public String getAllUser(Model model) {
		List<User> userlist= taskInfosvc.getAlluser();
		model.addAttribute("userlist", userlist);
		return "alluser";
		
	}
	
	@RequestMapping("getAlltask")
	public String getAlltask(Model model) {
		List<Usertask> usertasklist = taskInfosvc.getAlltask();
		model.addAttribute("usertasklist",usertasklist);
		return "alltask";
		
	}
	
	@RequestMapping("/updateuser")
	public String alterTask(int param, String name, String userpassword, String userid, User user, HttpSession session, Model model) {
		if(param == 0) {
			user = taskInfosvc.getUserById(userid);
			model.addAttribute("user", user);
			return "alteruser";
		}else if(param == 1) {
			
			user.setUserid(userid);
			user.setName(name);
			user.setUserpassword(userpassword);
			taskInfosvc.updateUser(user);
			session.setAttribute("user", user);
		}
		
		return "user";
		
	}
	
	@RequestMapping("/deleteuser")
	public String deleteTask(String userid) { //删除任务
		taskInfosvc.deleteUser(userid);
		return "user";
	}

}
