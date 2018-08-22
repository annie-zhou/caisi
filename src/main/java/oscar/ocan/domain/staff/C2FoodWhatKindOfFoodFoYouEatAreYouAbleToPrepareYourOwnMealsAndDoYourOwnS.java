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

//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-793 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2009.05.24 at 10:52:14 PM EDT 
//


package oscar.ocan.domain.staff;

import java.math.BigInteger;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element ref="{}C1__Does_the_person_have_difficulty_getting_enough_to_eat___If_rated_0_or_9__go_to_the_next_doma"/>
 *         &lt;element ref="{}C2__How_much_help_with_getting_enough_to_eat_does_the_person_receive_from_friends_or_relatives_"/>
 *         &lt;element ref="{}C3a__How_much_help_with_getting_enough_to_eat_does_the_person_receive_from_local_services_"/>
 *         &lt;element ref="{}C3b__How_much_help_with_getting_enough_to_eat_does_the_person_need_from_local_services_"/>
 *         &lt;element ref="{}CComments_"/>
 *         &lt;element ref="{}CActions_"/>
 *         &lt;element ref="{}CBy_whom_"/>
 *         &lt;element ref="{}CReview_date_"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma",
    "c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives",
    "c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices",
    "c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices",
    "cComments",
    "cActions",
    "cByWhom",
    "cReviewDate"
})
@XmlRootElement(name = "C2__Food__What_kind_of_food_fo_you_eat__Are_you_able_to_prepare_your_own_meals_and_do_your_own_s")
public class C2FoodWhatKindOfFoodFoYouEatAreYouAbleToPrepareYourOwnMealsAndDoYourOwnS {

    @XmlElement(name = "C1__Does_the_person_have_difficulty_getting_enough_to_eat___If_rated_0_or_9__go_to_the_next_doma", required = true)
    protected BigInteger c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma;
    @XmlElement(name = "C2__How_much_help_with_getting_enough_to_eat_does_the_person_receive_from_friends_or_relatives_", required = true)
    protected BigInteger c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives;
    @XmlElement(name = "C3a__How_much_help_with_getting_enough_to_eat_does_the_person_receive_from_local_services_", required = true)
    protected BigInteger c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices;
    @XmlElement(name = "C3b__How_much_help_with_getting_enough_to_eat_does_the_person_need_from_local_services_", required = true)
    protected BigInteger c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices;
    @XmlElement(name = "CComments_", required = true)
    protected CComments cComments;
    @XmlElement(name = "CActions_", required = true)
    protected String cActions;
    @XmlElement(name = "CBy_whom_", required = true)
    protected String cByWhom;
    @XmlElement(name = "CReview_date_", required = true)
    protected String cReviewDate;

    /**
     * Gets the value of the c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getC1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma() {
        return c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma;
    }

    /**
     * Sets the value of the c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setC1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma(BigInteger value) {
        this.c1DoesThePersonHaveDifficultyGettingEnoughToEatIfRated0Or9GoToTheNextDoma = value;
    }

    /**
     * Gets the value of the c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getC2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives() {
        return c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives;
    }

    /**
     * Sets the value of the c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setC2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives(BigInteger value) {
        this.c2HowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromFriendsOrRelatives = value;
    }

    /**
     * Gets the value of the c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getC3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices() {
        return c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices;
    }

    /**
     * Sets the value of the c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setC3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices(BigInteger value) {
        this.c3AHowMuchHelpWithGettingEnoughToEatDoesThePersonReceiveFromLocalServices = value;
    }

    /**
     * Gets the value of the c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getC3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices() {
        return c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices;
    }

    /**
     * Sets the value of the c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setC3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices(BigInteger value) {
        this.c3BHowMuchHelpWithGettingEnoughToEatDoesThePersonNeedFromLocalServices = value;
    }

    /**
     * Gets the value of the cComments property.
     * 
     * @return
     *     possible object is
     *     {@link CComments }
     *     
     */
    public CComments getCComments() {
        return cComments;
    }

    /**
     * Sets the value of the cComments property.
     * 
     * @param value
     *     allowed object is
     *     {@link CComments }
     *     
     */
    public void setCComments(CComments value) {
        this.cComments = value;
    }

    /**
     * Gets the value of the cActions property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCActions() {
        return cActions;
    }

    /**
     * Sets the value of the cActions property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCActions(String value) {
        this.cActions = value;
    }

    /**
     * Gets the value of the cByWhom property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCByWhom() {
        return cByWhom;
    }

    /**
     * Sets the value of the cByWhom property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCByWhom(String value) {
        this.cByWhom = value;
    }

    /**
     * Gets the value of the cReviewDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCReviewDate() {
        return cReviewDate;
    }

    /**
     * Sets the value of the cReviewDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCReviewDate(String value) {
        this.cReviewDate = value;
    }

}
