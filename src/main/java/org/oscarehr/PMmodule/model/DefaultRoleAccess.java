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

package org.oscarehr.PMmodule.model;

import java.io.Serializable;

/**
 * This is the object class that relates to the default_role_access table. Any customizations belong here.
 */
public class DefaultRoleAccess  implements Serializable {

    private int hashCode = Integer.MIN_VALUE;// primary key
    private Long _id;// fields
    private long _roleId;
    private long _accessTypeId;// many to one
    private com.quatro.model.security.Secrole _caisi_role;
    private AccessType _access_type;


    // constructors
    public DefaultRoleAccess () {
        initialize();
    }

    /**
     * Constructor for primary key
     */
    public DefaultRoleAccess (Long _id) {
        this.setId(_id);
        initialize();
    }

    /* [CONSTRUCTOR MARKER END] */
    protected void initialize () {}

    /**
     * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="native"
     *  column="id"
     */
    public Long getId () {
        return _id;
    }

    /**
     * Set the unique identifier of this class
     * @param _id the new ID
     */
    public void setId (Long _id) {
        this._id = _id;
        this.hashCode = Integer.MIN_VALUE;
    }

    /**
     * Return the value associated with the column: role_id
     */
    public long getRoleId () {
        return _roleId;
    }

    /**
     * Set the value related to the column: role_id
     * @param _roleId the role_id value
     */
    public void setRoleId (long _roleId) {
        this._roleId = _roleId;
    }

    /**
     * Return the value associated with the column: access_id
     */
    public long getAccessTypeId () {
        return _accessTypeId;
    }

    /**
     * Set the value related to the column: access_id
     * @param _accessTypeId the access_id value
     */
    public void setAccessTypeId (long _accessTypeId) {
        this._accessTypeId = _accessTypeId;
    }

    /**
     * @hibernate.property
     *  column=role_id
     */
    public com.quatro.model.security.Secrole getCaisi_role () {
        return this._caisi_role;
    }

    /**
     * Set the value related to the column: role_id
     * @param _caisi_role the role_id value
     */
    public void setCaisi_role (com.quatro.model.security.Secrole _caisi_role) {
        this._caisi_role = _caisi_role;
    }

    /**
     * @hibernate.property
     *  column=access_id
     */
    public AccessType getAccess_type () {
        return this._access_type;
    }

    /**
     * Set the value related to the column: access_id
     * @param _access_type the access_id value
     */
    public void setAccess_type (AccessType _access_type) {
        this._access_type = _access_type;
    }

    public boolean equals (Object obj) {
        if (null == obj) return false;
        if (!(obj instanceof DefaultRoleAccess)) return false;
        else {
            DefaultRoleAccess mObj = (DefaultRoleAccess) obj;
            if (null == this.getId() || null == mObj.getId()) return false;
            else return (this.getId().longValue() == mObj.getId().longValue());
        }
    }

    public int hashCode () {
        if (Integer.MIN_VALUE == this.hashCode) {
            if (null == this.getId()) return super.hashCode();
            else {
                String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
                this.hashCode = hashStr.hashCode();
            }
        }
        return this.hashCode;
    }

    public String toString () {
        return super.toString();
    }
}
