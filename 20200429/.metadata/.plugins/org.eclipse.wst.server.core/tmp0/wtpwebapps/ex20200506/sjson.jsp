<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200506.*,java.util.*,org.json.simple.*"%>

<%	
	String scode=request.getParameter("scode");
	
	SDAO dao=new SDAO();
	ArrayList<SVO> list=dao.list();
	ArrayList<CVO> elist=dao.elist(scode);
	CVO vo=dao.avg(scode);
	
	JSONObject jObject=new JSONObject();
	
	JSONArray jArray=new JSONArray();
	for(SVO v:list) {
		JSONObject obj=new JSONObject();
		obj.put("scode", v.getScode());
		obj.put("sname", v.getSname());
		obj.put("sdept", v.getSdept());
		obj.put("pname", v.getPname());
		jArray.add(obj);
	}
	
	jObject.put("list", jArray);
	
	
	
	JSONArray jArray1=new JSONArray();
	for(CVO v:elist) {
		JSONObject obj=new JSONObject();
		obj.put("lcode", v.getLcode());
		obj.put("lname", v.getLname());
		obj.put("grade", v.getCount());
		jArray1.add(obj);
	}
	
	jObject.put("elist", jArray1);
	
	jObject.put("avg", vo.getAvg());
	jObject.put("cnt", vo.getCount());
	
	out.print(jObject);
%>