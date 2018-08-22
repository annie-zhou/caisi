CREATE TABLE `formRourke2009` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `demographic_no` int(10) ,
  `provider_no` varchar(6) ,
  `formCreated` date ,
  `formEdited` timestamp, 
  `c_lastVisited` char(3) ,
  `c_birthRemarks` text,
  `c_riskFactors` text,
  `c_famHistory` text,
  `c_pName` varchar(60) ,
  `c_birthDate` date ,
  `c_length` varchar(6) ,
  `c_headCirc` varchar(6) ,
  `c_birthWeight` varchar(7) ,
  `c_dischargeWeight` varchar(7) ,
  `c_fsa` char(3) ,
  `c_APGAR1min` int ,
  `c_APGAR5min` int ,
  `p1_2ndhandsmoke` tinyint(1) ,
  `p1_alcohol` tinyint(1) ,
  `p1_drugs` tinyint(1) ,
  `p1_birthRemarksr1` tinyint(1) ,
  `p1_birthRemarksr2` tinyint(1) ,
  `p1_birthRemarksr3` tinyint(1) ,
  `p1_date1w` date ,
  `p1_date2w` date ,
  `p1_date1m` date ,
  `p1_ht1w` varchar(5) ,
  `p1_wt1w` varchar(5) ,
  `p1_hc1w` varchar(5) ,
  `p1_ht2w` varchar(5) ,
  `p1_wt2w` varchar(5) ,
  `p1_hc2w` varchar(5) ,
  `p1_ht1m` varchar(5) ,
  `p1_wt1m` varchar(5) ,
  `p1_hc1m` varchar(5) ,
  `p1_pConcern1w` text,
  `p1_pConcern2w` text,
  `p1_pConcern1m` text,
  `p1_breastFeeding1wOk` tinyint(1) ,
  `p1_breastFeeding1wNo` tinyint(1) ,
  `p1_formulaFeeding1wOk` tinyint(1) ,
  `p1_formulaFeeding1wNo` tinyint(1) ,
  `p1_stoolUrine1wOk` tinyint(1) ,
  `p1_stoolUrine1wNo` tinyint(1) ,
  `p1_breastFeeding2wOk` tinyint(1) ,
  `p1_breastFeeding2wNo` tinyint(1) ,
  `p1_formulaFeeding2wOk` tinyint(1) ,
  `p1_formulaFeeding2wNo` tinyint(1) ,
  `p1_stoolUrine2wOk` tinyint(1) ,
  `p1_stoolUrine2wNo` tinyint(1) ,
  `p1_breastFeeding1mOk` tinyint(1) ,
  `p1_breastFeeding1mNo` tinyint(1) ,
  `p1_formulaFeeding1mOk` tinyint(1) ,
  `p1_formulaFeeding1mNo` tinyint(1) ,
  `p1_stoolUrine1mOk` tinyint(1) ,
  `p1_stoolUrine1mNo` tinyint(1) ,
  `p1_carSeatOk` tinyint(1) ,
  `p1_carSeatNo` tinyint(1) ,
  `p1_sleepPosOk` tinyint(1) ,
  `p1_sleepPosNo` tinyint(1) ,
  `p1_cribSafetyOk` tinyint(1) ,
  `p1_cribSafetyNo` tinyint(1) ,
  `p1_firearmSafetyOk` tinyint(1) ,
  `p1_firearmSafetyNo` tinyint(1) ,
  `p1_smokeSafetyOk` tinyint(1) ,
  `p1_smokeSafetyNo` tinyint(1) ,
  `p1_hotWaterOk` tinyint(1) ,
  `p1_hotWaterNo` tinyint(1) ,
  `p1_safeToysOk` tinyint(1) ,
  `p1_safeToysNo` tinyint(1) ,
  `p1_sleepCryOk` tinyint(1) ,
  `p1_sleepCryNo` tinyint(1) ,
  `p1_soothabilityOk` tinyint(1) ,
  `p1_soothabilityNo` tinyint(1) ,
  `p1_homeVisitOk` tinyint(1) ,
  `p1_homeVisitNo` tinyint(1) ,
  `p1_bondingOk` tinyint(1) ,
  `p1_bondingNo` tinyint(1) ,
  `p1_pFatigueOk` tinyint(1) ,
  `p1_pFatigueNo` tinyint(1) ,
  `p1_famConflictOk` tinyint(1) ,
  `p1_famConflictNo` tinyint(1) ,
  `p1_siblingsOk` tinyint(1) ,
  `p1_siblingsNo` tinyint(1) ,
  `p1_2ndSmokeOk` tinyint(1) ,
  `p1_2ndSmokeNo` tinyint(1) ,
  `p1_altMedOk` tinyint(1) ,
  `p1_altMedNo` tinyint(1) ,
  `p1_pacifierOk` tinyint(1) ,
  `p1_pacifierNo` tinyint(1) ,
  `p1_feverOk` tinyint(1) ,
  `p1_feverNo` tinyint(1) ,
  `p1_noCoughMedOk` tinyint(1) ,
  `p1_noCoughMedNo` tinyint(1) ,
  `p1_tmpControlOk` tinyint(1) ,
  `p1_tmpControlNo` tinyint(1) ,
  `p1_sunExposureOk` tinyint(1) ,
  `p1_sunExposureNo` tinyint(1) ,
  `p1_development1w` text,
  `p1_development2w` text,
  `p1_sucks2wOk` tinyint(1) ,
  `p1_sucks2wNo` tinyint(1) ,
  `p1_noParentsConcerns2wOk` tinyint(1) ,
  `p1_noParentsConcerns2wNo` tinyint(1) ,
  `p1_development1m` text,
  `p1_focusGaze1mOk` tinyint(1) ,
  `p1_focusGaze1mNo` tinyint(1) ,
  `p1_startles1mOk` tinyint(1) ,
  `p1_startles1mNo` tinyint(1) ,
  `p1_calms1mOk` tinyint(1) ,
  `p1_calms1mNo` tinyint(1) ,
  `p1_sucks1mOk` tinyint(1) ,
  `p1_sucks1mNo` tinyint(1) ,
  `p1_noParentsConcerns1mOk` tinyint(1) ,
  `p1_noParentsConcerns1mNo` tinyint(1) ,
  `p1_skin1wOk` tinyint(1) ,
  `p1_skin1wNo` tinyint(1) ,
  `p1_fontanelles1wOk` tinyint(1) ,
  `p1_fontanelles1wNo` tinyint(1) ,
  `p1_eyes1wOk` tinyint(1) ,
  `p1_eyes1wNo` tinyint(1) ,
  `p1_ears1wOk` tinyint(1) ,
  `p1_ears1wNo` tinyint(1) ,
  `p1_heartLungs1wOk` tinyint(1) ,
  `p1_heartLungs1wNo` tinyint(1) ,
  `p1_umbilicus1wOk` tinyint(1) ,
  `p1_umbilicus1wNo` tinyint(1) ,
  `p1_femoralPulses1wOk` tinyint(1) ,
  `p1_femoralPulses1wNo` tinyint(1) ,
  `p1_hips1wOk` tinyint(1) ,
  `p1_hips1wNo` tinyint(1) ,
  `p1_muscleTone1wOk` tinyint(1) ,
  `p1_muscleTone1wNo` tinyint(1) ,
  `p1_testicles1wOk` tinyint(1) ,
  `p1_testicles1wNo` tinyint(1) ,
  `p1_maleUrinary1wOk` tinyint(1) ,
  `p1_maleUrinary1wNo` tinyint(1) ,
  `p1_skin2wOk` tinyint(1) ,
  `p1_skin2wNo` tinyint(1) ,
  `p1_fontanelles2wOk` tinyint(1) ,
  `p1_fontanelles2wNo` tinyint(1) ,
  `p1_eyes2wOk` tinyint(1) ,
  `p1_eyes2wNo` tinyint(1) ,
  `p1_ears2wOk` tinyint(1) ,
  `p1_ears2wNo` tinyint(1) ,
  `p1_heartLungs2wOk` tinyint(1) ,
  `p1_heartLungs2wNo` tinyint(1) ,
  `p1_umbilicus2wOk` tinyint(1) ,
  `p1_umbilicus2wNo` tinyint(1) ,
  `p1_femoralPulses2wOk` tinyint(1) ,
  `p1_femoralPulses2wNo` tinyint(1) ,
  `p1_hips2wOk` tinyint(1) ,
  `p1_hips2wNo` tinyint(1) ,
  `p1_muscleTone2wOk` tinyint(1) ,
  `p1_muscleTone2wNo` tinyint(1) ,
  `p1_testicles2wOk` tinyint(1) ,
  `p1_testicles2wNo` tinyint(1) ,
  `p1_maleUrinary2wOk` tinyint(1) ,
  `p1_maleUrinary2wNo` tinyint(1) ,
  `p1_skin1mOk` tinyint(1) ,
  `p1_skin1mNo` tinyint(1) ,
  `p1_fontanelles1mOk` tinyint(1) ,
  `p1_fontanelles1mNo` tinyint(1) ,
  `p1_eyes1mOk` tinyint(1) ,
  `p1_eyes1mNo` tinyint(1) ,
  `p1_corneal1mOk` tinyint(1) ,
  `p1_corneal1mNo` tinyint(1) ,
  `p1_hearing1mOk` tinyint(1) ,
  `p1_hearing1mNo` tinyint(1) ,
  `p1_heart1mOk` tinyint(1) ,
  `p1_heart1mNo` tinyint(1) ,
  `p1_hips1mOk` tinyint(1) ,
  `p1_hips1mNo` tinyint(1) ,
  `p1_muscleTone1mOk` tinyint(1) ,
  `p1_muscleTone1mNo` tinyint(1) ,
  `p1_pkuThyroid1w` tinyint(1) ,
  `p1_hemoScreen1w` tinyint(1) ,
  `p1_problems1w` text,
  `p1_problems2w` text,
  `p1_problems1m` text,
  `p1_hepatitisVaccine1w` tinyint(1) ,
  `p1_hepatitisVaccine1m` tinyint(1) ,
  `p1_signature2w` varchar(250) ,
  `p2_date2m` date ,
  `p2_date4m` date ,
  `p2_date6m` date ,
  `p2_ht2m` varchar(5) ,
  `p2_wt2m` varchar(5) ,
  `p2_hc2m` varchar(5) ,
  `p2_ht4m` varchar(5) ,
  `p2_wt4m` varchar(5) ,
  `p2_hc4m` varchar(5) ,
  `p2_ht6m` varchar(5) ,
  `p2_wt6m` varchar(5) ,
  `p2_hc6m` varchar(5) ,
  `p2_pConcern2m` text,
  `p2_pConcern4m` text,
  `p2_pConcern6m` text,
  `p2_nutrition2m` text,
  `p2_breastFeeding2mOk` tinyint(1) ,
  `p2_breastFeeding2mNo` tinyint(1) ,
  `p2_formulaFeeding2mOk` tinyint(1) ,
  `p2_formulaFeeding2mNo` tinyint(1) ,
  `p2_nutrition4m` text,
  `p2_breastFeeding4mOk` tinyint(1) ,
  `p2_breastFeeding4mNo` tinyint(1) ,
  `p2_formulaFeeding4mOk` tinyint(1) ,
  `p2_formulaFeeding4mNo` tinyint(1) ,
  `p2_breastFeeding6mOk` tinyint(1) ,
  `p2_breastFeeding6mNo` tinyint(1) ,
  `p2_formulaFeeding6mOk` tinyint(1) ,
  `p2_formulaFeeding6mNo` tinyint(1) ,
  `p2_bottle6mOk` tinyint(1) ,
  `p2_bottle6mNo` tinyint(1) ,
  `p2_liquids6mOk` tinyint(1) ,
  `p2_liquids6mNo` tinyint(1) ,
  `p2_iron6mOk` tinyint(1) ,
  `p2_iron6mNo` tinyint(1) ,
  `p2_vegFruit6mOk` tinyint(1) ,
  `p2_vegFruit6mNo` tinyint(1) ,
  `p2_egg6mOk` tinyint(1) ,
  `p2_egg6mNo` tinyint(1) ,
  `p2_choking6mOk` tinyint(1) ,
  `p2_choking6mNo` tinyint(1) ,
  `p2_carSeatOk` tinyint(1) ,
  `p2_carSeatNo` tinyint(1) ,
  `p2_sleepPosOk` tinyint(1) ,
  `p2_sleepPosNo` tinyint(1) ,
  `p2_poisonsOk` tinyint(1) ,
  `p2_poisonsNo` tinyint(1) ,
  `p2_firearmSafetyOk` tinyint(1) ,
  `p2_firearmSafetyNo` tinyint(1) ,
  `p2_electricOk` tinyint(1) ,
  `p2_electricNo` tinyint(1) ,
  `p2_smokeSafetyOk` tinyint(1) ,
  `p2_smokeSafetyNo` tinyint(1) ,
  `p2_hotWaterOk` tinyint(1) ,
  `p2_hotWaterNo` tinyint(1) ,
  `p2_fallsOk` tinyint(1) ,
  `p2_fallsNo` tinyint(1) ,
  `p2_safeToysOk` tinyint(1) ,
  `p2_safeToysNo` tinyint(1) ,
  `p2_sleepCryOk` tinyint(1) ,
  `p2_sleepCryNo` tinyint(1) ,
  `p2_soothabilityOk` tinyint(1) ,
  `p2_soothabilityNo` tinyint(1) ,
  `p2_homeVisitOk` tinyint(1) ,
  `p2_homeVisitNo` tinyint(1) ,
  `p2_bondingOk` tinyint(1) ,
  `p2_bondingNo` tinyint(1) ,
  `p2_pFatigueOk` tinyint(1) ,
  `p2_pFatigueNo` tinyint(1) ,
  `p2_famConflictOk` tinyint(1) ,
  `p2_famConflictNo` tinyint(1) ,
  `p2_siblingsOk` tinyint(1) ,
  `p2_siblingsNo` tinyint(1) ,
  `p2_childCareOk` tinyint(1) ,
  `p2_childCareNo` tinyint(1) ,
  `p2_2ndSmokeOk` tinyint(1) ,
  `p2_2ndSmokeNo` tinyint(1) ,
  `p2_teethingOk` tinyint(1) ,
  `p2_teethingNo` tinyint(1) ,
  `p2_altMedOk` tinyint(1) ,
  `p2_altMedNo` tinyint(1) ,
  `p2_pacifierOk` tinyint(1) ,
  `p2_pacifierNo` tinyint(1) ,
  `p2_tmpControlOk` tinyint(1) ,
  `p2_tmpControlNo` tinyint(1) ,
  `p2_feverOk` tinyint(1) ,
  `p2_feverNo` tinyint(1) ,
  `p2_sunExposureOk` tinyint(1) ,
  `p2_sunExposureNo` tinyint(1) ,
  `p2_pesticidesOk` tinyint(1) ,
  `p2_pesticidesNo` tinyint(1) ,
  `p2_readingOk` tinyint(1) ,
  `p2_readingNo` tinyint(1) ,
  `p2_noCoughMedOk` tinyint(1) ,
  `p2_noCoughMedNo` tinyint(1) ,
  `p2_development2m` text,
  `p2_eyesOk` tinyint(1) ,
  `p2_eyesNo` tinyint(1) ,
  `p2_coosOk` tinyint(1) ,
  `p2_coosNo` tinyint(1) ,
  `p2_respondsOk` tinyint(1) ,
  `p2_respondsNo` tinyint(1) ,
  `p2_headUpTummyOk` tinyint(1) ,
  `p2_headUpTummyNo` tinyint(1) ,
  `p2_cuddledOk` tinyint(1) ,
  `p2_cuddledNo` tinyint(1) ,
  `p2_2sucksOk` tinyint(1) ,
  `p2_2sucksNo` tinyint(1) ,
  `p2_smilesOk` tinyint(1) ,
  `p2_smilesNo` tinyint(1) ,
  `p2_noParentsConcerns2mOk` tinyint(1) ,
  `p2_noParentsConcerns2mNo` tinyint(1) ,
  `p2_development4m` text,
  `p2_turnsHeadOk` tinyint(1) ,
  `p2_turnsHeadNo` tinyint(1) ,
  `p2_laughsOk` tinyint(1) ,
  `p2_laughsNo` tinyint(1) ,
  `p2_headSteadyOk` tinyint(1) ,
  `p2_headSteadyNo` tinyint(1) ,
  `p2_holdsObjOk` tinyint(1) ,
  `p2_holdsObjNo` tinyint(1) ,
  `p2_noParentsConcerns4mOk` tinyint(1) ,
  `p2_noParentsConcerns4mNo` tinyint(1) ,
  `p2_development6m` text,
  `p2_movingObjOk` tinyint(1) ,
  `p2_movingObjNo` tinyint(1) ,
  `p2_vocalizesOk` tinyint(1) ,
  `p2_vocalizesNo` tinyint(1) ,
  `p2_makesSoundOk` tinyint(1) ,
  `p2_makesSoundNo` tinyint(1) ,
  `p2_rollsOk` tinyint(1) ,
  `p2_rollsNo` tinyint(1) ,
  `p2_sitsOk` tinyint(1) ,
  `p2_sitsNo` tinyint(1) ,
  `p2_reachesGraspsOk` tinyint(1) ,
  `p2_reachesGraspsNo` tinyint(1) ,
  `p2_noParentsConcerns6mOk` tinyint(1) ,
  `p2_noParentsConcerns6mNo` tinyint(1) ,
  `p2_fontanelles2mOk` tinyint(1) ,
  `p2_fontanelles2mNo` tinyint(1) ,
  `p2_eyes2mOk` tinyint(1) ,
  `p2_eyes2mNo` tinyint(1) ,
  `p2_corneal2mOk` tinyint(1) ,
  `p2_corneal2mNo` tinyint(1) ,
  `p2_hearing2mOk` tinyint(1) ,
  `p2_hearing2mNo` tinyint(1) ,
  `p2_heart2mOk` tinyint(1) ,
  `p2_heart2mNo` tinyint(1) ,
  `p2_hips2mOk` tinyint(1) ,
  `p2_hips2mNo` tinyint(1) ,
  `p2_muscleTone2mOk` tinyint(1) ,
  `p2_muscleTone2mNo` tinyint(1) ,
  `p2_fontanelles4mOk` tinyint(1) ,
  `p2_fontanelles4mNo` tinyint(1) ,
  `p2_eyes4mOk` tinyint(1) ,
  `p2_eyes4mNo` tinyint(1) ,
  `p2_corneal4mOk` tinyint(1) ,
  `p2_corneal4mNo` tinyint(1) ,
  `p2_hearing4mOk` tinyint(1) ,
  `p2_hearing4mNo` tinyint(1) ,
  `p2_hips4mOk` tinyint(1) ,
  `p2_hips4mNo` tinyint(1) ,
  `p2_muscleTone4mOk` tinyint(1) ,
  `p2_muscleTone4mNo` tinyint(1) ,
  `p2_fontanelles6mOk` tinyint(1) ,
  `p2_fontanelles6mNo` tinyint(1) ,
  `p2_eyes6mOk` tinyint(1) ,
  `p2_eyes6mNo` tinyint(1) ,
  `p2_corneal6mOk` tinyint(1) ,
  `p2_corneal6mNo` tinyint(1) ,
  `p2_hearing6mOk` tinyint(1) ,
  `p2_hearing6mNo` tinyint(1) ,
  `p2_hips6mOk` tinyint(1) ,
  `p2_hips6mNo` tinyint(1) ,
  `p2_muscleTone6mOk` tinyint(1) ,
  `p2_muscleTone6mNo` tinyint(1) ,
  `p2_problems2m` text,
  `p2_problems4m` text,
  `p2_problems6m` text,
  `p2_tb6m` tinyint(1) ,
  `p2_hepatitisVaccine6m` tinyint(1) ,
  `p2_signature2m` varchar(250) ,
  `p2_signature4m` varchar(250) ,
  `p3_date9m` date ,
  `p3_date12m` date ,
  `p3_date15m` date ,
  `p3_ht9m` varchar(5) ,
  `p3_wt9m` varchar(5) ,
  `p3_hc9m` varchar(5) ,
  `p3_ht12m` varchar(5) ,
  `p3_wt12m` varchar(5) ,
  `p3_hc12m` varchar(5) ,
  `p3_ht15m` varchar(5) ,
  `p3_wt15m` varchar(5) ,
  `p3_hc15m` varchar(5) ,
  `p3_pConcern9m` text,
  `p3_pConcern12m` text,
  `p3_pConcern15m` text,
  `p3_breastFeeding9mOk` tinyint(1) ,
  `p3_breastFeeding9mNo` tinyint(1) ,
  `p3_formulaFeeding9mOk` tinyint(1) ,
  `p3_formulaFeeding9mNo` tinyint(1) ,
  `p3_bottle9mOk` tinyint(1) ,
  `p3_bottle9mNo` tinyint(1) ,
  `p3_liquids9mOk` tinyint(1) ,
  `p3_liquids9mNo` tinyint(1) ,
  `p3_cereal9mOk` tinyint(1) ,
  `p3_cereal9mNo` tinyint(1) ,
  `p3_introCowMilk9mOk` tinyint(1) ,
  `p3_introCowMilk9mNo` tinyint(1) ,
  `p3_egg9mOk` tinyint(1) ,
  `p3_egg9mNo` tinyint(1) ,
  `p3_choking9mOk` tinyint(1) ,
  `p3_choking9mNo` tinyint(1) ,
  `p3_nutrition12m` text,
  `p3_breastFeeding12mOk` tinyint(1) ,
  `p3_breastFeeding12mNo` tinyint(1) ,
  `p3_homoMilk12mOk` tinyint(1) ,
  `p3_homoMilk12mNo` tinyint(1) ,
  `p3_cup12mOk` tinyint(1) ,
  `p3_cup12mNo` tinyint(1) ,
  `p3_appetite12mOk` tinyint(1) ,
  `p3_appetite12mNo` tinyint(1) ,
  `p3_choking12mOk` tinyint(1) ,
  `p3_choking12mNo` tinyint(1) ,
  `p3_nutrition15m` text,
  `p3_breastFeeding15mOk` tinyint(1) ,
  `p3_breastFeeding15mNo` tinyint(1) ,
  `p3_homoMilk15mOk` tinyint(1) ,
  `p3_homoMilk15mNo` tinyint(1) ,
  `p3_choking15mOk` tinyint(1) ,
  `p3_choking15mNo` tinyint(1) ,
  `p3_cup15mOk` tinyint(1) ,
  `p3_cup15mNo` tinyint(1) ,
  `p3_carSeatOk` tinyint(1) ,
  `p3_carSeatNo` tinyint(1) ,
  `p3_poisonsOk` tinyint(1) ,
  `p3_poisonsNo` tinyint(1) ,
  `p3_firearmSafetyOk` tinyint(1) ,
  `p3_firearmSafetyNo` tinyint(1) ,
  `p3_smokeSafetyOk` tinyint(1) ,
  `p3_smokeSafetyNo` tinyint(1) ,
  `p3_hotWaterOk` tinyint(1) ,
  `p3_hotWaterNo` tinyint(1) ,
  `p3_electricOk` tinyint(1) ,
  `p3_electricNo` tinyint(1) ,
  `p3_fallsOk` tinyint(1) ,
  `p3_fallsNo` tinyint(1) ,
  `p3_safeToysOk` tinyint(1) ,
  `p3_safeToysNo` tinyint(1) ,
  `p3_sleepCryOk` tinyint(1) ,
  `p3_sleepCryNo` tinyint(1) ,
  `p3_soothabilityOk` tinyint(1) ,
  `p3_soothabilityNo` tinyint(1) ,
  `p3_homeVisitOk` tinyint(1) ,
  `p3_homeVisitNo` tinyint(1) ,
  `p3_parentingOk` tinyint(1) ,
  `p3_parentingNo` tinyint(1) ,
  `p3_pFatigueOk` tinyint(1) ,
  `p3_pFatigueNo` tinyint(1) ,
  `p3_famConflictOk` tinyint(1) ,
  `p3_famConflictNo` tinyint(1) ,
  `p3_siblingsOk` tinyint(1) ,
  `p3_siblingsNo` tinyint(1) ,
  `p3_childCareOk` tinyint(1) ,
  `p3_childCareNo` tinyint(1) ,
  `p3_2ndSmokeOk` tinyint(1) ,
  `p3_2ndSmokeNo` tinyint(1) ,
  `p3_teethingOk` tinyint(1) ,
  `p3_teethingNo` tinyint(1) ,
  `p3_altMedOk` tinyint(1) ,
  `p3_altMedNo` tinyint(1) ,
  `p3_pacifierOk` tinyint(1) ,
  `p3_pacifierNo` tinyint(1) ,
  `p3_feverOk` tinyint(1) ,
  `p3_feverNo` tinyint(1) ,
  `p3_coughMedOk` tinyint(1) ,
  `p3_coughMedNo` tinyint(1) ,
  `p3_activeOk` tinyint(1) ,
  `p3_activeNo` tinyint(1) ,
  `p3_readingOk` tinyint(1) ,
  `p3_readingNo` tinyint(1) ,
  `p3_footwearOk` tinyint(1) ,
  `p3_footwearNo` tinyint(1) ,
  `p3_sunExposureOk` tinyint(1) ,
  `p3_sunExposureNo` tinyint(1) ,
  `p3_checkSerumOk` tinyint(1) ,
  `p3_checkSerumNo` tinyint(1) ,
  `p3_pesticidesOk` tinyint(1) ,
  `p3_pesticidesNo` tinyint(1) ,
  `p3_development9m` text,
  `p3_hiddenToyOk` tinyint(1) ,
  `p3_hiddenToyNo` tinyint(1) ,
  `p3_soundsOk` tinyint(1) ,
  `p3_soundsNo` tinyint(1) ,
  `p3_responds2peopleOk` tinyint(1) ,
  `p3_responds2peopleNo` tinyint(1) ,
  `p3_makeSoundsOk` tinyint(1) ,
  `p3_makeSoundsNo` tinyint(1) ,
  `p3_sitsOk` tinyint(1) ,
  `p3_sitsNo` tinyint(1) ,
  `p3_standsOk` tinyint(1) ,
  `p3_standsNo` tinyint(1) ,
  `p3_thumbOk` tinyint(1) ,
  `p3_thumbNo` tinyint(1) ,
  `p3_playGamesOk` tinyint(1) ,
  `p3_playGamesNo` tinyint(1) ,
  `p3_attention9mOk` tinyint(1) ,
  `p3_attention9mNo` tinyint(1) ,
  `p3_noParentsConcerns9mOk` tinyint(1) ,
  `p3_noParentsConcerns9mNo` tinyint(1) ,
  `p3_development12m` text,
  `p3_respondsOk` tinyint(1) ,
  `p3_respondsNo` tinyint(1) ,
  `p3_simpleRequestsOk` tinyint(1) ,
  `p3_simpleRequestsNo` tinyint(1) ,
  `p3_consonantOk` tinyint(1) ,
  `p3_consonantNo` tinyint(1) ,
  `p3_says3wordsOk` tinyint(1) ,
  `p3_says3wordsNo` tinyint(1) ,
  `p3_shufflesOk` tinyint(1) ,
  `p3_shufflesNo` tinyint(1) ,
  `p3_pull2standOk` tinyint(1) ,
  `p3_pull2standNo` tinyint(1) ,
  `p3_showDistressOk` tinyint(1) ,
  `p3_showDistressNo` tinyint(1) ,
  `p3_followGazeOk` tinyint(1) ,
  `p3_followGazeNo` tinyint(1) ,
  `p3_noParentsConcerns12mOk` tinyint(1) ,
  `p3_noParentsConcerns12mNo` tinyint(1) ,
  `p3_says5wordsOk` tinyint(1) ,
  `p3_says5wordsNo` tinyint(1) ,
  `p3_reachesOk` tinyint(1) ,
  `p3_reachesNo` tinyint(1) ,
  `p3_fingerFoodsOk` tinyint(1) ,
  `p3_fingerFoodsNo` tinyint(1) ,
  `p3_walksSidewaysOk` tinyint(1) ,
  `p3_walksSidewaysNo` tinyint(1) ,
  `p3_showsFearStrangersOk` tinyint(1) ,
  `p3_showsFearStrangersNo` tinyint(1) ,
  `p3_crawlsStairsOk` tinyint(1) ,
  `p3_crawlsStairsNo` tinyint(1) ,
  `p3_squatsOk` tinyint(1) ,
  `p3_squatsNo` tinyint(1) ,
  `p3_noParentsConcerns15mOk` tinyint(1) ,
  `p3_noParentsConcerns15mNo` tinyint(1) ,
  `p3_fontanelles9mOk` tinyint(1) ,
  `p3_fontanelles9mNo` tinyint(1) ,
  `p3_eyes9mOk` tinyint(1) ,
  `p3_eyes9mNo` tinyint(1) ,
  `p3_corneal9mOk` tinyint(1) ,
  `p3_corneal9mNo` tinyint(1) ,
  `p3_hearing9mOk` tinyint(1) ,
  `p3_hearing9mNo` tinyint(1) ,
  `p3_hips9mOk` tinyint(1) ,
  `p3_hips9mNo` tinyint(1) ,
  `p3_fontanelles12mOk` tinyint(1) ,
  `p3_fontanelles12mNo` tinyint(1) ,
  `p3_eyes12mOk` tinyint(1) ,
  `p3_eyes12mNo` tinyint(1) ,
  `p3_corneal12mOk` tinyint(1) ,
  `p3_corneal12mNo` tinyint(1) ,
  `p3_hearing12mOk` tinyint(1) ,
  `p3_hearing12mNo` tinyint(1) ,
  `p3_tonsil12mOk` tinyint(1) ,
  `p3_tonsil12mNo` tinyint(1) ,
  `p3_hips12mOk` tinyint(1) ,
  `p3_hips12mNo` tinyint(1) ,
  `p3_development15m` text,
  `p3_fontanelles15mOk` tinyint(1) ,
  `p3_fontanelles15mNo` tinyint(1) ,
  `p3_eyes15mOk` tinyint(1) ,
  `p3_eyes15mNo` tinyint(1) ,
  `p3_corneal15mOk` tinyint(1) ,
  `p3_corneal15mNo` tinyint(1) ,
  `p3_hearing15mOk` tinyint(1) ,
  `p3_hearing15mNo` tinyint(1) ,
  `p3_tonsil15mOk` tinyint(1) ,
  `p3_tonsil15mNo` tinyint(1) ,
  `p3_hips15mOk` tinyint(1) ,
  `p3_hips15mNo` tinyint(1) ,
  `p3_problems9m` text,
  `p3_problems12m` text,
  `p3_problems15m` text,
  `p3_antiHB9m` tinyint(1) ,
  `p3_hemoglobin9m` tinyint(1) ,
  `p3_hemoglobin12m` tinyint(1) ,
  `p3_signature9m` varchar(250) ,
  `p3_signature12m` varchar(250) ,
  `p3_signature15m` varchar(250) ,
  `p4_date18m` date ,
  `p4_date24m` date ,
  `p4_date48m` date ,
  `p4_ht18m` varchar(5) ,
  `p4_wt18m` varchar(5) ,
  `p4_hc18m` varchar(5) ,
  `p4_ht24m` varchar(5) ,
  `p4_wt24m` varchar(5) ,
  `p4_hc24m` varchar(5) ,
  `p4_ht48m` varchar(5) ,
  `p4_wt48m` varchar(5) ,
  `p4_pConcern18m` text,
  `p4_pConcern24m` text,
  `p4_pConcern48m` text,
  `p4_breastFeeding18mOk` tinyint(1) ,
  `p4_breastFeeding18mNo` tinyint(1) ,
  `p4_homoMilk18mOk` tinyint(1) ,
  `p4_homoMilk18mNo` tinyint(1) ,
  `p4_bottle18mOk` tinyint(1) ,
  `p4_bottle18mNo` tinyint(1) ,
  `p4_homo2percent24mOk` tinyint(1) ,
  `p4_homo2percent24mNo` tinyint(1) ,
  `p4_lowerfatdiet24mOk` tinyint(1) ,
  `p4_lowerfatdiet24mNo` tinyint(1) ,
  `p4_foodguide24mOk` tinyint(1) ,
  `p4_foodguide24mNo` tinyint(1) ,
  `p4_2pMilk48mOk` tinyint(1) ,
  `p4_2pMilk48mNo` tinyint(1) ,
  `p4_foodguide48mOk` tinyint(1) ,
  `p4_foodguide48mNo` tinyint(1) ,
  `p4_carSeat18mOk` tinyint(1) ,
  `p4_carSeat18mNo` tinyint(1) ,
  `p4_bathSafetyOk` tinyint(1) ,
  `p4_bathSafetyNo` tinyint(1) ,
  `p4_safeToysOk` tinyint(1) ,
  `p4_safeToysNo` tinyint(1) ,
  `p4_parentChild18mOk` tinyint(1) ,
  `p4_parentChild18mNo` tinyint(1) ,
  `p4_discipline18mOk` tinyint(1) ,
  `p4_discipline18mNo` tinyint(1) ,
  `p4_pFatigue18mOk` tinyint(1) ,
  `p4_pFatigue18mNo` tinyint(1) ,
  `p4_highRisk18mOk` tinyint(1) ,
  `p4_highRisk18mNo` tinyint(1) ,
  `p4_socializing18mOk` tinyint(1) ,
  `p4_socializing18mNo` tinyint(1) ,
  `p4_weanPacifier18mOk` tinyint(1) ,
  `p4_weanPacifier18mNo` tinyint(1) ,
  `p4_dentalCareOk` tinyint(1) ,
  `p4_dentalCareNo` tinyint(1) ,
  `p4_toiletLearning18mOk` tinyint(1) ,
  `p4_toiletLearning18mNo` tinyint(1) ,
  `p4_encourageReading18mOk` tinyint(1) ,
  `p4_encourageReading18mNo` tinyint(1) ,
  `p4_carSeat24mOk` tinyint(1) ,
  `p4_carSeat24mNo` tinyint(1) ,
  `p4_bikeHelmetsOk` tinyint(1) ,
  `p4_bikeHelmetsNo` tinyint(1) ,
  `p4_firearmSafetyOk` tinyint(1) ,
  `p4_firearmSafetyNo` tinyint(1) ,
  `p4_smokeSafetyOk` tinyint(1) ,
  `p4_smokeSafetyNo` tinyint(1) ,
  `p4_matchesOk` tinyint(1) ,
  `p4_matchesNo` tinyint(1) ,
  `p4_waterSafetyOk` tinyint(1) ,
  `p4_waterSafetyNo` tinyint(1) ,
  `p4_parentChild24mOk` tinyint(1) ,
  `p4_parentChild24mNo` tinyint(1) ,
  `p4_discipline24mOk` tinyint(1) ,
  `p4_discipline24mNo` tinyint(1) ,
  `p4_highRisk24mOk` tinyint(1) ,
  `p4_highRisk24mNo` tinyint(1) ,
  `p4_pFatigue24mOk` tinyint(1) ,
  `p4_pFatigue24mNo` tinyint(1) ,
  `p4_famConflictOk` tinyint(1) ,
  `p4_famConflictNo` tinyint(1) ,
  `p4_siblingsOk` tinyint(1) ,
  `p4_siblingsNo` tinyint(1) ,
  `p4_2ndSmokeOk` tinyint(1) ,
  `p4_2ndSmokeNo` tinyint(1) ,
  `p4_dentalCleaningOk` tinyint(1) ,
  `p4_dentalCleaningNo` tinyint(1) ,
  `p4_altMedOk` tinyint(1) ,
  `p4_altMedNo` tinyint(1) ,
  `p4_toiletLearning24mOk` tinyint(1) ,
  `p4_toiletLearning24mNo` tinyint(1) ,
  `p4_activeOk` tinyint(1) ,
  `p4_activeNo` tinyint(1) ,
  `p4_socializing24mOk` tinyint(1) ,
  `p4_socializing24mNo` tinyint(1) ,
  `p4_readingOk` tinyint(1) ,
  `p4_readingNo` tinyint(1) ,
  `p4_noCough24mOk` tinyint(1) ,
  `p4_noCough24mNo` tinyint(1) ,
  `p4_noPacifier24mOk` tinyint(1) ,
  `p4_noPacifier24mNo` tinyint(1) ,
  `p4_dayCareOk` tinyint(1) ,
  `p4_dayCareNo` tinyint(1) ,
  `p4_sunExposureOk` tinyint(1) ,
  `p4_sunExposureNo` tinyint(1) ,
  `p4_pesticidesOk` tinyint(1) ,
  `p4_pesticidesNo` tinyint(1) ,
  `p4_checkSerumOk` tinyint(1) ,
  `p4_checkSerumNo` tinyint(1) ,
  `p4_manageableOk` tinyint(1) ,
  `p4_manageableNo` tinyint(1) ,
  `p4_otherChildrenNo` tinyint(1) ,
  `p4_otherChildrenOk` tinyint(1) ,
  `p4_soothabilityOk` tinyint(1) ,
  `p4_soothabilityNo` tinyint(1) ,
  `p4_comfortOk` tinyint(1) ,
  `p4_comfortNo` tinyint(1) ,
  `p4_pointsOk` tinyint(1) ,
  `p4_pointsNo` tinyint(1) ,
  `p4_getAttnOk` tinyint(1) ,
  `p4_getAttnNo` tinyint(1) ,
  `p4_points2wantOk` tinyint(1) ,
  `p4_points2wantNo` tinyint(1) ,
  `p4_looks4toyOk` tinyint(1) ,
  `p4_looks4toyNo` tinyint(1) ,
  `p4_recsNameOk` tinyint(1) ,
  `p4_recsNameNo` tinyint(1) ,
  `p4_initSpeechOk` tinyint(1) ,
  `p4_initSpeechNo` tinyint(1) ,
  `p4_says20wordsOk` tinyint(1) ,
  `p4_says20wordsNo` tinyint(1) ,
  `p4_4consonantsOk` tinyint(1) ,
  `p4_4consonantsNo` tinyint(1) ,
  `p4_walksbackOk` tinyint(1) ,
  `p4_walksbackNo` tinyint(1) ,
  `p4_feedsSelfOk` tinyint(1) ,
  `p4_feedsSelfNo` tinyint(1) ,
  `p4_removesHatOk` tinyint(1) ,
  `p4_removesHatNo` tinyint(1) ,
  `p4_noParentsConcerns18mOk` tinyint(1) ,
  `p4_noParentsConcerns18mNo` tinyint(1) ,
  `p4_2wSentenceOk` tinyint(1) ,
  `p4_2wSentenceNo` tinyint(1) ,
  `p4_one2stepdirectionsOk` tinyint(1) ,
  `p4_one2stepdirectionsNo` tinyint(1) ,
  `p4_walksbackwardOk` tinyint(1) ,
  `p4_walksbackwardNo` tinyint(1) ,
  `p4_runsOk` tinyint(1) ,
  `p4_runsNo` tinyint(1) ,
  `p4_smallContainerOk` tinyint(1) ,
  `p4_smallContainerNo` tinyint(1) ,
  `p4_pretendsPlayOk` tinyint(1) ,
  `p4_pretendsPlayNo` tinyint(1) ,
  `p4_newSkillsOk` tinyint(1) ,
  `p4_newSkillsNo` tinyint(1) ,
  `p4_noParentsConcerns24mOk` tinyint(1) ,
  `p4_noParentsConcerns24mNo` tinyint(1) ,
  `p4_3directionsOk` tinyint(1) ,
  `p4_3directionsNo` tinyint(1) ,
  `p4_asksQuestionsOk` tinyint(1) ,
  `p4_asksQuestionsNo` tinyint(1) ,
  `p4_upDownStairsOk` tinyint(1) ,
  `p4_upDownStairsNo` tinyint(1) ,
  `p4_undoesZippersOk` tinyint(1) ,
  `p4_undoesZippersNo` tinyint(1) ,
  `p4_tries2comfortOk` tinyint(1) ,
  `p4_tries2comfortNo` tinyint(1) ,
  `p4_noParentsConcerns48mOk` tinyint(1) ,
  `p4_noParentsConcerns48mNo` tinyint(1) ,
  `p4_2directionsOk` tinyint(1) ,
  `p4_2directionsNo` tinyint(1) ,
  `p4_5ormoreWordsOk` tinyint(1) ,
  `p4_5ormoreWordsNo` tinyint(1) ,
  `p4_walksUpStairsOk` tinyint(1) ,
  `p4_walksUpStairsNo` tinyint(1) ,
  `p4_twistslidsOk` tinyint(1) ,
  `p4_twistslidsNo` tinyint(1) ,
  `p4_turnsPagesOk` tinyint(1) ,
  `p4_turnsPagesNo` tinyint(1) ,
  `p4_sharesSometimeOk` tinyint(1) ,
  `p4_sharesSometimeNo` tinyint(1) ,
  `p4_playMakeBelieveOk` tinyint(1) ,
  `p4_playMakeBelieveNo` tinyint(1) ,
  `p4_listenMusikOk` tinyint(1) ,
  `p4_listenMusikNo` tinyint(1) ,
  `p4_noParentsConcerns36mOk` tinyint(1) ,
  `p4_noParentsConcerns36mNo` tinyint(1) ,
  `p4_countsOutloudOk` tinyint(1) ,
  `p4_countsOutloudNo` tinyint(1) ,
  `p4_speaksClearlyOk` tinyint(1) ,
  `p4_speaksClearlyNo` tinyint(1) ,
  `p4_throwsCatchesOk` tinyint(1) ,
  `p4_throwsCatchesNo` tinyint(1) ,
  `p4_hops1footOk` tinyint(1) ,
  `p4_hops1footNo` tinyint(1) ,
  `p4_dressesUndressesOk` tinyint(1) ,
  `p4_dressesUndressesNo` tinyint(1) ,
  `p4_obeysAdultOk` tinyint(1) ,
  `p4_obeysAdultNo` tinyint(1) ,
  `p4_retellsStoryOk` tinyint(1) ,
  `p4_retellsStoryNo` tinyint(1) ,
  `p4_separatesOk` tinyint(1) ,
  `p4_separatesNo` tinyint(1) ,
  `p4_noParentsConcerns60mOk` tinyint(1) ,
  `p4_noParentsConcerns60mNo` tinyint(1) ,
  `p4_fontanellesClosedOk` tinyint(1) ,
  `p4_fontanellesClosedNo` tinyint(1) ,
  `p4_eyes18mOk` tinyint(1) ,
  `p4_eyes18mNo` tinyint(1) ,
  `p4_corneal18mOk` tinyint(1) ,
  `p4_corneal18mNo` tinyint(1) ,
  `p4_hearing18mOk` tinyint(1) ,
  `p4_hearing18mNo` tinyint(1) ,
  `p4_tonsil18mOk` tinyint(1) ,
  `p4_tonsil18mNo` tinyint(1) ,
  `p4_bloodpressure24mOk` tinyint(1) ,
  `p4_bloodpressure24mNo` tinyint(1) ,
  `p4_eyes24mOk` tinyint(1) ,
  `p4_eyes24mNo` tinyint(1) ,
  `p4_corneal24mOk` tinyint(1) ,
  `p4_corneal24mNo` tinyint(1) ,
  `p4_hearing24mOk` tinyint(1) ,
  `p4_hearing24mNo` tinyint(1) ,
  `p4_tonsil24mOk` tinyint(1) ,
  `p4_tonsil24mNo` tinyint(1) ,
  `p4_bloodpressure48mOk` tinyint(1) ,
  `p4_bloodpressure48mNo` tinyint(1) ,
  `p4_eyes48mOk` tinyint(1) ,
  `p4_eyes48mNo` tinyint(1) ,
  `p4_corneal48mOk` tinyint(1) ,
  `p4_corneal48mNo` tinyint(1) ,
  `p4_hearing48mOk` tinyint(1) ,
  `p4_hearing48mNo` tinyint(1) ,
  `p4_tonsil48mOk` tinyint(1) ,
  `p4_tonsil48mNo` tinyint(1) ,
  `p4_problems18m` text,
  `p4_problems24m` text,
  `p4_problems48m` text,
  `p4_signature18m` varchar(250) ,
  `p4_signature24m` varchar(250) ,
  `p4_signature48m` varchar(250) ,
  `p1_signature1w` varchar(250) ,
  `p1_signature1m` varchar(250) ,
  `p2_signature6m` varchar(250) ,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;
