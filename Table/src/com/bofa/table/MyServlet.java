package com.bofa.table;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Ticket>pendingList = new ArrayList<Ticket>();
		List<Ticket>assignList = new ArrayList<Ticket>();
		List<Ticket>progressList = new ArrayList<Ticket>();
		try {
		String excelFilePath = "C:\\Users\\varun\\Desktop\\Test2.xlsx";
		Path path = Paths.get("C:\\Users\\varun\\Desktop\\Test2.xlsx");
		FileTime lastModified = Files.getLastModifiedTime(path);
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy - hh:mm:ss");
	    String fileTime = dateFormat.format(lastModified.toMillis());
	    System.err.println(lastModified+"  "+fileTime);
		XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
		Sheet firstSheet = workbook.getSheetAt(0);
		Iterator<Row> iterator = firstSheet.iterator();
		iterator.next();
		while(iterator.hasNext()) {
			Row nextRow = iterator.next();
			
			Cell incnoCell = nextRow.getCell(0);
			String inc = incnoCell.getStringCellValue();
			
			Cell statusCell = nextRow.getCell(1);
			String status = statusCell.getStringCellValue();
			
			Cell groupCell = nextRow.getCell(3);
			String group = groupCell.getStringCellValue();
			
			Cell priorityCell = nextRow.getCell(2);
			String priority = priorityCell.getStringCellValue();
			
			Cell asigneeCell = nextRow.getCell(4);
			String asignee = asigneeCell.getStringCellValue();
			
			Cell slaCell = nextRow.getCell(5);
			String sla = slaCell.getStringCellValue();
			
			
			Ticket ticket = new Ticket(status, inc, group, priority, asignee, sla);
			
			if(ticket.getStatus().equals("Pending")) {
				pendingList.add(ticket);
			}
			if(ticket.getStatus().equals("In Progress")) {
				progressList.add(ticket);
			}
			if(ticket.getStatus().equals("Assigned")) {
				assignList.add(ticket);
			}
		}
		workbook.close();
		
		
		request.getSession().setAttribute("unassigned", pendingList);
		request.getSession().setAttribute("assigned", assignList);
		request.getSession().setAttribute("inprogress", progressList);
		request.getSession().setAttribute("unsize", pendingList.size());
		request.getSession().setAttribute("assize", assignList.size());
		request.getSession().setAttribute("inprsize", progressList.size());
		request.getSession().setAttribute("fileTime",fileTime);
		response.sendRedirect("home.jsp");
	}
		catch(Exception e) {
			response.getWriter().print(e.toString());
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
