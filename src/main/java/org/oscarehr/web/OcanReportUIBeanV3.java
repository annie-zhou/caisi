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

package org.oscarehr.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.ws.BindingProvider;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.ws.security.WSPasswordCallback;
import org.apache.xmlbeans.XmlOptions;
import org.oscarehr.PMmodule.dao.AdmissionDao;
import org.oscarehr.PMmodule.dao.OcanSubmissionLogDao;
import org.oscarehr.PMmodule.model.Admission;
import org.oscarehr.PMmodule.model.OcanSubmissionLog;
import org.oscarehr.PMmodule.web.OcanForm;
import org.oscarehr.common.dao.FacilityDao;
import org.oscarehr.common.dao.OcanClientFormDao;
import org.oscarehr.common.dao.OcanClientFormDataDao;
import org.oscarehr.common.dao.OcanConnexOptionDao;
import org.oscarehr.common.dao.OcanStaffFormDao;
import org.oscarehr.common.dao.OcanStaffFormDataDao;
import org.oscarehr.common.model.Facility;
import org.oscarehr.common.model.OcanClientForm;
import org.oscarehr.common.model.OcanClientFormData;
import org.oscarehr.common.model.OcanStaffForm;
import org.oscarehr.common.model.OcanStaffFormData;
import org.oscarehr.util.CxfClientUtils;
import org.oscarehr.util.LoggedInInfo;
import org.oscarehr.util.MiscUtils;
import org.oscarehr.util.SpringUtils;

import ca.ehealthontario.ccim.ActionDocument;
import ca.ehealthontario.ccim.ActionDocument.Action;
import ca.ehealthontario.ccim.ActionListDocument.ActionList;
import ca.ehealthontario.ccim.AddictionTypeDocument.AddictionType;
import ca.ehealthontario.ccim.AddictionTypeListDocument.AddictionTypeList;
import ca.ehealthontario.ccim.AgeHospitalizationDocument.AgeHospitalization;
import ca.ehealthontario.ccim.AgeOnsetMentalDocument.AgeOnsetMental;
import ca.ehealthontario.ccim.ApplyToDocument;
import ca.ehealthontario.ccim.ApplyToDocument.ApplyTo;
import ca.ehealthontario.ccim.ApplyToDocument.ApplyTo.Assessment.AssessmentType;
import ca.ehealthontario.ccim.AreasOfConcernDocument.AreasOfConcern;
import ca.ehealthontario.ccim.BarriersFindingWorkDocument.BarriersFindingWork;
import ca.ehealthontario.ccim.BarriersFindingWorkListDocument.BarriersFindingWorkList;
import ca.ehealthontario.ccim.CdConsentActionType;
import ca.ehealthontario.ccim.CdConsentDirectiveType;
import ca.ehealthontario.ccim.ClientAddressDocument2.ClientAddress;
import ca.ehealthontario.ccim.ClientCapacityDocument.ClientCapacity;
import ca.ehealthontario.ccim.ClientContactDocument.ClientContact;
import ca.ehealthontario.ccim.ClientCultureDocument;
import ca.ehealthontario.ccim.ClientCultureHeritageImportanceDocument.ClientCultureHeritageImportance;
import ca.ehealthontario.ccim.ClientDOBDocument.ClientDOB;
import ca.ehealthontario.ccim.ClientHealthCardInfoDocument.ClientHealthCardInfo;
import ca.ehealthontario.ccim.ClientHopesForFutureDocument.ClientHopesForFuture;
import ca.ehealthontario.ccim.ClientIDDocument.ClientID;
import ca.ehealthontario.ccim.ClientNameDocument2.ClientName;
import ca.ehealthontario.ccim.ClientNeedToGetThereDocument.ClientNeedToGetThere;
import ca.ehealthontario.ccim.ClientPhoneDocument.ClientPhone;
import ca.ehealthontario.ccim.ClientSpiritualityImportanceDocument.ClientSpiritualityImportance;
import ca.ehealthontario.ccim.ClientStrengthsDocument.ClientStrengths;
import ca.ehealthontario.ccim.CommunityTreatOrderDocument.CommunityTreatOrder;
import ca.ehealthontario.ccim.CompletedByOCANLeadDocument.CompletedByOCANLead;
import ca.ehealthontario.ccim.ConsentDirectiveDocument.ConsentDirective;
import ca.ehealthontario.ccim.ConsentSubmissionDocument.ConsentSubmission;
import ca.ehealthontario.ccim.ConsumerSelfAxCompletedDocument.ConsumerSelfAxCompleted;
import ca.ehealthontario.ccim.ContactInfoDocument.ContactInfo;
import ca.ehealthontario.ccim.CoreClientRecordType;
import ca.ehealthontario.ccim.CoreDomainType;
import ca.ehealthontario.ccim.CoreadditionalElementsType;
import ca.ehealthontario.ccim.DiagnosticListDocument.DiagnosticList;
import ca.ehealthontario.ccim.DiscrimExpListDocument.DiscrimExpList;
import ca.ehealthontario.ccim.DoctorContactDocument.DoctorContact;
import ca.ehealthontario.ccim.DomainActionsDocument.DomainActions;
import ca.ehealthontario.ccim.DomainCommentsFull;
import ca.ehealthontario.ccim.DomainCommentsSelf;
import ca.ehealthontario.ccim.DrinkAlcoholDocument.DrinkAlcohol;
import ca.ehealthontario.ccim.DrugUseDocument.DrugUse;
import ca.ehealthontario.ccim.DrugUseListDocument.DrugUseList;
import ca.ehealthontario.ccim.EducationProgramStatusDocument.EducationProgramStatus;
import ca.ehealthontario.ccim.FirstEntryDateDocument.FirstEntryDate;
import ca.ehealthontario.ccim.FormalHelpNeedDocument.FormalHelpNeed;
import ca.ehealthontario.ccim.FormalHelpRecvdDocument.FormalHelpRecvd;
import ca.ehealthontario.ccim.FullClientRecordType;
import ca.ehealthontario.ccim.FullDomainItemType;
import ca.ehealthontario.ccim.FulladditionalElementsType;
import ca.ehealthontario.ccim.HospitalizedPastTwoYearsDocument.HospitalizedPastTwoYears;
import ca.ehealthontario.ccim.ImmigExpListDocument.ImmigExpList;
import ca.ehealthontario.ccim.InformalHelpRecvdDocument.InformalHelpRecvd;
import ca.ehealthontario.ccim.LegalGuardianDocument.LegalGuardian;
import ca.ehealthontario.ccim.LegalIssuesListDocument.LegalIssuesList;
import ca.ehealthontario.ccim.LegalStatusListDocument.LegalStatusList;
import ca.ehealthontario.ccim.LivingArrangementListDocument.LivingArrangementList;
import ca.ehealthontario.ccim.LivingArrangementTypeDocument.LivingArrangementType;
import ca.ehealthontario.ccim.MISFunctionDocument.MISFunction;
import ca.ehealthontario.ccim.MedicalConditionDocument.MedicalCondition;
import ca.ehealthontario.ccim.MedicalConditionListDocument.MedicalConditionList;
import ca.ehealthontario.ccim.MedicationDetailDocument.MedicationDetail;
import ca.ehealthontario.ccim.MedicationListDocument.MedicationList;
import ca.ehealthontario.ccim.NeedRatingFull;
import ca.ehealthontario.ccim.NeedRatingSelf;
import ca.ehealthontario.ccim.OCANCoreSubmissionRecordDocument.OCANCoreSubmissionRecord;
import ca.ehealthontario.ccim.OCANFullSubmissionRecordDocument.OCANFullSubmissionRecord;
import ca.ehealthontario.ccim.OCANFullSubmissionRecordDocument.OCANFullSubmissionRecord.OCANDomains;
import ca.ehealthontario.ccim.OCANSelfSubmissionRecordDocument.OCANSelfSubmissionRecord;
import ca.ehealthontario.ccim.OCANSubmissionFileDocument;
import ca.ehealthontario.ccim.OCANSubmissionFileDocument.OCANSubmissionFile;
import ca.ehealthontario.ccim.OCANSubmissionRecordType;
import ca.ehealthontario.ccim.OtherAgencyContactDocument.OtherAgencyContact;
import ca.ehealthontario.ccim.OtherIllnessDocument.OtherIllness;
import ca.ehealthontario.ccim.OtherIllnessListDocument.OtherIllnessList;
import ca.ehealthontario.ccim.OtherPractitionerContactDocument.OtherPractitionerContact;
import ca.ehealthontario.ccim.PersonIdentificationDocument;
import ca.ehealthontario.ccim.PersonIdentificationDocument.PersonIdentification;
import ca.ehealthontario.ccim.PersonIdentificationDocument.PersonIdentification.SourceSystem;
import ca.ehealthontario.ccim.PowerAttorneyPersonalCareDocument.PowerAttorneyPersonalCare;
import ca.ehealthontario.ccim.PowerAttorneyPropertyDocument.PowerAttorneyProperty;
import ca.ehealthontario.ccim.PresentingIssueDocument.PresentingIssue;
import ca.ehealthontario.ccim.PresentingIssueListDocument.PresentingIssueList;
import ca.ehealthontario.ccim.ProgramDocument.Program;
import ca.ehealthontario.ccim.ProvinceListType;
import ca.ehealthontario.ccim.PsychiatristContactDocument.PsychiatristContact;
import ca.ehealthontario.ccim.ReasonConsumerSelfAxNotCompletedListDocument.ReasonConsumerSelfAxNotCompletedList;
import ca.ehealthontario.ccim.ReasonForOCANDocument.ReasonForOCAN;
import ca.ehealthontario.ccim.RecordedByInfoDocument.RecordedByInfo;
import ca.ehealthontario.ccim.ReferralDocument.Referral;
import ca.ehealthontario.ccim.ReferralListDocument.ReferralList;
import ca.ehealthontario.ccim.ResidenceTypeDocument.ResidenceType;
import ca.ehealthontario.ccim.SafetyToSelfRiskDocument.SafetyToSelfRisk;
import ca.ehealthontario.ccim.SafetyToSelfRiskListDocument.SafetyToSelfRiskList;
import ca.ehealthontario.ccim.SelfClientRecordType;
import ca.ehealthontario.ccim.SelfDomainItemType;
import ca.ehealthontario.ccim.SelfadditionalElementsType;
import ca.ehealthontario.ccim.ServiceOrgDocument.ServiceOrg;
import ca.ehealthontario.ccim.ServiceUseRecord;
import ca.ehealthontario.ccim.ServiceUseRecordListDocument.ServiceUseRecordList;
import ca.ehealthontario.ccim.SourceOfIncomeDocument.SourceOfIncome;
import ca.ehealthontario.ccim.StaffWorkerDocument.StaffWorker;
import ca.ehealthontario.ccim.SubmitOrgDocument.SubmitOrg;
import ca.ehealthontario.ccim.SubmitOrganizationRecordDocument;
import ca.ehealthontario.ccim.SubmitOrganizationRecordDocument.SubmitOrganizationRecord;
import ca.ehealthontario.ccim.SymptomDocument.Symptom;
import ca.ehealthontario.ccim.SymptomListDocument.SymptomList;
import ca.ehealthontario.ccim.TimeLivedInCanadaDocument.TimeLivedInCanada;
import ca.on.iar.definition.SubmissionPortType;
import ca.on.iar.definition.SubmissionService;
import ca.on.iar.types.IARSubmission;
import ca.on.iar.types.SubmissionContent;
import ca.on.iar.types.SubmissionContent.Record;
import ca.on.iar.types.SubmissionResultType;
import ca.on.iar.types.SubmissionResultType.Result;
import ca.on.iar.types.SubmissionType.Text;
import ca.on.iar.types.TransmissionHeaderType;
import ca.on.iar.types.TransmissionHeaderType.Application;
import ca.on.iar.types.TransmissionHeaderType.Organization;
import oscar.OscarProperties;

public class OcanReportUIBeanV3 implements CallbackHandler {

	private static final Logger logger = MiscUtils.getLogger();

	private static OcanStaffFormDao ocanStaffFormDao = (OcanStaffFormDao) SpringUtils.getBean("ocanStaffFormDao");
	private static OcanStaffFormDataDao ocanStaffFormDataDao = (OcanStaffFormDataDao) SpringUtils.getBean("ocanStaffFormDataDao");
	private static OcanClientFormDao ocanClientFormDao = (OcanClientFormDao) SpringUtils.getBean("ocanClientFormDao");
	private static OcanClientFormDataDao ocanClientFormDataDao = (OcanClientFormDataDao) SpringUtils.getBean("ocanClientFormDataDao");
	private static FacilityDao facilityDao = (FacilityDao)SpringUtils.getBean("facilityDao");
	private static AdmissionDao admissionDao = (AdmissionDao)SpringUtils.getBean("admissionDao");

	private static OcanConnexOptionDao ocanConnexOptionDao = (OcanConnexOptionDao) SpringUtils.getBean("ocanConnexOptionDao");

	private static OcanSubmissionLogDao logDao = (OcanSubmissionLogDao)SpringUtils.getBean("ocanSubmissionLogDao");
	
	public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
        WSPasswordCallback pc = (WSPasswordCallback) callbacks[0];
        // set the password for our message - need a better way to do this.
        String value = OscarProperties.getInstance().getProperty("ocan.iar.password");
        pc.setPassword(value);
    }
	
	public static String convertToOcanXmlDateTime(Date date) {
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss");

		return formatter1.format(date) + "T" + formatter2.format(date) + "Z";
	}
	public static Calendar convertToOcanXmlCalendar(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		return calendar;
	}

	public static String convertToOcanXmlDate(Date date) {
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

		return formatter1.format(date) + "Z";
	}
	
	public static XMLGregorianCalendar convertToXmlDate(Date date) throws Exception {
		XMLGregorianCalendar xmlGregorianCalendar = null;
		
		if(date!=null) {
			GregorianCalendar gregorianCalendar = new GregorianCalendar();
			gregorianCalendar.setTime(date);
			xmlGregorianCalendar = DatatypeFactory.newInstance().newXMLGregorianCalendar(gregorianCalendar);
		}
		
		return xmlGregorianCalendar;
	}
	
	private static boolean isEmpty(Object[] arr)
	{
		return isEmpty(Arrays.asList(arr));
	}
	
	private static boolean isEmpty(List<?> list)
	{
		boolean flg = false;
		
		if(list==null || list.size()==0)
			flg = false;
		else 
			flg = true;
		
		return flg;
	}
	
	private static boolean isEmpty(String str)
	{
		boolean flg = false;

		if(str==null || str.trim().length()==0)
			flg = true;
		
		return flg;
	}
	
	private static int getLength(Object[] arr)
	{
		int size = 0;
		
		if(!isEmpty(arr))
			size = arr.length;
		
		return size;
	}
	
	private static int getSize(List<?> list)
	{
		int size = 0;
		
		if(!isEmpty(list))
			size = list.size();
		
		return size;
	}
	
	public static OCANSubmissionFileDocument generateOCANSubmission(String ocanType) {
		int increment = 1;
		LoggedInInfo loggedInInfo = LoggedInInfo.loggedInInfo.get();

		List<OcanStaffForm> ocanStaffForms = ocanStaffFormDao.findUnsubmittedOcanFormsByOcanType(loggedInInfo.currentFacility.getId(), ocanType);
		logger.info("# of staff forms found for submission = " + ocanStaffForms.size());

		OCANSubmissionFileDocument submissionFileDoc = OCANSubmissionFileDocument.Factory.newInstance();
		OCANSubmissionFile submissionFile = OCANSubmissionFile.Factory.newInstance();
		submissionFile.setToolRevision(OCANSubmissionFile.ToolRevision.X_3_0);
		submissionFile.setSchemaVersion(OCANSubmissionFile.SchemaVersion.X_3_0);
		submissionFile.setID("File-" + ( (increment<10)?("0"+increment):(increment) ));

		submissionFile.setTimestamp(convertToOcanXmlCalendar(new Date()));

		List<OCANCoreSubmissionRecord> submissionRecordList_core = new ArrayList<OCANCoreSubmissionRecord>();
		List<OCANFullSubmissionRecord> submissionRecordList_full = new ArrayList<OCANFullSubmissionRecord>();
		List<OCANSelfSubmissionRecord> submissionRecordList_self = new ArrayList<OCANSelfSubmissionRecord>();
		
		for(OcanStaffForm staffForm:ocanStaffForms) {
			//If ReasonForAssessment is Review or Re-key, this ocan should not be included in xml file.
			String answer = staffForm.getReasonForAssessment();
			if(answer.equals("REV") || answer.equals("REK")) {
				continue;
			}

			OcanClientForm clientForm = null;
			List<OcanClientFormData> clientFormData = null;

			if(!isEmpty(ocanType)){
				if(ocanType.equalsIgnoreCase("CORE")) {
					OCANCoreSubmissionRecord submissionRecord = convertOcanForm_core(staffForm,ocanStaffFormDataDao.findByForm(staffForm.getId()),clientForm,clientFormData, ocanType);
					submissionRecordList_core.add(submissionRecord);					
				}else if(ocanType.equalsIgnoreCase("FULL")) {
					OCANFullSubmissionRecord submissionRecord = convertOcanForm_full(staffForm,ocanStaffFormDataDao.findByForm(staffForm.getId()),clientForm,clientFormData, ocanType);
					submissionRecordList_full.add(submissionRecord);					
				}else if(ocanType.equalsIgnoreCase("SELF")) {
					OCANSelfSubmissionRecord submissionRecord = convertOcanForm_self(staffForm,ocanStaffFormDataDao.findByForm(staffForm.getId()),clientForm,clientFormData, ocanType);
					submissionRecordList_self.add(submissionRecord);					
				}
			}
		}
		submissionFile.setOCANCoreSubmissionRecordArray(submissionRecordList_core.toArray(new OCANCoreSubmissionRecord[submissionRecordList_core.size()]));
		submissionFile.setOCANFullSubmissionRecordArray(submissionRecordList_full.toArray(new OCANFullSubmissionRecord[submissionRecordList_full.size()]));
		submissionFile.setOCANSelfSubmissionRecordArray(submissionRecordList_self.toArray(new OCANSelfSubmissionRecord[submissionRecordList_self.size()]));
		
		submissionFileDoc.setOCANSubmissionFile(submissionFile);

		return submissionFileDoc;
	}

	public static int sendSubmissionToIAR(OCANSubmissionFileDocument submissionDoc, String ocanType) {
		return prepareSubmissionToIAR(submissionDoc, true, null, ocanType) ;
	}
	
	public static int sendSubmissionToIAR(OCANSubmissionFileDocument submissionDoc) {
		return prepareSubmissionToIAR(submissionDoc, true, null) ;
	}
	
	public static int prepareSubmissionToIAR(OCANSubmissionFileDocument submissionDoc, boolean autoSubmit, OutputStream out ) {
		return prepareSubmissionToIAR(submissionDoc, autoSubmit, out, null);
	}
	
	public static int prepareSubmissionToIAR(OCANSubmissionFileDocument submissionDoc, boolean autoSubmit, OutputStream out, String ocanType ) {
		if(isEmpty(submissionDoc.getOCANSubmissionFile().getOCANCoreSubmissionRecordArray()) && isEmpty(submissionDoc.getOCANSubmissionFile().getOCANFullSubmissionRecordArray())
				&& isEmpty(submissionDoc.getOCANSubmissionFile().getOCANSelfSubmissionRecordArray())) {
			logger.info("No records to send");
			return 0;
		}
		if( (getLength(submissionDoc.getOCANSubmissionFile().getOCANCoreSubmissionRecordArray()) > 500)  || (getLength(submissionDoc.getOCANSubmissionFile().getOCANFullSubmissionRecordArray()) > 500)
				|| (getLength(submissionDoc.getOCANSubmissionFile().getOCANSelfSubmissionRecordArray()) > 500)) {
			logger.warn("over 500 to send..will probably fail");
		}

		//serialize the data
		ByteArrayOutputStream sos = new ByteArrayOutputStream();
		try {
			XmlOptions options = new XmlOptions();
			options.setUseDefaultNamespace();
			options.setSavePrettyPrint();
			options.setCharacterEncoding("UTF-8");
			Map<String,String> implicitNamespaces = new HashMap<String,String>();
			implicitNamespaces.put("", "http://oscarehr.org/ocan");
			options.setSaveImplicitNamespaces(implicitNamespaces);
			submissionDoc.save(sos,options);
			
			//OcanReportUIBean.writeFile(sos.toString(), "ocan_submissionDoc", "3.0", ocanType);
		}catch(IOException e) {
			logger.error("Error:",e);
			return 0;
		}

		//generate the envelope
		IARSubmission is = new IARSubmission();
		is.setVersion("3.0");

		Application application = new Application();
		application.setId("1");
		application.setName("OSCAR");
		application.setVendor("CAISI");
		application.setVersion("10.06");

		Organization org = new Organization();
		//String orgId = OscarProperties.getInstance().getProperty("ocan.iar.org.id");
		String orgId = LoggedInInfo.loggedInInfo.get().currentFacility.getOcanServiceOrgNumber();
		org.setId(orgId);
		org.setName(LoggedInInfo.loggedInInfo.get().currentFacility.getName());

		XMLGregorianCalendar cal = null;

		try {
			GregorianCalendar gc = new GregorianCalendar();
			DatatypeFactory dtf = DatatypeFactory.newInstance();
			cal = dtf.newXMLGregorianCalendar(gc);
		}catch(Exception e) {
			logger.error("Error:",e);
		}

		TransmissionHeaderType th = new TransmissionHeaderType();
		th.setApplication(application);
		th.setAssessmentType(OcanStaffForm.FORM_TYPE_OCAN);
		th.setExportTimestamp(cal);
		th.setOrganization(org);
		th.setSubmissionId("1");

		is.setTransmissionHeader(th);

		Text t = new Text();
		t.setValue(sos.toString());

		Record r = new Record();
		r.setRecordType("Assessment");
		r.setMimeType("text/xml");
		r.setText(t);
		r.setVersion("2.0.6");

		Record consent = new Record();
		consent.setVersion("1.0");
		consent.setMimeType("text/xml");
		consent.setRecordType("Consent");
		ConsentSubmission cs = ConsentSubmission.Factory.newInstance();
		//cs.getDomNode().getAttributes().
		OCANCoreSubmissionRecord[] submissionRecords = submissionDoc.getOCANSubmissionFile().getOCANCoreSubmissionRecordArray();
		for(OCANCoreSubmissionRecord submissionRecord:submissionRecords) {

			String assessmentId = submissionRecord.getAssessmentID();

			String assessmentId_noPrefix = assessmentId;
			String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
			if(!StringUtils.isBlank(idPrefix)) {
				assessmentId_noPrefix = assessmentId.replace(idPrefix,"");
			}
			
			OcanStaffForm staffForm = ocanStaffFormDao.findLatestByAssessmentId(LoggedInInfo.loggedInInfo.get().currentFacility.getId(),Integer.parseInt(assessmentId_noPrefix));
			//addConsentDirective(ConsentSubmisison cs, String assessmentId, Application application, String orgId, OcanStaff)
			ConsentDirective cd = cs.addNewConsentDirective();
			cd.setId(assessmentId);
			cd.setType(CdConsentDirectiveType.ASSESSMENT);

			PersonIdentification pi = PersonIdentification.Factory.newInstance();
			SourceSystem ss = pi.addNewSourceSystem();
			ss.setId(application.getId());
			ss.setType(SourceSystem.Type.APPLICATION_ID);
			PersonIdentificationDocument.PersonIdentification.Organization o = pi.addNewOrganization();
			o.setId(orgId);
			o.setName(LoggedInInfo.loggedInInfo.get().currentFacility.getName());
			pi.setPersonId(submissionRecord.getClientRecord().getClientID().getOrgClientID());
			cd.setPersonIdentification(pi);

			ApplyTo at = ApplyTo.Factory.newInstance();
			ApplyToDocument.ApplyTo.Assessment a = at.addNewAssessment();
			a.setAssessmentId(assessmentId);
			a.setAssessmentType(AssessmentType.OCAN);
			at.setAssessment(a);
			cd.setApplyTo(at);

			CdConsentActionType actionType = CdConsentActionType.Factory.newInstance();
			String c = staffForm.getConsent();
			if(c.equals("GRANT")) {
				actionType.setAccessLevel(CdConsentActionType.AccessLevel.GRANT);
			}
			else if(c.equals("DENY")) {
				actionType.setAccessLevel(CdConsentActionType.AccessLevel.DENY);
			}
			else if(c.equals("NOT_SPECIFIED")) {
				actionType.setAccessLevel(CdConsentActionType.AccessLevel.UNSUPPORTED);
			} else {
				actionType.setAccessLevel(CdConsentActionType.AccessLevel.GRANT);
			}
			cd.setDirective(actionType);

			RecordedByInfo rbi = RecordedByInfo.Factory.newInstance();
			rbi.setNameOrUserID(staffForm.getProviderName());
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(staffForm.getCreated());
			rbi.setTimeRecorded(cal2);
			cd.setRecordedByInfo(rbi);

		}

		Text t2 = new Text();
		String cs1 = cs.toString().replace("<xml-fragment xmlns:ccim=\"http://www.ehealthontario.ca/CCIM\">", "");
		String cs2 = cs1.replace("</xml-fragment>", "");
	        String cs3 = cs2.replaceAll("ccim:","");
		t2.setValue("<ConsentSubmission xsi:schemaLocation=\"http://www.ehealthontario.ca/CCIMConsentSubmission-1.0.xsd\" xmlns=\"http://www.ehealthontario.ca/CCIM\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" + cs3 + "</ConsentSubmission>");
		consent.setText(t2);

		SubmissionContent sc = new SubmissionContent();
		sc.getRecord().add(r);
		sc.getRecord().add(consent);

		is.setSubmissionContent(sc);

		//create the log entry and get the submission id
		OcanSubmissionLog log = new OcanSubmissionLog();
		log.setSubmitDateTime(new Date());
		log.setSubmissionType(OcanStaffForm.FORM_TYPE_OCAN);
		logDao.persist(log);

		if(log.getId() == null) {
			logger.info("log has no id!");
			return 0;
		}

		is.getTransmissionHeader().setSubmissionId(String.valueOf(log.getId()));
		logger.info("the submissionId is " + log.getId());

		if(autoSubmit) {
		 try {
			String user = OscarProperties.getInstance().getProperty("ocan.iar.user");
			String url = OscarProperties.getInstance().getProperty("ocan.iar.url");
			if(url == null || url.length() == 0) {
				//validation environment
				url = "https://iarvt.ccim.on.ca/iarws-2.0/services/SubmissionService";
			}
			System.setProperty("https.protocols", "TLSv1.2");
			SubmissionService service = new SubmissionService();
			SubmissionPortType port =  service.getSubmissionPort();
			((BindingProvider)port).getRequestContext().put(
				    BindingProvider.ENDPOINT_ADDRESS_PROPERTY,url);
			CxfClientUtils.configureClientConnection(port);
			CxfClientUtils.configureWSSecurity(port,user,new OcanReportUIBean());
			CxfClientUtils.configureLogging(port);

			SubmissionResultType result=port.submitAssessment(is);
			Result res = result.getResult();
			logger.info("result message:"+result.getDetailMessage());
			logger.info("error code:"+result.getErrorCode());
			logger.info("result:"+res.isValue());
			logger.info("transactionId="+res.getTransactionId());

			log.setResult(String.valueOf(res.isValue()));
			log.setTransactionId(res.getTransactionId());
			log.setResultMessage(result.getDetailMessage());
		  } catch(Exception e) {
			logger.error("Error:",e);
			return 0;
		  }
		} else {
			try {
			    if (out!=null) {
					JAXBContext context = JAXBContext.newInstance(IARSubmission.class);
					Marshaller marshaller = context.createMarshaller();
					marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
					marshaller.setProperty("com.sun.xml.bind.namespacePrefixMapper", new NamespacePrefixmapperImpl());
					marshaller.marshal(is, out);
					log.setResult("true");
					log.setResultMessage("Manual Export");
					log.setTransactionId("");
				}
			}
			catch(Exception e) {
				logger.error("Error",e);
			}
		}
		logDao.merge(log);

		if(log.getResult()!=null && log.getResult().equals("true")) {
			for(int x=0;x<submissionDoc.getOCANSubmissionFile().getOCANCoreSubmissionRecordArray().length;x++) {
				OCANCoreSubmissionRecord subRec = submissionDoc.getOCANSubmissionFile().getOCANCoreSubmissionRecordArray()[x];
				String id = subRec.getAssessmentID();
				//OcanStaffForm staffForm = ocanStaffFormDao.find(Integer.parseInt(id));
				// assessment ID is not form ID.
				String assessmentId_noPrefix = id;
				String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
				if(!StringUtils.isBlank(idPrefix)) {
					assessmentId_noPrefix = id.replace(idPrefix,"");
				}
				
				OcanStaffForm staffForm = ocanStaffFormDao.findLatestByAssessmentId(LoggedInInfo.loggedInInfo.get().currentFacility.getId(), Integer.valueOf(assessmentId_noPrefix));

				staffForm.setSubmissionId(log.getId());
				ocanStaffFormDao.merge(staffForm);
			}
		}

		return log.getId();
	}
	
	public static OCANCoreSubmissionRecord convertOcanForm_core(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		OCANCoreSubmissionRecord ocanSubmissionRecord = OCANCoreSubmissionRecord.Factory.newInstance();

		ocanSubmissionRecord.setOCANType(OCANSubmissionRecordType.OCANType.Enum.forString(ocanStaffForm.getOcanType()));

		//ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		//If the IAR submission is being done by two organizations to CCIM under the organization ID of one of the organizations. 
		//They don't want clients to accidentally have the same ID from the two organizations. 
		//So they want to add the prefix "TWC" to the ID's of one of The Working Centre submission.
		//The prefix should be stored in the oscar property file so that in the future other organizations can change that property and do a similar thing if needed,
		String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
		if(StringUtils.isBlank(idPrefix)) {
			ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		}
		else {
			idPrefix = idPrefix.concat(String.valueOf(ocanStaffForm.getAssessmentId()));
			ocanSubmissionRecord.setAssessmentID(idPrefix);
		}
			
		ocanSubmissionRecord.setAssessmentRevision("1");

		ocanSubmissionRecord.setStartDate(convertToOcanXmlCalendar(OcanForm.getAssessmentStartDate(ocanStaffForm.getStartDate(),ocanStaffForm.getClientStartDate())));
		ocanSubmissionRecord.setCompletionDate(convertToOcanXmlCalendar(OcanForm.getAssessmentCompletionDate(ocanStaffForm.getCompletionDate(),ocanStaffForm.getClientCompletionDate())));

		ocanSubmissionRecord.setAssessmentStatus(OCANSubmissionRecordType.AssessmentStatus.COMPLETE);
		//ocanSubmissionRecord.setIARViewingConsent(OCANSubmissionRecordType.IARViewingConsent.Enum.forString("TRUE"));

		ocanSubmissionRecord.setSubmitOrganizationRecord(convertSubmitOrganizationRecord(ocanStaffForm,ocanStaffFormData));
		ocanSubmissionRecord.setClientRecord(convertClientRecord_core(ocanStaffForm,ocanStaffFormData,ocanType));
		ocanSubmissionRecord.setOCANDomains(convertOCANDomains(ocanStaffForm,ocanStaffFormData, ocanClientForm, ocanClientFormData, ocanType));
		ocanSubmissionRecord.setAdditionalElements(convertAdditionalElements(ocanStaffForm,ocanStaffFormData,ocanType));
		
		return ocanSubmissionRecord;
	}
	
	public static OCANFullSubmissionRecord convertOcanForm_full(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		OCANFullSubmissionRecord ocanSubmissionRecord = OCANFullSubmissionRecord.Factory.newInstance();

		ocanSubmissionRecord.setOCANType(OCANSubmissionRecordType.OCANType.Enum.forString(ocanStaffForm.getOcanType()));

		//ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		//If the IAR submission is being done by two organizations to CCIM under the organization ID of one of the organizations. 
		//They don't want clients to accidentally have the same ID from the two organizations. 
		//So they want to add the prefix "TWC" to the ID's of one of The Working Centre submission.
		//The prefix should be stored in the oscar property file so that in the future other organizations can change that property and do a similar thing if needed,
		String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
		if(StringUtils.isBlank(idPrefix)) {
			ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		}
		else {
			idPrefix = idPrefix.concat(String.valueOf(ocanStaffForm.getAssessmentId()));
			ocanSubmissionRecord.setAssessmentID(idPrefix);
		}
			
		ocanSubmissionRecord.setAssessmentRevision("1");

		ocanSubmissionRecord.setStartDate(convertToOcanXmlCalendar(OcanForm.getAssessmentStartDate(ocanStaffForm.getStartDate(),ocanStaffForm.getClientStartDate())));
		ocanSubmissionRecord.setCompletionDate(convertToOcanXmlCalendar(OcanForm.getAssessmentCompletionDate(ocanStaffForm.getCompletionDate(),ocanStaffForm.getClientCompletionDate())));

		ocanSubmissionRecord.setAssessmentStatus(OCANSubmissionRecordType.AssessmentStatus.COMPLETE);
		//ocanSubmissionRecord.setIARViewingConsent(OCANSubmissionRecordType.IARViewingConsent.Enum.forString("TRUE"));

		ocanSubmissionRecord.setSubmitOrganizationRecord(convertSubmitOrganizationRecord(ocanStaffForm,ocanStaffFormData));
		ocanSubmissionRecord.setClientRecord(convertClientRecord_full(ocanStaffForm,ocanStaffFormData,ocanType));
		ocanSubmissionRecord.setOCANDomains(convertOCANDomains_full(ocanStaffForm,ocanStaffFormData, ocanClientForm, ocanClientFormData, ocanType));
		ocanSubmissionRecord.setAdditionalElements(convertAdditionalElements_full(ocanStaffForm,ocanStaffFormData,ocanType));
		
		return ocanSubmissionRecord;
	}
	
	public static OCANSelfSubmissionRecord convertOcanForm_self(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		OCANSelfSubmissionRecord ocanSubmissionRecord = OCANSelfSubmissionRecord.Factory.newInstance();

		ocanSubmissionRecord.setOCANType(OCANSubmissionRecordType.OCANType.Enum.forString(ocanStaffForm.getOcanType()));

		//ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		//If the IAR submission is being done by two organizations to CCIM under the organization ID of one of the organizations. 
		//They don't want clients to accidentally have the same ID from the two organizations. 
		//So they want to add the prefix "TWC" to the ID's of one of The Working Centre submission.
		//The prefix should be stored in the oscar property file so that in the future other organizations can change that property and do a similar thing if needed,
		String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
		if(StringUtils.isBlank(idPrefix)) {
			ocanSubmissionRecord.setAssessmentID(String.valueOf(ocanStaffForm.getAssessmentId()));
		}
		else {
			idPrefix = idPrefix.concat(String.valueOf(ocanStaffForm.getAssessmentId()));
			ocanSubmissionRecord.setAssessmentID(idPrefix);
		}
			
		ocanSubmissionRecord.setAssessmentRevision("1");

		ocanSubmissionRecord.setStartDate(convertToOcanXmlCalendar(OcanForm.getAssessmentStartDate(ocanStaffForm.getStartDate(),ocanStaffForm.getClientStartDate())));
		ocanSubmissionRecord.setCompletionDate(convertToOcanXmlCalendar(OcanForm.getAssessmentCompletionDate(ocanStaffForm.getCompletionDate(),ocanStaffForm.getClientCompletionDate())));

		ocanSubmissionRecord.setAssessmentStatus(OCANSubmissionRecordType.AssessmentStatus.COMPLETE);
		//ocanSubmissionRecord.setIARViewingConsent(OCANSubmissionRecordType.IARViewingConsent.Enum.forString("TRUE"));

		ocanSubmissionRecord.setSubmitOrganizationRecord(convertSubmitOrganizationRecord(ocanStaffForm,ocanStaffFormData));
		ocanSubmissionRecord.setClientRecord(convertClientRecord_self(ocanStaffForm,ocanStaffFormData,ocanType));
		ocanSubmissionRecord.setOCANDomains(convertOCANDomains_self(ocanStaffForm,ocanStaffFormData, ocanClientForm, ocanClientFormData, ocanType));
		ocanSubmissionRecord.setAdditionalElements(convertAdditionalElements_self(ocanStaffForm,ocanStaffFormData,ocanType));
		
		return ocanSubmissionRecord;
	}
	
	public static SubmitOrganizationRecord convertSubmitOrganizationRecord(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		SubmitOrganizationRecord submitOrganizationRecord = SubmitOrganizationRecord.Factory.newInstance();
		submitOrganizationRecord.setSubmitOrg(convertSubmitOrg(ocanStaffForm));
		
		SubmitOrganizationRecordDocument submitOrganizationRecordDocument = SubmitOrganizationRecordDocument.Factory.newInstance();
		submitOrganizationRecordDocument.setSubmitOrganizationRecord(submitOrganizationRecord);
		
		return submitOrganizationRecord;
	}

	public static SubmitOrg convertSubmitOrg(OcanStaffForm ocanStaffForm) {
		Facility facility = facilityDao.find(ocanStaffForm.getFacilityId());
		SubmitOrg submitOrg = SubmitOrg.Factory.newInstance();
		submitOrg.setName(facility.getName());
		submitOrg.setNumber(facility.getOcanServiceOrgNumber());
		return submitOrg;
	}
	
	public static CoreClientRecordType convertClientRecord_core(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		CoreClientRecordType clientRecord = CoreClientRecordType.Factory.newInstance();
		clientRecord.setClientID(convertClientID(ocanStaffForm,ocanStaffFormData));

		//START OF PHI
		if(!"".equals(getStaffAnswer("completedByOCANLead",ocanStaffFormData))) {
			clientRecord.setCompletedByOCANLead(CompletedByOCANLead.Enum.forString(getStaffAnswer("completedByOCANLead",ocanStaffFormData)));
		}
		clientRecord.setClientName(convertClientName(ocanStaffForm,ocanStaffFormData));

		clientRecord.setClientAddress(convertClientAddress(ocanStaffForm,ocanStaffFormData));
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
				clientRecord.setClientEmailAddress(getStaffAnswer("email",ocanStaffFormData));
		}else{
			clientRecord.setClientEmailAddress("");
		}
		clientRecord.setClientPhone(convertClientPhone(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientHealthCardInfo(convertClientHealthCardInfo(ocanStaffForm,ocanStaffFormData));

		ClientCultureDocument.ClientCulture clientCulture = ClientCultureDocument.ClientCulture.Factory.newInstance();
		clientCulture.setValue(ClientCultureDocument.ClientCulture.Value.Enum.forString(getStaffAnswer("culture",ocanStaffFormData)));
		clientCulture.setOther(getStaffAnswer("cultureother",ocanStaffFormData));
		clientRecord.setClientCulture(clientCulture);

		clientRecord.setReasonForOCAN(convertReasonForOCAN(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientContact(convertClientContact(ocanStaffForm,ocanStaffFormData));
		clientRecord.setServiceRecipientLocation(ca.ehealthontario.ccim.ServiceLocationListType.Enum.forString(getStaffAnswer("service_recipient_location",ocanStaffFormData)));
		clientRecord.setServiceRecipientLHIN(ca.ehealthontario.ccim.LHINListType.Enum.forString(getStaffAnswer("service_recipient_lhin",ocanStaffFormData)));
		clientRecord.setClientDOB(convertClientDOB(ocanStaffForm, ocanStaffFormData));
		
		ca.ehealthontario.ccim.GenderDocument.Gender gender = ca.ehealthontario.ccim.GenderDocument.Gender.Factory.newInstance();
		gender.setValue(ca.ehealthontario.ccim.GenderDocument.Gender.Value.Enum.forString(ocanStaffForm.getGender()));
		clientRecord.setGender(gender);

		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(getStaffAnswer("marital_status",ocanStaffFormData)));
		}else{
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(""));
		}

		clientRecord.setServiceUseRecordList(convertServiceUseRecordList(ocanStaffFormData));
		clientRecord.setClientCapacity(convertClientCapacity(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeOnsetMental(convertAgeOnsetMental(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeHospitalization(convertAgeHospitalization(ocanStaffForm,ocanStaffFormData));
		clientRecord.setFirstEntryDate(convertFirstEntryDate(ocanStaffForm,ocanStaffFormData));
		//clientRecord.setAboriginalOrigin(AboriginalOrigin.Enum.forString(getStaffAnswer("aboriginal",ocanStaffFormData)));
		clientRecord.setCitizenshipStatus(ca.ehealthontario.ccim.CitizenshipStatusDocument.CitizenshipStatus.Enum.forString(getStaffAnswer("citizenship_status",ocanStaffFormData)));
		clientRecord.setTimeLivedInCanada(convertTimeLivedInCanada(ocanStaffForm,ocanStaffFormData));

		ca.ehealthontario.ccim.PrefLangDocument.PrefLang prefLang = ca.ehealthontario.ccim.PrefLangDocument.PrefLang.Factory.newInstance();
		prefLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("preferred_language",ocanStaffFormData)));
		clientRecord.setPrefLang(prefLang);
		
		ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang serviceLang = ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang.Factory.newInstance();
		serviceLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("language_service_provision",ocanStaffFormData)));
		clientRecord.setServiceLang(serviceLang);
			
		List<String> legalIssuesList = getMultipleStaffAnswer("legal_issues",ocanStaffFormData);
		if(!isEmpty(legalIssuesList)) {
			LegalIssuesList legalIssuesList2 = LegalIssuesList.Factory.newInstance();
			
			for (String legalIssue : legalIssuesList) {
				legalIssuesList2.addLegalIssue(ca.ehealthontario.ccim.LegalIssuesListDocument.LegalIssuesList.LegalIssue.Enum.forString(legalIssue));
			}
			
			clientRecord.setLegalIssuesList(legalIssuesList2);
		}
		clientRecord.setLegalIssuesComments(getStaffAnswer("legal_issues_other",ocanStaffFormData));
		
		List<String> legalStatusAnswers = getMultipleStaffAnswer("legal_status",ocanStaffFormData);
		if(!isEmpty(legalStatusAnswers)) {
			LegalStatusList legalStatusList = LegalStatusList.Factory.newInstance();
			
			for (String legalStatusAnswer : legalStatusAnswers) {
				legalStatusList.addLegalStatus(ca.ehealthontario.ccim.LegalStatusDocument.LegalStatus.Enum.forString(legalStatusAnswer));
			}
			
			clientRecord.setLegalStatusList(legalStatusList);
		}
		
		clientRecord.setGeneralComments(getStaffAnswer("commments",ocanStaffFormData));
		
		ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue motherTongue = ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue.Factory.newInstance();
		motherTongue.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("Language",ocanStaffFormData)));
		clientRecord.setMotherTongue(motherTongue);
		
		clientRecord.setPrefOfficialLang(ca.ehealthontario.ccim.PrefOfficialLangDocument.PrefOfficialLang.Enum.forString(getStaffAnswer("language_comfortable",ocanStaffFormData)));

		return clientRecord;
	}
	
	public static FullClientRecordType convertClientRecord_full(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		FullClientRecordType clientRecord = FullClientRecordType.Factory.newInstance();
		clientRecord.setClientID(convertClientID(ocanStaffForm,ocanStaffFormData));

		//START OF PHI
		if(!"".equals(getStaffAnswer("completedByOCANLead",ocanStaffFormData))) {
			clientRecord.setCompletedByOCANLead(CompletedByOCANLead.Enum.forString(getStaffAnswer("completedByOCANLead",ocanStaffFormData)));
		}
		clientRecord.setClientName(convertClientName(ocanStaffForm,ocanStaffFormData));

		clientRecord.setClientAddress(convertClientAddress(ocanStaffForm,ocanStaffFormData));
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
				clientRecord.setClientEmailAddress(getStaffAnswer("email",ocanStaffFormData));
		}else{
			clientRecord.setClientEmailAddress("");
		}
		clientRecord.setClientPhone(convertClientPhone(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientHealthCardInfo(convertClientHealthCardInfo(ocanStaffForm,ocanStaffFormData));

		ClientCultureDocument.ClientCulture clientCulture = ClientCultureDocument.ClientCulture.Factory.newInstance();
		clientCulture.setValue(ClientCultureDocument.ClientCulture.Value.Enum.forString(getStaffAnswer("culture",ocanStaffFormData)));
		clientCulture.setOther(getStaffAnswer("cultureother",ocanStaffFormData));
		clientRecord.setClientCulture(clientCulture);

		if("FULL".equals(ocanType)) {
				clientRecord.setConsumerSelfAxCompleted(ConsumerSelfAxCompleted.Enum.forString(getStaffAnswer("consumerSelfAxCompleted",ocanStaffFormData)));
				clientRecord.setReasonConsumerSelfAxNotCompletedList(convertReasonConsumerSelfAxNotCompletedList(ocanStaffFormData));
		}

		clientRecord.setReasonForOCAN(convertReasonForOCAN(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientContact(convertClientContact(ocanStaffForm,ocanStaffFormData));
		clientRecord.setServiceRecipientLocation(ca.ehealthontario.ccim.ServiceLocationListType.Enum.forString(getStaffAnswer("service_recipient_location",ocanStaffFormData)));
		clientRecord.setServiceRecipientLHIN(ca.ehealthontario.ccim.LHINListType.Enum.forString(getStaffAnswer("service_recipient_lhin",ocanStaffFormData)));
		clientRecord.setClientDOB(convertClientDOB(ocanStaffForm, ocanStaffFormData));
		
		ca.ehealthontario.ccim.GenderDocument.Gender gender = ca.ehealthontario.ccim.GenderDocument.Gender.Factory.newInstance();
		gender.setValue(ca.ehealthontario.ccim.GenderDocument.Gender.Value.Enum.forString(ocanStaffForm.getGender()));
		clientRecord.setGender(gender);

		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(getStaffAnswer("marital_status",ocanStaffFormData)));
		}else{
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(""));
		}

		clientRecord.setServiceUseRecordList(convertServiceUseRecordList(ocanStaffFormData));
		clientRecord.setClientCapacity(convertClientCapacity(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeOnsetMental(convertAgeOnsetMental(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeHospitalization(convertAgeHospitalization(ocanStaffForm,ocanStaffFormData));
		clientRecord.setFirstEntryDate(convertFirstEntryDate(ocanStaffForm,ocanStaffFormData));
		//clientRecord.setAboriginalOrigin(AboriginalOrigin.Enum.forString(getStaffAnswer("aboriginal",ocanStaffFormData)));
		clientRecord.setCitizenshipStatus(ca.ehealthontario.ccim.CitizenshipStatusDocument.CitizenshipStatus.Enum.forString(getStaffAnswer("citizenship_status",ocanStaffFormData)));
		clientRecord.setTimeLivedInCanada(convertTimeLivedInCanada(ocanStaffForm,ocanStaffFormData));

		if("FULL".equals(ocanType)) {
			List<String> immigrationExpAnswers = getMultipleStaffAnswer("immigration_issues",ocanStaffFormData);
			if(immigrationExpAnswers.size()>0) {
				ImmigExpList immigExpList = ImmigExpList.Factory.newInstance();
				List<ImmigExpList.Value.Enum> immigExpListEnum = new ArrayList<ImmigExpList.Value.Enum>();
				for(String answer:immigrationExpAnswers) {
	
					//immigExpList.addValue(ImmigExpList.Value.Enum.forString(answer));
					immigExpListEnum.add(ImmigExpList.Value.Enum.forString(answer));
				}
				immigExpList.setValueArray(immigExpListEnum.toArray(new ImmigExpList.Value.Enum[immigrationExpAnswers.size()] ));
				immigExpList.setOtherImmigExp(getStaffAnswer("immigration_issues_other",ocanStaffFormData));
				if(immigExpList!=null) {
					clientRecord.setImmigExpList(immigExpList);
				}
			}
			clientRecord.setImmigExpFreeText(getStaffAnswer("immigration_experience",ocanStaffFormData));
	
			List<String> discriminationExpAnswers = getMultipleStaffAnswer("discrimination",ocanStaffFormData);
			if(discriminationExpAnswers.size()>0) {
				DiscrimExpList discrimExpList = null;
				for(String answer:discriminationExpAnswers) {
					if(discrimExpList==null) {
						discrimExpList = DiscrimExpList.Factory.newInstance();
					}
					discrimExpList.addValue(DiscrimExpList.Value.Enum.forString(answer));
				}
	
				discrimExpList.setOtherDiscrimExp(getStaffAnswer("discrimination_other",ocanStaffFormData));
				if(discrimExpList!=null) {
					clientRecord.setDiscrimExpList(discrimExpList);
				}
			}
		}

		ca.ehealthontario.ccim.PrefLangDocument.PrefLang prefLang = ca.ehealthontario.ccim.PrefLangDocument.PrefLang.Factory.newInstance();
		prefLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("preferred_language",ocanStaffFormData)));
		clientRecord.setPrefLang(prefLang);
		
		ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang serviceLang = ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang.Factory.newInstance();
		serviceLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("language_service_provision",ocanStaffFormData)));
		clientRecord.setServiceLang(serviceLang);
			
		List<String> legalIssuesList = getMultipleStaffAnswer("legal_issues",ocanStaffFormData);
		if(!isEmpty(legalIssuesList)) {
			LegalIssuesList legalIssuesList2 = LegalIssuesList.Factory.newInstance();
			
			for (String legalIssue : legalIssuesList) {
				legalIssuesList2.addLegalIssue(ca.ehealthontario.ccim.LegalIssuesListDocument.LegalIssuesList.LegalIssue.Enum.forString(legalIssue));
			}
			
			clientRecord.setLegalIssuesList(legalIssuesList2);
		}
		clientRecord.setLegalIssuesComments(getStaffAnswer("legal_issues_other",ocanStaffFormData));
		
		List<String> legalStatusAnswers = getMultipleStaffAnswer("legal_status",ocanStaffFormData);
		if(!isEmpty(legalStatusAnswers)) {
			LegalStatusList legalStatusList = LegalStatusList.Factory.newInstance();
			
			for (String legalStatusAnswer : legalStatusAnswers) {
				legalStatusList.addLegalStatus(ca.ehealthontario.ccim.LegalStatusDocument.LegalStatus.Enum.forString(legalStatusAnswer));
			}
			
			clientRecord.setLegalStatusList(legalStatusList);
		}
		
		clientRecord.setGeneralComments(getStaffAnswer("commments",ocanStaffFormData));
		
		ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue motherTongue = ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue.Factory.newInstance();
		motherTongue.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("Language",ocanStaffFormData)));
		clientRecord.setMotherTongue(motherTongue);
		
		clientRecord.setPrefOfficialLang(ca.ehealthontario.ccim.PrefOfficialLangDocument.PrefOfficialLang.Enum.forString(getStaffAnswer("language_comfortable",ocanStaffFormData)));

		return clientRecord;
	}
	
	public static SelfClientRecordType convertClientRecord_self(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		SelfClientRecordType clientRecord = SelfClientRecordType.Factory.newInstance();
		clientRecord.setClientID(convertClientID(ocanStaffForm,ocanStaffFormData));

		//START OF PHI
		if(!"".equals(getStaffAnswer("completedByOCANLead",ocanStaffFormData))) {
			clientRecord.setCompletedByOCANLead(CompletedByOCANLead.Enum.forString(getStaffAnswer("completedByOCANLead",ocanStaffFormData)));
		}
		clientRecord.setClientName(convertClientName(ocanStaffForm,ocanStaffFormData));

		clientRecord.setClientAddress(convertClientAddress(ocanStaffForm,ocanStaffFormData));
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
				clientRecord.setClientEmailAddress(getStaffAnswer("email",ocanStaffFormData));
		}else{
			clientRecord.setClientEmailAddress("");
		}
		clientRecord.setClientPhone(convertClientPhone(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientHealthCardInfo(convertClientHealthCardInfo(ocanStaffForm,ocanStaffFormData));

		ClientCultureDocument.ClientCulture clientCulture = ClientCultureDocument.ClientCulture.Factory.newInstance();
		clientCulture.setValue(ClientCultureDocument.ClientCulture.Value.Enum.forString(getStaffAnswer("culture",ocanStaffFormData)));
		clientCulture.setOther(getStaffAnswer("cultureother",ocanStaffFormData));
		clientRecord.setClientCulture(clientCulture);

		if("FULL".equals(ocanType)) {
				//clientRecord.setConsumerSelfAxCompleted(ConsumerSelfAxCompleted.Enum.forString(getStaffAnswer("consumerSelfAxCompleted",ocanStaffFormData)));
				//clientRecord.setReasonConsumerSelfAxNotCompletedList(convertReasonConsumerSelfAxNotCompletedList(ocanStaffFormData));
		}

		clientRecord.setReasonForOCAN(convertReasonForOCAN(ocanStaffForm,ocanStaffFormData));
		clientRecord.setClientContact(convertClientContact(ocanStaffForm,ocanStaffFormData));
		clientRecord.setServiceRecipientLocation(ca.ehealthontario.ccim.ServiceLocationListType.Enum.forString(getStaffAnswer("service_recipient_location",ocanStaffFormData)));
		clientRecord.setServiceRecipientLHIN(ca.ehealthontario.ccim.LHINListType.Enum.forString(getStaffAnswer("service_recipient_lhin",ocanStaffFormData)));
		clientRecord.setClientDOB(convertClientDOB(ocanStaffForm, ocanStaffFormData));
		
		ca.ehealthontario.ccim.GenderDocument.Gender gender = ca.ehealthontario.ccim.GenderDocument.Gender.Factory.newInstance();
		gender.setValue(ca.ehealthontario.ccim.GenderDocument.Gender.Value.Enum.forString(ocanStaffForm.getGender()));
		clientRecord.setGender(gender);

		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(getStaffAnswer("marital_status",ocanStaffFormData)));
		}else{
			clientRecord.setMaritalStatus(ca.ehealthontario.ccim.MaritalStatusDocument.MaritalStatus.Enum.forString(""));
		}

		clientRecord.setServiceUseRecordList(convertServiceUseRecordList(ocanStaffFormData));
		clientRecord.setClientCapacity(convertClientCapacity(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeOnsetMental(convertAgeOnsetMental(ocanStaffForm,ocanStaffFormData));
		clientRecord.setAgeHospitalization(convertAgeHospitalization(ocanStaffForm,ocanStaffFormData));
		clientRecord.setFirstEntryDate(convertFirstEntryDate(ocanStaffForm,ocanStaffFormData));
		//clientRecord.setAboriginalOrigin(AboriginalOrigin.Enum.forString(getStaffAnswer("aboriginal",ocanStaffFormData)));
		clientRecord.setCitizenshipStatus(ca.ehealthontario.ccim.CitizenshipStatusDocument.CitizenshipStatus.Enum.forString(getStaffAnswer("citizenship_status",ocanStaffFormData)));
		clientRecord.setTimeLivedInCanada(convertTimeLivedInCanada(ocanStaffForm,ocanStaffFormData));

		ca.ehealthontario.ccim.PrefLangDocument.PrefLang prefLang = ca.ehealthontario.ccim.PrefLangDocument.PrefLang.Factory.newInstance();
		prefLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("preferred_language",ocanStaffFormData)));
		clientRecord.setPrefLang(prefLang);
		
		ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang serviceLang = ca.ehealthontario.ccim.ServiceLangDocument.ServiceLang.Factory.newInstance();
		serviceLang.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("language_service_provision",ocanStaffFormData)));
		clientRecord.setServiceLang(serviceLang);
			
		List<String> legalIssuesList = getMultipleStaffAnswer("legal_issues",ocanStaffFormData);
		if(!isEmpty(legalIssuesList)) {
			LegalIssuesList legalIssuesList2 = LegalIssuesList.Factory.newInstance();
			
			for (String legalIssue : legalIssuesList) {
				legalIssuesList2.addLegalIssue(ca.ehealthontario.ccim.LegalIssuesListDocument.LegalIssuesList.LegalIssue.Enum.forString(legalIssue));
			}
			
			clientRecord.setLegalIssuesList(legalIssuesList2);
		}
		clientRecord.setLegalIssuesComments(getStaffAnswer("legal_issues_other",ocanStaffFormData));
		
		List<String> legalStatusAnswers = getMultipleStaffAnswer("legal_status",ocanStaffFormData);
		if(!isEmpty(legalStatusAnswers)) {
			LegalStatusList legalStatusList = LegalStatusList.Factory.newInstance();
			
			for (String legalStatusAnswer : legalStatusAnswers) {
				legalStatusList.addLegalStatus(ca.ehealthontario.ccim.LegalStatusDocument.LegalStatus.Enum.forString(legalStatusAnswer));
			}
			
			clientRecord.setLegalStatusList(legalStatusList);
		}
		
		clientRecord.setGeneralComments(getStaffAnswer("commments",ocanStaffFormData));
		
		ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue motherTongue = ca.ehealthontario.ccim.MotherTongueDocument.MotherTongue.Factory.newInstance();
		motherTongue.setValue(ca.ehealthontario.ccim.OCANLanguageListType.Enum.forString(getStaffAnswer("Language",ocanStaffFormData)));
		clientRecord.setMotherTongue(motherTongue);
		
		clientRecord.setPrefOfficialLang(ca.ehealthontario.ccim.PrefOfficialLangDocument.PrefOfficialLang.Enum.forString(getStaffAnswer("language_comfortable",ocanStaffFormData)));

		return clientRecord;
	}
	
	public static ReasonConsumerSelfAxNotCompletedList convertReasonConsumerSelfAxNotCompletedList(List<OcanStaffFormData> ocanStaffFormData) {
		ReasonConsumerSelfAxNotCompletedList self = ReasonConsumerSelfAxNotCompletedList.Factory.newInstance();
		self.setOtherReason(getStaffAnswer("otherReason",ocanStaffFormData));

		List<ReasonConsumerSelfAxNotCompletedList.Value.Enum> reasonList = new ArrayList<ReasonConsumerSelfAxNotCompletedList.Value.Enum>();

		List<String> answers = getMultipleStaffAnswer("reasonConsumerSelfAxNotCompletedList",ocanStaffFormData);

		for(String answer:answers) {
			reasonList.add(ReasonConsumerSelfAxNotCompletedList.Value.Enum.forString(answer));
		}
		if(answers!=null) {
			self.setValueArray(reasonList.toArray(new ReasonConsumerSelfAxNotCompletedList.Value.Enum[answers.size()]));
		}
		self.setOtherReason(getStaffAnswer("otherReason",ocanStaffFormData));
		return self;
	}
	
	public static ClientID convertClientID(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientID clientId = ClientID.Factory.newInstance();
		String idPrefix = OscarProperties.getInstance().getProperty("ocan.iar.idPrefix");
		if(StringUtils.isBlank(idPrefix)) {
			clientId.setOrgClientID(String.valueOf(ocanStaffForm.getClientId()));
		}
		else {
			idPrefix = idPrefix.concat(String.valueOf(ocanStaffForm.getClientId()));
			clientId.setOrgClientID(idPrefix);
		}
		return clientId;
	}

	static String getStaffAnswer(String question,List<OcanStaffFormData> ocanStaffFormData) {
		for(OcanStaffFormData item:ocanStaffFormData) {
			//logger.info("looking for " +  question + " - " + item.getQuestion());
			if(item.getQuestion().equals(question)) {
				return item.getAnswer();
			}
		}
		return "";
	}
	
	static List<String> getMultipleStaffAnswer(String question,List<OcanStaffFormData> ocanStaffFormData) {
		List<String> answers = new ArrayList<String>();
		for(OcanStaffFormData item:ocanStaffFormData) {
			//logger.info("looking for " +  question + " - " + item.getQuestion());
			if(item.getQuestion().equals(question)) {
				answers.add(item.getAnswer());
			}
		}
		return answers;
	}
	
	public static ClientName convertClientName(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientName clientName = ClientName.Factory.newInstance();
		clientName.setFirst(ocanStaffForm.getFirstName());
		clientName.setMiddle(getStaffAnswer("middle",ocanStaffFormData));
		clientName.setLast(ocanStaffForm.getLastName());
		clientName.setPreferred(getStaffAnswer("preferred",ocanStaffFormData));
		return clientName;
	}
	
	public static ClientAddress convertClientAddress(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientAddress clientAddress = ClientAddress.Factory.newInstance();
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientAddress.setLine1(ocanStaffForm.getAddressLine1());
			clientAddress.setLine2(ocanStaffForm.getAddressLine2());
			
			clientAddress.setCity(ocanStaffForm.getCity());
			clientAddress.setProvince(ProvinceListType.Enum.forString(ocanStaffForm.getProvince()));
			clientAddress.setPostalCode(ocanStaffForm.getPostalCode());
		} else {
			clientAddress.setLine1("");
			clientAddress.setLine2("");
			clientAddress.setCity("");
			clientAddress.setProvince(ProvinceListType.Enum.forString(""));
			clientAddress.setPostalCode("");
		}
		return clientAddress;
	}
	
	public static ClientPhone convertClientPhone(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientPhone clientPhone = ClientPhone.Factory.newInstance();
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientPhone.setNumber(ocanStaffForm.getPhoneNumber());
			clientPhone.setExtension(getStaffAnswer("extension",ocanStaffFormData));
		}else{
			clientPhone.setNumber("");
			clientPhone.setExtension("");
		}
		return clientPhone;
	}
	
	public static ClientHealthCardInfo convertClientHealthCardInfo(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData) {
		ClientHealthCardInfo clientHealthCardInfo = ClientHealthCardInfo.Factory.newInstance();
		if(!"TRUE".equalsIgnoreCase(getStaffAnswer("consumerAnonymous",ocanStaffFormData))) {
			clientHealthCardInfo.setNumber(ocanStaffForm.getHcNumber());
			clientHealthCardInfo.setVersion(ocanStaffForm.getHcVersion());
			
			
			clientHealthCardInfo.setIssuingTerritory(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(getStaffAnswer("issuingTerritory",ocanStaffFormData)));
		}else{
			clientHealthCardInfo.setNumber("");
			clientHealthCardInfo.setVersion("");
			clientHealthCardInfo.setIssuingTerritory(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(""));
		}
		return clientHealthCardInfo;
	}
	
	public static ReasonForOCAN convertReasonForOCAN(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ReasonForOCAN reasonForOCAN = ReasonForOCAN.Factory.newInstance();
		String answer = ocanStaffForm.getReasonForAssessment();
		reasonForOCAN.setValue(ReasonForOCAN.Value.Enum.forString(answer));
		reasonForOCAN.setOther(getStaffAnswer("reason_for_assessment_other",ocanStaffFormData));
		return reasonForOCAN;
	}
	
	public static ClientContact convertClientContact(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientContact clientContact = ClientContact.Factory.newInstance();
		clientContact.setDoctorContact(convertDoctorContact(ocanStaffForm,ocanStaffFormData));
		clientContact.setPsychiatristContact(convertPsychiatristContact(ocanStaffForm,ocanStaffFormData));

		List<OtherPractitionerContact> otherPractitionerList = convertOtherPractitionerContact(ocanStaffForm,ocanStaffFormData);
		clientContact.setOtherPractitionerContactArray(otherPractitionerList.toArray(new OtherPractitionerContact[otherPractitionerList.size()]));

		List<OtherAgencyContact> otherAgencyContactList = convertOtherAgencyContact(ocanStaffForm,ocanStaffFormData);
		clientContact.setOtherAgencyContactArray(otherAgencyContactList.toArray(new OtherAgencyContact[otherAgencyContactList.size()]));

		return clientContact;
	}
	
	public static DoctorContact convertDoctorContact(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		DoctorContact doctorContact = DoctorContact.Factory.newInstance();
		doctorContact.setDoctor(DoctorContact.Doctor.Enum.forString(getStaffAnswer("familyDoctor",ocanStaffFormData)));
		doctorContact.setContactInfo(convertContactInfo_doctor(ocanStaffFormData));
		doctorContact.setLastSeen(ca.ehealthontario.ccim.LastSeenListType.Enum.forString(getStaffAnswer("famliyDoctorLastSeen",ocanStaffFormData)));
		return doctorContact;
	}
	
	public static PsychiatristContact convertPsychiatristContact(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		PsychiatristContact psychiatristContact = PsychiatristContact.Factory.newInstance();
		psychiatristContact.setPsychiatrist(PsychiatristContact.Psychiatrist.Enum.forString(getStaffAnswer("psychiatrist",ocanStaffFormData)));
		psychiatristContact.setLastSeen(ca.ehealthontario.ccim.LastSeenListType.Enum.forString(getStaffAnswer("psychiatristLastSeen",ocanStaffFormData)));
		psychiatristContact.setContactInfo(convertContactInfo_psychiatrist(ocanStaffFormData));

		return psychiatristContact;
	}
	
	public static ContactInfo convertContactInfo_psychiatrist(List<OcanStaffFormData> ocanStaffFormData) {
		ContactInfo contactInfo = ContactInfo.Factory.newInstance();
		contactInfo.setContactName(getStaffAnswer("psychiatristName",ocanStaffFormData));
		contactInfo.setAddressLine1(getStaffAnswer("psychiatristAddress1",ocanStaffFormData));
		contactInfo.setAddressLine2(getStaffAnswer("psychiatristAddress2",ocanStaffFormData));
		contactInfo.setCity(getStaffAnswer("psychiatristCity",ocanStaffFormData));
		contactInfo.setProvince(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(getStaffAnswer("psychiatristProvince",ocanStaffFormData)));
		contactInfo.setPostalCode(getStaffAnswer("psychiatristPostalCode",ocanStaffFormData));
		contactInfo.setPhoneNumber(getStaffAnswer("psychiatristPhoneNumber",ocanStaffFormData));
		contactInfo.setExtension(getStaffAnswer("psychiatristPhoneNumberExt",ocanStaffFormData));
		contactInfo.setEmailAddress(getStaffAnswer("psychiatristEmail",ocanStaffFormData));

		return contactInfo;
	}
	
	public static ContactInfo convertContactInfo_doctor(List<OcanStaffFormData> ocanStaffFormData) {
		ContactInfo contactInfo = ContactInfo.Factory.newInstance();
		contactInfo.setContactName(getStaffAnswer("familyDoctorName",ocanStaffFormData));
		contactInfo.setAddressLine1(getStaffAnswer("familyDoctorAddress1",ocanStaffFormData));
		contactInfo.setAddressLine2(getStaffAnswer("familyDoctorAddress2",ocanStaffFormData));
		contactInfo.setCity(getStaffAnswer("familyDoctorCity",ocanStaffFormData));
		contactInfo.setProvince(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(getStaffAnswer("familyDoctorProvince",ocanStaffFormData)));
		contactInfo.setPostalCode(getStaffAnswer("familyDoctorPostalCode",ocanStaffFormData));
		contactInfo.setPhoneNumber(getStaffAnswer("familyDoctorPhoneNumber",ocanStaffFormData));
		contactInfo.setExtension(getStaffAnswer("familyDoctorPhoneNumberExt",ocanStaffFormData));
		contactInfo.setEmailAddress(getStaffAnswer("familyDoctorEmail",ocanStaffFormData));

		return contactInfo;
	}
	
	public static List<OtherPractitionerContact> convertOtherPractitionerContact(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		List<OtherPractitionerContact> list = new ArrayList<OtherPractitionerContact>();
		String contact = getStaffAnswer("otherContact",ocanStaffFormData);
		for(int index=1; index <=3; index++) {
				OtherPractitionerContact otherPractitionerContact = OtherPractitionerContact.Factory.newInstance();

				otherPractitionerContact.setOtherContact(OtherPractitionerContact.OtherContact.Enum.forString(contact));
				otherPractitionerContact.setPractitionerType(OtherPractitionerContact.PractitionerType.Enum.forString(getStaffAnswer(index+"_otherContactType",ocanStaffFormData)));
				otherPractitionerContact.setLastSeen(ca.ehealthontario.ccim.LastSeenListType.Enum.forString(getStaffAnswer(index+"_otherContactLastSeen",ocanStaffFormData)));
				otherPractitionerContact.setContactInfo(convertContactInfo_otherContact(index,ocanStaffFormData));

				list.add(otherPractitionerContact);
		}
		return list;
	}
	
	public static ContactInfo convertContactInfo_otherContact(int index,List<OcanStaffFormData> ocanStaffFormData) {
		ContactInfo contactInfo = ContactInfo.Factory.newInstance();
		contactInfo.setContactName(getStaffAnswer(index+"_otherContactName",ocanStaffFormData));
		contactInfo.setAddressLine1(getStaffAnswer(index+"_otherContactAddress1",ocanStaffFormData));
		contactInfo.setAddressLine2(getStaffAnswer(index+"_otherContactAddress2",ocanStaffFormData));
		contactInfo.setCity(getStaffAnswer(index+"_otherContactCity",ocanStaffFormData));
		contactInfo.setProvince(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(getStaffAnswer(index+"_otherContactProvince",ocanStaffFormData)));
		contactInfo.setPostalCode(getStaffAnswer(index+"_otherContactPostalCode",ocanStaffFormData));
		contactInfo.setPhoneNumber(getStaffAnswer(index+"_otherContactPhoneNumber",ocanStaffFormData));
		contactInfo.setExtension(getStaffAnswer(index+"_otherContactPhoneNumberExt",ocanStaffFormData));
		contactInfo.setEmailAddress(getStaffAnswer(index+"_otherContactEmail",ocanStaffFormData));

		return contactInfo;
	}
	
	public static List<OtherAgencyContact> convertOtherAgencyContact(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		List<OtherAgencyContact> list = new ArrayList<OtherAgencyContact>();
		String contact = getStaffAnswer("otherAgency",ocanStaffFormData);
		for(int index=1; index<=3; index++) {
				OtherAgencyContact otherAgencyContact = OtherAgencyContact.Factory.newInstance();
				otherAgencyContact.setOtherAgency(OtherAgencyContact.OtherAgency.Enum.forString(getStaffAnswer("otherAgency",ocanStaffFormData)));
				otherAgencyContact.setContactInfo(convertContactInfo_agencyContact(index,ocanStaffFormData));
				otherAgencyContact.setLastSeen(ca.ehealthontario.ccim.LastSeenListType.Enum.forString(getStaffAnswer(index+"_otherAgencyLastSeen",ocanStaffFormData)));
				list.add(otherAgencyContact);
		}
		return list;
	}
	
	public static ContactInfo convertContactInfo_agencyContact(int index,List<OcanStaffFormData> ocanStaffFormData) {
		ContactInfo contactInfo = ContactInfo.Factory.newInstance();
		contactInfo.setContactName(getStaffAnswer(index+"_otherAgencyName",ocanStaffFormData));
		contactInfo.setAddressLine1(getStaffAnswer(index+"_otherAgencyAddress1",ocanStaffFormData));
		contactInfo.setAddressLine2(getStaffAnswer(index+"_otherAgencyAddress2",ocanStaffFormData));
		contactInfo.setCity(getStaffAnswer(index+"_otherAgencyCity",ocanStaffFormData));
		contactInfo.setProvince(ca.ehealthontario.ccim.ProvinceListType.Enum.forString(getStaffAnswer(index+"_otherAgencyProvince",ocanStaffFormData)));
		contactInfo.setPostalCode(getStaffAnswer(index+"_otherAgencyPostalCode",ocanStaffFormData));
		contactInfo.setPhoneNumber(getStaffAnswer(index+"_otherAgencyPhoneNumber",ocanStaffFormData));
		contactInfo.setExtension(getStaffAnswer(index+"_otherAgencyPhoneNumberExt",ocanStaffFormData));
		contactInfo.setEmailAddress(getStaffAnswer(index+"_otherAgencyEmail",ocanStaffFormData));

		return contactInfo;
	}
	
	public static CoreadditionalElementsType convertAdditionalElements(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		CoreadditionalElementsType additionalElements = CoreadditionalElementsType.Factory.newInstance();
		
		if(!"CORE".equals(ocanType)) {
			/*additionalElements.setClientHopesForFuture(convertClientHopesForFuture(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientNeedToGetThere(convertClientNeedToGetThere(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientViewMentalHealth(convertClientViewMentalHealth(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientSpiritualityImportance(convertClientSpiritualityImportance(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientCultureHeritageImportance(convertClientCultureHeritageImportance(ocanStaffForm,ocanStaffFormData, ocanType));*/
		}

		PresentingIssueList presentingIssueList = getPresentingIssueList(ocanStaffFormData);
		additionalElements.setPresentingIssueList(presentingIssueList);

	/*if("FULL".equals(ocanType)) {
		ActionList actionList = ActionList.Factory.newInstance();
		List<Action> actions = new ArrayList<Action>();

		String strActionCount = getStaffAnswer("summary_of_actions_count",ocanStaffFormData);
		if(strActionCount.equals("")) {strActionCount="0";}
		int actionCount = Integer.valueOf(strActionCount);
		for(int x=0;x<actionCount;x++) {
			int index = x+1;
			Action action = Action.Factory.newInstance();
			action.setPriority(index);
			if(StringUtils.isBlank(getStaffAnswer(index+"_summary_of_actions_domain",ocanStaffFormData)))
					continue;
			action.setDomain(ActionDocument.Action.Domain.Enum.forString(getDomainName(Integer.valueOf(getStaffAnswer(index+"_summary_of_actions_domain",ocanStaffFormData)))));
			action.setAction(getStaffAnswer(index+"_summary_of_actions_action",ocanStaffFormData));
			actions.add(action);
		}
		actionList.setActionArray(actions.toArray(new Action[actions.size()]));
		additionalElements.setActionList(actionList);


		ReferralList referralList = ReferralList.Factory.newInstance();
		List<Referral> referrals = new ArrayList<Referral>();

		String strReferralCount = getStaffAnswer("referrals_count",ocanStaffFormData);
		int referralCount = 0;
		try {referralCount = Integer.valueOf(strReferralCount);}catch(NumberFormatException e){}

		for(int x=0;x<referralCount;x++) {
			int index = x+1;
			Referral referral = Referral.Factory.newInstance();
			referral.setOptimal(Referral.Optimal.Enum.forString(getStaffAnswer(index+"_summary_of_referral_optimal",ocanStaffFormData)));
			referral.setSpecifyOptimal(getStaffAnswer(index+"_summary_of_referral_optimal_spec",ocanStaffFormData));
			referral.setActual(Referral.Actual.Enum.forString(getStaffAnswer(index+"_summary_of_referral_actual",ocanStaffFormData)));
			referral.setSpecifyActual(getStaffAnswer(index+"_summary_of_referral_actual_spec",ocanStaffFormData));
			referral.setDifferenceReason(Referral.DifferenceReason.Enum.forString(getStaffAnswer(index+"_summary_of_referral_diff",ocanStaffFormData)));
			referral.setStatus(Referral.Status.Enum.forString(getStaffAnswer(index+"_summary_of_referral_status",ocanStaffFormData)));
			referrals.add(referral);
		}
		referralList.setReferralArray(referrals.toArray(new Referral[referrals.size()]));
		additionalElements.setReferralList(referralList);
		}*/

		return additionalElements;
	}
	
	public static FulladditionalElementsType convertAdditionalElements_full(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		FulladditionalElementsType additionalElements = FulladditionalElementsType.Factory.newInstance();
		
		if(!"CORE".equals(ocanType)) {
			additionalElements.setClientHopesForFuture(convertClientHopesForFuture(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientNeedToGetThere(convertClientNeedToGetThere(ocanStaffForm,ocanStaffFormData, ocanType));
			//additionalElements.setClientViewMentalHealth(convertClientViewMentalHealth(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientSpiritualityImportance(convertClientSpiritualityImportance(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientCultureHeritageImportance(convertClientCultureHeritageImportance(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientStrengths(convertClientStrengthSkills(ocanStaffForm, ocanStaffFormData, ocanType));
		}

		PresentingIssueList presentingIssueList = getPresentingIssueList(ocanStaffFormData);
		additionalElements.setPresentingIssueList(presentingIssueList);

	if("FULL".equals(ocanType)) {
		ActionList actionList = ActionList.Factory.newInstance();
		List<Action> actions = new ArrayList<Action>();

		String strActionCount = getStaffAnswer("summary_of_actions_count",ocanStaffFormData);
		if(strActionCount.equals("")) {strActionCount="0";}
		int actionCount = Integer.valueOf(strActionCount);
		for(int x=0;x<actionCount;x++) {
			int index = x+1;
			Action action = Action.Factory.newInstance();
			action.setPriority(index);
			if(StringUtils.isBlank(getStaffAnswer(index+"_summary_of_actions_domain",ocanStaffFormData)))
					continue;
			action.setDomain(ActionDocument.Action.Domain.Enum.forString(getDomainName(Integer.valueOf(getStaffAnswer(index+"_summary_of_actions_domain",ocanStaffFormData)))));
			action.setAction(getStaffAnswer(index+"_summary_of_actions_action",ocanStaffFormData));
			actions.add(action);
		}
		actionList.setActionArray(actions.toArray(new Action[actions.size()]));
		additionalElements.setActionList(actionList);


		ReferralList referralList = ReferralList.Factory.newInstance();
		List<Referral> referrals = new ArrayList<Referral>();

		String strReferralCount = getStaffAnswer("referrals_count",ocanStaffFormData);
		int referralCount = 0;
		try {referralCount = Integer.valueOf(strReferralCount);}catch(NumberFormatException e){}

		for(int x=0;x<referralCount;x++) {
			int index = x+1;
			Referral referral = Referral.Factory.newInstance();
			referral.setOptimal(ca.ehealthontario.ccim.ReferalListItemType.Enum.forString(getStaffAnswer(index+"_summary_of_referral_optimal",ocanStaffFormData)));
			referral.setSpecifyOptimal(getStaffAnswer(index+"_summary_of_referral_optimal_spec",ocanStaffFormData));
			referral.setActual(ca.ehealthontario.ccim.ReferalListItemType.Enum.forString(getStaffAnswer(index+"_summary_of_referral_actual",ocanStaffFormData)));
			referral.setSpecifyActual(getStaffAnswer(index+"_summary_of_referral_actual_spec",ocanStaffFormData));
			referral.setDifferenceReason(Referral.DifferenceReason.Enum.forString(getStaffAnswer(index+"_summary_of_referral_diff",ocanStaffFormData)));
			referral.setStatus(Referral.Status.Enum.forString(getStaffAnswer(index+"_summary_of_referral_status",ocanStaffFormData)));
			referrals.add(referral);
		}
		referralList.setReferralArray(referrals.toArray(new Referral[referrals.size()]));
		additionalElements.setReferralList(referralList);
		}

		return additionalElements;
	}
	
	public static SelfadditionalElementsType convertAdditionalElements_self(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		SelfadditionalElementsType additionalElements = SelfadditionalElementsType.Factory.newInstance();
		
		if(!"CORE".equals(ocanType)) {
			additionalElements.setClientHopesForFuture(convertClientHopesForFuture(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientNeedToGetThere(convertClientNeedToGetThere(ocanStaffForm,ocanStaffFormData, ocanType));
			//additionalElements.setClientViewMentalHealth(convertClientViewMentalHealth(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientSpiritualityImportance(convertClientSpiritualityImportance(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientCultureHeritageImportance(convertClientCultureHeritageImportance(ocanStaffForm,ocanStaffFormData, ocanType));
			additionalElements.setClientStrengths(convertClientStrengthSkills(ocanStaffForm, ocanStaffFormData, ocanType));
		}

		PresentingIssueList presentingIssueList = getPresentingIssueList(ocanStaffFormData);
		additionalElements.setPresentingIssueList(presentingIssueList);

		return additionalElements;
	}
	
	public static ClientCultureHeritageImportance convertClientCultureHeritageImportance(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		ClientCultureHeritageImportance cntgt = ClientCultureHeritageImportance.Factory.newInstance();

		if("FULL".equals(ocanType))
			cntgt.setStaff(getStaffAnswer("culture_heritage",ocanStaffFormData));

		cntgt.setClient(getStaffAnswer("client_culture_heritage",ocanStaffFormData));
		return cntgt;
	}
	
	public static ClientSpiritualityImportance convertClientSpiritualityImportance(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		ClientSpiritualityImportance cntgt = ClientSpiritualityImportance.Factory.newInstance();

		if("FULL".equals(ocanType))
			cntgt.setStaff(getStaffAnswer("sprituality",ocanStaffFormData));

		cntgt.setClient(getStaffAnswer("client_sprituality",ocanStaffFormData));
		return cntgt;
	}
	
	public static ClientNeedToGetThere convertClientNeedToGetThere(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		ClientNeedToGetThere cntgt = ClientNeedToGetThere.Factory.newInstance();

		if("FULL".equals(ocanType))
			cntgt.setStaff(getStaffAnswer("hope_future_need",ocanStaffFormData));

		cntgt.setClient(getStaffAnswer("client_hope_future_need",ocanStaffFormData));
		return cntgt;
	}

	
	public static ClientHopesForFuture convertClientHopesForFuture(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		ClientHopesForFuture chff = ClientHopesForFuture.Factory.newInstance();

		if("FULL".equals(ocanType))
			chff.setStaff(getStaffAnswer("hopes_future",ocanStaffFormData));

		chff.setClient(getStaffAnswer("client_hopes_future",ocanStaffFormData));
		return chff;
	}
	
	public static ClientStrengths convertClientStrengthSkills(OcanStaffForm ocanStaffForm,List<OcanStaffFormData> ocanStaffFormData, String ocanType) {
		ClientStrengths chff = ClientStrengths.Factory.newInstance();

		if("FULL".equals(ocanType))
			chff.setStaff(getStaffAnswer("strength_skills",ocanStaffFormData));

		chff.setClient(getStaffAnswer("client_strength_skills",ocanStaffFormData));
		return chff;
	}
	
	public static PresentingIssueList getPresentingIssueList(List<OcanStaffFormData> ocanStaffFormData) {
		PresentingIssueList presentingIssueList = PresentingIssueList.Factory.newInstance();

		presentingIssueList.setOtherIssues(getStaffAnswer("presenting_issues_other",ocanStaffFormData));
		List<String> answers = getMultipleStaffAnswer("presenting_issues",ocanStaffFormData);
		List<PresentingIssue> piList = new ArrayList<PresentingIssue>();
		for(String answer:answers) {
			PresentingIssue pi = PresentingIssue.Factory.newInstance();
			pi.setType(PresentingIssue.Type.Enum.forString(answer));
			piList.add(pi);
		}
		if(piList!=null)
			presentingIssueList.setPresentingIssueArray(piList.toArray(new PresentingIssue[piList.size()]));
		return presentingIssueList;
	}
	
	public static CoreDomainType convertOCANDomains(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		CoreDomainType ocanDomains = CoreDomainType.Factory.newInstance();

		if("FULL".equals(ocanType) || "SELF".equals(ocanType)) {/*
			List<Domain> domainList = new ArrayList<Domain>();

			for(int x=0;x<24;x++) {
				domainList.add(convertOCANDomain(x+1,ocanStaffForm,ocanStaffFormData,ocanClientForm, ocanClientFormData, ocanType));
				ocanDomains.setDomainArray(domainList.toArray(new Domain[domainList.size()]));
			}
		*/} else {
			ocanDomains.setResidenceType(convertResidenceType(ocanStaffForm,ocanStaffFormData));
			ocanDomains.setResidenceSupport(ca.ehealthontario.ccim.ResidenceSupportDocument.ResidenceSupport.Enum.forString(getStaffAnswer("1_any_support",ocanStaffFormData)));
			//ocanDomains.setLivingArrangementType(LivingArrangementType.Enum.forString(getStaffAnswer("1_live_with_anyone",ocanStaffFormData)));
			
			List<String> livingArrangements = getMultipleStaffAnswer("1_live_with_anyone", ocanStaffFormData);
			if(!isEmpty(livingArrangements))
			{
				LivingArrangementList livingArrangementList = LivingArrangementList.Factory.newInstance();
				List<LivingArrangementType> arrangementTypes = new ArrayList<LivingArrangementType>();
				
				for (String livingArrangement : livingArrangements) {
					LivingArrangementType livingArrangementType = LivingArrangementType.Factory.newInstance();
					livingArrangementType.setValue(ca.ehealthontario.ccim.LivingArrangementTypeDocument.LivingArrangementType.Value.Enum.forString(livingArrangement));
					
					arrangementTypes.add(livingArrangementType);
				}
				
				livingArrangementList.setLivingArrangementTypeArray(arrangementTypes.toArray(new LivingArrangementType[] {}));
				ocanDomains.setLivingArrangementList(livingArrangementList);
			}

			ocanDomains.setEmployStatus(ca.ehealthontario.ccim.EmployStatusDocument.EmployStatus.Enum.forString(getStaffAnswer("5_current_employment_status",ocanStaffFormData)));
			ocanDomains.setEducationProgramStatus(convertEducationProgramStatus(ocanStaffForm,ocanStaffFormData));

			ocanDomains.setHospitalizedPastTwoYears(ca.ehealthontario.ccim.HospitalizedPastTwoYearsDocument.HospitalizedPastTwoYears.Enum.forString(getStaffAnswer("hospitalized_mental_illness",ocanStaffFormData)));
			String totalAdmissions = getStaffAnswer("hospitalized_mental_illness_admissions",ocanStaffFormData);
			if(totalAdmissions!=null&&totalAdmissions.length()>0) {
				ocanDomains.setTotalAdmissions(new BigInteger(totalAdmissions));
			} else {
				ocanDomains.setTotalAdmissions(new BigInteger("0"));
			}

			String totalHospitalDays = getStaffAnswer("hospitalized_mental_illness_days",ocanStaffFormData);
			if(totalHospitalDays!=null&&totalHospitalDays.length()>0) {
				ocanDomains.setTotalHospitalDays(new BigInteger(totalHospitalDays));
			} else {
				ocanDomains.setTotalHospitalDays(new BigInteger("0"));
			}

			ocanDomains.setCommunityTreatOrder(ca.ehealthontario.ccim.CommunityTreatOrderDocument.CommunityTreatOrder.Enum.forString(getStaffAnswer("community_treatment_orders",ocanStaffFormData)));

			ocanDomains.setVisitEmergencyDepartment(ca.ehealthontario.ccim.VisitEmergencyDepartmentDocument.VisitEmergencyDepartment.Enum.forString(getStaffAnswer("visitEmergencyDepartment",ocanStaffFormData)));

			DiagnosticList diagnosticList = getDiagnosticList(ocanStaffFormData);
			ocanDomains.setDiagnosticList(diagnosticList);
			
			OtherIllnessList otherIllnessList = getOtherIllnessList(ocanStaffFormData);
			ocanDomains.setOtherIllnessList(otherIllnessList);

			ocanDomains.setHighestEducationLevel(ca.ehealthontario.ccim.HighestEducationLevelDocument.HighestEducationLevel.Enum.forString(getStaffAnswer("level_of_education",ocanStaffFormData)));

			ocanDomains.setSourceOfIncome(convertSourceOfIncome(ocanStaffForm,ocanStaffFormData));

			String sexualOrientationStr = getStaffAnswer("sex_orientation",ocanStaffFormData);
			ca.ehealthontario.ccim.SexualOrientationDocument.SexualOrientation sexualOrientation = ca.ehealthontario.ccim.SexualOrientationDocument.SexualOrientation.Factory.newInstance();
			sexualOrientation.setValue(ca.ehealthontario.ccim.SexualOrientationDocument.SexualOrientation.Value.Enum.forString(sexualOrientationStr));
			ocanDomains.setSexualOrientation(sexualOrientation);
			
			ocanDomains.setFamilyIncome(ca.ehealthontario.ccim.FamilyIncomeDocument.FamilyIncome.Enum.forString(getStaffAnswer("family_income",ocanStaffFormData)));
			ocanDomains.setIncomeSupportedPeople(ca.ehealthontario.ccim.IncomeSupportedPeopleDocument.IncomeSupportedPeople.Enum.forString(getStaffAnswer("people_income_support",ocanStaffFormData)));
		}
		return ocanDomains;
	}
	
	public static OCANDomains convertOCANDomains_full(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		OCANDomains ocanDomains = OCANDomains.Factory.newInstance();

		if("FULL".equals(ocanType) || "SELF".equals(ocanType)) {
			List<FullDomainItemType> domainList = new ArrayList<FullDomainItemType>();

			for(int x=0;x<24;x++) {
				domainList.add(convertOCANDomain(x+1,ocanStaffForm,ocanStaffFormData,ocanClientForm, ocanClientFormData, ocanType));
			}
			
			ocanDomains.setDomainArray(domainList.toArray(new FullDomainItemType[domainList.size()]));
		} 
		
		return ocanDomains;
	}
	
	public static ca.ehealthontario.ccim.OCANSelfSubmissionRecordDocument.OCANSelfSubmissionRecord.OCANDomains convertOCANDomains_self(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		ca.ehealthontario.ccim.OCANSelfSubmissionRecordDocument.OCANSelfSubmissionRecord.OCANDomains ocanDomains = ca.ehealthontario.ccim.OCANSelfSubmissionRecordDocument.OCANSelfSubmissionRecord.OCANDomains.Factory.newInstance();

		if("FULL".equals(ocanType) || "SELF".equals(ocanType)) {
			List<SelfDomainItemType> domainList = new ArrayList<SelfDomainItemType>();

			for(int x=0;x<24;x++) {
				domainList.add(convertOCANDomain_self(x+1,ocanStaffForm,ocanStaffFormData,ocanClientForm, ocanClientFormData, ocanType));
			}
			
			ocanDomains.setDomainArray(domainList.toArray(new SelfDomainItemType[domainList.size()]));
		} 
		
		return ocanDomains;
	}
	
	public static FullDomainItemType convertOCANDomain(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		FullDomainItemType domain = FullDomainItemType.Factory.newInstance();

		if("FULL".equals(ocanType) || "SELF".equals(ocanType)) {
			domain.setName(ca.ehealthontario.ccim.DomainNameList.Enum.forString(getDomainName(domainNumber)));
			domain.setDomainComments(convertDomainComments(String.valueOf(domainNumber),ocanStaffFormData,ocanClientForm, ocanClientFormData, ocanType));
		}

		if("FULL".equals(ocanType))
			domain.setDomainActions(convertDomainActions(String.valueOf(domainNumber),ocanStaffFormData));

		if(!"CORE".equals(ocanType)) {
			NeedRatingFull needRating = convertNeedRating(domainNumber,ocanStaffForm,ocanStaffFormData, ocanClientForm, ocanClientFormData, ocanType);
			domain.setNeedRating(needRating);
		}
		if("FULL".equals(ocanType)) {
		//if(needRating.getStaff() != 0 && needRating.getStaff() != 9) {
			//2,3a,3b
			domain.setInformalHelpRecvd(convertInformalHelpRecvd(domainNumber,ocanStaffForm,ocanStaffFormData));
			domain.setFormalHelpRecvd(convertFormalHelpRecvd(domainNumber,ocanStaffForm,ocanStaffFormData));
			domain.setFormalHelpNeed(convertFormalHelpNeed(domainNumber,ocanStaffForm,ocanStaffFormData));

		//}
		}

		switch(domainNumber) {

		case 1:
			domain.setResidenceType(convertResidenceType(ocanStaffForm,ocanStaffFormData));
			domain.setResidenceSupport(ca.ehealthontario.ccim.ResidenceSupportDocument.ResidenceSupport.Enum.forString(getStaffAnswer("1_any_support",ocanStaffFormData)));
			
			List<String> livingArrangements = getMultipleStaffAnswer("1_live_with_anyone", ocanStaffFormData);
			if(!isEmpty(livingArrangements))
			{
				LivingArrangementList livingArrangementList = LivingArrangementList.Factory.newInstance();
				List<LivingArrangementType> arrangementTypes = new ArrayList<LivingArrangementType>();
				
				for (String livingArrangement : livingArrangements) {
					LivingArrangementType livingArrangementType = LivingArrangementType.Factory.newInstance();
					livingArrangementType.setValue(ca.ehealthontario.ccim.LivingArrangementTypeDocument.LivingArrangementType.Value.Enum.forString(livingArrangement));
					
					arrangementTypes.add(livingArrangementType);
				}
				
				livingArrangementList.setLivingArrangementTypeArray(arrangementTypes.toArray(new LivingArrangementType[] {}));
				domain.setLivingArrangementList(livingArrangementList);
			}
			
			break;

		case 5:
			domain.setEmployStatus(ca.ehealthontario.ccim.EmployStatusDocument.EmployStatus.Enum.forString(getStaffAnswer("5_current_employment_status",ocanStaffFormData)));
			domain.setEducationProgramStatus(convertEducationProgramStatus(ocanStaffForm,ocanStaffFormData));

			if("FULL".equals(ocanType)) {
			domain.setBarriersFindingWorkList(convertBarriersFindingWorkList(ocanStaffForm,ocanStaffFormData));
			}
			break;

		case 6:
			if("FULL".equals(ocanType)) {
			MedicalConditionList medicalConditionList = getMedicalConditionList(ocanStaffFormData);
			domain.setMedicalConditionList(medicalConditionList);

			//domain.setPhysicalHealthConcern(PhysicalHealthConcern.Enum.forString(getStaffAnswer("6_physical_health_concerns",ocanStaffFormData)));

			/*ConcernAreaList concernAreaList = getConcernAreaList(ocanStaffFormData);
			//if(concernAreaList.getConcernAreaList().size()>0) {
			if(concernAreaList.getConcernAreaArray().length>0) {
				domain.setConcernAreaList(concernAreaList);
			}*/

			MedicationList medicationList = getMedicationList(ocanStaffFormData);
			//if(medicationList.getMedicationDetailList().size()>0) {
			if(medicationList.getMedicationDetailArray().length>0) {
				domain.setMedicationList(medicationList);
			}
			}
			break;

		case 7:
			domain.setHospitalizedPastTwoYears(HospitalizedPastTwoYears.Enum.forString(getStaffAnswer("hospitalized_mental_illness",ocanStaffFormData)));
			String totalAdmissions = getStaffAnswer("hospitalized_mental_illness_admissions",ocanStaffFormData);
			if(totalAdmissions!=null&&totalAdmissions.length()>0) {
				domain.setTotalAdmissions(new BigInteger(totalAdmissions));
			} else {
				domain.setTotalAdmissions(new BigInteger("0"));
			}
			String totalHospitalDays = getStaffAnswer("hospitalized_mental_illness_days",ocanStaffFormData);
			if(totalHospitalDays!=null&&totalHospitalDays.length()>0) {
				domain.setTotalHospitalDays(new BigInteger(totalHospitalDays));
			} else {
				domain.setTotalHospitalDays(new BigInteger("0"));
			}
			domain.setCommunityTreatOrder(CommunityTreatOrder.Enum.forString(getStaffAnswer("community_treatment_orders",ocanStaffFormData)));

			domain.setVisitEmergencyDepartment(ca.ehealthontario.ccim.VisitEmergencyDepartmentDocument.VisitEmergencyDepartment.Enum.forString(getStaffAnswer("visitEmergencyDepartment",ocanStaffFormData)));

			if("FULL".equals(ocanType)) {
				domain.setPsychiatricAdditionalInfo(getStaffAnswer("7_psychiatric_history_addl_info",ocanStaffFormData));
				SymptomList symptomList = getSymptomList(ocanStaffFormData);
				//if(symptomList.getSymptomList().size()>0) {
				if(symptomList.getSymptomArray().length>0) {
					domain.setSymptomList(symptomList);
				}
			}
			break;

		case 8:

			DiagnosticList diagnosticList = getDiagnosticList(ocanStaffFormData);
			//if(diagnosticList.getDiagnosticList().size()>0) {
			if(diagnosticList.getDiagnosticArray().length>0) {
				domain.setDiagnosticList(diagnosticList);
			}

			OtherIllnessList otherIllnessList = getOtherIllnessList(ocanStaffFormData);
			//if(otherIllnessList.getOtherIllnessList().size()>0) {
			if(otherIllnessList.getOtherIllnessArray().length>0) {
				domain.setOtherIllnessList(otherIllnessList);
			}

			break;

		case 10:
			if("FULL".equals(ocanType)) {
			domain.setSuicideAttempt(ca.ehealthontario.ccim.SuicideAttemptDocument.SuicideAttempt.Enum.forString(getStaffAnswer("suicide_past",ocanStaffFormData)));
			domain.setSuicideThoughts(ca.ehealthontario.ccim.SuicideThoughtsDocument.SuicideThoughts.Enum.forString(getStaffAnswer("suicidal_thoughts",ocanStaffFormData)));
			domain.setSafetyConcernSelf(ca.ehealthontario.ccim.SafetyConcernSelfDocument.SafetyConcernSelf.Enum.forString(getStaffAnswer("safety_concerns",ocanStaffFormData)));

			SafetyToSelfRiskList safetyToSelfRiskList = getSafetyToSelfRiskList(ocanStaffFormData);
			//if(safetyToSelfRiskList.getSafetyToSelfRiskList().size()>0) {
			if(safetyToSelfRiskList.getSafetyToSelfRiskArray().length>0) {
				domain.setSafetyToSelfRiskList(safetyToSelfRiskList);
			}
			}
			break;

		case 12:
			if("FULL".equals(ocanType)) {
			domain.setDrinkAlcohol(getDrinkAlcohol(ocanStaffFormData));
			domain.setStageOfChangeAlcohol(ca.ehealthontario.ccim.StageOfChangeAlcoholDocument.StageOfChangeAlcohol.Enum.forString(getStaffAnswer("state_of_change_alcohol",ocanStaffFormData)));
			//domain.setDrinkingImpact(getStaffAnswer("drinking_impact",ocanStaffFormData));
			}
			break;

		case 13:
			if("FULL".equals(ocanType)) {
			DrugUseList drugUseList = getDrugUseList(ocanStaffFormData);
			domain.setDrugUseList(drugUseList);
			domain.setStageOfChangeDrugs(ca.ehealthontario.ccim.StageOfChangeDrugsDocument.StageOfChangeDrugs.Enum.forString(getStaffAnswer("state_of_change_drug",ocanStaffFormData)));
			//domain.setDrugsImpact(getStaffAnswer("drug_impact",ocanStaffFormData));
			}
			break;

		case 14:
			if("FULL".equals(ocanType)) {
			AddictionTypeList addictionTypeList = getAddictionTypeList(ocanStaffFormData);
			//if(addictionTypeList.getAddictionTypeList().size()>0) {
			if(addictionTypeList.getAddictionTypeArray().length>0) {
				domain.setAddictionTypeList(addictionTypeList);
			}

			domain.setStageOfChangeAddictions(ca.ehealthontario.ccim.StageOfChangeAddictionsDocument.StageOfChangeAddictions.Enum.forString(getStaffAnswer("14_state_of_change",ocanStaffFormData)));
			//domain.setAddictionImpact(getStaffAnswer("addiction_impact",ocanStaffFormData));
			}
			break;

		case 15:
			if("FULL".equals(ocanType)) {
			//domain.setChangedSocialPatterns(ChangedSocialPatterns.Enum.forString(getStaffAnswer("social_patterns",ocanStaffFormData)));
			}
			break;

		case 20:
			domain.setHighestEducationLevel(ca.ehealthontario.ccim.HighestEducationLevelDocument.HighestEducationLevel.Enum.forString(getStaffAnswer("level_of_education",ocanStaffFormData)));
			break;

		case 23:
			domain.setSourceOfIncome(convertSourceOfIncome(ocanStaffForm,ocanStaffFormData));

			break;
		}

		return domain;
	}
	
	public static SelfDomainItemType convertOCANDomain_self(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		SelfDomainItemType domain = SelfDomainItemType.Factory.newInstance();

		if("FULL".equals(ocanType) || "SELF".equals(ocanType)) {
			domain.setName(ca.ehealthontario.ccim.DomainNameList.Enum.forString(getDomainName(domainNumber)));
			domain.setDomainComments(convertDomainComments_self(String.valueOf(domainNumber),ocanStaffFormData,ocanClientForm, ocanClientFormData, ocanType));
		}

		if(!"CORE".equals(ocanType)) {
			NeedRatingSelf needRating = convertNeedRating_self(domainNumber,ocanStaffForm,ocanStaffFormData, ocanClientForm, ocanClientFormData, ocanType);
			domain.setNeedRating(needRating);
		}

		switch(domainNumber) {

		case 1:
			domain.setResidenceType(convertResidenceType(ocanStaffForm,ocanStaffFormData));
			domain.setResidenceSupport(ca.ehealthontario.ccim.ResidenceSupportDocument.ResidenceSupport.Enum.forString(getStaffAnswer("1_any_support",ocanStaffFormData)));
			
			List<String> livingArrangements = getMultipleStaffAnswer("1_live_with_anyone", ocanStaffFormData);
			if(!isEmpty(livingArrangements))
			{
				LivingArrangementList livingArrangementList = LivingArrangementList.Factory.newInstance();
				List<LivingArrangementType> arrangementTypes = new ArrayList<LivingArrangementType>();
				
				for (String livingArrangement : livingArrangements) {
					LivingArrangementType livingArrangementType = LivingArrangementType.Factory.newInstance();
					livingArrangementType.setValue(ca.ehealthontario.ccim.LivingArrangementTypeDocument.LivingArrangementType.Value.Enum.forString(livingArrangement));
					
					arrangementTypes.add(livingArrangementType);
				}
				
				livingArrangementList.setLivingArrangementTypeArray(arrangementTypes.toArray(new LivingArrangementType[] {}));
				domain.setLivingArrangementList(livingArrangementList);
			}
			
			break;

		case 5:
			domain.setEmployStatus(ca.ehealthontario.ccim.EmployStatusDocument.EmployStatus.Enum.forString(getStaffAnswer("5_current_employment_status",ocanStaffFormData)));
			domain.setEducationProgramStatus(convertEducationProgramStatus(ocanStaffForm,ocanStaffFormData));

			break;

		case 6:
			break;

		case 7:
			domain.setHospitalizedPastTwoYears(HospitalizedPastTwoYears.Enum.forString(getStaffAnswer("hospitalized_mental_illness",ocanStaffFormData)));
			String totalAdmissions = getStaffAnswer("hospitalized_mental_illness_admissions",ocanStaffFormData);
			if(totalAdmissions!=null&&totalAdmissions.length()>0) {
				domain.setTotalAdmissions(new BigInteger(totalAdmissions));
			} else {
				domain.setTotalAdmissions(new BigInteger("0"));
			}
			String totalHospitalDays = getStaffAnswer("hospitalized_mental_illness_days",ocanStaffFormData);
			if(totalHospitalDays!=null&&totalHospitalDays.length()>0) {
				domain.setTotalHospitalDays(new BigInteger(totalHospitalDays));
			} else {
				domain.setTotalHospitalDays(new BigInteger("0"));
			}
			domain.setCommunityTreatOrder(CommunityTreatOrder.Enum.forString(getStaffAnswer("community_treatment_orders",ocanStaffFormData)));

			domain.setVisitEmergencyDepartment(ca.ehealthontario.ccim.VisitEmergencyDepartmentDocument.VisitEmergencyDepartment.Enum.forString(getStaffAnswer("visitEmergencyDepartment",ocanStaffFormData)));

			break;

		case 8:

			DiagnosticList diagnosticList = getDiagnosticList(ocanStaffFormData);
			//if(diagnosticList.getDiagnosticList().size()>0) {
			if(diagnosticList.getDiagnosticArray().length>0) {
				domain.setDiagnosticList(diagnosticList);
			}

			OtherIllnessList otherIllnessList = getOtherIllnessList(ocanStaffFormData);
			//if(otherIllnessList.getOtherIllnessList().size()>0) {
			if(otherIllnessList.getOtherIllnessArray().length>0) {
				domain.setOtherIllnessList(otherIllnessList);
			}

			break;

		case 10:
			break;

		case 12:
			break;

		case 13:
			break;

		case 14:
			break;

		case 15:
			break;

		case 20:
			domain.setHighestEducationLevel(ca.ehealthontario.ccim.HighestEducationLevelDocument.HighestEducationLevel.Enum.forString(getStaffAnswer("level_of_education",ocanStaffFormData)));
			break;

		case 23:
			domain.setSourceOfIncome(convertSourceOfIncome(ocanStaffForm,ocanStaffFormData));

			break;
		}

		return domain;
	}
	
	
	public static AddictionTypeList getAddictionTypeList(List<OcanStaffFormData> ocanStaffFormData) {
		AddictionTypeList addictionTypeList = AddictionTypeList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("addiction_type",ocanStaffFormData);

		List<AddictionType.Enum> mc_list = new ArrayList<AddictionType.Enum>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			mc_list.add(AddictionType.Enum.forString(itr.next()));
		}
		addictionTypeList.setAddictionTypeArray(mc_list.toArray(new AddictionType.Enum[answers.size()]));

		addictionTypeList.setOtherAddictionType(getStaffAnswer("addiction_type_other",ocanStaffFormData));
		return addictionTypeList;
	}
	
	public static DrugUseList getDrugUseList(List<OcanStaffFormData> ocanStaffFormData) {
		DrugUseList drugUseList = DrugUseList.Factory.newInstance();

		List<DrugUse> drugs = new ArrayList<DrugUse>();
		List<String> drugList = getDrugList();

		for(String drug:drugList) {
			String mnth = getStaffAnswer(drug.concat("_freq_6months"),ocanStaffFormData);
			String ever = getStaffAnswer(drug.concat("_freq_ever"),ocanStaffFormData);
			DrugUse drugUse = DrugUse.Factory.newInstance();
			if(mnth.length()>0 || ever.length()>0) {
				//we have a winner
				drugUse.setName(DrugUse.Name.Enum.forString(drug));
				if(mnth.length()>0) {
					drugUse.setFrequency(DrugUse.Frequency.Enum.forString(mnth));
				} else {
					drugUse.setFrequency(DrugUse.Frequency.Enum.forString(ever));
				}
			} else {
				drugUse.setFrequency(DrugUse.Frequency.Enum.forString(""));
			}
			drugs.add(drugUse);
		}

		if(getStaffAnswer("drug_injection_freq_6months",ocanStaffFormData).length()>0) {
			drugUseList.setInjected(DrugUseList.Injected.Enum.forString(getStaffAnswer("drug_injection_freq_6months",ocanStaffFormData)));
		} else if(getStaffAnswer("drug_injection_freq_ever",ocanStaffFormData).length()>0) {
			drugUseList.setInjected(DrugUseList.Injected.Enum.forString(getStaffAnswer("drug_injection_freq_ever",ocanStaffFormData)));
		} else {
			drugUseList.setInjected(DrugUseList.Injected.Enum.forString(""));
		}
		drugUseList.setDrugUseArray(drugs.toArray(new DrugUse[drugs.size()]));


		/*
		drugUseList.setInjected(DrugUseList.Injected.Enum.forString(getStaffAnswer("drug_injection_freq",ocanStaffFormData)));

		List<String> drugList = getDrugList();
		//List<String> drugList = getMultipleStaffAnswer("drug_list",ocanStaffFormData);
		List<DrugUse> drugUse = new ArrayList<DrugUse>();
		DrugUse du;
		for(String answer:drugList) {
			du = null;
			if(du==null) {
				du = DrugUse.Factory.newInstance();
			}
			du.setName(DrugUse.Name.Enum.forString(answer));
			du.setFrequency(DrugUse.Frequency.Enum.forString(getStaffAnswer(answer+"_DrugUseFreq",ocanStaffFormData)));
			drugUse.add(du);
		}
		drugUseList.setDrugUseArray(drugUse.toArray(new DrugUse[drugList.size()]));
		*/
		return drugUseList;
	}
	
	static List<String> getDrugList() {
		List<String> result = new ArrayList<String>();
		result.add("398705004");
		result.add("288453002");
		result.add("229005006");
		result.add("226059005");
		result.add("226044004");
		result.add("372614000");
		result.add("80288002");
		result.add("61010005");
		result.add("OTH");
		return result;
	}

	public static DrinkAlcohol getDrinkAlcohol(List<OcanStaffFormData> ocanStaffFormData) {
		DrinkAlcohol drinkAlcohol = DrinkAlcohol.Factory.newInstance();
		String quantity = getStaffAnswer("num_drinks",ocanStaffFormData);
		if(quantity!=null&&quantity.length()>0) {
			drinkAlcohol.setQuantity(new BigInteger(quantity));
		}
		drinkAlcohol.setFrequency(DrinkAlcohol.Frequency.Enum.forString(getStaffAnswer("frequency_alcohol",ocanStaffFormData)));
		return drinkAlcohol;
	}
	
	public static SafetyToSelfRiskList getSafetyToSelfRiskList(List<OcanStaffFormData> ocanStaffFormData) {
		SafetyToSelfRiskList safetyToSelfRiskList = SafetyToSelfRiskList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("risks",ocanStaffFormData);

		List<SafetyToSelfRisk.Enum> mc_list = new ArrayList<SafetyToSelfRisk.Enum>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			mc_list.add(SafetyToSelfRisk.Enum.forString(itr.next()));
		}
		safetyToSelfRiskList.setSafetyToSelfRiskArray(mc_list.toArray(new SafetyToSelfRisk.Enum[answers.size()]));
		safetyToSelfRiskList.setOtherSafetyToSelfRisk(getStaffAnswer("risks_other",ocanStaffFormData));
		return safetyToSelfRiskList;
	}
	
	public static ca.ehealthontario.ccim.SymptomListDocument.SymptomList getSymptomList(List<OcanStaffFormData> ocanStaffFormData) {
		SymptomList symptomList = SymptomList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("symptom_checklist",ocanStaffFormData);

		List<ca.ehealthontario.ccim.SymptomDocument.Symptom.Enum> mc_list = new ArrayList<ca.ehealthontario.ccim.SymptomDocument.Symptom.Enum>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			mc_list.add(ca.ehealthontario.ccim.SymptomDocument.Symptom.Enum.forString(itr.next()));
		}
		symptomList.setSymptomComments(getStaffAnswer("7_comments",ocanStaffFormData));
		symptomList.setSymptomArray(mc_list.toArray(new Symptom.Enum[answers.size()]));
		//symptomList.setSymptomArray(answers.toArray(new String[answers.size()]));
		//symptomList.setOtherSymptom(getStaffAnswer("symptom_checklist_other",ocanStaffFormData));
		return symptomList;
	}
	
	public static MedicationList getMedicationList(List<OcanStaffFormData> ocanStaffFormData) {
		MedicationList medicationList = MedicationList.Factory.newInstance();
		if(getStaffAnswer("medications_count",ocanStaffFormData)==null || getStaffAnswer("medications_count",ocanStaffFormData).equals("")) {
			return medicationList;
		}
		int numberOfMedications = Integer.valueOf(getStaffAnswer("medications_count",ocanStaffFormData));
		List<MedicationDetail> medicationDetailList = new ArrayList<MedicationDetail>();
		for(int x=0;x<numberOfMedications;x++) {
			MedicationDetail medicationDetail = getMedicationDetail(String.valueOf(x+1),ocanStaffFormData);
			medicationDetailList.add(medicationDetail);
		}
		medicationList.setAdditionalInfo(getStaffAnswer("medications_additionalInfo",ocanStaffFormData));
		medicationList.setMedicationDetailArray(medicationDetailList.toArray(new MedicationDetail[medicationDetailList.size()]));
		return medicationList;
	}
	
	public static MedicationDetail getMedicationDetail(String index, List<OcanStaffFormData> ocanStaffFormData) {
		MedicationDetail medicationDetail = MedicationDetail.Factory.newInstance();

		medicationDetail.setMedicationName(getStaffAnswer("medication_"+index+"_medication",ocanStaffFormData));
		medicationDetail.setSourceInfo(MedicationDetail.SourceInfo.Enum.forString(getStaffAnswer("medication_"+index+"_source_of_info",ocanStaffFormData)));
		medicationDetail.setDosage(getStaffAnswer("medication_"+index+"_dosage",ocanStaffFormData));
		medicationDetail.setTakenAsPrescribed(MedicationDetail.TakenAsPrescribed.Enum.forString(getStaffAnswer("medication_"+index+"_taken_as_prescribed",ocanStaffFormData)));
		medicationDetail.setIsHelpProvided(MedicationDetail.IsHelpProvided.Enum.forString(getStaffAnswer("medication_"+index+"_help_provided",ocanStaffFormData)));
		medicationDetail.setIsHelpNeeded(MedicationDetail.IsHelpNeeded.Enum.forString(getStaffAnswer("medication_"+index+"_help_needed",ocanStaffFormData)));

		return medicationDetail;
	}
	
	public static MedicalConditionList getMedicalConditionList(List<OcanStaffFormData> ocanStaffFormData) {
		MedicalConditionList medicalConditionList = MedicalConditionList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("6_medical_conditions",ocanStaffFormData);

		List<MedicalCondition.Enum> mc_list = new ArrayList<MedicalCondition.Enum>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			mc_list.add(MedicalCondition.Enum.forString(itr.next()));
		}
		//medicalConditionList.setMedicalConditionArray(answers.toArray(new String[answers.size()]));
		if(answers.size()>0) {
			medicalConditionList.setMedicalConditionArray(mc_list.toArray(new MedicalCondition.Enum[answers.size()]));
		}
		medicalConditionList.setAutismDetail(getStaffAnswer("6_medical_conditions_autism",ocanStaffFormData));
		medicalConditionList.setOtherDetail(getStaffAnswer("6_medical_conditions_other",ocanStaffFormData));
		medicalConditionList.setComments(getStaffAnswer("6_medical_conditions_comments",ocanStaffFormData));

		return medicalConditionList;
	}
	
	public static BarriersFindingWorkList convertBarriersFindingWorkList(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		BarriersFindingWorkList cntgt = BarriersFindingWorkList.Factory.newInstance();

		cntgt.setOtherBarriers(getStaffAnswer("5_barriersFindingWork_Other",ocanStaffFormData));
		cntgt.setBarriersComments(getStaffAnswer("5_barriersFindingWork_Comments",ocanStaffFormData));

		List<String> answers = getMultipleStaffAnswer("5_barriersFindingWork",ocanStaffFormData);
		List<BarriersFindingWork.Enum> barrierList = new ArrayList<BarriersFindingWork.Enum>();
		BarriersFindingWork bfw = null;
		for(String answer: answers) {
			barrierList.add(BarriersFindingWork.Enum.forString(answer));
		}
		cntgt.setBarriersFindingWorkArray(barrierList.toArray(new BarriersFindingWork.Enum[answers.size()]));
		return cntgt;
	}
	
	public static FormalHelpNeed convertFormalHelpNeed(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		FormalHelpNeed formalHelpNeed = FormalHelpNeed.Factory.newInstance();
		String staffAnswer = getStaffAnswer(domainNumber+"_3b",ocanStaffFormData);
		if(staffAnswer!=null && !staffAnswer.equals(""))
			formalHelpNeed.setStaff(Byte.valueOf(staffAnswer));
		else
			formalHelpNeed.setStaff(Byte.valueOf("0"));

		return formalHelpNeed;
	}
	
	public static FormalHelpRecvd convertFormalHelpRecvd(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		FormalHelpRecvd formalHelpRecvd = FormalHelpRecvd.Factory.newInstance();
		String staffAnswer = getStaffAnswer(domainNumber+"_3a",ocanStaffFormData);
		if(staffAnswer!=null && !staffAnswer.equals(""))
			formalHelpRecvd.setStaff(Byte.valueOf(staffAnswer));
		else
			formalHelpRecvd.setStaff(Byte.valueOf("0"));
		return formalHelpRecvd;
	}
	
	public static InformalHelpRecvd convertInformalHelpRecvd(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		InformalHelpRecvd informalHelpRecvd = InformalHelpRecvd.Factory.newInstance();
		String staffAnswer = getStaffAnswer(domainNumber+"_2",ocanStaffFormData);
		if(staffAnswer!=null && !staffAnswer.equals(""))
			informalHelpRecvd.setStaff(Byte.valueOf(staffAnswer));
		else
			informalHelpRecvd.setStaff(Byte.valueOf("0"));
		return informalHelpRecvd;
	}
	
	public static NeedRatingFull convertNeedRating(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		NeedRatingFull needRating = NeedRatingFull.Factory.newInstance();

		if("FULL".equals(ocanType)) {
			String staffAnswer = getStaffAnswer(domainNumber+"_1",ocanStaffFormData);
			needRating.setStaff(Byte.valueOf(staffAnswer));
			if(getStaffAnswer("consumerSelfAxCompleted",ocanStaffFormData).equals("TRUE")) {
				String clientAnswer = getStaffAnswer("client_"+domainNumber+"_1",ocanStaffFormData);
				if(clientAnswer.length()>0) {
					needRating.setClient(Byte.valueOf(clientAnswer));
				} else {
					needRating.setClient((byte)-1);
				}
			} else {
				needRating.setClient((byte)-1);
			}
		} else if("SELF".equals(ocanType)) {
			String clientAnswer = getStaffAnswer("client_"+domainNumber+"_1",ocanStaffFormData);
			if(clientAnswer.length()>0) {
				needRating.setClient(Byte.valueOf(clientAnswer));
			} else {
				needRating.setClient((byte)-1);
			}

		}

		return needRating;
	}
	
	public static NeedRatingSelf convertNeedRating_self(int domainNumber,OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		NeedRatingSelf needRating = NeedRatingSelf.Factory.newInstance();

		if("FULL".equals(ocanType)) {
			
		} else if("SELF".equals(ocanType)) {
			String clientAnswer = getStaffAnswer("client_"+domainNumber+"_1",ocanStaffFormData);
			if(clientAnswer.length()>0) {
				needRating.setClient(Byte.valueOf(clientAnswer));
			} else {
				needRating.setClient((byte)-1);
			}

		}

		return needRating;
	}
	
	public static DomainActions convertDomainActions(String domainNumber,List<OcanStaffFormData> ocanStaffFormData) {
		DomainActions domainActions = DomainActions.Factory.newInstance();

		domainActions.setActionText(getStaffAnswer(domainNumber+"_actions",ocanStaffFormData));
		domainActions.setByWhom(getStaffAnswer(domainNumber+"_by_whom",ocanStaffFormData));
		String reviewDate = getStaffAnswer(domainNumber+"_review_date",ocanStaffFormData);
		reviewDate = reviewDate.concat("Z");
		//domainActions.setReviewDate(getStaffAnswer(domainNumber+"_review_date",ocanStaffFormData));
		domainActions.setReviewDate(reviewDate);
		return domainActions;
	}
	
	public static DomainCommentsFull convertDomainComments(String domainNumber,List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		DomainCommentsFull domainComments = DomainCommentsFull.Factory.newInstance();
		if("FULL".equals(ocanType)) {
			domainComments.setStaff(getStaffAnswer(domainNumber+"_comments",ocanStaffFormData));
			if(getStaffAnswer("consumerSelfAxCompleted",ocanStaffFormData).equals("TRUE")) {
				//if(ocanClientForm != null) {
				//	String clientAnswer = getClientAnswer(domainNumber+"_comments",ocanClientFormData);
				//	if(clientAnswer.length()>0)
				//		domainComments.setClient(clientAnswer);
				//	else
				//		domainComments.setClient("");
				//} else {
				//	domainComments.setClient("");
				//}
				domainComments.setClient(getStaffAnswer("client_"+domainNumber+"_comments",ocanStaffFormData));
			} else {
				domainComments.setClient("");
			}
		} else if("SELF".equals(ocanType)) {
			domainComments.setClient(getStaffAnswer("client_"+domainNumber+"_comments",ocanStaffFormData));
		}

		return domainComments;
	}
	
	public static DomainCommentsSelf convertDomainComments_self(String domainNumber,List<OcanStaffFormData> ocanStaffFormData, OcanClientForm ocanClientForm, List<OcanClientFormData> ocanClientFormData, String ocanType) {
		DomainCommentsSelf domainComments = DomainCommentsSelf.Factory.newInstance();
		if("SELF".equals(ocanType)) {
			domainComments.setClient(getStaffAnswer("client_"+domainNumber+"_comments",ocanStaffFormData));
		}

		return domainComments;
	}
	
	static String getDomainName(int domainNumber) {

		switch(domainNumber) {
		case 1: return "01-accommodation";
		case 2: return "02-food";
		case 3: return "03-looking after the home";
		case 4: return "04-self-care";
		case 5: return "05-daytime activities";
		case 6: return "06-physical health";
		case 7: return "07-psychotic symptoms";
		case 8: return "08-condition and treatment";
		case 9: return "09-psychological distress";
		case 10: return "10-safety to self";
		case 11: return "11-safety to others";
		case 12: return "12-alcohol";
		case 13: return "13-drugs";
		case 14: return "14-other addictions";
		case 15: return "15-company";
		case 16: return "16-intimate relationships";
		case 17: return "17-sexual expression";
		case 18: return "18-childcare";
		case 19: return "19-other dependents";
		case 20: return "20-basic education";
		case 21: return "21-telephone";
		case 22: return "22-transport";
		case 23: return "23-money";
		case 24: return "24-benefits";
		}
		return "";

	}
	
	public static ResidenceType convertResidenceType(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ResidenceType cntgt = ResidenceType.Factory.newInstance();
		cntgt.setValue(ResidenceType.Value.Enum.forString(getStaffAnswer("1_where_live",ocanStaffFormData)));
		cntgt.setOther(getStaffAnswer("1_where_live_other",ocanStaffFormData));
		return cntgt;
	}
	
	public static EducationProgramStatus convertEducationProgramStatus(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		EducationProgramStatus cntgt = EducationProgramStatus.Factory.newInstance();
		cntgt.setValue(EducationProgramStatus.Value.Enum.forString(getStaffAnswer("5_education_program_status",ocanStaffFormData)));
		cntgt.setOther(getStaffAnswer("5_education_program_status_other",ocanStaffFormData));
		return cntgt;
	}
	
	public static DiagnosticList getDiagnosticList(List<OcanStaffFormData> ocanStaffFormData) {
		DiagnosticList diagnosticList = DiagnosticList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("diagnostic_categories",ocanStaffFormData);
		String diagnosticSource = getStaffAnswer("source_diagnosis", ocanStaffFormData);

		List<ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic> mc_list = new ArrayList<ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic diagnostic = ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic.Factory.newInstance();
			diagnostic.setValue(ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic.Value.Enum.forString(itr.next()));
			
			if(!isEmpty(diagnosticSource))
				diagnostic.setSource(ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic.Source.Enum.forString(diagnosticSource));
			
			mc_list.add(diagnostic);
		}
		diagnosticList.setDiagnosticArray(mc_list.toArray(new ca.ehealthontario.ccim.DiagnosticDocument.Diagnostic[answers.size()]));

		return diagnosticList;
	}
	
	public static OtherIllnessList getOtherIllnessList(List<OcanStaffFormData> ocanStaffFormData) {
		OtherIllnessList otherIllnessList = OtherIllnessList.Factory.newInstance();
		List<String> answers = getMultipleStaffAnswer("other_illness",ocanStaffFormData);

		List<OtherIllness> mc_list = new ArrayList<OtherIllness>();
		Iterator<String> itr = answers.iterator();
		while(itr.hasNext()) {
			OtherIllness otherIllness = OtherIllness.Factory.newInstance();
			otherIllness.setValue(OtherIllness.Value.Enum.forString(itr.next()));
			
			mc_list.add(otherIllness);
		}
		otherIllnessList.setOtherIllnessArray(mc_list.toArray(new OtherIllness[answers.size()]));
		return otherIllnessList;
	}
	
	public static SourceOfIncome convertSourceOfIncome(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		SourceOfIncome cntgt = SourceOfIncome.Factory.newInstance();
		cntgt.setValue(SourceOfIncome.Value.Enum.forString(getStaffAnswer("income_source_type",ocanStaffFormData)));
		cntgt.setOther(getStaffAnswer("income_source_type_other",ocanStaffFormData));
		return cntgt;

	}
	
	public static ClientDOB convertClientDOB(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientDOB clientDOB = ClientDOB.Factory.newInstance();
		String dob = ocanStaffForm.getDateOfBirth();
		dob = dob.concat("Z");
		clientDOB.setValue(dob);
		clientDOB.setType(ClientDOB.Type.Enum.forString(getStaffAnswer("clientDOBType",ocanStaffFormData)));
		return clientDOB;
	}
	
	public static ServiceUseRecordList convertServiceUseRecordList(List<OcanStaffFormData> ocanStaffFormData) {
		ServiceUseRecordList serviceUseRecordList = ServiceUseRecordList.Factory.newInstance();

		int numberOfCenter = Integer.valueOf(getStaffAnswer("center_count",ocanStaffFormData));

		List<ServiceUseRecord> serviceUseRecord_list = new ArrayList<ServiceUseRecord>();
		for(int x=0;x<numberOfCenter;x++) {
			ServiceUseRecord serviceUseRecord = getServiceUseRecord(x+1,ocanStaffFormData);
			serviceUseRecord_list.add(serviceUseRecord);
		}
		serviceUseRecordList.setServiceUseRecordArray(serviceUseRecord_list.toArray(new ServiceUseRecord[serviceUseRecord_list.size()]));

		return serviceUseRecordList;
	}
	
	public static ServiceUseRecord getServiceUseRecord(int index, List<OcanStaffFormData> ocanStaffFormData) {
		String indexString = String.valueOf(index);
		ServiceUseRecord serviceUseRecord = ServiceUseRecord.Factory.newInstance();
		serviceUseRecord.setOCANLead(ca.ehealthontario.ccim.OCANLeadDocument.OCANLead.Enum.forString(getStaffAnswer("serviceUseRecord_OCANLead"+indexString,ocanStaffFormData)));
		serviceUseRecord.setStaffWorker(convertStaffWorker(indexString,ocanStaffFormData));
		serviceUseRecord.setServiceOrg(convertServiceOrg(indexString,ocanStaffFormData));
		serviceUseRecord.setProgram(convertProgram(indexString,ocanStaffFormData));
		serviceUseRecord.setMISFunction(convertMISFunction(indexString,ocanStaffFormData));
		serviceUseRecord.setServiceDeliveryLHIN(ca.ehealthontario.ccim.LHINListType.Enum.forString(getStaffAnswer("serviceUseRecord_service_delivery_lhin"+indexString,ocanStaffFormData)));
		
		ca.ehealthontario.ccim.ReferralSourceDocument.ReferralSource referralSource = ca.ehealthontario.ccim.ReferralSourceDocument.ReferralSource.Factory.newInstance();
		referralSource.setValue(ca.ehealthontario.ccim.ReferralSourceDocument.ReferralSource.Value.Enum.forString(getStaffAnswer("serviceUseRecord_source_of_referral"+indexString,ocanStaffFormData)));
		referralSource.setOther(getStaffAnswer("serviceUseRecord_source_of_referralother"+indexString,ocanStaffFormData));
		serviceUseRecord.setReferralSource(referralSource);
		
		serviceUseRecord.setRequestForServiceDate(getStaffAnswer("serviceUseRecord_requestForServiceDate"+indexString,ocanStaffFormData));
		serviceUseRecord.setServiceDecisionDate(getStaffAnswer("serviceUseRecord_serviceDecisionDate"+indexString,ocanStaffFormData));
		serviceUseRecord.setAccepted(ca.ehealthontario.ccim.AcceptedDocument.Accepted.Enum.forString(getStaffAnswer("serviceUseRecord_accepted"+indexString,ocanStaffFormData)));
		serviceUseRecord.setServiceInitiationDate(getStaffAnswer("serviceUseRecord_serviceInitiationDate"+indexString,ocanStaffFormData));
		serviceUseRecord.setExitDate(getStaffAnswer("serviceUseRecord_exitDate"+indexString,ocanStaffFormData));
		serviceUseRecord.setExitDisposition(ca.ehealthontario.ccim.ExitDispositionDocument.ExitDisposition.Enum.forString(getStaffAnswer("serviceUseRecord_exitDisposition"+indexString,ocanStaffFormData)));
		return serviceUseRecord;
	}
	
	public static StaffWorker convertStaffWorker(String index,List<OcanStaffFormData> ocanStaffFormData) {
		StaffWorker staffWorker = StaffWorker.Factory.newInstance();
		staffWorker.setName(getStaffAnswer("serviceUseRecord_staffWorker"+index,ocanStaffFormData));
		staffWorker.setPhoneNumber(getStaffAnswer("serviceUseRecord_phoneNumber"+index,ocanStaffFormData));
		staffWorker.setExtension(getStaffAnswer("serviceUseRecord_ext"+index,ocanStaffFormData));
		return staffWorker;
	}
	
	public static ServiceOrg convertServiceOrg(String index,List<OcanStaffFormData> ocanStaffFormData) {
		ServiceOrg serviceOrg = ServiceOrg.Factory.newInstance();
		serviceOrg.setLHIN(ca.ehealthontario.ccim.LHINListType.Enum.forString(getStaffAnswer("serviceUseRecord_orgLHIN"+index,ocanStaffFormData)));

		//serviceOrg.setName(getStaffAnswer("serviceUseRecord_orgName"+index,ocanStaffFormData));
		String optionId = getStaffAnswer("serviceUseRecord_orgName"+index,ocanStaffFormData);
		ocanConnexOptionDao.findByID(Integer.valueOf(optionId));
		serviceOrg.setName(ocanConnexOptionDao.findByID(Integer.valueOf(optionId)).getOrgName());

		serviceOrg.setNumber(getStaffAnswer("serviceUseRecord_orgNumber"+index,ocanStaffFormData));
		serviceOrg.setNameOther(getStaffAnswer("serviceUseRecord_orgNameOther"+index,ocanStaffFormData));
		serviceOrg.setNumberOther(getStaffAnswer("serviceUseRecord_orgNumberOther"+index,ocanStaffFormData));
		return serviceOrg;
	}
	
	public static Program convertProgram(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		Admission admission = admissionDao.getAdmission(ocanStaffForm.getAdmissionId());
		Program program = Program.Factory.newInstance();
		program.setName(admission.getProgramName());
		program.setNumber(String.valueOf(admission.getProgramId()));
		return program;
	}
	
	public static Program convertProgram(String index, List<OcanStaffFormData> ocanStaffFormData) {
		Program program = Program.Factory.newInstance();
		//program.setName(getStaffAnswer("admissionId",ocanStaffFormData));
		program.setName(getStaffAnswer("serviceUseRecord_programName"+index,ocanStaffFormData));
		program.setNumber(getStaffAnswer("serviceUseRecord_programNumber"+index,ocanStaffFormData));
		program.setNameOther(getStaffAnswer("serviceUseRecord_programNameOther"+index,ocanStaffFormData));
		program.setNumberOther(getStaffAnswer("serviceUseRecord_programNumberOther"+index,ocanStaffFormData));
		return program;
	}
	
	public static MISFunction convertMISFunction(String index,List<OcanStaffFormData> ocanStaffFormData) {
		MISFunction mISFunction = MISFunction.Factory.newInstance();
		mISFunction.setValue(ca.ehealthontario.ccim.MISFunctionListType.Enum.forString(getStaffAnswer("serviceUseRecord_functionName"+index,ocanStaffFormData)));
		mISFunction.setNameOther(getStaffAnswer("serviceUseRecord_functionNameOther"+index,ocanStaffFormData));
		mISFunction.setNumberOther(getStaffAnswer("serviceUseRecord_functionNumberOther"+index,ocanStaffFormData));
		mISFunction.setSubFunction(getStaffAnswer("serviceUseRecord_functionNumber"+index,ocanStaffFormData));
		return mISFunction;
	}
	
	public static ClientCapacity convertClientCapacity(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		ClientCapacity clientCapacity = ClientCapacity.Factory.newInstance();

		clientCapacity.setPowerAttorneyProperty(convertPowerAttorneyProperty(ocanStaffFormData));
		clientCapacity.setPowerAttorneyPersonalCare(convertPowerAttorneyPersonalCare(ocanStaffFormData));
		clientCapacity.setLegalGuardian(convertLegalGuardian(ocanStaffFormData));
		clientCapacity.setAreasOfConcern(convertAreasOfConcern(ocanStaffFormData));

		return clientCapacity;
	}
	
	public static PowerAttorneyProperty convertPowerAttorneyProperty(List<OcanStaffFormData> ocanStaffFormData) {
		PowerAttorneyProperty powerAttorneyProperty = PowerAttorneyProperty.Factory.newInstance();

		powerAttorneyProperty.setProperty(PowerAttorneyProperty.Property.Enum.forString(getStaffAnswer("power_attorney_property",ocanStaffFormData)));
		powerAttorneyProperty.setName(getStaffAnswer("power_attorney_property_name",ocanStaffFormData));
		powerAttorneyProperty.setAddress(getStaffAnswer("power_attorney_property_address",ocanStaffFormData));
		powerAttorneyProperty.setPhoneNumber(getStaffAnswer("power_attorney_property_phone",ocanStaffFormData));
		powerAttorneyProperty.setExtension(getStaffAnswer("power_attorney_property_phoneExt",ocanStaffFormData));
		return powerAttorneyProperty;
	}
	
	public static PowerAttorneyPersonalCare convertPowerAttorneyPersonalCare(List<OcanStaffFormData> ocanStaffFormData) {
		PowerAttorneyPersonalCare powerAttorneyPersonalCare = PowerAttorneyPersonalCare.Factory.newInstance();
		powerAttorneyPersonalCare.setPersonalCare(PowerAttorneyPersonalCare.PersonalCare.Enum.forString(getStaffAnswer("power_attorney_personal_care",ocanStaffFormData)));
		powerAttorneyPersonalCare.setName(getStaffAnswer("power_attorney_personal_care_name",ocanStaffFormData));
		powerAttorneyPersonalCare.setAddress(getStaffAnswer("power_attorney_personal_care_address",ocanStaffFormData));
		powerAttorneyPersonalCare.setPhoneNumber(getStaffAnswer("power_attorney_personal_care_phone",ocanStaffFormData));
		powerAttorneyPersonalCare.setExtension(getStaffAnswer("power_attorney_personal_care_phoneExt",ocanStaffFormData));
		return powerAttorneyPersonalCare;
	}
	
	public static LegalGuardian convertLegalGuardian(List<OcanStaffFormData> ocanStaffFormData) {
		LegalGuardian legalGuardian = LegalGuardian.Factory.newInstance();

		legalGuardian.setGuardian(LegalGuardian.Guardian.Enum.forString(getStaffAnswer("court_appointed_guardian",ocanStaffFormData)));
		legalGuardian.setName(getStaffAnswer("guardian_name",ocanStaffFormData));
		legalGuardian.setAddress(getStaffAnswer("guardian_address",ocanStaffFormData));
		legalGuardian.setPhoneNumber(getStaffAnswer("guardian_phone",ocanStaffFormData));
		legalGuardian.setExtension(getStaffAnswer("guardian_phoneExt",ocanStaffFormData));
		return legalGuardian;
	}
	
	public static AreasOfConcern convertAreasOfConcern(List<OcanStaffFormData> ocanStaffFormData) {
		AreasOfConcern areasOfConcern = AreasOfConcern.Factory.newInstance();
		areasOfConcern.setFinanceProperty(AreasOfConcern.FinanceProperty.Enum.forString(getStaffAnswer("financeProperty",ocanStaffFormData)));
		areasOfConcern.setTreatmentDecisions(AreasOfConcern.TreatmentDecisions.Enum.forString(getStaffAnswer("treatmentDecisions",ocanStaffFormData)));
		return areasOfConcern;
	}
	
	public static AgeOnsetMental convertAgeOnsetMental(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		AgeOnsetMental ageOnsetMental = AgeOnsetMental.Factory.newInstance();

		if(!"".equals(getStaffAnswer("ageOnsetMental_year",ocanStaffFormData)))
			ageOnsetMental.setYears(BigInteger.valueOf(Long.valueOf(getStaffAnswer("ageOnsetMental_year",ocanStaffFormData)).longValue()));

		ageOnsetMental.setAgeType(AgeOnsetMental.AgeType.Enum.forString(getStaffAnswer("ageTypeOnsetMental",ocanStaffFormData)));

		return ageOnsetMental;
	}
	
	public static AgeHospitalization convertAgeHospitalization(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		AgeHospitalization ageHospitalization = AgeHospitalization.Factory.newInstance();
		if("".equals(getStaffAnswer("ageTypeHospitalization",ocanStaffFormData))) {
			return ageHospitalization;
		}

		if(!"".equals(getStaffAnswer("ageHospitalization_year",ocanStaffFormData)))
			ageHospitalization.setYears(BigInteger.valueOf(Long.valueOf(getStaffAnswer("ageHospitalization_year",ocanStaffFormData)).longValue()));

		ageHospitalization.setAgeType(AgeHospitalization.AgeType.Enum.forString(getStaffAnswer("ageTypeHospitalization",ocanStaffFormData)));

		return ageHospitalization;
	}
	
	public static FirstEntryDate convertFirstEntryDate(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		FirstEntryDate firstEntryDate = FirstEntryDate.Factory.newInstance();
		if("".equals(getStaffAnswer("firstEntryDateType",ocanStaffFormData))) {
			return firstEntryDate;
		}
		if(!"".equals(getStaffAnswer("year_firstEntryDate",ocanStaffFormData)))
			firstEntryDate.setEntryYear(BigInteger.valueOf(Long.valueOf(getStaffAnswer("year_firstEntryDate",ocanStaffFormData)).longValue()));


		if(!"".equals(getStaffAnswer("month_firstEntryDate",ocanStaffFormData)))
			firstEntryDate.setEntryMonth(Integer.valueOf(getStaffAnswer("month_firstEntryDate",ocanStaffFormData)).intValue());

		firstEntryDate.setAgeType(FirstEntryDate.AgeType.Enum.forString(getStaffAnswer("firstEntryDateType",ocanStaffFormData)));

		return firstEntryDate;
	}
	
	public static TimeLivedInCanada convertTimeLivedInCanada(OcanStaffForm ocanStaffForm, List<OcanStaffFormData> ocanStaffFormData) {
		TimeLivedInCanada timeLivedInCanada = TimeLivedInCanada.Factory.newInstance();
		//String years = getStaffAnswer("years_in_canada",ocanStaffFormData);
		//String months = getStaffAnswer("months_in_canada",ocanStaffFormData);
		
		String year_arrived_in_canada = getStaffAnswer("year_arrived_in_canada",ocanStaffFormData);
		String born_in_canada = getStaffAnswer("born_in_canada",ocanStaffFormData);
		
		/*if(years!=null && years.length()>0) {
			timeLivedInCanada.setYears(new BigInteger(years));
		}
		if(months!=null && months.length()>0) {
			timeLivedInCanada.setMonths(new BigInteger(months));
		}*/
		
		if(!isEmpty(year_arrived_in_canada)){
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			String year_arrived_in_canada_str = "01/01"+year_arrived_in_canada;
			
			try {
				Calendar year_arrived_in_canada_obj = convertToOcanXmlCalendar(formatter1.parse(year_arrived_in_canada_str));
				timeLivedInCanada.setArrivalYear(year_arrived_in_canada_obj);
				
			} catch (Exception e) {
				logger.error("error in convertTimeLivedInCanada.. "+e.getMessage(), e);
			}
		}
		
		if(!isEmpty(born_in_canada)) {
			timeLivedInCanada.setBornInCanada(ca.ehealthontario.ccim.TimeLivedInCanadaDocument.TimeLivedInCanada.BornInCanada.Enum.forString(born_in_canada));
		}
		
		return timeLivedInCanada;
	}
}
