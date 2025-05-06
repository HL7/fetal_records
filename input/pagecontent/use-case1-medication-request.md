#### Use case 1: Medication request
##### Description
This use case describes a situation where a medication order is placed to administer (medication) substance to a child immediately at birth. The child patient record does not exist yet prior to birth, but the order must be prepared and  ready at the moment of delivery. Therefore the order is placed beforehand with the fetus as the subject. Placing the order with the mother as subject would be incorrect, because the substance is not meant for her. The request is processed with different possible states (of reply). The request is processed with different possible states (of reply).

Note that after birth the fetus becomes a child and a child patient record is created. The completion of the substance administration order would be recorded against the child as a patient.

A FHIR medication request resource can only refer either to a patient or a group. In our use case FHIR medication request resource is referring to the fetus using the FHIR patient with the  extension. This itself is not an issue with FHIR. However we have stated that the fetus itself might lack an identifier and certain systems can fail when placing an order with a missing identifier for the subject.  

>**Postnatal intervention - d-transposition of the great arteries with intact ventricular septum**
>
>A 32 yo Gravida 3 Para 2002 Mother with a history of *hypertension* on *labetolol* during this pregnancy was diagnosed with female fetus with **d-transpositon of the great arteries** (SCTID: 399216004) on fetal echocardiography at 21 3/7 weeks gestation. Most recent U/S at 37 5/7 weeks revealed an *estimated fetal weight* of 2.960 kg.
>
>**Prostoglandin E infusion** 0.01 mg/kg/min was ordered based on a dosing weight of 3kg to be initiated just after birth following umbilical line placement. 

What this use case addresses: medication ordering prior to delivery, assigning a condition to a fetus prior to birth,  assigning gestation specific observation. The issue here is how to make clear that the medication request is meant to suppress high blood pressure of the child immediately after it is born and not the mother.

##### Roles & systems
Order placer: ordering care provider. The order placing system is usually an EHR from the obstetrician. 
Order receiver; Procedure performer. Order receiving systems are for example ultrasound systems, lab systems.
Subject of procedure: mother or  fetus
Carrier: pregnant woman

As mentioned before we have an order placer and an order performer.
The order placer takes the initiative at a specific moment and the order performer reacts whenever a request has been generated.

<div>
<img src="usecase1-roles.png" alt="Use case 1 Medication Request" width="50%" height="50%" class="center">
</div>


##### FHIR
The graph below shows the mapping of this use case to FHIR. The FHIR example resources can be found in the [FHIR artifacts](artifacts.html#2) section of this IG and in the table below. Note that the example resources corresponding to this use case are prefixed with UC1.

<div>
<img src="usecase1.png" alt="Use case 1 Medication Request" width="90%" height="90%" class="center">
</div>

| Concept   | Resource type | Example
| -------- | ------- |
| A 32 yo Mother  | Patient  | [UC1 Mother](Patient-uc1-mother.html)
| Pregnancy  | Condition  | [UC1 Pregnancy](Condition-uc1-pregnancy.html)
| Female fetus  | Patient  | [UC1 Fetus](Patient-uc1-fetus.html)
| Relation mother and fetus  | RelatedPerson    | [UC1 RelatedPerson](RelatedPerson-uc1-mother-relatedperson.html)
| D-transpositon of the great arteries  | Condition  | [UC1 D-Transposition of the Great Vessels](Condition-uc1-399216004.html)
| 21 3/7 weeks gestation | Observation     |  [UC1 Gestational Age 21 weeks](Observation-uc1-gestation21.html)
| U/S at 37 5/7 weeks   | Procedure   | [UC1 Ultrasound Scan](Procedure-uc1-ultrasoundscan.html)
| U/S at 37 5/7 weeks  | DiagnosticReport  | [UC1 Ultrasound Scan](DiagnosticReport-uc1-ultrasoundreport.html)
| 37 5/7 weeks | Observation     |  [UC1 Gestational Age 37 weeks](Observation-uc1-gestation37.html)
| Estimated fetal weight of 2.960 kg | Observation     |  [UC1 Estimated Fetal Weight](Observation-uc1-estimatedfetalbodyweight.html)
| Prostoglandin E   | Medication    | [UC1 Medication](Medication-uc1-medication.html)
| Prostoglandin E infusion 0.01 mg/kg/min   | MedicationRequest    | [UC1 MedicationRequest](MedicationRequest-uc1-medicationrequest.html)  

Note: the following resources are not included in the list of examples
* Condition 1 - Hypertension on labetolo
* Observation 1 - Gravida
* Observation 2 - Para
* Procedure 1 - Fetal echocardiography
* Procedure 3 - Umbilical line placement