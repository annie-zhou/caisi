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
 * LabPDFCreator.java
 *
 * Created on November 27, 2007, 9:43 AM
 *
 */

package oscar.oscarLab.ca.all.pageUtil;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.oscarehr.common.dao.Hl7TextMessageDao;
import org.oscarehr.common.model.Hl7TextMessage;
import org.oscarehr.util.SpringUtils;

import oscar.OscarProperties;
import oscar.oscarLab.ca.all.Hl7textResultsData;
import oscar.oscarLab.ca.all.parsers.Factory;
import oscar.oscarLab.ca.all.parsers.MessageHandler;
import oscar.util.UtilDateUtilities;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.ExceptionConverter;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfWriter;

/**
 *
 * @author wrighd
 */
public class LabPDFCreator extends PdfPageEventHelper{
    private OutputStream os;

    private boolean ackFlag = false;
    private MessageHandler handler;
    private int versionNum;
    private String[] multiID;
    private String id;

    private Document document;
    private BaseFont bf;
    private Font font;
    private Font boldFont;
    private Font redFont;
    private String dateLabReceived;

    public static byte[] getPdfBytes(String segmentId, String providerNo) throws IOException, DocumentException
    {
    	ByteArrayOutputStream baos=new ByteArrayOutputStream();

    	LabPDFCreator labPDFCreator=new LabPDFCreator(baos, segmentId, providerNo);
    	labPDFCreator.printPdf();

    	return(baos.toByteArray());
    }

    /** Creates a new instance of LabPDFCreator */
    public LabPDFCreator(HttpServletRequest request, OutputStream os) {
    	this(os, (request.getParameter("segmentID")!=null?request.getParameter("segmentID"):(String)request.getAttribute("segmentID")), (request.getParameter("providerNo")!=null?request.getParameter("providerNo"):(String)request.getAttribute("providerNo")));
    }

    public LabPDFCreator(OutputStream os, String segmentId, String providerNo) {
        this.os = os;
        this.id = segmentId;

      //Need date lab was received by OSCAR
        Hl7TextMessageDao hl7TxtMsgDao = (Hl7TextMessageDao)SpringUtils.getBean("hl7TextMessageDao");
        Hl7TextMessage hl7TextMessage = hl7TxtMsgDao.find(Integer.parseInt(segmentId));
        java.util.Date date = hl7TextMessage.getCreated();
        String stringFormat = "yyyy-MM-dd HH:mm";
        dateLabReceived = UtilDateUtilities.DateToString(date, stringFormat);

        // create handler
        this.handler = Factory.getHandler(id);

        // determine lab version
        String multiLabId = Hl7textResultsData.getMatchingLabs(id);
        this.multiID = multiLabId.split(",");

        int i=0;
        while (!multiID[i].equals(id)){
            i++;
        }
        this.versionNum = i+1;

    }

    public void printPdf() throws IOException, DocumentException{

        // check that we have data to print
        if (handler == null)
            throw new DocumentException();

        //response.setContentType("application/pdf");  //octet-stream
        //response.setHeader("Content-Disposition", "attachment; filename=\""+handler.getPatientName().replaceAll("\\s", "_")+"_LabReport.pdf\"");

        //Create the document we are going to write to
        document = new Document();
        //PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        PdfWriter writer = PdfWriter.getInstance(document, os);

        //Set page event, function onEndPage will execute each time a page is finished being created
        writer.setPageEvent(this);

        document.setPageSize(PageSize.LETTER);
        document.addTitle("Title of the Document");
        document.addCreator("OSCAR");
        document.open();

        //Create the fonts that we are going to use
        bf = BaseFont.createFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        font = new Font(bf, 9, Font.NORMAL);
        boldFont = new Font(bf, 10, Font.BOLD);
        redFont = new Font(bf, 9, Font.NORMAL, Color.RED);

        // add the header table containing the patient and lab info to the document
        createInfoTable();

        // add the tests and test info for each header
        ArrayList<String> headers = handler.getHeaders();
        for (int i=0; i < headers.size(); i++)
            addLabCategory( headers.get(i));

        // add end of report table
        PdfPTable table = new PdfPTable(1);
        table.setWidthPercentage(100);
        PdfPCell cell = new PdfPCell();
        cell.setBorder(0);
        cell.setPhrase(new Phrase("  "));
        table.addCell(cell);
        cell.setBorder(15);
        cell.setBackgroundColor(new Color(210, 212, 255));
        cell.setPhrase(new Phrase("END OF REPORT", boldFont));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
        document.add(table);

        document.close();

        os.flush();
    }


    /*
	 * Given the name of a lab category this method will add the category
	 * header, the test result headers and the test results for that category.
	 */
	private void addLabCategory(String header) throws DocumentException {

		float[] mainTableWidths = { 5f, 3f, 1f, 3f, 2f, 4f, 2f };
		PdfPTable table = new PdfPTable(mainTableWidths);
		table.setHeaderRows(3);
		table.setWidthPercentage(100);

		PdfPCell cell = new PdfPCell();
		// category name
		cell.setPadding(3);
		cell.setPhrase(new Phrase("  "));
		cell.setBorder(0);
		cell.setColspan(7);
		table.addCell(cell);
		cell.setBorder(15);
		cell.setPadding(3);
		cell.setColspan(2);
		cell.setPhrase(new Phrase(header.replaceAll("<br\\s*/*>", "\n"),
				new Font(bf, 12, Font.BOLD)));
		table.addCell(cell);
		cell.setPhrase(new Phrase("  "));
		cell.setBorder(0);
		cell.setColspan(5);
		table.addCell(cell);

		// table headers
		cell.setColspan(1);
		cell.setBorder(15);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setBackgroundColor(new Color(210, 212, 255));
		cell.setPhrase(new Phrase("Test Name(s)", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Result", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Abn", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Reference Range", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Units", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Date/Time Completed", boldFont));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Status", boldFont));
		table.addCell(cell);

		// add test results
		int obrCount = handler.getOBRCount();
		int linenum = 0;
		cell.setBorder(12);
		cell.setBorderColor(Color.BLACK); // cell.setBorderColor(Color.WHITE);
		cell.setBackgroundColor(new Color(255, 255, 255));

		if (handler.getMsgType().equals("MEDVUE")) {

			//cell.setBackgroundColor(getHighlightColor(linenum));
			linenum++;
			cell.setPhrase(new Phrase(handler.getRadiologistInfo(), boldFont));
			cell.setColspan(7);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(cell);
			cell.setPaddingLeft(100);
			cell.setColspan(7);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setPhrase(new Phrase(handler.getOBXComment(1, 1, 1)
					.replaceAll("<br\\s*/*>", "\n"), font));
			table.addCell(cell);

		} else {
			for (int j = 0; j < obrCount; j++) {
				boolean obrFlag = false;
				int obxCount = handler.getOBXCount(j);
				for (int k = 0; k < obxCount; k++) {
					String obxName = handler.getOBXName(j, k);
					
					if (!handler.getOBXResultStatus(j, k).equals("TDIS")) {

						// ensure that the result is a real result
						if ((!handler.getOBXResultStatus(j, k).equals("DNS")
								&& !obxName.equals("")
								&& handler.getObservationHeader(j, k).equals(
										header)) || 
								(handler.getMsgType().equals("EPSILON") && handler.getOBXIdentifier(j,k).equals(header) && !obxName.equals("")) 
								|| (handler.getMsgType().equals("PFHT") && !obxName.equals("") && handler.getObservationHeader(j,k).equals(header))) { // <<-- DNS only needed for
													// MDS messages
							String obrName = handler.getOBRName(j);

							// add the obrname if necessary
							if (!obrFlag
									&& !obrName.equals("")
									&& !(obxName.contains(obrName) && obxCount < 2)) {
								// cell.setBackgroundColor(getHighlightColor(linenum));
								linenum++;
								cell.setPhrase(new Phrase(obrName, boldFont));
								cell.setColspan(7);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								table.addCell(cell);
								cell.setColspan(1);
								obrFlag = true;
							}

							// add the obx results and info
							Font lineFont = new Font(bf, 8, Font.NORMAL,
									getTextColor(handler.getOBXAbnormalFlag(j,
											k)));
							// cell.setBackgroundColor(getHighlightColor(linenum));
							linenum++;
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setPhrase(new Phrase((obrFlag ? "   " : "")
									+ obxName, lineFont));
							table.addCell(cell);
							cell.setPhrase(new Phrase(handler
									.getOBXResult(j, k).replaceAll(
											"<br\\s*/*>", "\n"), lineFont));
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							table.addCell(cell);
							cell.setHorizontalAlignment(Element.ALIGN_CENTER);
							cell.setPhrase(new Phrase(
									(handler.isOBXAbnormal(j, k) ? handler
											.getOBXAbnormalFlag(j, k) : "N"),
									lineFont));
							table.addCell(cell);
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setPhrase(new Phrase(handler
									.getOBXReferenceRange(j, k), lineFont));
							table.addCell(cell);
							cell.setPhrase(new Phrase(
									handler.getOBXUnits(j, k), lineFont));
							table.addCell(cell);
							cell.setHorizontalAlignment(Element.ALIGN_CENTER);
							cell.setPhrase(new Phrase(handler
									.getTimeStamp(j, k), lineFont));
							table.addCell(cell);
							cell.setPhrase(new Phrase(handler
									.getOBXResultStatus(j, k), lineFont));
							table.addCell(cell);
							
						if(!handler.getMsgType().equals("PFHT")) {
							// add obx comments
							if (handler.getOBXCommentCount(j, k) > 0) {
								// cell.setBackgroundColor(getHighlightColor(linenum));
								linenum++;
								cell.setPaddingLeft(100);
								cell.setColspan(7);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								for (int l = 0; l < handler.getOBXCommentCount(
										j, k); l++) {

									cell.setPhrase(new Phrase(handler
											.getOBXComment(j, k, l).replaceAll(
													"<br\\s*/*>", "\n"), font));
									table.addCell(cell);

								}
								cell.setPadding(3);
								cell.setColspan(1);
							}
						}
						// if (DNS)
						} else if ((handler.getMsgType().equals("EPSILON") && handler.getOBXIdentifier(j,k).equals(header) && obxName.equals("")) || (handler.getMsgType().equals("PFHT") && obxName.equals("")&& handler.getObservationHeader(j,k).equals(header))){
							// cell.setBackgroundColor(getHighlightColor(linenum));
							linenum++;
							cell.setPaddingLeft(100);
							cell.setColspan(7);
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setPhrase(new Phrase(handler
									.getOBXResult(j, k).replaceAll(
											"<br\\s*/*>", "\n"), font));
							table.addCell(cell);
							cell.setPadding(3);
							cell.setColspan(1);
						
						}
						if (handler.getMsgType().equals("PFHT") && !handler.getNteForOBX(j,k).equals("") && handler.getNteForOBX(j,k)!=null) {
							// cell.setBackgroundColor(getHighlightColor(linenum));
							linenum++;
							cell.setPaddingLeft(100);
							cell.setColspan(7);
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setPhrase(new Phrase(handler.getNteForOBX(j, k).replaceAll("<br\\s*/*>", "\n"),font));
							table.addCell(cell);
							cell.setPadding(3);
							cell.setColspan(1);
							
							if (handler.getOBXCommentCount(j, k) > 0) {
								// cell.setBackgroundColor(getHighlightColor(linenum));
								linenum++;
								cell.setPaddingLeft(100);
								cell.setColspan(7);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								for (int l = 0; l < handler.getOBXCommentCount(
										j, k); l++) {

									cell.setPhrase(new Phrase(handler
											.getOBXComment(j, k, l).replaceAll(
													"<br\\s*/*>", "\n"), font));
									table.addCell(cell);

								}
								cell.setPadding(3);
								cell.setColspan(1);
							}
						}
					} else {
						if (handler.getOBXCommentCount(j, k) > 0) {
							// cell.setBackgroundColor(getHighlightColor(linenum));
							linenum++;
							cell.setPaddingLeft(100);
							cell.setColspan(7);
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							for (int l = 0; l < handler
									.getOBXCommentCount(j, k); l++) {

								cell.setPhrase(new Phrase(handler
										.getOBXComment(j, k, l).replaceAll(
												"<br\\s*/*>", "\n"), font));
								table.addCell(cell);

							}
							cell.setPadding(3);
							cell.setColspan(1);
						}
					} // if (!handler.getOBXResultStatus(j, k).equals("TDIS"))

				}
				
			if (!handler.getMsgType().equals("PFHT")) {
				// add obr comments
				if (handler.getObservationHeader(j, 0).equals(header)) {
					cell.setColspan(7);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					for (int k = 0; k < handler.getOBRCommentCount(j); k++) {
						// the obrName should only be set if it has not been
						// set already which will only have occured if the
						// obx name is "" or if it is the same as the obr name
						if (!obrFlag && handler.getOBXName(j, 0).equals("")) {
							// cell.setBackgroundColor(getHighlightColor(linenum));
							linenum++;

							cell.setPhrase(new Phrase(handler.getOBRName(j),
									boldFont));
							table.addCell(cell);
							obrFlag = true;
						}

						// cell.setBackgroundColor(getHighlightColor(linenum));
						linenum++;
						cell.setPaddingLeft(100);
						cell.setPhrase(new Phrase(handler.getOBRComment(j, k)
								.replaceAll("<br\\s*/*>", "\n"), font));
						table.addCell(cell);
						cell.setPadding(3);
					}
					cell.setColspan(1);
				}
			}
			} // for (j)

		}// if (isMEDVUE)

		document.add(table);

	}


    /*
     *  getTextColor will return the the color corresponding to the abnormal
     *  status of the result.
     */
    private Color getTextColor(String abn){
        Color ret = Color.BLACK;
        if ( abn != null && ( abn.equals("A") || abn.startsWith("H")) ){
            ret = Color.RED;
        }else if ( abn != null && abn.startsWith("L")){
            ret = Color.BLUE;
        }
        return ret;
    }


    /*
     *  getHighlightColor will return the background color of the current result
     *  line, this is determined by the line number
     */
    private Color getHighlightColor(int linenum){
        Color ret = new Color(225,225,255);
        if ((linenum % 2) == 1)
            ret = new Color(245,245,255);

        return ret;
    }

    /*
     *  createInfoTable creates and adds the table at the top of the document
     *  which contains the patient and lab information
     */
    private void createInfoTable() throws DocumentException{

        //Create patient info table
        PdfPCell cell = new PdfPCell();
        cell.setBorder(0);
        float[] pInfoWidths = {2f, 4f, 3f, 2f};
        PdfPTable pInfoTable = new PdfPTable(pInfoWidths);
        cell.setPhrase(new Phrase("Patient Name: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getPatientName(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Home Phone: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getHomePhone(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Date of Birth: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getDOB(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Work Phone: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getWorkPhone(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Age: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getAge(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Sex: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getSex(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Health #: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getHealthNum(), font));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Patient Location: ", boldFont));
        pInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getPatientLocation(), font));
        pInfoTable.addCell(cell);

        //Create results info table
        PdfPTable rInfoTable = new PdfPTable(2);
        cell.setPhrase(new Phrase("Date of Service: ", boldFont));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getServiceDate(), font));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Date Received: ", boldFont));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(dateLabReceived, font));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Report Status: ", boldFont));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase((handler.getOrderStatus().equals("F") ? "Final" : (handler.getOrderStatus().equals("C") ? "Corrected" : "Partial")), font));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Client Ref. #: ", boldFont));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getClientRef(), font));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase("Accession #: ", boldFont));
        rInfoTable.addCell(cell);
        cell.setPhrase(new Phrase(handler.getAccessionNum(), font));
        rInfoTable.addCell(cell);

        //Create client table
        float[] clientWidths = {2f, 3f};
        Phrase clientPhrase = new Phrase();
        PdfPTable clientTable = new PdfPTable(clientWidths);
        clientPhrase.add(new Chunk("Requesting Client:  ", boldFont));
        clientPhrase.add(new Chunk(handler.getDocName(), font));
        cell.setPhrase(clientPhrase);
        clientTable.addCell(cell);

        clientPhrase = new Phrase();
        clientPhrase.add(new Chunk("cc: Client:  ", boldFont));
        clientPhrase.add(new Chunk(handler.getCCDocs(), font));
        cell.setPhrase(clientPhrase);
        clientTable.addCell(cell);

        //Create header info table
        float[] tableWidths = {2f, 1f};
        PdfPTable table = new PdfPTable(tableWidths);
        if (multiID.length > 1){
            cell = new PdfPCell(new Phrase("Version: "+versionNum+" of "+multiID.length, boldFont));
            cell.setBackgroundColor(new Color(210, 212, 255));
            cell.setPadding(3);
            cell.setColspan(2);
            table.addCell(cell);
        }
        cell = new PdfPCell(new Phrase("Detail Results: Patient Info", boldFont));
        cell.setBackgroundColor(new Color(210, 212, 255));
        cell.setPadding(3);
        table.addCell(cell);
        cell.setPhrase(new Phrase("Results Info", boldFont));
        table.addCell(cell);

        // add the created tables to the document
        table = addTableToTable(table, pInfoTable, 1);
        table = addTableToTable(table, rInfoTable, 1);
        table = addTableToTable(table, clientTable, 2);

        table.setWidthPercentage(100);

        document.add(table);
    }

    /*
     *  addTableToTable(PdfPTable main, PdfPTable add) adds the table 'add' as
     *  a cell spanning 'colspan' columns to the table main.
     */
    private PdfPTable addTableToTable(PdfPTable main, PdfPTable add, int colspan){
        PdfPCell cell = new PdfPCell(add);
        cell.setPadding(3);
        cell.setColspan(colspan);
        main.addCell(cell);
        return main;
    }


    /*
     *  onEndPage is a page event that occurs when a page has finished being created.
     *  It is used to add header and footer information to each page.
     */
    public void onEndPage(PdfWriter writer, Document document){
        try {

            Rectangle page = document.getPageSize();
            PdfContentByte cb = writer.getDirectContent();
            BaseFont bf = BaseFont.createFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            int pageNum = document.getPageNumber();
            float width = page.getWidth();
            float height = page.getHeight();

            //add patient name header for every page but the first.
            if (pageNum > 1){
                cb.beginText();
                cb.setFontAndSize(bf, 8);
                cb.showTextAligned(PdfContentByte.ALIGN_RIGHT, handler.getPatientName(), 575, height - 30, 0);
                cb.endText();

            }

            //add footer for every page
            cb.beginText();
            cb.setFontAndSize(bf, 8);
            cb.showTextAligned(PdfContentByte.ALIGN_CENTER, "-"+pageNum+"-", width/2, 30, 0);
            cb.endText();


            // add promotext as footer if it is enabled
            if ( OscarProperties.getInstance().getProperty("FORMS_PROMOTEXT") != null){
                cb.beginText();
                cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA,BaseFont.CP1252,BaseFont.NOT_EMBEDDED), 6);
                cb.showTextAligned(PdfContentByte.ALIGN_CENTER, OscarProperties.getInstance().getProperty("FORMS_PROMOTEXT"), width/2, 19, 0);
                cb.endText();
            }

        // throw any exceptions
        } catch (Exception e) {
            throw new ExceptionConverter(e);
        }
    }
}
