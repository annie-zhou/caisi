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

package org.oscarehr.survey.dao;

import org.oscarehr.survey.model.SurveyTestData;
import org.oscarehr.survey.model.SurveyTestInstance;

public interface SurveyTestDAO {
	public SurveyTestInstance getSurveyInstance(Long id);
	public SurveyTestInstance getSurveyInstance(Long surveyId,Long clientId);
	
	public void saveSurveyInstance(SurveyTestInstance instance);
	public void saveSurveyData(SurveyTestData data);
	
	public void clearTestData(Long surveyId);
}
