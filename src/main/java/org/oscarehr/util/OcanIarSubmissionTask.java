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

package org.oscarehr.util;

import java.util.List;
import java.util.TimerTask;
import org.apache.log4j.Logger;
import org.oscarehr.common.dao.FacilityDao;
import org.oscarehr.common.model.Facility;
import org.oscarehr.web.OcanReportUIBean;
import org.oscarehr.web.OcanReportUIBeanV3;

import oscar.OscarProperties;

public class OcanIarSubmissionTask extends TimerTask {

	private static final Logger logger = MiscUtils.getLogger();

	@Override
	public void run() {
		try {
			logger.info("Running OCAN IAR Submission Task");
			LoggedInInfo.setLoggedInInfoToCurrentClassAndMethod();

			FacilityDao facilityDao = (FacilityDao) SpringUtils.getBean("facilityDao");
			List<Facility> facilities = facilityDao.findAll(null);
			for (Facility facility : facilities) {
				if (!facility.isDisabled() && facility.isEnableOcanForms() && Integer.valueOf(facility.getOcanServiceOrgNumber()).intValue() != 0) {
					LoggedInInfo.loggedInInfo.get().currentFacility = facility;
					break;
				}
			}

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
				submissionId_full = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("FULL"));
			
			logger.info("FULL OCAN upload Completed: submissionId=" + submissionId_full);

			int submissionId_self = 0;
			if(ocanVersion==3)
				submissionId_self = OcanReportUIBeanV3.sendSubmissionToIAR(OcanReportUIBeanV3.generateOCANSubmission("SELF"));
			else
				submissionId_self = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("SELF"));
			
			logger.info("SELF OCAN upload Completed: submissionId=" + submissionId_self);

			int submissionId_core = 0;
			if(ocanVersion==3)
				submissionId_core = OcanReportUIBeanV3.sendSubmissionToIAR(OcanReportUIBeanV3.generateOCANSubmission("CORE"));			
			else
				submissionId_core = OcanReportUIBean.sendSubmissionToIAR(OcanReportUIBean.generateOCANSubmission("CORE"));
			
			logger.info("CORE OCAN upload Completed: submissionId=" + submissionId_core);
		} catch (Exception e) {
			logger.error("Error", e);
		} finally {
			DbConnectionFilter.releaseAllThreadDbResources();
		}
	}
}
