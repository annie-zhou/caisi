<%--

    Copyright (c) 2001-2002. Department of Family Medicine, McMaster University. All Rights Reserved.
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

    This software was written for the
    Department of Family Medicine
    McMaster University
    Hamilton
    Ontario, Canada

--%>

<%
  if(session.getValue("user") == null)
    response.sendRedirect("../logout.jsp");
  String form_name="ar1_99_08";
  String user_no = (String) session.getAttribute("user");
%>
<%@ page import="java.util.*, java.sql.*, oscar.*"
	errorPage="errorpage.jsp"%>
<%@ include file="/common/webAppContextAndSuperMgr.jsp"%>
<%@page import="org.oscarehr.util.SpringUtils" %>
<%@page import="org.oscarehr.common.dao.DemographicAccessoryDao" %>
<%@page import="org.oscarehr.common.model.DemographicAccessory" %>
<%
	DemographicAccessoryDao demographicAccessoryDao = (DemographicAccessoryDao)SpringUtils.getBean("demographicAccessoryDao");
%>

<html>
<head>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/global.js"></script>
<title>ANTENATAL RECORD</title>
<link rel="stylesheet" href="antenatalrecord.css">
<script language="JavaScript">
<!--


function checkTypeNum(typeIn) {
	var typeInOK = true;
	var i = 0;
	var length = typeIn.length;
	var ch;
	// walk through a string and find a number
	if (length>=1) {
	  while (i <  length) {
		ch = typeIn.substring(i, i+1);
		if ((ch < "0") || (ch > "9")) {
			typeInOK = false;
			break;
		}
	    i++;
      }
	} else typeInOK = false;
	return typeInOK;
}
function checkTypeIn(obj) {
    if(!checkTypeNum(obj.value) ) {
	  alert ("You must type in a number in the field.");
	}
}

//-->
</SCRIPT>
</head>
<body onLoad="setfocus()" bgcolor="#c4e9f6" bgproperties="fixed"
	topmargin="0" leftmargin="1" rightmargin="1">
<form name="serviceform" action="providercontrol.jsp" method="POST">

<%
  //if bNewForm is false (0), then it should be able to display xml data.
  boolean bNew = true, bNewList = true; //bNew=if using the old xml_form data, bNewList=if it is from history
  String content="", demoname=null,address=null,dob=null,homephone=null,workphone=null,allergies="",medications="";
  String birthAttendants="", newbornCare="",riskFactors="",finalEDB="",g="",t="",p="",a="",l="";
  int age=0;
  if( request.getParameter("bNewForm")!=null && request.getParameter("bNewForm").compareTo("0")==0 ) bNew = false;

  if(!bNew ) { //not new form
    bNewList = false;
    List<Map<String,Object>> resultList = oscarSuperManager.find("providerDao", "search_form", new Object[] {request.getParameter("form_no")});
    for (Map form : resultList) {
      content = (String)form.get("content");
%> <xml id="xml_list"><encounter><%=content%></encounter></xml> <%
    }
  } else {
    String[] param2 =new String[2];
    param2[0]=request.getParameter("demographic_no");
    param2[1]=form_name;
    List<Map<String,Object>> resultList = oscarSuperManager.find("providerDao", "search_form_no", param2);
    for (Map form : resultList) {
      bNew = false;
      content = (String)form.get("content");
%> <xml id="xml_list"> <encounter> <%=content%> </encounter> </xml> <%
    }

    resultList = oscarSuperManager.find("providerDao", "search_demograph", new Object[] {request.getParameter("demographic_no")});
    for (Map demo : resultList) {
      demoname=demo.get("last_name")+", "+demo.get("first_name");
      address=demo.get("address") +",  "+demo.get("city") +",  "+ demo.get("province") +"  "+ demo.get("postal");
      dob=demo.get("year_of_birth")+"/"+demo.get("month_of_birth")+"/"+demo.get("date_of_birth");
      homephone=(String)demo.get("phone");
      workphone=(String)demo.get("phone2");
      age=MyDateFormat.getAge(Integer.parseInt((String)demo.get("year_of_birth")),Integer.parseInt((String)demo.get("month_of_birth")),Integer.parseInt((String)demo.get("date_of_birth")));
    }

    DemographicAccessory da = demographicAccessoryDao.find(Integer.parseInt(request.getParameter("demographic_no")));
    if(da != null) {
    	allergies=SxmlMisc.getXmlContent(da.getContent(),"<xml_Alert>","</xml_Alert>");
        medications=SxmlMisc.getXmlContent(da.getContent(),"<xml_Medication>","</xml_Medication>");
    }

    //find the latest version of g,t,p,a,l etc.
    String[] param1 =new String[2];
    param1[0]=request.getParameter("demographic_no");
    param1[1]="ar%"; //!!! other forms can't have the name of 'ar' chars.
    resultList = oscarSuperManager.find("providerDao", "compare_form", param1);
    for (Map form : resultList) {
      content = (String)form.get("content");
      birthAttendants = SxmlMisc.getXmlContent(content,"<xml_ba>","</xml_ba>");
	  birthAttendants = birthAttendants==null?"":birthAttendants;
      newbornCare = SxmlMisc.getXmlContent(content,"<xml_nc>","</xml_nc>");
	  newbornCare = newbornCare==null?"":newbornCare;
      riskFactors = SxmlMisc.getXmlContent(content,"<xml_rfi>","</xml_rfi>");
	  riskFactors = riskFactors==null?"":riskFactors;

      finalEDB = SxmlMisc.getXmlContent(content,"<xml_fedb>","</xml_fedb>");
	  finalEDB = finalEDB==null?"":finalEDB;
      g = SxmlMisc.getXmlContent(content,"<xml_gra>","</xml_gra>");
	  g = g==null?"":g;
      t = SxmlMisc.getXmlContent(content,"<xml_term>","</xml_term>");
	  t = t==null?"":t;
      p = SxmlMisc.getXmlContent(content,"<xml_prem>","</xml_prem>");
	  p = p==null?"":p;
      l = SxmlMisc.getXmlContent(content,"<xml_liv>","</xml_liv>");
	  l = l==null?"":l;
    }
  }
  //boolean bNewDemoAcc=true;
%>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr bgcolor="#486ebd">
		<th align=CENTER><font face="Arial, Helvetica, sans-serif"
			color="#FFFFFF">Antenatal Record 1 </font></th>
		<th width="25%" nowrap>
		<div align="right"><%=bNewList?"<input type='submit' name='subbutton' value=' Save '>":""%>
		<input type="button" name="Button" value="Cancel"
			onClick="window.close();"> <%=bNewList?"<input type=\"submit\" name=\"print\" value=\"Print\">":""%>
		<a href=# onClick="popupPage(200,300,'formarprintsetting.jsp')"> .
		</a> <input type="hidden" name="oox" value="0"> <input
			type="hidden" name="ooy" value="0"></div>
		</th>
	</tr>
</table>
<table width="60%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td valign="top" colspan='4'>Name <input type="text"
			name="xml_name" style="width: 100%" size="30" maxlength="60"
			<%=bNew?"value=\""+demoname+"\"":"datafld='xml_name'"%>></td>
	</tr>
	<tr>
		<td valign="top" colspan='4'>Address <input type="text"
			name="xml_address" style="width: 100%" size="60" maxlength="80"
			<%=bNew?"value=\""+address+"\"":"datafld='xml_address'"%>></td>
	</tr>
	<tr>
		<td valign="top" width="28%">Date of birth (yyyy/mm/dd)<br>
		<input type="text" name="xml_dob" style="width: 100%" size="10"
			maxlength="10" <%=bNew?"value='"+dob+"'":"datafld='xml_dob'"%>>
		</td>
		<td width="8%">Age<br>
		<input type="text" name="xml_age" style="width: 100%" size="10"
			maxlength="10" <%=bNew?"value='"+age+"'":"datafld='xml_age'"%>>
		</td>
		<td width="25%" nowrap>Marital status <br>
		<input type="checkbox" name="xml_msm" value="checked"
			<%=bNew?"":"datafld='xml_msm'"%>> M <input type="checkbox"
			name="xml_mscl" value="checked" <%=bNew?"":"datafld='xml_mscl'"%>>
		CL <input type="checkbox" name="xml_mss" value="checked"
			<%=bNew?"":"datafld='xml_mss'"%>> S</td>
		<td>Education level <br>
		<input type="text" name="xml_el" size="15" style="width: 100%"
			maxlength="25" <%=bNew?"":"datafld='xml_el'"%>></td>
	</tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td>Occupation<br>
		<input type="text" name="xml_occp" size="15" style="width: 100%"
			maxlength="25" <%=bNew?"":"datafld='xml_occp'"%>></td>
		<td>Language<br>
		<input type="text" name="xml_lang" size="15" style="width: 100%"
			maxlength="25" <%=bNew?"":"datafld='xml_lang'"%>></td>
		<td>Home phone<br>
		<input type="text" name="xml_hp" size="15" style="width: 100%"
			maxlength="20" <%=bNew?"value='"+homephone+"'":"datafld='xml_hp'"%>>
		</td>
		<td>Work phone<br>
		<input type="text" name="xml_wp" size="15" style="width: 100%"
			maxlength="20" <%=bNew?"value='"+workphone+"'":"datafld='xml_wp'"%>>
		</td>
		<td>Name of partner<br>
		<input type="text" name="xml_nop" size="15" style="width: 100%"
			maxlength="50" <%=bNew?"":"datafld='xml_nop'"%>></td>
		<td>Age<br>
		<input type="text" name="xml_page" size="2" style="width: 100%"
			maxlength="2" <%=bNew?"":"datafld='xml_page'"%>></td>
		<td valign="top">Occupation<br>
		<input type="text" name="xml_poccp" size="15" style="width: 100%"
			maxlength="25" <%=bNew?"":"datafld='xml_poccp'"%>></td>
	</tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td nowrap>Birth attendants<br>
		<input type="checkbox" name="xml_baobs" value="checked"
			<%=bNew?"":"datafld='xml_baobs'"%>>OBS <input type="checkbox"
			name="xml_bafp" value="checked" <%=bNew?"":"datafld='xml_bafp'"%>>FP
		<input type="checkbox" name="xml_bam" value="checked"
			<%=bNew?"":"datafld='xml_bam'"%>>Midwife<br>
		<input type="text" name="xml_ba" size="15" style="width: 100%"
			maxlength="25"
			<%=bNewList?("value=\""+birthAttendants+"\""):"datafld='xml_ba'"%>>
		</td>
		<td nowrap valign="top">Family physician<br>
		<div align="center"><textarea name="xml_fphy"
			style="width: 100%" cols="30" rows="2"
			<%=bNew?"":"datafld='xml_fphy'"%>></textarea></div>
		</td>
		<td nowrap>Newborn care<br>
		<input type="checkbox" name="xml_ncp" value="checked"
			<%=bNew?"":"datafld='xml_ncp'"%>>Ped. <input type="checkbox"
			name="xml_ncfp" value="checked" <%=bNew?"":"datafld='xml_ncfp'"%>>FP
		<input type="checkbox" name="xml_ncm" value="checked"
			<%=bNew?"":"datafld='xml_ncm'"%>>Midwife<br>
		<input type="text" name="xml_nc" size="15" style="width: 100%"
			maxlength="25"
			<%=bNewList?("value=\""+newbornCare+"\""):"datafld='xml_nc'"%>>
		</td>
		<td nowrap valign="top">Ethnic background of mother/father<br>
		<div align="center"><textarea name="xml_ebmf"
			style="width: 100%" cols="30" rows="2"
			<%=bNew?"":"datafld='xml_ebmf'"%>></textarea></div>
		</td>
	</tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td width="12%"><input type="checkbox" name="xml_vbac"
			value="checked" <%=bNew?"":"datafld='xml_vbac'"%>> VBAC<br>
		<input type="checkbox" name="xml_rcs" value="checked"
			<%=bNew?"":"datafld='xml_rcs'"%>> Repeat CS<br>
		</td>
		<td width="44%">Allergies(list):<br>
		<div align="center"><textarea
			name="xml_Alert_demographicaccessory" style="width: 100%" cols="30"
			rows="2" <%=bNewList?"":"datafld='xml_Alert_demographicaccessory'"%>><%=bNewList?allergies:""%></textarea>
		</div>
		</td>
		<td width="44%">Medications (list)<br>
		<div align="center"><textarea
			name="xml_Medication_demographicaccessory" style="width: 100%"
			cols="30" rows="2"
			<%=bNewList?"":"datafld='xml_Medication_demographicaccessory'"%>><%=bNewList?medications:""%></textarea></div>
		</td>
	</tr>
</table>

<table width="100%" border="0">
	<tr bgcolor="#99FF99">
		<td valign="top" bgcolor="#CCCCCC">
		<div align="center"><b>Pregnancy Summary</b></div>
		</td>
	</tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td valign="top" nowrap>Menstrual history (LMP): <input
			type="text" name="xml_lmp" size="10" maxlength="10"
			<%=bNew?"value='yyyy/mm/dd'":"datafld='xml_lmp'"%>> &nbsp;
		&nbsp; &nbsp; Cycle <input type="text" name="xml_c" size="7"
			maxlength="7" <%=bNew?"value='  /  '":"datafld='xml_c'"%>>
		&nbsp; &nbsp; &nbsp; <input type="checkbox" name="xml_r"
			value="checked" <%=bNew?"":"datafld='xml_r'"%>> Regular
		&nbsp; &nbsp; &nbsp; EDB <input type="text" name="xml_edb" size="10"
			maxlength="10" <%=bNew?"value='yyyy/mm/dd'":"datafld='xml_edb'"%>>
		<br>
		Contraception:<br>
		<input type="checkbox" name="xml_iud" value="checked"
			<%=bNew?"":"datafld='xml_iud'"%>> IUD <input type="checkbox"
			name="xml_ht" value="checked" <%=bNew?"":"datafld='xml_ht'"%>>
		Hormonal(type) <input type="text" name="xml_htt" size="15"
			maxlength="25" <%=bNew?"":"datafld='xml_htt'"%>> <input
			type="checkbox" name="xml_oc" value="checked"
			<%=bNew?"":"datafld='xml_oc'"%>> Other <input type="text"
			name="xml_ot" size="15" maxlength="25"
			<%=bNew?"":"datafld='xml_ot'"%>> Last used <input type="text"
			name="xml_lu" size="10" maxlength="10"
			<%=bNew?"value='yyyy/mm/dd'":"datafld='xml_lu'"%>></td>
		<td valign="top" width="25%"><font size="+2"><b><font
			size="+1">Final EDB</font></b></font> (yyyy/mm/dd) <br>
		<input type="text" name="xml_fedb" style="width: 100%" size="10"
			maxlength="10"
			<%=bNewList?"value=\""+finalEDB+"\"":"datafld='xml_fedb'"%>>
		</td>
	</tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td>Gravida<br>
		<input type="text" name="xml_gra" size="5" style="width: 100%"
			maxlength="10" <%=bNewList?"value=\""+g+"\"":"datafld='xml_gra'"%>>
		</td>
		<td>Term<br>
		<input type="text" name="xml_term" size="5" style="width: 100%"
			maxlength="10" <%=bNewList?"value=\""+t+"\"":"datafld='xml_term'"%>>
		</td>
		<td>Prem<br>
		<input type="text" name="xml_prem" size="5" style="width: 100%"
			maxlength="8" <%=bNewList?"value=\""+p+"\"":"datafld='xml_prem'"%>>
		</td>
		<td valign="top" nowrap>No. of pregnancy loss(es)<br>
		&nbsp; &nbsp; <input type="checkbox" name="xml_ecc" value="checked"
			<%=bNew?"":"datafld='xml_ecc'"%>> Ectopic <input type="text"
			name="xml_ect" size="2" maxlength="2"
			<%=bNew?"":"datafld='xml_ect'"%> onChange="checkTypeIn(this)">
		&nbsp; &nbsp; <input type="checkbox" name="xml_tec" value="checked"
			<%=bNew?"":"datafld='xml_tec'"%>> Termination <input
			type="text" name="xml_tet" size="2" maxlength="2"
			<%=bNew?"":"datafld='xml_tet'"%> onChange="checkTypeIn(this)">
		&nbsp; &nbsp; <input type="checkbox" name="xml_spc" value="checked"
			<%=bNew?"":"datafld='xml_spc'"%>> Spontaneous <input
			type="text" name="xml_spt" size="2" maxlength="2"
			<%=bNew?"":"datafld='xml_spt'"%> onChange="checkTypeIn(this)">
		&nbsp; &nbsp; <input type="checkbox" name="xml_stc" value="checked"
			<%=bNew?"":"datafld='xml_stc'"%>> Stillborn <input
			type="text" name="xml_stt" size="2" maxlength="2"
			<%=bNew?"":"datafld='xml_stt'"%> onChange="checkTypeIn(this)">
		</td>
		<td>Living<br>
		<input type="text" name="xml_liv" size="5" style="width: 100%"
			maxlength="10" <%=bNewList?"value=\""+l+"\"":"datafld='xml_liv'"%>>
		</td>
		<td nowrap>Multipregnancy<br>
		No.<input type="text" name="xml_mul" size="5" style="width: 100%"
			maxlength="10" <%=bNew?"":"datafld='xml_mul'"%>></td>
	</tr>
</table>
<table width="100%" border="0" <%=bNew?"":"datasrc='#xml_list'"%>>
	<tr bgcolor="#99FF99">
		<td align="center" colspan="2" bgcolor="#CCCCCC"><b>Obstetrical
		History</b></td>
	</tr>
	<tr>
		<td valign="top">
		<table width="100%" border="1" cellspacing="0" cellpadding="0">
			<tr align="center">
				<td width="40">No.</td>
				<td width="50">Year</td>
				<td width="40">Sex<br>
				M/F</td>
				<td width="70">Gest. age<br>
				(weeks)</td>
				<td width="70">Birth<br>
				weight</td>
				<td width="70">Length<br>
				of labour</td>
				<td width="120">Place<br>
				of birth</td>
				<td width="100">Type of birth<br>
				SVB CS Ass'd</td>
				<td nowrap>Comments regarding pregnancy and birth</td>
			</tr>
			<tr align="center">
				<td>1</td>
				<td><input type="text" name="xml_oh1ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh1ye'"%>></td>
				<td><input type="text" name="xml_oh1se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh1se'"%>></td>
				<td><input type="text" name="xml_oh1ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh1ge'"%>></td>
				<td><input type="text" name="xml_oh1bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh1bi'"%>></td>
				<td><input type="text" name="xml_oh1le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh1le'"%>></td>
				<td><input type="text" name="xml_oh1pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh1pl'"%>></td>
				<td><input type="checkbox" name="xml_oh1sv" value="checked"
					<%=bNew?"":"datafld='xml_oh1sv'"%>> <input type="checkbox"
					name="xml_oh1cs" value="checked" <%=bNew?"":"datafld='xml_oh1cs'"%>>
				<input type="checkbox" name="xml_oh1as" value="checked"
					<%=bNew?"":"datafld='xml_oh1as'"%>></td>
				<td align="left"><input type="text" name="xml_oh1co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh1co'"%>></td>
			</tr>
			<tr align="center">
				<td>2</td>
				<td><input type="text" name="xml_oh2ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh2ye'"%>></td>
				<td><input type="text" name="xml_oh2se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh2se'"%>></td>
				<td><input type="text" name="xml_oh2ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh2ge'"%>></td>
				<td><input type="text" name="xml_oh2bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh2bi'"%>></td>
				<td><input type="text" name="xml_oh2le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh2le'"%>></td>
				<td><input type="text" name="xml_oh2pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh2pl'"%>></td>
				<td><input type="checkbox" name="xml_oh2sv" value="checked"
					<%=bNew?"":"datafld='xml_oh2sv'"%>> <input type="checkbox"
					name="xml_oh2cs" value="checked" <%=bNew?"":"datafld='xml_oh2cs'"%>>
				<input type="checkbox" name="xml_oh2as" value="checked"
					<%=bNew?"":"datafld='xml_oh2as'"%>></td>
				<td align="left"><input type="text" name="xml_oh2co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh2co'"%>></td>
			</tr>
			<tr align="center">
				<td>3</td>
				<td><input type="text" name="xml_oh3ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh3ye'"%>></td>
				<td><input type="text" name="xml_oh3se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh3se'"%>></td>
				<td><input type="text" name="xml_oh3ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh3ge'"%>></td>
				<td><input type="text" name="xml_oh3bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh3bi'"%>></td>
				<td><input type="text" name="xml_oh3le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh3le'"%>></td>
				<td><input type="text" name="xml_oh3pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh3pl'"%>></td>
				<td><input type="checkbox" name="xml_oh3sv" value="checked"
					<%=bNew?"":"datafld='xml_oh3sv'"%>> <input type="checkbox"
					name="xml_oh3cs" value="checked" <%=bNew?"":"datafld='xml_oh3cs'"%>>
				<input type="checkbox" name="xml_oh3as" value="checked"
					<%=bNew?"":"datafld='xml_oh3as'"%>></td>
				<td align="left"><input type="text" name="xml_oh3co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh3co'"%>></td>
			</tr>
			<tr align="center">
				<td>4</td>
				<td><input type="text" name="xml_oh4ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh4ye'"%>></td>
				<td><input type="text" name="xml_oh4se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh4se'"%>></td>
				<td><input type="text" name="xml_oh4ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh4ge'"%>></td>
				<td><input type="text" name="xml_oh4bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh4bi'"%>></td>
				<td><input type="text" name="xml_oh4le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh4le'"%>></td>
				<td><input type="text" name="xml_oh4pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh4pl'"%>></td>
				<td><input type="checkbox" name="xml_oh4sv" value="checked"
					<%=bNew?"":"datafld='xml_oh4sv'"%>> <input type="checkbox"
					name="xml_oh4cs" value="checked" <%=bNew?"":"datafld='xml_oh4cs'"%>>
				<input type="checkbox" name="xml_oh4as" value="checked"
					<%=bNew?"":"datafld='xml_oh4as'"%>></td>
				<td align="left"><input type="text" name="xml_oh4co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh4co'"%>></td>
			</tr>
			<tr align="center">
				<td>5</td>
				<td><input type="text" name="xml_oh5ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh5ye'"%>></td>
				<td><input type="text" name="xml_oh5se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh5se'"%>></td>
				<td><input type="text" name="xml_oh5ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh5ge'"%>></td>
				<td><input type="text" name="xml_oh5bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh5bi'"%>></td>
				<td><input type="text" name="xml_oh5le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh5le'"%>></td>
				<td><input type="text" name="xml_oh5pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh5pl'"%>></td>
				<td><input type="checkbox" name="xml_oh5sv" value="checked"
					<%=bNew?"":"datafld='xml_oh5sv'"%>> <input type="checkbox"
					name="xml_oh5cs" value="checked" <%=bNew?"":"datafld='xml_oh5cs'"%>>
				<input type="checkbox" name="xml_oh5as" value="checked"
					<%=bNew?"":"datafld='xml_oh5as'"%>></td>
				<td align="left"><input type="text" name="xml_oh5co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh5co'"%>></td>
			</tr>
			<tr align="center">
				<td>6</td>
				<td><input type="text" name="xml_oh6ye" size="4" maxlength="4"
					style="width: 90%" <%=bNew?"":"datafld='xml_oh6ye'"%>></td>
				<td><input type="text" name="xml_oh6se" size="1" maxlength="1"
					style="width: 50%" <%=bNew?"":"datafld='xml_oh6se'"%>></td>
				<td><input type="text" name="xml_oh6ge" size="3" maxlength="5"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh6ge'"%>></td>
				<td><input type="text" name="xml_oh6bi" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh6bi'"%>></td>
				<td><input type="text" name="xml_oh6le" size="5" maxlength="6"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh6le'"%>></td>
				<td><input type="text" name="xml_oh6pl" size="8" maxlength="20"
					style="width: 80%" <%=bNew?"":"datafld='xml_oh6pl'"%>></td>
				<td><input type="checkbox" name="xml_oh6sv" value="checked"
					<%=bNew?"":"datafld='xml_oh6sv'"%>> <input type="checkbox"
					name="xml_oh6cs" value="checked" <%=bNew?"":"datafld='xml_oh6cs'"%>>
				<input type="checkbox" name="xml_oh6as" value="checked"
					<%=bNew?"":"datafld='xml_oh6as'"%>></td>
				<td align="left"><input type="text" name="xml_oh6co" size="20"
					maxlength="80" style="width: 100%"
					<%=bNew?"":"datafld='xml_oh6co'"%>></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center" bgcolor="#CCCCCC"><b><font
			face="Verdana, Arial, Helvetica, sans-serif">Medical History
		and Physical Examination</font></b></td>
	</tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="0"
	<%=bNew?"":"datasrc='#xml_list'"%>>
	<tr>
		<td align="center">Current Pregnancy</td>
		<td align="center">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" nowrap>Medical</td>
				<td align="center" width="15%">
				<div align="right">Yes</div>
				</td>
				<td align="center" nowrap width="15%">
				<div align="right">No</div>
				</td>
			</tr>
		</table>
		</td>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td nowrap align="center">Genetic/Family</td>
				<td align="center" width="15%">
				<div align="right">Yes</div>
				</td>
				<td align="center" width="15%">
				<div align="right">No</div>
				</td>
			</tr>
		</table>
		</td>
		<td align="center">Infection Discussion Topics</td>
		<td align="center"><b>Physical examination</b></td>
	</tr>
	<tr>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>1.</td>
				<td>Bleeding</td>
				<td width="15%"><input type="checkbox" name="xml_cp1b"
					value="checked" <%=bNew?"":"datafld='xml_cp1b'"%>></td>
			</tr>
			<tr>
				<td>2.</td>
				<td>Vomiting</td>
				<td><input type="checkbox" name="xml_cp2v" value="checked"
					<%=bNew?"":"datafld='xml_cp2v'"%>></td>
			</tr>
			<tr>
				<td valign="top">3.</td>
				<td nowrap><font size=1> Smoking <br>
				cig/day <input type="text" name="xml_cp3c" size="2" maxlength="3"
					<%=bNew?"":"datafld='xml_cp3c'"%>> </font></td>
				<td valign="bottom"><input type="checkbox" name="xml_cp3s"
					value="checked" <%=bNew?"":"datafld='xml_cp3s'"%>></td>
			</tr>
			<tr>
				<td>4.</td>
				<td>Drugs</td>
				<td><input type="checkbox" name="xml_cp4d" value="checked"
					<%=bNew?"":"datafld='xml_cp4d'"%>></td>
			</tr>
			<tr>
				<td valign="top">5.</td>
				<td nowrap>Alcohol<br>
				drinks/day <font size=1> <input type="text" name="xml_cp5d"
					size="2" maxlength="3" <%=bNew?"":"datafld='xml_cp5d'"%>> </font></td>
				<td valign="bottom"><input type="checkbox" name="xml_cp5a"
					value="checked" <%=bNew?"":"datafld='xml_cp5a'"%>></td>
			</tr>
			<tr>
				<td>6.</td>
				<td>Infertility</td>
				<td><input type="checkbox" name="xml_cp6i" value="checked"
					<%=bNew?"":"datafld='xml_cp6i'"%>></td>
			</tr>
			<tr>
				<td>7.</td>
				<td>Radiation</td>
				<td><input type="checkbox" name="xml_cp7r" value="checked"
					<%=bNew?"":"datafld='xml_cp7r'"%>></td>
			</tr>
			<tr>
				<td valign="top">8.</td>
				<td>Occup./Env.<br>
				hazards</td>
				<td><input type="checkbox" name="xml_cp8o" value="checked"
					<%=bNew?"":"datafld='xml_cp8o'"%>></td>
			</tr>
			<tr>
				<td colspan="3">
				<hr>
				<b> Nutrition Assessment</b></td>
			</tr>
			<tr>
				<td colspan="2">Folic acid/vitamins</td>
				<td><input type="checkbox" name="xml_nafa" value="checked"
					<%=bNew?"":"datafld='xml_nafa'"%>></td>
			</tr>
			<tr>
				<td colspan="2">Milk products</td>
				<td><input type="checkbox" name="xml_namp" value="checked"
					<%=bNew?"":"datafld='xml_namp'"%>></td>
			</tr>
			<tr>
				<td colspan="2">Diet</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp; &nbsp; &nbsp;Balanced</td>
				<td><input type="checkbox" name="xml_nadb" value="checked"
					<%=bNew?"":"datafld='xml_nadb'"%>></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp; &nbsp; &nbsp;Restricted</td>
				<td><input type="checkbox" name="xml_nadr" value="checked"
					<%=bNew?"":"datafld='xml_nadr'"%>></td>
			</tr>
			<tr>
				<td colspan="2">Dietitian referral</td>
				<td><input type="checkbox" name="xml_nadref" value="checked"
					<%=bNew?"":"datafld='xml_nadref'"%>></td>
			</tr>
		</table>
		</td>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>9.</td>
				<td>Hypertension</td>
				<td><input type="checkbox" name="xml_m9hy" value="checked"
					<%=bNew?"":"datafld='xml_m9hy'"%>></td>
				<td><input type="checkbox" name="xml_m9hn" value="checked"
					<%=bNew?"":"datafld='xml_m9hn'"%>></td>
			</tr>
			<tr>
				<td>10.</td>
				<td>Endocrine/Diabetes</td>
				<td><input type="checkbox" name="xml_m10ey" value="checked"
					<%=bNew?"":"datafld='xml_m10ey'"%>></td>
				<td><input type="checkbox" name="xml_m10en" value="checked"
					<%=bNew?"":"datafld='xml_m10en'"%>></td>
			</tr>
			<tr>
				<td>11.</td>
				<td>Heart</td>
				<td><input type="checkbox" name="xml_m11hy" value="checked"
					<%=bNew?"":"datafld='xml_m11hy'"%>></td>
				<td><input type="checkbox" name="xml_m11hn" value="checked"
					<%=bNew?"":"datafld='xml_m11hn'"%>></td>
			</tr>
			<tr>
				<td>12.</td>
				<td>Renal/urinary tract</td>
				<td><input type="checkbox" name="xml_m12ry" value="checked"
					<%=bNew?"":"datafld='xml_m12ry'"%>></td>
				<td><input type="checkbox" name="xml_m12rn" value="checked"
					<%=bNew?"":"datafld='xml_m12rn'"%>></td>
			</tr>
			<tr>
				<td>13.</td>
				<td>Respiratory</td>
				<td><input type="checkbox" name="xml_m13ry" value="checked"
					<%=bNew?"":"datafld='xml_m13ry'"%>></td>
				<td><input type="checkbox" name="xml_m13rn" value="checked"
					<%=bNew?"":"datafld='xml_m13rn'"%>></td>
			</tr>
			<tr>
				<td>14.</td>
				<td>Liver/Hepatitis/GI</td>
				<td><input type="checkbox" name="xml_m14ly" value="checked"
					<%=bNew?"":"datafld='xml_m14ly'"%>></td>
				<td><input type="checkbox" name="xml_m14ln" value="checked"
					<%=bNew?"":"datafld='xml_m14ln'"%>></td>
			</tr>
			<tr>
				<td>15.</td>
				<td>Neurological</td>
				<td><input type="checkbox" name="xml_m15ny" value="checked"
					<%=bNew?"":"datafld='xml_m15ny'"%>></td>
				<td><input type="checkbox" name="xml_m15nn" value="checked"
					<%=bNew?"":"datafld='xml_m15nn'"%>></td>
			</tr>
			<tr>
				<td>16.</td>
				<td>Autoimmune</td>
				<td><input type="checkbox" name="xml_m16ay" value="checked"
					<%=bNew?"":"datafld='xml_m16ay'"%>></td>
				<td><input type="checkbox" name="xml_m16an" value="checked"
					<%=bNew?"":"datafld='xml_m16an'"%>></td>
			</tr>
			<tr>
				<td>17.</td>
				<td>Breast</td>
				<td><input type="checkbox" name="xml_m17by" value="checked"
					<%=bNew?"":"datafld='xml_m17by'"%>></td>
				<td><input type="checkbox" name="xml_m17bn" value="checked"
					<%=bNew?"":"datafld='xml_m17bn'"%>></td>
			</tr>
			<tr>
				<td>18.</td>
				<td>Gyn/PAP</td>
				<td><input type="checkbox" name="xml_m18gy" value="checked"
					<%=bNew?"":"datafld='xml_m18gy'"%>></td>
				<td><input type="checkbox" name="xml_m18gn" value="checked"
					<%=bNew?"":"datafld='xml_m18gn'"%>></td>
			</tr>
			<tr>
				<td>19.</td>
				<td>Hospitalizations</td>
				<td><input type="checkbox" name="xml_m19hy" value="checked"
					<%=bNew?"":"datafld='xml_m19hy'"%>></td>
				<td><input type="checkbox" name="xml_m19hn" value="checked"
					<%=bNew?"":"datafld='xml_m19hn'"%>></td>
			</tr>
			<tr>
				<td>20.</td>
				<td>Surgeries</td>
				<td><input type="checkbox" name="xml_m20sy" value="checked"
					<%=bNew?"":"datafld='xml_m20sy'"%>></td>
				<td><input type="checkbox" name="xml_m20sn" value="checked"
					<%=bNew?"":"datafld='xml_m20sn'"%>></td>
			</tr>
			<tr>
				<td>21.</td>
				<td>Anesthetics</td>
				<td><input type="checkbox" name="xml_m21ay" value="checked"
					<%=bNew?"":"datafld='xml_m21ay'"%>></td>
				<td><input type="checkbox" name="xml_m21an" value="checked"
					<%=bNew?"":"datafld='xml_m21an'"%>></td>
			</tr>
			<tr>
				<td>22.</td>
				<td>Hem./Transfusions</td>
				<td><input type="checkbox" name="xml_m22hy" value="checked"
					<%=bNew?"":"datafld='xml_m22hy'"%>></td>
				<td><input type="checkbox" name="xml_m22hn" value="checked"
					<%=bNew?"":"datafld='xml_m22hn'"%>></td>
			</tr>
			<tr>
				<td>23.</td>
				<td>Varicosities/Phlebitis</td>
				<td><input type="checkbox" name="xml_m23vy" value="checked"
					<%=bNew?"":"datafld='xml_m23vy'"%>></td>
				<td><input type="checkbox" name="xml_m23vn" value="checked"
					<%=bNew?"":"datafld='xml_m23vn'"%>></td>
			</tr>
			<tr>
				<td>24.</td>
				<td>Psychiatric illness</td>
				<td><input type="checkbox" name="xml_m24py" value="checked"
					<%=bNew?"":"datafld='xml_m24py'"%>></td>
				<td><input type="checkbox" name="xml_m24pn" value="checked"
					<%=bNew?"":"datafld='xml_m24pn'"%>></td>
			</tr>
			<tr>
				<td>25.</td>
				<td>Other</td>
				<td><input type="checkbox" name="xml_m25oy" value="checked"
					<%=bNew?"":"datafld='xml_m25oy'"%>></td>
				<td><input type="checkbox" name="xml_m25on" value="checked"
					<%=bNew?"":"datafld='xml_m25on'"%>></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="text" name="xml_m25" size="15" maxlength="25"
					<%=bNew?"":"datafld='xml_m25'"%>></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>26.</td>
				<td>Age&gt;=35 at EDB</td>
				<td width="15%" align="center"><input type="checkbox"
					name="xml_g26ay" value="checked" <%=bNew?"":"datafld='xml_g26ay'"%>>
				</td>
				<td width="15%" align="center"><input type="checkbox"
					name="xml_g26an" value="checked" <%=bNew?"":"datafld='xml_g26an'"%>>
				</td>
			</tr>
			<tr>
				<td valign="top">27.</td>
				<td>&quot;At risk&quot; population<br>
				<span class="small">(Tay-Sach's, sicke cell,<br>
				thalassemia, etc.)</span></td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_g27ay" value="checked" <%=bNew?"":"datafld='xml_g27ay'"%>>
				</td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_g27an" value="checked" <%=bNew?"":"datafld='xml_g27an'"%>>
				</td>
			</tr>
			<tr>
				<td valign="top">28.</td>
				<td nowrap>Known teratogen exposure<br>
				<span class="small">(includes maternal diabetes)</span></td>
				<td align="center"><input type="checkbox" name="xml_g28ky"
					value="checked" <%=bNew?"":"datafld='xml_g28ky'"%>></td>
				<td align="center"><input type="checkbox" name="xml_g28kn"
					value="checked" <%=bNew?"":"datafld='xml_g28kn'"%>></td>
			</tr>
			<tr>
				<td>29.</td>
				<td>Previous birth defect</td>
				<td align="center"><input type="checkbox" name="xml_g29py"
					value="checked" <%=bNew?"":"datafld='xml_g29py'"%>></td>
				<td align="center"><input type="checkbox" name="xml_g29pn"
					value="checked" <%=bNew?"":"datafld='xml_g29pn'"%>></td>
			</tr>
			<tr>
				<td colspan="4">
				<hr>
				<b>Family history of:</b></td>
			</tr>
			<tr>
				<td>30.</td>
				<td>Neural tube defects</td>
				<td align="center"><input type="checkbox" name="xml_fh30ny"
					value="checked" <%=bNew?"":"datafld='xml_fh30ny'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh30nn"
					value="checked" <%=bNew?"":"datafld='xml_fh30nn'"%>></td>
			</tr>
			<tr>
				<td>31.</td>
				<td>Development delay</td>
				<td align="center"><input type="checkbox" name="xml_fh31dy"
					value="checked" <%=bNew?"":"datafld='xml_fh31dy'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh31dn"
					value="checked" <%=bNew?"":"datafld='xml_fh31dn'"%>></td>
			</tr>
			<tr>
				<td valign="top">32.</td>
				<td>Congenital physical<br>
				anomalies (includes<br>
				congenital heart disease)</td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_fh32cy" value="checked"
					<%=bNew?"":"datafld='xml_fh32cy'"%>></td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_fh32cn" value="checked"
					<%=bNew?"":"datafld='xml_fh32cn'"%>></td>
			</tr>
			<tr>
				<td>33.</td>
				<td>Congenital hypotonias</td>
				<td align="center"><input type="checkbox" name="xml_fh33cy"
					value="checked" <%=bNew?"":"datafld='xml_fh33cy'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh33cn"
					value="checked" <%=bNew?"":"datafld='xml_fh33cn'"%>></td>
			</tr>
			<tr>
				<td valign="top">34.</td>
				<td>Chromosomal disease<br>
				<span class="small">(Down's, Turner's, etc.) </span></td>
				<td align="center"><input type="checkbox" name="xml_fh34cy"
					value="checked" <%=bNew?"":"datafld='xml_fh34cy'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh34cn"
					value="checked" <%=bNew?"":"datafld='xml_fh34cn'"%>></td>
			</tr>
			<tr>
				<td valign="top">35.</td>
				<td>Genetic disease<br>
				<span class="small">(cystic fibrosis, muscular<br>
				dystrophy, etc.)</span></td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_fh35gy" value="checked"
					<%=bNew?"":"datafld='xml_fh35gy'"%>></td>
				<td align="center" valign="top"><input type="checkbox"
					name="xml_fh35gn" value="checked"
					<%=bNew?"":"datafld='xml_fh35gn'"%>></td>
			</tr>
			<tr>
				<td>36.</td>
				<td>Further investigations</td>
				<td align="center"><input type="checkbox" name="xml_fh36fy"
					value="checked" <%=bNew?"":"datafld='xml_fh36fy'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh36fn"
					value="checked" <%=bNew?"":"datafld='xml_fh36fn'"%>></td>
			</tr>
			<tr>
				<td>37.</td>
				<td>MSS<br>
				</td>
				<td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>Offered</td>
				<td align="center"><input type="checkbox" name="xml_fh37oy"
					value="checked" <%=bNew?"":"datafld='xml_fh37oy'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh37on"
					value="checked" <%=bNew?"":"datafld='xml_fh37on'"%>></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>Accepted</td>
				<td align="center"><input type="checkbox" name="xml_fh37ay"
					value="checked" <%=bNew?"":"datafld='xml_fh37ay'"%>></td>
				<td align="center"><input type="checkbox" name="xml_fh37an"
					value="checked" <%=bNew?"":"datafld='xml_fh37an'"%>></td>
			</tr>
		</table>
		</td>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>38.</td>
				<td>STDs/Herpes</td>
				<td><input type="checkbox" name="xml_idt38s" value="checked"
					<%=bNew?"":"datafld='xml_idt38s'"%>></td>
			</tr>
			<tr>
				<td>39.</td>
				<td>HIV</td>
				<td><input type="checkbox" name="xml_idt39h" value="checked"
					<%=bNew?"":"datafld='xml_idt39h'"%>></td>
			</tr>
			<tr>
				<td>40.</td>
				<td>Varicella</td>
				<td><input type="checkbox" name="xml_idt40v" value="checked"
					<%=bNew?"":"datafld='xml_idt40v'"%>></td>
			</tr>
			<tr>
				<td>41.</td>
				<td>Toxo/CMV/Parvo</td>
				<td><input type="checkbox" name="xml_idt41t" value="checked"
					<%=bNew?"":"datafld='xml_idt41t'"%>></td>
			</tr>
			<tr>
				<td>42.</td>
				<td>TB/Other <input type="text" name="xml_idt42o" size="10"
					maxlength="20" <%=bNew?"":"datafld='xml_idt42o'"%>></td>
				<td><input type="checkbox" name="xml_idt42t" value="checked"
					<%=bNew?"":"datafld='xml_idt42t'"%>></td>
			</tr>
			<tr>
				<td colspan="3">
				<hr>
				<b>Psychosocial discussion topics</b></td>
			</tr>
			<tr>
				<td>43.</td>
				<td>Social support</td>
				<td><input type="checkbox" name="xml_pdt43s" value="checked"
					<%=bNew?"":"datafld='xml_pdt43s'"%>></td>
			</tr>
			<tr>
				<td>44.</td>
				<td>Couple's relationship</td>
				<td><input type="checkbox" name="xml_pdt44c" value="checked"
					<%=bNew?"":"datafld='xml_pdt44c'"%>></td>
			</tr>
			<tr>
				<td>45.</td>
				<td>Emotional/Depression</td>
				<td><input type="checkbox" name="xml_pdt45e" value="checked"
					<%=bNew?"":"datafld='xml_pdt45e'"%>></td>
			</tr>
			<tr>
				<td>46.</td>
				<td>Substance abuse</td>
				<td><input type="checkbox" name="xml_pdt46s" value="checked"
					<%=bNew?"":"datafld='xml_pdt46s'"%>></td>
			</tr>
			<tr>
				<td>47.</td>
				<td>Family violence</td>
				<td><input type="checkbox" name="xml_pdt47f" value="checked"
					<%=bNew?"":"datafld='xml_pdt47f'"%>></td>
			</tr>
			<tr>
				<td>48.</td>
				<td>Parenting concerns</td>
				<td><input type="checkbox" name="xml_pdt48p" value="checked"
					<%=bNew?"":"datafld='xml_pdt48p'"%>></td>
			</tr>
			<tr>
				<td colspan="3">
				<hr>
				<b>Risk factors identified</b></td>
			</tr>
			<tr>
				<td colspan="3"><textarea name="xml_rfi" cols="20" rows="5"
					style="width: 100%" <%=bNew?"":"datafld='xml_rfi'"%>><%=bNewList?riskFactors:""%></textarea>
				</td>
			</tr>
		</table>
		</td>
		<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">Ht. <input type="text" name="xml_peh" size="5"
					maxlength="6" <%=bNew?"":"datafld='xml_peh'"%>> Wt. <input
					type="text" name="xml_pew" size="5" maxlength="6"
					<%=bNew?"":"datafld='xml_pew'"%>></td>
			</tr>
			<tr>
				<td colspan="2">Pre-preg. wt. <input type="text" name="xml_pep"
					size="6" maxlength="6" <%=bNew?"":"datafld='xml_pep'"%>></td>
			</tr>
			<tr>
				<td colspan="2">BP <input type="text" name="xml_pebp" size="10"
					maxlength="10" <%=bNew?"":"datafld='xml_pebp'"%>></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				<b>Checkmark if normal:</b></td>
			</tr>
			<tr>
				<td>Head, teeth, ENT</td>
				<td align="right"><input type="checkbox" name="xml_cinhe"
					value="checked" <%=bNew?"":"datafld='xml_cinhe'"%>></td>
			</tr>
			<tr>
				<td>Thyroid</td>
				<td align="right"><input type="checkbox" name="xml_cinth"
					value="checked" <%=bNew?"":"datafld='xml_cinth'"%>></td>
			</tr>
			<tr>
				<td>Chest</td>
				<td align="right"><input type="checkbox" name="xml_cinch"
					value="checked" <%=bNew?"":"datafld='xml_cinch'"%>></td>
			</tr>
			<tr>
				<td>Breasts</td>
				<td align="right"><input type="checkbox" name="xml_cinbr"
					value="checked" <%=bNew?"":"datafld='xml_cinbr'"%>></td>
			</tr>
			<tr>
				<td>Cardiovascular</td>
				<td align="right"><input type="checkbox" name="xml_cinca"
					value="checked" <%=bNew?"":"datafld='xml_cinca'"%>></td>
			</tr>
			<tr>
				<td>Abdomen</td>
				<td align="right"><input type="checkbox" name="xml_cinab"
					value="checked" <%=bNew?"":"datafld='xml_cinab'"%>></td>
			</tr>
			<tr>
				<td>Varicosities, extremities</td>
				<td align="right"><input type="checkbox" name="xml_cinva"
					value="checked" <%=bNew?"":"datafld='xml_cinva'"%>></td>
			</tr>
			<tr>
				<td>Neurological</td>
				<td align="right"><input type="checkbox" name="xml_cinne"
					value="checked" <%=bNew?"":"datafld='xml_cinne'"%>></td>
			</tr>
			<tr>
				<td>Pelvic architecture</td>
				<td align="right"><input type="checkbox" name="xml_cinpe"
					value="checked" <%=bNew?"":"datafld='xml_cinpe'"%>></td>
			</tr>
			<tr>
				<td>Ext. genitalia</td>
				<td align="right"><input type="checkbox" name="xml_cinex"
					value="checked" <%=bNew?"":"datafld='xml_cinex'"%>></td>
			</tr>
			<tr>
				<td>Cervix, vagina</td>
				<td align="right"><input type="checkbox" name="xml_cince"
					value="checked" <%=bNew?"":"datafld='xml_cince'"%>></td>
			</tr>
			<tr>
				<td nowrap>Uterus <input type="text" name="xml_cinun" size="3"
					maxlength="3" <%=bNew?"":"datafld='xml_cinun'"%>> <span
					class="small"> (no. of wks.)</span></td>
				<td align="right"><input type="checkbox" name="xml_cinut"
					value="checked" <%=bNew?"":"datafld='xml_cinut'"%>></td>
			</tr>
			<tr>
				<td>Adnexa</td>
				<td align="right"><input type="checkbox" name="xml_cinad"
					value="checked" <%=bNew?"":"datafld='xml_cinad'"%>></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" <%=bNew?"":"datasrc='#xml_list'"%>>
	<tr bgcolor="#CCCCCC">
		<td align="center" colspan="2"><b>Comments re Medical History
		and Physical Examination</b></td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="xml_comments" style="width: 100%"
			cols="80" <%=bNew?"":"datafld='xml_comments'"%>></textarea></td>
	</tr>
	<%
  GregorianCalendar now=new GregorianCalendar();
%>
	<tr>
		<td>Signature of attendant<br>
		<input type="text" name="xml_soa" size="30" maxlength="50"
			style="width: 80%"
			<%=bNewList?"value='"+request.getParameter("username")+"'":"datafld='xml_soa'"%>>
		</td>
		<td>Date (yyyy/mm/dd)<br>
		<input type="text" name="xml_date" size="30" maxlength="50"
			style="width: 80%"
			<%=bNewList?"value='"+now.get(Calendar.YEAR)+"/"+(now.get(Calendar.MONTH)+1)+"/"+now.get(Calendar.DAY_OF_MONTH)+"'":"datafld='xml_date'"%>>
		</td>
	</tr>
	<tr bgcolor="#486ebd">
		<td align="center" colspan="2">
		<%
  if(bNewList) {
%> <input type="hidden" name="xml_subject" value="form:AR1"> <input
			type="hidden" name="demographic_no"
			value="<%=request.getParameter("demographic_no")%>"> <input
			type="hidden" name="form_date"
			value='<%=now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH)+1)+"-"+now.get(Calendar.DAY_OF_MONTH)%>'>
		<input type="hidden" name="form_time"
			value='<%=now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+":"+now.get(Calendar.SECOND)%>'>
		<input type="hidden" name="user_no" value='<%=user_no%>'> <input
			type="hidden" name="formtype" value='direct'> <input
			type="hidden" name="form_name" value='<%=form_name%>'> <input
			type="hidden" name="dboperation" value="save_form"> <input
			type="hidden" name="displaymode" value="saveform"> <input
			type='submit' name='subbutton' value=' Save '> <%
  }
%> <input type="button" name="Button" value=" Cancel "
			onClick="window.close();"></td>
	</tr>
</table>
</form>
</body>
</html>
