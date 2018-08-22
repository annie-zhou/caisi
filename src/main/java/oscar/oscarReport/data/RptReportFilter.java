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


/*
 * Created on 2005-7-30
 */
package oscar.oscarReport.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import org.apache.commons.lang.StringEscapeUtils;

import oscar.login.DBHelp;

/**
 * @author yilee18
 */
public class RptReportFilter {
    int report_id = 0;
    String description;
    String value;
    String position;
    int status = 1;
    int order_no = 1;
    String javascript;
    String date_format;
    DBHelp dbObj = new DBHelp();

    public boolean insertRecord()  {
        boolean ret = false;
        String sql = "insert into reportFilter (report_id, description, value, position, status,order_no,javascript,date_format) values ("
                + report_id
                + ", '"
                + StringEscapeUtils.escapeSql(description)
                + "','"
                + StringEscapeUtils.escapeSql(value)
                + "','"
                + StringEscapeUtils.escapeSql(position)
                + "', "
                + status
                + " , "
                + order_no
                + ",'"
                + StringEscapeUtils.escapeSql(javascript)
                + "','"
                + StringEscapeUtils.escapeSql(date_format) + "')";
        ret = DBHelp.updateDBRecord(sql);
        return ret;
    }

    public boolean deleteRecord(int recordId) {
        boolean ret = false;
        String sql = "update reportFilter set status=0 where id=" + recordId;
        ret = DBHelp.updateDBRecord(sql);
        return ret;
    }

    public boolean unDeleteRecord(int recordId) {
        boolean ret = false;
        String sql = "update reportFilter set status=1 where id=" + recordId;
        ret = DBHelp.updateDBRecord(sql);
        return ret;
    }

    // 1 - name list, 0 - deleted name list, 0-`description` 1-value 2-javascript 3-dateformat
    public Vector getNameList(int n) throws SQLException {
        Vector ret = new Vector();
        String[] str = null;
        String sql = "select * from reportFilter where status = " + n + " order by order_no";
        ResultSet rs = DBHelp.searchDBRecord(sql);
        while (rs.next()) {
            str = new String[6];
            str[0] = DBHelp.getString(rs,"description");
            str[1] = DBHelp.getString(rs,"value");
            str[2] = DBHelp.getString(rs,"position");
            str[3] = "" + rs.getInt("order_no");
            str[4] = DBHelp.getString(rs,"javascript");
            str[5] = DBHelp.getString(rs,"date_format");
            ret.add(str);
        }
        rs.close();
        return ret;
    }

    public Vector getNameList(String recordId, int n) throws SQLException {
        Vector ret = new Vector();
        String[] str = null;
        String sql = "select * from reportFilter where report_id=" + recordId + " and status = " + n
                + " order by order_no";
        ResultSet rs = DBHelp.searchDBRecord(sql);
        while (rs.next()) {
            str = new String[6];
            str[0] = DBHelp.getString(rs,"description");
            str[1] = DBHelp.getString(rs,"value");
            str[2] = DBHelp.getString(rs,"position");
            str[3] = "" + rs.getInt("order_no");
            str[4] = DBHelp.getString(rs,"javascript");
            str[5] = DBHelp.getString(rs,"date_format");
            ret.add(str);
        }
        rs.close();
        return ret;
    }

}
