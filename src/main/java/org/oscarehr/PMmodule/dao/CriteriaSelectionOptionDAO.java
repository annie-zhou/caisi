/**
 * Copyright (c) 2001-2002. Department of Family Medicine, McMaster University. All Rights Reserved.
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
 * This software was written for the
 * Department of Family Medicine
 * McMaster University
 * Hamilton
 * Ontario, Canada
 */

package org.oscarehr.PMmodule.dao;

import java.util.List;

import javax.persistence.Query;

import org.oscarehr.PMmodule.model.CriteriaSelectionOption;
import org.oscarehr.common.dao.AbstractDao;
import org.springframework.stereotype.Repository;

@Repository
public class CriteriaSelectionOptionDAO extends AbstractDao<CriteriaSelectionOption> {

	public CriteriaSelectionOptionDAO() {
		super(CriteriaSelectionOption.class);
	}

	@SuppressWarnings("unchecked")
    public List<CriteriaSelectionOption> getCriteriaSelectedOptionsByCriteriaId(Integer criteriaId) {
		String sqlCommand = "select * from criteria_selection_option where CRITERIA_ID=?1 ";

		Query query = entityManager.createNativeQuery(sqlCommand, modelClass);
		query.setParameter(1, criteriaId);
		
		return query.getResultList();
		
	}
}

