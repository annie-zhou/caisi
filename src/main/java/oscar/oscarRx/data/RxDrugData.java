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


package oscar.oscarRx.data;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Vector;

import org.oscarehr.common.model.Allergy;
import org.oscarehr.util.MiscUtils;

import oscar.oscarRx.util.RxDrugRef;

public class RxDrugData {

    public void suggestAlias(String alias,String aliasComment,String id,String name,String provider) throws Exception{
        RxDrugRef d = new RxDrugRef();
        d.suggestAlias(alias,aliasComment,id,name,provider);
    }


    public class DrugMonograph{


          public String name;        // : string. International nonproprietary name (INPN) of this drug (=generic)
          public String atc;         //: string. ATC code
          public String regionalIdentifier;
          //     generics : struct. Lists all generic components (usually just one). Key (string) is the generic name, value (integer) is the repective primary key
          public boolean essential;  //: True if this drug is on the WHO essential drug list
          public String product;     //: string. If this drug is not a generic, the product brand name is listed under this key, else this key is not available
          public String action;      //: string. Description of mode of action.
          public Vector indications; //: array of Indications. Each struct has indication as key, and a struct as value containing the following keys:
          public Vector components = new Vector();

          public Vector contraindications; //: array of contraindications. Each struct has contraindication as key, and a struct as value containing the following keys:

          public String[] practice_points; //: array of strings
          public String paediatric_use; //:  string. Describing special considerations in paediatric use

          public String[] common_adverse_effects; //: array of strings
          public String[] rare_adverse_effects;   //: array of strings
          public Vector dosage; //array of Dosage
          public String drugForm;//drug form
          public Vector route = new Vector();//route for taking drug


          public PregnancyUse pregnancyUse;
          public LactationUse lactationUse;
          public RenalImpairment renalImpairment;
          public HepaticImpairment hepaticImpairment;



          public DrugMonograph(){};

          public DrugMonograph(Hashtable hash){
              MiscUtils.getLogger().debug(hash);
              name    = (String) hash.get("name");
              atc     = (String) hash.get("atc");
              product = (String) hash.get("product");
              regionalIdentifier = (String) hash.get("regional_identifier");
              drugForm = (String)hash.get("drugForm");
              Vector drugRoute=(Vector)hash.get("drugRoute");
              if(drugRoute!=null){
                  for (int i=0;i<drugRoute.size();i++){
                      String r=(String)drugRoute.get(i);

                      route.add(r);
                  }
              }
              Vector comps    = (Vector) hash.get("components");
              for (int i = 0; i < comps.size(); i++){
                Hashtable h = (Hashtable) comps.get(i);
                DrugComponent comp = new DrugComponent(h);
                components.add(comp);
              }
               //{name=WARFARIN SODIUM, regional_identifier=02007959, product=COUMADIN TAB 4MG, atc=808774}
      }


          class Contraindications{
            int code;          // integer. Drugref condition code primary key.
            int severity;      // : integer (1-3, 3 being absolute contraindication)
            String comment;    // : string
          }
          class Indications{
             int code;         // : integer. Drugref condition code primary key
             boolean firstline;// : boolean. True if for this indication this drug is considered a first line treatment.
             String comment;   // : string
          }
          class PregnancyUse{    //: struct with following keys:
            char   code;    // : character. ADEC category
            String comment; // : string
          }
          class LactationUse{  //: struct with following keys:
            int code;          // : integer. 1=compatible, 2=restricted, 3=dangerous
            String comment;    // : string
          }
          class RenalImpairment{ //: struct with following keys:
            int code;            // : integer. 1=compatible, 2=restricted, 3=dangerous
            String comment;      // : string
          }
          class HepaticImpairment{ //: struct with following keys:
            int code;              //: integer. 1=compatible, 2=restricted, 3=dangerous
            String comment;        // : string
          }
          class Dosage{
            String text;//: string. If this key is available, only free text dosage information is available, as described in this string.
            int indication; // : integer. Drugref condition code primary key. 0 is wild card, indicating general dosage recommendation.
            String units;   //: string. SI unit for this dosage
            int calculation_base_units;//: integer. 0=not applicable, 1=age in months, 2=age in years, 3=kg body weight, 4=cm2 body surface
            double calculation_base; // : real. Meaning depends on calculation_base_units
            double starting_range;  // : real. Usual mimimal recommended dosage
            double upper_range; // : real. Usual maximal recommended dosage
            int frequency_units; //: integer. 0=not applicable, 1=seconds, 2=minutes, 3=hours, 4=days, 5=weeks, 6=months, 7=years
            int frequency;       //: integer. How often this drug should be administered
            int duration_units; //: integer. Same as frequency_units, additional value 8='times'
            int duration_minimum; // ; integer. How long a usual course of this drug should be given. -1 is permanent, -2=p.r.n.
            int duration_maximum; // : integer. -1 is permanent, -2=p.r.n.
            boolean constrained;  //: boolean. If true, no automazied dosage suggestion must be generated, prescriber must read comment. (e.g. dosage per body surface etc.)
            String comment;
          }

          public class DrugComponent{
              public String name;
              public String strength;
              public String unit;

              public DrugComponent(){}
              public DrugComponent(Hashtable h){
                name = (String) h.get("name");
                strength = ((Double) h.get("strength")).toString();
                unit = (String) h.get("unit");
              }
          }

      }

    public class MinDrug{
        public String pKey;
        public String name;
        public String type;
        public Tag tag;

        MinDrug(){};

        MinDrug(Hashtable h){
            //this.pKey = (String) h.get("id"); //pKey
            this.pKey = ((Integer) h.get("id")).toString();
            this.name = (String) h.get("name");
            //this.type = (String) h.get("category");//type
            this.type = ((Integer) h.get("category")).toString();
            MiscUtils.getLogger().debug("pkey "+pKey+" name "+name+" type "+type);
            //d.tag  = (Tag)    h.get("tag");
        }


     };

     public class DrugSearch{
        ArrayList brand = null;
        ArrayList gen = null;
        ArrayList afhcClass = null;
        int totalSearch;
        boolean empty = false;
        public boolean failed = false;
        public String errorMessage = null;

        DrugSearch(){
             brand = new ArrayList();
             gen = new ArrayList();
             afhcClass = new ArrayList();
        }

        public void processResult(Vector vec){
            for (int i = 0 ; i <  vec.size(); i++){
                Hashtable h = (Hashtable) vec.get(i);
                if (!h.get("name").equals("None found")){
                    MinDrug d = new MinDrug(h);

                    if(d.type.equals("13")){
                        brand.add(d);
                    }else if (d.type.equals("11") || d.type.equals("12")){
                        gen.add(d);
                    }else if (d.type.equals("8") || d.type.equals("10") ){
                        afhcClass.add(d);
                    }
                }else{
                    this.setEmpty(true);
                }
             }
        }




        public boolean isEmpty(){
            return empty;
        }

        public void setEmpty(boolean b){
            empty = b;
        }


        /** Getter for property brand.
         * @return Value of property brand.
         *
         */
        public java.util.ArrayList getBrand() {
            return brand;
        }

        /** Setter for property brand.
         * @param brand New value of property brand.
         *
         */
        public void setBrand(java.util.ArrayList brand) {
            this.brand = brand;
        }

        /** Getter for property gen.
         * @return Value of property gen.
         *
         */
        public java.util.ArrayList getGen() {
            return gen;
        }

        /** Setter for property gen.
         * @param gen New value of property gen.
         *
         */
        public void setGen(java.util.ArrayList gen) {
            this.gen = gen;
        }

        /** Getter for property afhcClass.
         * @return Value of property afhcClass.
         *
         */
        public java.util.ArrayList getAfhcClass() {
            return afhcClass;
        }

        /** Setter for property afhcClass.
         * @param afhcClass New value of property afhcClass.
         *
         */
        public void setAfhcClass(java.util.ArrayList afhcClass) {
            this.afhcClass = afhcClass;
        }

     }


    public DrugSearch listDrug(String searchStr){
        DrugSearch drugSearch = new DrugSearch();
        RxDrugRef drugRef = new RxDrugRef();
        Vector vec= new Vector();
        //Vector vec = drugRef.list_drugs(searchStr,hashtable);
        try{
            vec  = drugRef.list_drug_element(searchStr);
        }catch(Exception connEx){
            drugSearch.failed = true;
            drugSearch.errorMessage = connEx.getMessage();
        }
        if (!drugSearch.failed){
            drugSearch.processResult(vec);
        }
        return drugSearch;
    }

    public DrugSearch listDrug2(String searchStr){
        DrugSearch drugSearch = new DrugSearch();
        RxDrugRef drugRef = new RxDrugRef();
        Vector vec= new Vector();
        //Vector vec = drugRef.list_drugs(searchStr,hashtable);
        try{
            vec  = drugRef.list_drug_element2(searchStr);
        }catch(Exception connEx){
            drugSearch.failed = true;
            drugSearch.errorMessage = connEx.getMessage();
        }
        if (!drugSearch.failed){
            drugSearch.processResult(vec);
        }
        return drugSearch;
    }

    public DrugSearch listDrugByRoute(String searchStr, String searchRoute){
        DrugSearch drugSearch = new DrugSearch();
        RxDrugRef drugRef = new RxDrugRef();
        Vector vec= new Vector();
        //Vector vec = drugRef.list_drugs(searchStr,hashtable);
        try{
            vec  = drugRef.list_drug_element_route(searchStr, searchRoute);
        }catch(Exception connEx){
            drugSearch.failed = true;
            drugSearch.errorMessage = connEx.getMessage();
        }
        if (!drugSearch.failed){
            drugSearch.processResult(vec);
        }
        return drugSearch;
    }

    public DrugSearch listDrugFromElement(String searchStr){
        DrugSearch drugSearch = new DrugSearch();
        RxDrugRef drugRef = new RxDrugRef();
        Vector vec = new Vector();
        try{
             vec  = drugRef.list_brands_from_element(searchStr);
        }catch(Exception connEx){
            drugSearch.failed = true;
            drugSearch.errorMessage = connEx.getMessage();
        }
        if (!drugSearch.failed){
            drugSearch.processResult(vec);
        }
        return drugSearch;
    }







    public DrugMonograph getDrug(String pKey) throws Exception{
        RxDrugRef d = new RxDrugRef();
        return new DrugMonograph(d.getDrug(pKey,new Boolean(true)));
    }


     public DrugMonograph getDrug2(String pKey) throws Exception{
        RxDrugRef d = new RxDrugRef();
        return new DrugMonograph(d.getDrug2(pKey,new Boolean(true)));
    }


    public String getDrugForm(String pKey) throws Exception {
	RxDrugRef d = new RxDrugRef();
	Hashtable h = d.getDrugForm(pKey);
	return (String) h.get("pharmaceutical_cd_form");
    }

    public String getGenericName(String pKey) throws Exception{
        RxDrugRef d = new RxDrugRef();
        Hashtable h = d.getGenericName(pKey);
        return (String) h.get("name");
    }


    public String getGenericName(int pKey) throws Exception{
        RxDrugRef d = new RxDrugRef();
        Hashtable h = d.getGenericName(""+pKey);
        return (String) h.get("name");
    }

    public ArrayList getFormFromDrugCode(String drugCode){
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.getFormFromDrugCode(drugCode);
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            lst.add(h.get("form"));
        }
        return lst;
    }

    public ArrayList getComponentsFromDrugCode(String drugCode){
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.listComponents(drugCode);
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            lst.add(h.get("name"));
        }
        return lst;
    }

    public ArrayList getDistinctForms(){
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.getDistinctForms();
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            lst.add(h.get("form"));
        }
        return lst;
    }

    public ArrayList getRouteFromDrugCode(String drugCode){
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.getRouteFromDrugCode(drugCode);
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            lst.add( h.get("route"));
        }
        return lst;
    }

    public Hashtable getStrengths(String drugCode){
        Hashtable retHash = new Hashtable();
        String dosage ="";
        String dosageDef ="";
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.getStrengths(drugCode);
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            dosage    = dosage + ((String) h.get("strength")) +" "+((String) h.get("strength_unit"));
            dosageDef = dosageDef + ((String) h.get("ingredient"));
            if (i < (v.size() -1 ) ){
                dosage = dosage+"/";
                dosageDef = dosageDef+"/";
            }
        }

        //select ingredient, strength, strength_unit
        retHash.put("dosage",dosage);
        retHash.put("dosageDef",dosageDef);

        return retHash;

    }


    public Hashtable getStrengthsLists(String drugCode){
        Hashtable retHash = new Hashtable();

        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        v = d.getStrengths(drugCode);
        ArrayList dosage = new ArrayList();
        ArrayList dosageDef = new ArrayList();
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            dosage.add(((String) h.get("strength")) +" "+((String) h.get("strength_unit")));
            dosageDef.add((h.get("ingredient")));

        }

        //select ingredient, strength, strength_unit
        retHash.put("dosage",dosage);
        retHash.put("dosageDef",dosageDef);

        return retHash;

    }

    class Tag{
         public int source;
         public int sources;
         public String language;
         public int  languages;
         public String country;
         public int countries;
         public int author;
         public int authors;
         public String  modified_after;
         boolean return_tags;
          /*
        hashtable.put("classes", new Boolean(true));
        hashtable.put("generics", new Boolean(true));
        hashtable.put("branded", new Boolean(true));
        hashtable.put("composites", new Boolean(true));
        hashtable.put("return_tags", new Boolean(false));
        */

         public Tag(){};

         public Tag(Hashtable h){
           source           = getInt(h.get("source"));//,new Integer(0));
           sources          = getInt(h.get("sources"));//,new Integer(sources));
           language         =(String) h.get("language");//, "");
           languages        =getInt(h.get("languages"));//, new Integer(languages));
           country          =(String)h.get("country");//,"");
           countries        =getInt(h.get("countries"));//;,new Integer(countries));
           author           =getInt(h.get("author"));//, new Integer(0));
           authors          =getInt(h.get("authors"));//, new Integer(authors));
           modified_after   =(String) h.get("modified_after");//, new SimpleDateFormat("yyyy-MM-dd").parse(modified_after));
           //return_tags      =h.get("return_tags");//,Boolean.toString(return_tags));

         }

         int getInt(Object obj){
            try{
                return Integer.parseInt(obj.toString());
            }catch(Exception e){
               return -1;
            }
         }
     };


     public Allergy[] getAllergyWarnings(String atcCode,Allergy[] allerg) throws Exception{
        Vector vec = new Vector();
        for (int i =0; i < allerg.length; i++){
           Hashtable h = new Hashtable();
           h.put("id",""+i);
           h.put("description",allerg[i].getDescription());
           h.put("type",""+allerg[i].getTypeCode());
           vec.add(h);
        }
        RxDrugRef d = new RxDrugRef();
        Vector res = d.getAlergyWarnings(atcCode, vec);

        Allergy[] actualAllergies = {};
        ArrayList li = new ArrayList();
        if(res != null ){
           Hashtable hashObject  = (Hashtable) res.get(0);
           if (hashObject != null){
              Vector alli = (Vector) hashObject.get("warnings");
              for (int k = 0; k < alli.size(); k++){
                 String str = (String) alli.get(k);
                 int id = Integer.parseInt(str);
                 li.add(allerg[id]);
                 MiscUtils.getLogger().debug(str);
              }

           }
        }
        actualAllergies  =  (Allergy[]) li.toArray(actualAllergies);

        return actualAllergies;
     }


     public Interaction[] getInteractions(Vector atcCodes) throws Exception{
        Interaction[] arr = {};
        ArrayList lst = new ArrayList();
        Vector v = new Vector();
        RxDrugRef d = new RxDrugRef();
        for(int i = 0; i < atcCodes.size(); i++){
           String ss = (String) atcCodes.get(i);
           MiscUtils.getLogger().debug(ss);
        }

        v = d.getInteractions(atcCodes);
        for (int i = 0 ; i < v.size();i++){
            Hashtable h = (Hashtable) v.get(i);
            Interaction inact = new Interaction();
            inact.affectedatc = (String) h.get("affectedatc");
            inact.affecteddrug = (String) h.get("affecteddrug");
            inact.affectingatc = (String) h.get("affectingatc");
            inact.affectingdrug = (String) h.get("affectingdrug");
	    inact.effect = (String) h.get("effect");
            inact.evidence = (String) h.get("evidence");
            inact.significance = (String) h.get("significance");
            inact.comment = (String) h.get("comment");
            lst.add(inact);
            MiscUtils.getLogger().debug("affectingDrug"+inact.affectingdrug);
        }
        MiscUtils.getLogger().debug(lst.size());
        arr = (Interaction[])lst.toArray(arr);
        MiscUtils.getLogger().debug(arr.length);
        return arr;
     }


    public class Interaction implements Comparable {
        public int compareTo(Object obj) {
           int retval = 0;
           int compVal = 0;
           int thisVal =0;
           Interaction t = (Interaction) obj;
           String sig = t.significance;
           try{
              compVal = Integer.parseInt(sig);
           }catch(Exception e1 ){
              retval = -1;
           }
           try{
              thisVal = Integer.parseInt(significance);
           }catch(Exception e2){
              retval = 1;
           }

           if ( retval == 0){
              if ( thisVal < compVal){
                 retval = 1;
              }else if ( thisVal > compVal){
                 retval = -1;
              }

           }
            // If this < obj, return a negative value
            // If this = obj, return 0
            // If this > obj, return a positive value
           return retval;
        }

        public String significance =null;
        public String affectingatc =null;
        public String affectingdrug =null;
        public String evidence =null;
        public String effect =null;
        public String affecteddrug =null;
        public String affectedatc =null;
        public String comment = null;
     }

}
