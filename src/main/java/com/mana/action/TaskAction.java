package com.mana.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mana.pojo.Manager;
import com.mana.pojo.User;
import com.mana.pojo.Usertask;
import com.mana.svc.TaskInfoSvc;

@Controller
public class TaskAction {
	@Autowired
	private TaskInfoSvc taskInfo; //服务层
	
	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		request.setAttribute("key", "Sd");
		return "login";
	}
	
	@RequestMapping("backusermain")
	public String backmain() {
		return "usermain";
	}
	
	@RequestMapping("skip") //实现跳转页面
	public String skip() {
		return "usertask";
	}
	
	/**
	 * 
	 * @Title: getLogin
	 * @Description: 获取登录信息，判断登录的是用户还是管理员
	 * @param id
	 * @param pwd
	 * @param choice
	 * @return
	 */
	@RequestMapping("getLogin")
	public String getLogin(@RequestParam String id, @RequestParam String pwd,@RequestParam String choice,HttpSession session) {
		Manager manage;
		User user;
		System.out.println(id+"2342413");
		if(choice.equals("") && id =="" && pwd == "") {
			return "errorlogin";
		}

		else {
			if(choice.equals("mana") ) {
				 manage=taskInfo.getManagerbyId(id);
				 System.out.println(manage+"24432");
				if(manage != null && manage.getManapassword().equals(pwd)) { //获取管理员信息
					
					//session.setAttribute("manage",mana);
					return "management";
					
				}else {
					return "errorlogin";
				}
				
			}else {
				user=taskInfo.getUserById(id);
				if(user != null && user.getUserpassword().equals(pwd)) {
					session.setAttribute("user", user);
					return "usermain";
					
				}else {
					
					return "usererror";
				}
				
			}
		}
		
	}
	
	/**
	 * 
	 * @Title: openUser
	 * @Description:自动获取账号
	 * @param session
	 * @return
	 */
	@RequestMapping("openuser")
	public String openUser(HttpSession session) {
		System.out.println("进入获取账户页面");
		int min = 10000;
		int max = 1000000;
		int n = 200;
		int[] result = new int[n];
		int count = 0;
		while(count < n) {
			int num = (int) ((Math.random()*(max-min))+min);
			boolean flag = true;
			for(int j=0; j<n; j++) {
				if(num==result[j]) {
					flag = false;
					break;
				}
			}
			if(flag) {
				result[count] = num;
				session.setAttribute("id", result[count]);
				count++;			
			}
		}
		
		return "register";
	}
	
	/**
	 * 
	 * @Title: getUser
	 * @Description: 用户注册
	 * @param id
	 * @param name
	 * @param psw
	 * @param usertask
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("getUser")
	public String getUser(@RequestParam String id, @RequestParam String name, @RequestParam String psw, 
			User user, HttpSession session, ServletRequest request) {
		
		User user1 = taskInfo.getUserById(id);
		if(user1 != null) {
			return "registereror";
		}
		else {
			user.setUserid(id);
			user.setName(name);
			user.setUserpassword(psw);
			return "registersuccess";
		}
		
	}
	/**
	 * 
	 * @Title: getSaveTask
	 * @Description: 获取添加任务界面
	 * @return
	 */	
	@RequestMapping("getSaveTask")
	public String saveTask(HttpSession session) {
		int min = 1;
		int max = 1000;
		int n = 200;
		int[] result = new int[n];
		int count = 0;
		while(count < n) {
			int num = (int) ((Math.random()*(max-min))+min);
			boolean flag = true;
			for(int j=0; j<n; j++) {
				if(num==result[j]) {
					flag = false;
					break;
				}
			}
			if(flag) {
				result[count] = num;
				session.setAttribute("id", result[count]);
				count++;			
			}
		}
		
		return "usertask";
	}
	
	/**
	 * 
	 * @Title: saveTask
	 * @Description: 保存任务
	 * @param title
	 * @param cont
	 * @param session
	 * @return
	 */
	@RequestMapping("saveTask")
	public String saveTask(@RequestParam String taskid, @RequestParam String title, @RequestParam String cont,HttpSession session, Usertask task) {
		User user = (User) session.getAttribute("user"); //获取当前用户id
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //获取当前时间
		String str=sdf.format(new Date());
		String userid = user.getUserid();
		
		System.out.println(userid+"1231131");
		task.setTaskid(taskid);
		task.setUserid(userid);
		task.setTitle(title);
		task.setContent(cont);
		task.setTime(str);
		task.setSchedule("0");
		
		taskInfo.insertUsertask(task);
		//taskInfo.updateTask(task);
		session.setAttribute("task", task);
		return "insertsuccess";	
		
	}
	
	/**
	 * 
	 * @Title: getTask
	 * @Description: 获取查询任务界面
	 * @return
	 */
	@RequestMapping("getTask")
	public String getTask(Model model, HttpSession session, ServletRequest request) {
		
		User user = (User) session.getAttribute("user"); //获取当前用户
		String id = user.getUserid();
		List<Usertask> task = taskInfo.getTaskById(id);
		//model.addAttribute("task", task);
		//request.setAttribute("task", task);
		session.setAttribute("task", task);
		return "showtask";
		
		
	}
	
	
	@RequestMapping("/updatetask")
	public String alterTask(int param, String cont, String title, String schedule, 
			String taskid, Usertask task, HttpSession session, Model model) {
		if(param == 0) {
			System.out.println(taskid+"43212312432");
			task = taskInfo.selectBytaskId(taskid);
			model.addAttribute("task", task);
			return "altertask";
		}else if(param == 1) {
			User user = (User) session.getAttribute("user");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //获取当前时间
			String str=sdf.format(new Date());
			task.setTaskid(taskid+"");
			task.setUserid(user.getUserid());
			task.setTime(str);
			task.setTitle(title);
			task.setSchedule(schedule+"%");
			task.setContent(cont);
			taskInfo.updateTask(task);
			session.setAttribute("task", task);
		}
		
		return "task";
		
	}
	
	@RequestMapping("/deletetask")
	public String deleteTask(String taskid) { //删除任务
		taskInfo.deleteTask(taskid);
		return "task";
		
	}
	

}
