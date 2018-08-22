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


package oscar.oscarEncounter.oscarMeasurements.pageUtil;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import oscar.oscarEncounter.oscarMeasurements.bean.EctTypeDisplayNameBeanHandler;

public class EctSetupEditMeasurementGroupAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
 
        EctSetupEditMeasurementGroupForm frm = (EctSetupEditMeasurementGroupForm) form;                
        request.getSession().setAttribute("EctSetupEditMeasurementGroupForm", frm);
        
        String groupName = (String) frm.getValue("groupName");                        
        
        EctTypeDisplayNameBeanHandler hd = new EctTypeDisplayNameBeanHandler(groupName, false);
        Collection existingTypeDisplayName = hd.getTypeDisplayNameVector();
        hd = new EctTypeDisplayNameBeanHandler(groupName, true);
        Collection allTypeDisplayName = hd.getTypeDisplayNameVector();

        HttpSession session = request.getSession();
        session.setAttribute( "existingTypeDisplayNames", existingTypeDisplayName );   
        session.setAttribute( "allTypeDisplayNames", allTypeDisplayName ); 
        session.setAttribute( "groupName", groupName);
        return mapping.findForward("continue");
                      

    }

}