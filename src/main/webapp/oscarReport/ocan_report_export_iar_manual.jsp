<%--


    Copyright (c) 2005-2012. Centre for Research on Inner City Health, St. Michael's Hospital, Toronto. All Rights Reserved.
    This software is published under the GPL GNU General Public License.
    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

    This software was written for
    Centre for Research on Inner City Health, St. Michael's Hospital,
    Toronto, Ontario, Canada

--%>
<%@page import="org.oscarehr.web.OcanReportUIBeanV3"%>
<%@page import="oscar.OscarProperties"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.oscarehr.util.WebUtils"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.oscarehr.web.OcanReportUIBean"%>
<%@page contentType="application/octet-stream"%>
<%
	int ocanVersion = 0;
    		
	if(OscarProperties.getInstance().getProperty("ocan.version", "").trim().length()>0)
	{
		String ocanVersionStr = OscarProperties.getInstance().getProperty("ocan.version", "").trim();
		
		ocanVersion = Double.valueOf(ocanVersionStr).intValue();
	}

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	response.setHeader("Content-Disposition", "attachment; filename=OCAN-IAR-"+formatter.format(new java.util.Date())  + ".xml");
	
	if(ocanVersion==3)
		OcanReportUIBeanV3.writeExportIar(response.getOutputStream());
	else
		OcanReportUIBean.writeExportIar(response.getOutputStream());
	
	response.getOutputStream().flush();
	
	//OcanReportUIBeanV3.writeOcanSubmissionFile("FULL");
	
	try{ 
		out.clear();
		out = pageContext.pushBody();
	}catch(Exception ex){ }
%>