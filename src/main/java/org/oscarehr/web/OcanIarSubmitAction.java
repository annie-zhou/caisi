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

package org.oscarehr.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.oscarehr.util.MiscUtils;

import oscar.OscarProperties;

public class OcanIarSubmitAction extends DispatchAction {

	Logger logger = MiscUtils.getLogger();
	
	public ActionForward submit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		String ocanVersionStr = "";
		int ocanVersion = 0;
		if(OscarProperties.getInstance().getProperty("ocan.version", "").trim().length()>0)
		{
			ocanVersionStr = OscarProperties.getInstance().getProperty("ocan.version", "").trim();
			ocanVersion = Double.valueOf(ocanVersionStr).intValue();
		}
		
		int submissionId_full = 0;
		if(ocanVersion==3)
			submissionId_full = OcanReportUIBeanV3.sendSubmissionToIAR(OcanReportUIBeanV3.generateOCANSubmission("FULL"), "FULL");
		else
			submissionId_full = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("FULL"), "FULL");
		
		try {
			response.getWriter().println(submissionId_full);
		}catch(IOException e) {
			logger.error("Error",e);
		}
		
		int submissionId_self = 0;
		if(ocanVersion==3)
			submissionId_self = OcanReportUIBeanV3.sendSubmissionToIAR(OcanReportUIBeanV3.generateOCANSubmission("SELF"));
		else
			submissionId_self = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("SELF"));
		
		try {
			response.getWriter().println(submissionId_self);
		}catch(IOException e) {
			logger.error("Error:",e);
		}
		
		int submissionId_core = 0;
		if(ocanVersion==3)
			submissionId_core = OcanReportUIBeanV3.sendSubmissionToIAR(OcanReportUIBeanV3.generateOCANSubmission("CORE"));			
		else
			submissionId_core = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("CORE"));
		
		try {
			response.getWriter().println(submissionId_core);
		}catch(IOException e) {
			logger.error("Error:",e);
		}
		
		return null;
	}
}
