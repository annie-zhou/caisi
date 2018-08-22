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

<%@page import="org.oscarehr.common.model.ProviderPreference"%>
<%@page import="org.oscarehr.util.SessionConstants"%>
<%@page import="org.oscarehr.util.LoggedInInfo"%>
<%@page import="org.oscarehr.util.MiscUtils"%>
<%@page import="org.oscarehr.caisi_integrator.ws.MatchingDemographicTransferScore"%>
<%@page import="java.util.List"%>
<%@page import="org.oscarehr.web.DemographicSearchHelper"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.oscarehr.caisi_integrator.ws.MatchingDemographicParameters"%>
<%
  if(session.getAttribute("user") == null)
  {
	  response.sendRedirect("../logout.jsp");
	  return;
  }
%>

<%@ page errorPage="errorpage.jsp" import="oscar.OscarProperties"%>
<jsp:useBean id="apptMainBean" class="oscar.AppointmentMainBean"
	scope="session" />

<%

  OscarProperties props = OscarProperties.getInstance();

  //operation available to the client -- dboperation
  //construct SQL expression
  String orderby="", limit="", limit1="", limit2="";
  if(request.getParameter("orderby")!=null) orderby="order by "+request.getParameter("orderby");
  if(request.getParameter("limit1")!=null) limit1=request.getParameter("limit1");
  if(request.getParameter("limit2")!=null) {
    limit2=request.getParameter("limit2");
    limit="limit "+limit2+" offset "+limit1;
  }

  String fieldname="";
  String regularexp = "regexp";

	String searchMode=request.getParameter("search_mode");
	String keyword=request.getParameter("keyword");
	MatchingDemographicParameters matchingDemographicParameters=null;

	MiscUtils.getLogger().debug("Search parameters, searchMode="+searchMode+", keyword="+keyword);

  if(searchMode!=null) {
	  if(keyword.indexOf("*")!=-1 || keyword.indexOf("%")!=-1) regularexp="like";

    if(searchMode.equals("search_address")) fieldname="address";
    if(searchMode.equals("search_phone")) fieldname="phone";
    if(searchMode.equals("search_hin")) {
    	fieldname="hin";
	  	matchingDemographicParameters=new MatchingDemographicParameters();
    	matchingDemographicParameters.setHin(keyword);
    }
    if(searchMode.equals("search_dob")){
    	fieldname="year_of_birth "+regularexp+" ?"+" and month_of_birth "+regularexp+" ?"+" and date_of_birth ";

    	try
    	{
    		String year=keyword.substring(0, 4);
    		String month=keyword.substring(4, 6);
    		String day=keyword.substring(6);

	    	GregorianCalendar cal=new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month)-1, Integer.parseInt(day));
	    	matchingDemographicParameters=new MatchingDemographicParameters();
	    	matchingDemographicParameters.setBirthDate(cal);
    	}
    	catch (Exception e){
    		// this is okay, person imputed a bad date, we'll ignore for now
    		matchingDemographicParameters=null;
    	}
    }
    if(searchMode.equals("search_chart_no")) fieldname="chart_no";
    if(searchMode.equals("search_name")) {
	  	matchingDemographicParameters=new MatchingDemographicParameters();
	  	String[] lastfirst = keyword.split(",");

        if (lastfirst.length > 1) {
            matchingDemographicParameters.setLastName(lastfirst[0].trim());
            matchingDemographicParameters.setFirstName(lastfirst[1].trim());
        }else{
            matchingDemographicParameters.setLastName(lastfirst[0].trim());
        }

    	if(keyword.indexOf(",")==-1)  fieldname="lower(last_name)";
      else if(keyword.trim().indexOf(",")==(keyword.trim().length()-1)) fieldname="lower(last_name)";
      else fieldname="lower(last_name) "+regularexp+" ?"+" and lower(first_name) ";
    }
  }

  String ptstatusexp="";
  if(request.getParameter("ptstatus")!=null) {
	if(request.getParameter("ptstatus").equals("active")) {
		ptstatusexp=" and patient_status not in ("+props.getProperty("inactive_statuses", "'IN','DE','IC', 'ID', 'MO', 'FI'")+") ";
	}
	if(request.getParameter("ptstatus").equals("inactive"))  {
		ptstatusexp=" and patient_status in ("+props.getProperty("inactive_statuses", "'IN','DE','IC', 'ID', 'MO', 'FI'")+") ";
	}
  }
  else
      ptstatusexp=" and patient_status not in ("+props.getProperty("inactive_statuses", "'IN','DE','IC', 'ID', 'MO', 'FI'")+") ";

  String domainRestriction="";
  if(request.getParameter("outofdomain")!=null && !request.getParameter("outofdomain").equals("true")) {
  	String curProvider_no = (String) session.getAttribute("user");
  	domainRestriction = "and demographic_no in (select client_id from admission where admission_status='current' and program_id in (select program_id from program_provider where provider_no='"+curProvider_no+"')) ";
  }


  String [][] dbQueries=new String[][] {
    {"search_titlename", "select *  from demographic where "+fieldname+" "+regularexp+" ? "+ptstatusexp+domainRestriction+orderby},
    {"search_titlename_mysql", "select *  from demographic where "+fieldname+" "+regularexp+" ? "+ptstatusexp+domainRestriction+orderby + " " + limit},
    {"add_apptrecord", "select demographic_no,first_name,last_name,roster_status,sex,chart_no,year_of_birth,month_of_birth,date_of_birth,provider_no from demographic where "+fieldname+ " "+regularexp+" ? " +ptstatusexp+domainRestriction+orderby},
    {"update_apptrecord", "select demographic_no,first_name,last_name,roster_status,sex,chart_no,year_of_birth,month_of_birth,date_of_birth,provider_no  from demographic where "+fieldname+ " "+regularexp+" ? " +ptstatusexp+domainRestriction+orderby + " "+limit},
    {"search_detail", "select * from demographic where demographic_no=?"},
    {"search_detail_ptbr", "select * from demographic d left outer join demographic_ptbr dptbr on dptbr.demographic_no = d.demographic_no where d.demographic_no=?"},

    {"search_provider", "select * from provider status='1' order by last_name"},
    {"search_provider_doc", "select * from provider where provider_type='doctor' and status='1' order by last_name"},
    {"search_provider_doc_with_ohip", "select * from provider where provider_type='doctor' and status='1' and ohip_no is not null and ohip_no !='' order by last_name"},
    {"search_demographicid", "select * from demographic where demographic_no=?"},
    {"search*", "select * from demographic "+ ptstatusexp+domainRestriction+orderby + " "+limit },
    {"search_lastfirstnamedob", "select demographic_no from demographic where last_name=? and first_name=? and year_of_birth=? and month_of_birth=? and date_of_birth=?"},
    {"search_demographic_ptbr","select * from demographic_ptbr where demographic_no = ?"},
    {"search_demoaddno", "select demographic_no,chart_no,provider_no from demographic where last_name=? and first_name =? and year_of_birth=? and month_of_birth=? and date_of_birth=? and hin=? and ver=?"},
    {"appt_history", "select appointment_no, appointment_date, start_time, remarks, CONCAT(appointment_date,start_time) AS appttime, end_time, reason, appointment.status, provider.last_name, provider.first_name, appointment.location from appointment LEFT JOIN provider ON appointment.provider_no=provider.provider_no where appointment.demographic_no=? "+ orderby + " desc "},
    {"search_ptstatus", "select distinct patient_status from demographic where patient_status != '' and patient_status != 'AC' and patient_status != 'IN' and patient_status != 'DE' and patient_status != 'MO' and patient_status != 'FI'"},
    {"search_rsstatus", "select distinct roster_status from demographic where roster_status != '' and roster_status != 'RO' and roster_status != 'NR' and roster_status != 'TE' and roster_status != 'FS' "},
    {"search_waitingListPosition", "select max(position) as position from waitingList where listID=? AND is_history='N' "},
    {"search_wlstatus", "select * from waitingList where demographic_no=? AND is_history='N' order by onListSince DESC"},
    {"search_waiting_list", "select * from waitingListName where group_no='" + ((ProviderPreference)session.getAttribute(SessionConstants.LOGGED_IN_PROVIDER_PREFERENCE)).getMyGroupNo() +"' AND is_history='N' order by name"},
    {"search_demo_waiting_list", "select * from waitingList where demographic_no=? AND listID=?  AND is_history='N' "},
    {"search_future_appt", "select a.demographic_no, a.appointment_date from appointment a where a.appointment_date >= now() AND a.demographic_no=?"},
    {"search_hin", "select demographic_no, ver from demographic where hin=?"},
    {"search_program", "select id from program where name = ?"}
   };

	//associate each operation with an output JSP file -- displaymode
	String[][] responseTargets=new String[][] {
	  {"Search " , "demographicsearch2apptresults.jsp"},
	  {"Search" , "demographicsearchresults.jsp"},
	  {"edit" , "demographiceditdemographic.jsp"},
	  {"pdflabel" , "demographicpdflabel.jsp"},
	  {"pdfaddresslabel" , "demographicpdfaddresslabel.jsp"},
	  {"pdfchartlabel" , "demographicpdfchartlabel.jsp"},
	  {"appt_history" , "demographicappthistory.jsp"},
	  {"Update Record" , "demographicupdatearecord.jsp"},

	  {"Delete" , "demographicdeletearecord.jsp"},
	  {"Save Record & Back to Appointment" , "demographicaddbacktoappt.jsp"},
	  {"Update Record & Back to Appointment" , "demographicupdatebacktoappt.jsp"},
	  {"Demographic ID" , "adddemographictoeditappt.jsp"},
	  {"Add Record & Back to Appointment" , "adddemographicbacktoappt.jsp"},
	  {"Update Record & Back to Appointment" , "updatedemographicbacktoappt.jsp"},
	  {"linkMsg2Demo" , "../oscarMessenger/msgSearchDemo.jsp"},
	};
	apptMainBean.doConfigure( dbQueries,responseTargets);

   	apptMainBean.doCommand(request); //store request to a help class object Dict - function&params

	LoggedInInfo loggedInInfo=LoggedInInfo.loggedInInfo.get();
   	//--- add integrator results ---

   	boolean searchIntegrator = false;
   	if (request.getParameter("includeIntegratedResults") != null && "true".equals(request.getParameter("includeIntegratedResults"))){
   		searchIntegrator = true;
   	}
   	MiscUtils.getLogger().debug("search Integrator: "+searchIntegrator);


	if (searchIntegrator && matchingDemographicParameters!=null && loggedInInfo.currentFacility.isIntegratorEnabled())
	{
		try{
			matchingDemographicParameters.setMaxEntriesToReturn(5);
			matchingDemographicParameters.setMinScore(7);
			List<MatchingDemographicTransferScore> integratorSearchResults=DemographicSearchHelper.getIntegratedSearchResults(matchingDemographicParameters);

			MiscUtils.getLogger().debug("Integrator search results : "+MiscUtils.getSize(integratorSearchResults) );
			request.setAttribute("integratorSearchResults", integratorSearchResults);
		}catch(Exception e){
			log("error searching integrator", e);
		}
	}

	String pg=apptMainBean.whereTo();
	MiscUtils.getLogger().debug("forward to page : "+pg);
	if (pg!=null)
	{
	   	pageContext.forward(pg); //forward request&response to the target page
		return;
	}
%>
