package com.bofa.table;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
		
		String excelFilePath = "C:\\Users\\varun\\Desktop\\Test1.xlsx";
		
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
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
		for(Ticket ticket:pendingList) {
			System.out.println(ticket.getInc());
		}
		workbook.close();
		
		
		request.getSession().setAttribute("unassigned", pendingList);
		request.getSession().setAttribute("assigned", assignList);
		request.getSession().setAttribute("inprogress", progressList);
		request.getSession().setAttribute("unsize", pendingList.size());
		request.getSession().setAttribute("assize", assignList.size());
		request.getSession().setAttribute("inprsize", progressList.size());
		response.sendRedirect("home.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
