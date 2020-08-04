<%@ include file="/navbar.jspf" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body style="color:black;  background: linear-gradient(0deg, rgba(236,222,240,1)0%, rgba(255,229,229,1)100%)">
<div style="margin-top:10px;margin-left:10px; margin-right:10px;">
<table style="width:33%; border-collapse: collapse; border: 2px; margin-left:auto; margin:right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: #e68a00">
<h5 style="color:white">Unassigned (<%= session.getAttribute("unsize")%>)</h5>
</div>
</th>
</tr>
<c:forEach items="${unassigned}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #fff5e6">
<h6>${ticket.getInc()}</h6>
<p>${ticket.getGroup()}</p>
<p>${ticket.getPriority()}</p>
</div>
</td>
</tr>
</c:forEach>
</table>


<table style="width:34%; border-collapse: collapse; border: 2px; margin-left:auto; margin:right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: #000080">
<h5 style="color:white">Assigned (<%= session.getAttribute("assize")%>)</h5>
</div>
</th>
</tr>
<c:forEach items="${assigned}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #e6e6ff">
<h6>${ticket.getInc()}</h6>
<p>${ticket.getGroup()}</p>
<p>${ticket.getPriority()}</p>
</div>
</td>
</tr>
</c:forEach>
</table>

<table style="width:33%; border-collapse: collapse; border: 2px; margin-left:auto; margin:right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: green">
<h5 style="color:white">In Progress (<%= session.getAttribute("inprsize")%>)</h5>
</div>
</th>
</tr>
<c:forEach items="${inprogress}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #e6ffee">
<h6>${ticket.getInc()}</h6>
<p>${ticket.getGroup()}</p>
<p>${ticket.getPriority()}</p>
</div>
</td>
</tr>
</c:forEach>
</table>


</div>
</body>