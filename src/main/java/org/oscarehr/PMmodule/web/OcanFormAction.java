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

package org.oscarehr.PMmodule.web;

import org.apache.commons.lang.StringUtils;
import org.oscarehr.common.dao.OcanClientFormDao;
import org.oscarehr.common.dao.OcanClientFormDataDao;
import org.oscarehr.common.dao.OcanStaffFormDao;
import org.oscarehr.common.dao.OcanStaffFormDataDao;
import org.oscarehr.common.model.OcanClientForm;
import org.oscarehr.common.model.OcanClientFormData;
import org.oscarehr.common.model.OcanStaffForm;
import org.oscarehr.common.model.OcanStaffFormData;
import org.oscarehr.util.LoggedInInfo;
import org.oscarehr.util.SpringUtils;

import oscar.OscarProperties;

public class OcanFormAction {
	
	private static OcanStaffFormDao ocanStaffFormDao = (OcanStaffFormDao) SpringUtils.getBean("ocanStaffFormDao");
	private static OcanStaffFormDataDao ocanStaffFormDataDao = (OcanStaffFormDataDao) SpringUtils.getBean("ocanStaffFormDataDao");

	private static OcanClientFormDao ocanClientFormDao = (OcanClientFormDao) SpringUtils.getBean("ocanClientFormDao");
	private static OcanClientFormDataDao ocanClientFormDataDao = (OcanClientFormDataDao) SpringUtils.getBean("ocanClientFormDataDao");

	private static String ocanFormVersion = "1.2";
	static
	{
		if(OscarProperties.getInstance().getProperty("ocan.version", "").trim().length()>0)
		{
			ocanFormVersion = OscarProperties.getInstance().getProperty("ocan.version", "").trim();
		}
	}
	
	public static OcanStaffForm createOcanStaffForm(Integer admissionId, Integer clientId, boolean signed)
	{
		LoggedInInfo loggedInInfo=LoggedInInfo.loggedInInfo.get();
		
		OcanStaffForm ocanStaffForm=new OcanStaffForm();
		ocanStaffForm.setAdmissionId(admissionId);
		ocanStaffForm.setOcanFormVersion(ocanFormVersion);		
		ocanStaffForm.setClientId(clientId);
		ocanStaffForm.setFacilityId(loggedInInfo.currentFacility.getId());
		ocanStaffForm.setProviderNo(loggedInInfo.loggedInProvider.getProviderNo());
		ocanStaffForm.setSigned(signed);
		
		
		return(ocanStaffForm);
	}
	
	public static OcanStaffForm createOcanStaffForm(String ocanStaffFormId, Integer clientId, boolean signed)
	{
		LoggedInInfo loggedInInfo=LoggedInInfo.loggedInInfo.get();
		OcanStaffForm ocanStaffForm=new OcanStaffForm();
		if(ocanStaffFormId==null || "".equals(ocanStaffFormId) || "null".equals(ocanStaffFormId) || "0".equals(ocanStaffFormId)) {
			
			//ocanStaffForm.setAdmissionId(admissionId);
			ocanStaffForm.setAssessmentId(ocanStaffForm.getId());
			ocanStaffForm.setOcanFormVersion(ocanFormVersion);		
			ocanStaffForm.setClientId(clientId);
			ocanStaffForm.setFacilityId(loggedInInfo.currentFacility.getId());			
			ocanStaffForm.setSigned(signed);
		} else {
			ocanStaffForm = OcanForm.getOcanStaffForm(Integer.valueOf(ocanStaffFormId));
		}
		return(ocanStaffForm);
	}
	
	public static void saveOcanStaffForm(OcanStaffForm ocanStaffForm) {			
		if(ocanStaffFormDao.findOcanStaffFormById(ocanStaffForm.getId())==null) {
			ocanStaffFormDao.persist(ocanStaffForm);
			ocanStaffForm.setAssessmentId(ocanStaffForm.getId());
			ocanStaffFormDao.merge(ocanStaffForm);
		} else {
			ocanStaffForm.setId(null);
			ocanStaffFormDao.persist(ocanStaffForm);
		}
		
	}
	
	public static void addOcanStaffFormData(Integer ocanStaffFormId, String question, String answer)
	{
		answer=StringUtils.trimToNull(answer);
		if (answer==null || answer=="") return;
		OcanStaffFormData ocanStaffFormData;
		if(ocanStaffFormDataDao.findByQuestion(ocanStaffFormId, question).isEmpty()) {
			ocanStaffFormData=new OcanStaffFormData();
			ocanStaffFormData.setOcanStaffFormId(ocanStaffFormId);
			ocanStaffFormData.setQuestion(question);
			ocanStaffFormData.setAnswer(answer);			
			ocanStaffFormDataDao.persist(ocanStaffFormData); //create
		} else {
			ocanStaffFormData = ocanStaffFormDataDao.findLatestByQuestion(ocanStaffFormId, question);
			ocanStaffFormData.setOcanStaffFormId(ocanStaffFormId);
			ocanStaffFormData.setQuestion(question);
			ocanStaffFormData.setAnswer(answer);			
			ocanStaffFormDataDao.merge(ocanStaffFormData); //update
		}
		
	}
	
	public static void addOcanStaffFormDataMultipleAnswers(Integer ocanStaffFormId, String question, String answer)
	{
		answer=StringUtils.trimToNull(answer);
		if (answer==null || answer=="") return;
		OcanStaffFormData ocanStaffFormData;
		
			ocanStaffFormData=new OcanStaffFormData();
			ocanStaffFormData.setOcanStaffFormId(ocanStaffFormId);
			ocanStaffFormData.setQuestion(question);
			ocanStaffFormData.setAnswer(answer);			
			ocanStaffFormDataDao.persist(ocanStaffFormData); //create
				
	}
/*	
	public static void updateOcanStaffFormData(Integer ocanStaffFormId, String question, String answer)
	{
		OcanStaffFormData ocanStaffFormData;
		
		ocanStaffFormData=new OcanStaffFormData();
		ocanStaffFormData.setOcanStaffFormId(ocanStaffFormId);
		ocanStaffFormData.setQuestion(question);
		ocanStaffFormData.setAnswer(answer);
		
		if(ocanStaffFormDataDao.findByQuestion(ocanStaffFormId, question).size()<=0) {
			ocanStaffFormDataDao.persist(ocanStaffFormData); //create	
		} else {
			ocanStaffFormData.setId(ocanStaffFormDataDao.findByQuestion(ocanStaffFormId, question).get(0).getId());
			ocanStaffFormDataDao.merge(ocanStaffFormData); //update	
		}
	}
*/	
	
	
	
	public static OcanClientForm createOcanClientForm(Integer clientId)
	{
		LoggedInInfo loggedInInfo=LoggedInInfo.loggedInInfo.get();
		
		OcanClientForm ocanClientForm=new OcanClientForm();		
		ocanClientForm.setOcanFormVersion(ocanFormVersion);		
		ocanClientForm.setClientId(clientId);
		ocanClientForm.setFacilityId(loggedInInfo.currentFacility.getId());
		ocanClientForm.setProviderNo(loggedInInfo.loggedInProvider.getProviderNo());
		
		
		return(ocanClientForm);
	}
	
	public static void saveOcanClientForm(OcanClientForm ocanClientForm) {
		LoggedInInfo loggedInInfo=LoggedInInfo.loggedInInfo.get();
		ocanClientForm.setProviderNo(loggedInInfo.loggedInProvider.getProviderNo());
		ocanClientForm.setProviderName(loggedInInfo.loggedInProvider.getFormattedName());
		
		ocanClientFormDao.persist(ocanClientForm);
	}
	
	public static void addOcanClientFormData(Integer ocanClientFormId, String question, String answer)
	{
		answer=StringUtils.trimToNull(answer);
		if (answer==null) return;
		
		OcanClientFormData ocanClientFormData=new OcanClientFormData();
		
		ocanClientFormData.setOcanClientFormId(ocanClientFormId);
		ocanClientFormData.setQuestion(question);
		ocanClientFormData.setAnswer(answer);
		
		ocanClientFormDataDao.persist(ocanClientFormData);
	}
	

}
