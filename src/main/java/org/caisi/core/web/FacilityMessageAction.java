/**
 *
 * Copyright (c) 2005-2012. Centre for Research on Inner City Health, St. Michael's Hospital, Toronto. All Rights Reserved.
 * This software is published under the GPL GNU General Public License.
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * This software was written for
 * Centre for Research on Inner City Health, St. Michael's Hospital,
 * Toronto, Ontario, Canada
 */

package org.caisi.core.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;
import org.caisi.model.FacilityMessage;
import org.caisi.service.FacilityMessageManager;
import org.oscarehr.PMmodule.dao.ProgramProviderDAO;
import org.oscarehr.common.dao.FacilityDao;
import org.oscarehr.common.model.Facility;

public class FacilityMessageAction extends DispatchAction {

	private FacilityMessageManager mgr = null;
	private FacilityDao facilityDao = null;
	private ProgramProviderDAO programProviderDAO;
	
	public void setFacilityMessageManager(FacilityMessageManager mgr) {
		this.mgr = mgr;
	}
	
	public void setFacilityDao(FacilityDao facilityDao) {
		this.facilityDao = facilityDao;
	}
	
	public void setProgramProviderDAO(ProgramProviderDAO dao) {
		this.programProviderDAO = dao;
	}	
	
	public ActionForward unspecified(ActionMapping mapping,ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		return list(mapping,form,request,response);
	}
		
	public ActionForward list(ActionMapping mapping,ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		//List activeMessages = mgr.getMessages();
		Facility facility = (Facility)request.getSession().getAttribute("currentFacility");
		Integer facilityId = null;
		if(facility!=null)
			facilityId = facility.getId();
		
		List<FacilityMessage> activeMessages = mgr.getMessagesByFacilityId(facilityId);
		if(activeMessages!=null && activeMessages.size() >0)
			request.setAttribute("ActiveFacilityMessages",activeMessages);
		return mapping.findForward("list");
	}
	
	public ActionForward edit(ActionMapping mapping,ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm facilityMessageForm = (DynaActionForm)form;
		String messageId = request.getParameter("id");
		
		//List facilities = programProviderDAO.getFacilitiesInProgramDomain(providerNo);
		List<Facility> facilities = new ArrayList<Facility>();
		facilities.add((Facility)request.getSession().getAttribute("currentFacility"));
		
		request.getSession().setAttribute("facilities", facilities);
		
		if(messageId != null) {
			FacilityMessage msg = mgr.getMessage(messageId);
			
			if(msg == null) {
				ActionMessages webMessage = new ActionMessages();
				webMessage.add(ActionMessages.GLOBAL_MESSAGE,new ActionMessage("system_message.missing"));
				saveErrors(request,webMessage);
				return list(mapping,form,request,response);
			}
			facilityMessageForm.set("facility_message",msg);
		}
		
		
		return mapping.findForward("edit");
	}

	public ActionForward save(ActionMapping mapping,ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm userForm = (DynaActionForm)form;
		FacilityMessage msg = (FacilityMessage)userForm.get("facility_message");
		msg.setCreation_date(new Date());
		Integer facilityId = msg.getFacilityId().intValue();
		String facilityName = "";
		if(facilityId!=null && facilityId.intValue()!=0)
			facilityName = facilityDao.find(facilityId).getName();
		msg.setFacilityName(facilityName);
		mgr.saveFacilityMessage(msg);
		
        ActionMessages messages = new ActionMessages();
        messages.add(ActionMessages.GLOBAL_MESSAGE,new ActionMessage("system_message.saved"));
        saveMessages(request,messages);

        return list(mapping,form,request,response);
	}
	
	public ActionForward view(ActionMapping mapping,ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		//String providerNo = (String)request.getSession().getAttribute("user");
		//List messages = programProviderDAO.getFacilityMessagesInProgramDomain(providerNo);
		Facility facility = (Facility)request.getSession().getAttribute("currentFacility");
		Integer facilityId = null;
		if(facility!=null) 
			facilityId = facility.getId();
		List<FacilityMessage> messages = programProviderDAO.getFacilityMessagesByFacilityId(facilityId);
		if(messages!=null && messages.size()>0) {
			request.setAttribute("FacilityMessages",messages);
		}
		return mapping.findForward("view");
	}
}
