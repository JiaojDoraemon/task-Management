package com.mana.svc;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mana.mapper.ManagerMapper;
import com.mana.mapper.UserMapper;
import com.mana.mapper.UsertaskMapper;
import com.mana.pojo.Manager;
import com.mana.pojo.User;
import com.mana.pojo.Usertask;


/**
 * 
 * @ClassName: TaskInfoSvc
 * @Description: 服务层
 * @author 哆啦A梦
 * @date 2019年7月11日
 * @since JDK 1.8
 */

@Service
public class TaskInfoSvc {
	
	@Autowired(required=false)
	private ManagerMapper manageMapper;
	public Manager getManagerbyId(String id) {
		return manageMapper.selectByPrimaryKey(id); //通过管理员账号查询 并返回管理员信息
	}
	
	
	@Autowired(required=false)
	private UserMapper usermapper;
	public User getUserById(String id) {	
		User user = usermapper.selectByPrimaryKey(id);
		System.out.println(user+"32342121322");
		return user; //通过用户账号查询并返回用户信息
	}
	
	
	 @Autowired(required=false) 
	 private UsertaskMapper usertaskmapper; 
	 public List<Usertask> getTaskById(String userid) {
		 return usertaskmapper.selectByUserId(userid);//通过用户账号查找任务信息
		/*
		 * if(task!=null) { return task; }else{ task.add(null); task; }
		 */
	 }
	 
	 @Autowired(required=false)
	 public Usertask selectBytaskId(String taskid) {
		 return usertaskmapper.selectByPrimaryKey(taskid); //通过任务Id查找任务
	 }
	 
	 @Autowired(required=false) 
	 public boolean insertUsertask(Usertask task) {
		  return usertaskmapper.insert(task); //添加用户任务 
		
	}
	 
	 @Autowired(required=false)
	 public void updateTask(Usertask task) { //更新任务表
		 usertaskmapper.updateByPrimaryKey(task);
	 }
	 
	 @Autowired(required=false)
	 public void deleteTask(String taskid) { //删除任务
		 Usertask task = new Usertask();
		 task.setTaskid(taskid);
		 usertaskmapper.delete(taskid);
		 
	 }
	 
	 @Autowired(required=false)
	 public List<User> getAlluser(){
		 return usermapper.getAllUser(); //获取所有用户
	 }
	 
	 @Autowired(required=false)
	 public List<Usertask> getAlltask(){
		 return usertaskmapper.getAllTask(); //获取所有用户任务
	 }

	public User updateUser(User user) {
		 return usermapper.updateByPrimaryKey(user); //修改用户
		
	}

	public void deleteUser(String userid) { //删除用户
		
		User user = new User();
		user.setUserid(userid);
		usertaskmapper.delete(userid);
	}

	public boolean insertUser(User user) {
		return usermapper.insert(user);
		
	}

	
	
}
