<%@ include file="/navbar.jspf" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body style="color:black;  background: linear-gradient(0deg, rgba(236,222,240,1)0%, rgba(255,229,229,1)100%)">
<div style="margin-top:10px;margin-left:10px; margin-right:10px;">


<table style="border-collapse: collapse;border:2px; width: 100%; margin-bottom: 10px"><thead><tr><th colspan="3" style="text-align: center;" ><h5>This is the heading</h5><h6 style="display:inline">Source file last updated at(dd/mm/yyyy - hh:mm:ss): ${fileTime} <em><b><pre style="margin-left: 40px; display: inline">(Highlights: <pre style="margin-left: 10px; display: inline; color: red">Breached</pre><pre style="margin-left: 10px; display: inline; color: #a3a802">Warning</pre><pre style="margin-left: 10px; display: inline; color: blue">Normal</pre>)</pre></b></em></h6></th>
</tr></thead> </table>

<table style="width:33%; border-collapse: collapse; border: 2px; margin-left:auto; margin-right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: #e68a00; padding: 0px;">
<h5 style="color:white;">Unassigned (<%= session.getAttribute("unsize")%>)
<br>
<table style="width: 100%; border:none;border-collapse: collapse; align-content: center; ">
<tbody>
<tr>
<td style="font-size: 13px; color: white; text-align: right; padding-right: 10px ">Breached: ${unsize}</td>
<td style="text-align: left;font-size: 13px; color: white; padding-left: 10px ">Warning: ${unsize}</td>
</tr>
</tbody>
</table>
</h5>
</div>
</th>
</tr>
<c:forEach items="${unassigned}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #fff5e6; padding:2px">
<c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <a href="${ticket.getGroup()}" style="color:red; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <a href="${ticket.getGroup()}" style="color:#a3a802; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <a href="${ticket.getGroup()}" style="color:blue; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>
<p>Group: ${ticket.getGroup()}<br>
Priority: ${ticket.getPriority()}</p>
<%-- <c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <p style="color: red;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <p style="color: #ff9900;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <p style="color: green;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>--%>

</div>
</td>
</tr>
</c:forEach>
</table>


<table style="width:34%; border-collapse: collapse; border: 2px; margin-left:auto; margin:right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: #000080; padding: 0px;">
<h5 style="color:white">Assigned (<%= session.getAttribute("assize")%>)
<br>
<table style="width: 100%; border:none;border-collapse: collapse; align-content: center; ">
<tbody>
<tr>
<td style="font-size: 13px; color: white; text-align: right; padding-right: 10px ">Breached: ${assize}</td>
<td style="text-align: left;font-size: 13px; color: white; padding-left: 10px ">Warning: ${assize}</td>
</tr>
</tbody>
</table>
</h5>
</div>
</th>
</tr>
<c:forEach items="${assigned}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #e6e6ff; padding:2px">
<c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <a href="${ticket.getGroup()}" style="color:red; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <a href="${ticket.getGroup()}" style="color:#a3a802; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <a href="${ticket.getGroup()}" style="color:blue; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>
<p>Group: ${ticket.getGroup()}<br>
Priority: ${ticket.getPriority()}</p>
<%-- <c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <p style="color: red;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <p style="color: #ff9900;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <p style="color: green;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>--%>

</div>
</td>
</tr>
</c:forEach>
</table>

<table style="width:33%; border-collapse: collapse; border: 2px; margin-left:auto; margin:right:auto; float:left">
<tr>
<th style="border-right: 2px; text-align: center; border-bottom:2px;">
<div class="card" style="background-color: green; padding: 0px;">
<h5 style="color:white">In Progress (<%= session.getAttribute("inprsize")%>)
<br>
<table style="width: 100%; border:none;border-collapse: collapse; align-content: center; ">
<tbody>
<tr>
<td style="font-size: 13px; color: white; text-align: right; padding-right: 10px ">Breached: ${inprsize}</td>
<td style="text-align: left;font-size: 13px; color: white; padding-left: 10px ">Warning: ${inprsize}</td>
</tr>
</tbody>
</table>
</h5>
</div>
</th>
</tr>
<c:forEach items="${inprogress}" var="ticket">
<tr>
<td>
<div class="card" style="background-color: #e6ffee; padding:2px">
<c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <a href="${ticket.getGroup()}" style="color:red; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <a href="${ticket.getGroup()}" style="color:#a3a802; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <a href="${ticket.getGroup()}" style="color:blue; display: inline;" target="_blank" rel="noopener noreferrer"><h6 style="display: inline;">${ticket.getInc()}</h6></a><br>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>
<p>Group: ${ticket.getGroup()}<br>
Priority: ${ticket.getPriority()}</p>
<%-- <c:choose>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'breached')}">
        <p style="color: red;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'warning')}">
        <p style="color: #ff9900;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:when test="${fn:containsIgnoreCase(ticket.getSla(), 'within')}">
        <p style="color: green;">SLM Status: ${ticket.getSla()}</p>
</c:when>
<c:otherwise>
        <p>SLM Status: ${ticket.getSla()}</p>
</c:otherwise>
</c:choose>--%>

</div>
</td>
</tr>
</c:forEach>
</table>


</div>
</body>