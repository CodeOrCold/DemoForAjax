package com.kicom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kicom.entity.Note;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class LoadNoteServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//将笔记信息以JSON格式输出
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<Note> list = new ArrayList<Note>();
		
		Note note = new Note();
		note.setId("01");
		note.setName("Java变量");
		
		Note note2 = new Note();
		note2.setId("02");
		note2.setName("Ajax应用");
		list.add(note);
		list.add(note2);
		
//		JSONObject jsonObject = JSONObject.fromObject(list);
		JSONArray json = JSONArray.fromObject(list);
		
		String json_str = json.toString();
		System.out.println(json_str);
		out.println(json_str);
		
		
		out.flush();
		out.close();
		
	}
}
