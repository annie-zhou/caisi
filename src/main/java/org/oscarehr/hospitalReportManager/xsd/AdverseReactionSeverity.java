/**
 * Copyright (c) 2008-2012 Indivica Inc.
 *
 * This software is made available under the terms of the
 * GNU General Public License, Version 2, 1991 (GPLv2).
 * License details are available via "indivica.ca/gplv2"
 * and "gnu.org/licenses/gpl-2.0.html".
 */

//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-558 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.06.03 at 01:48:51 AM EDT 
//


package org.oscarehr.hospitalReportManager.xsd;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for adverseReactionSeverity.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="adverseReactionSeverity">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}token">
 *     &lt;length value="2"/>
 *     &lt;enumeration value="NO"/>
 *     &lt;enumeration value="MI"/>
 *     &lt;enumeration value="MO"/>
 *     &lt;enumeration value="LT"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "adverseReactionSeverity")
@XmlEnum
public enum AdverseReactionSeverity {

    NO,
    MI,
    MO,
    LT;

    public String value() {
        return name();
    }

    public static AdverseReactionSeverity fromValue(String v) {
        return valueOf(v);
    }

}
