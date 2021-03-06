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
package org.oscarehr.common.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Before;
import org.junit.Test;
import org.oscarehr.common.dao.utils.EntityDataGenerator;
import org.oscarehr.common.dao.utils.SchemaUtils;
import org.oscarehr.common.model.Allergy;
import org.oscarehr.util.SpringUtils;

public class AllergyDaoTest extends DaoTestFixtures {

	private AllergyDao dao = (AllergyDao)SpringUtils.getBean("AllergyDao");

	public AllergyDaoTest() {
	}

	@Before
	public void before() throws Exception {
		SchemaUtils.restoreTable(new String[]{"allergies"});
	}

	@Test
	public void testCreate() throws Exception {
		 Allergy allergy = new Allergy();
		 EntityDataGenerator.generateTestDataForModelClass(allergy);
		 dao.persist(allergy);
		 assertNotNull(allergy.getId());
	}

	@Test
	public void testCount() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		dao.persist(allergy);
		assertEquals(dao.getCountAll(),1);

	}

	@Test
	public void testGetNextPosition() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setPosition(100);
		dao.persist(allergy);

		assertEquals(dao.getMaxPosition(),(Integer)100);

		dao.remove(allergy.getId());

		assertNull(dao.getMaxPosition());


	}

	@Test
	public void testFindAllergies() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(1);
		dao.persist(allergy);

		allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(1);
		dao.persist(allergy);

		allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(2);
		dao.persist(allergy);

		assertEquals(dao.findAllergies(1).size(),2);
		assertEquals(dao.findAllergies(2).size(),1);
	}

	@Test
	public void testFindActive() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(3);
		allergy.setArchived(null);
		dao.persist(allergy);

		allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(3);
		allergy.setArchived("0");
		dao.persist(allergy);

		allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		allergy.setDemographicNo(3);
		allergy.setArchived("1");
		dao.persist(allergy);

		assertEquals(dao.findActiveAllergies(3).size(),2);

	}

	public void testFind() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		dao.persist(allergy);
		Integer id = allergy.getId();
		allergy = dao.find(allergy.getId());
		assertNotNull(allergy);
		assertEquals(id,allergy.getId());
	}

	@Test
	public void testDelete() throws Exception {
		Allergy allergy = new Allergy();
		EntityDataGenerator.generateTestDataForModelClass(allergy);
		dao.persist(allergy);
		dao.remove(allergy.getId());
		assertEquals(dao.getCountAll(),0);

	}

}

