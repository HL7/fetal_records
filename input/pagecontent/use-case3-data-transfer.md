#### Use case 3: Data Transfer
##### Description
This is a basic use case where you communicate data from one system to another system. Usually such a data transfer is a combined set of data with information about the mother, the pregnancy or the fetus. 

This of course could be in the various stages of the pregnancy and that has direct consequences on how to compose the set to communicate. Is there only a mother record? Are there fetus medical records? Is there already a child record?

There is more or less general consensus of what a child record should contain and in the elaboration of this use case we will explore the data categories.

>Patient Information:
>Ms. MS is a 32-year-old female residing in a rural village in Sri Lanka. She was born on February 1, 1991, from a healthy couple and was diagnosed with achondroplasia based on clinical diagnosis, as she had macrocephaly and short limbs at birth. Her current address is 88 Factory Road, Peradeniya, and she can be contacted at +94771234567.
>
>Pregnancy Details:
>Ms. MS's pregnancy was confirmed at 8 weeks of gestation by a urine HCG test, after which she was regularly monitored at the local Medical Officer of Health office (MOH) on a monthly basis. During the first visit, baseline examinations and testing done such as weight (47kg), height (147cm), Hb (12g/dl), Urine for sugar (negative). Continued monthly follow up at MOH office MS continued the pregnancy follow up at local MOH clinic. Other than general wellbeing, fetal growth by examination and maternal body weight is measured.
>
>Additionally, she was seen by an obstetrician once every trimester at Teaching Hospital Kandy.
>At 32 weeks of pregnancy, Ms. MS had her third visit to the Obstetrician at Teaching Hospital Kandy, during which an ultrasound scan was performed. The scan revealed that the femur length (40mm) was lower than the expected range for the period of gestation, but the head circumference (318mm) was larger than expected. Besides, her general well-being and a few other parameters, including weight, were recorded and found to be within the normal range.
>
>Management Plan:
>Considering the patient's medical history and ultrasound findings, the Obstetrician planned an Elective Lower Segment Cesarean (EL/LCSC) delivery at 38 weeks of gestation.

##### Roles & systems
Record initiator: Source provider
Record receiver;  Record receiver.
Subject of procedure: fetus, mother, child or pregnancy.
Carrier: pregnant woman

In this use case a source provider compiles a collection of data from the mother, the fetus and the pregnancy and sends it to a receiving system. The receiving system responds to the initiator to indicate whether it can process the information or else replies that it does not understand what is being sent.  

<<<<<<< Updated upstream
<center>
<table><tr><td><img src="usecase3-roles.png" style="width:60%; height: 60%" alt="Use case 3 Roles"/></td></tr></table>
</center>


=======
<div>
<img src="usecase3-roles.png" alt="Use case 3 Data Transfer" width="50%" height="50%" class="center">
</div>
>>>>>>> Stashed changes

#### FHIR
The graphs below show the mapping of this use case to FHIR. The FHIR example resources can be found in the [FHIR artifacts](artifacts.html#2) section of this IG and in the tables below. Note that the example resources corresponding to this use case are prefixed with UC3.

The first graph represents the first visit to the MOH. Baseline examinations and testing are performed such as weight (47kg), height (147cm), Hb (12g/dl), Urine for sugar (negative)
<center>
<table><tr><td><img src="usecase3-firstMOHvisit.png" style="width:100%;" alt="Use case 3 Data Transfer First MOH visit"/></td></tr></table>
</center>


<<<<<<< Updated upstream

The second graph represents an example of a follow-up visit to the MHO. Other than general wellbeing, fetal growth by examination and maternal body weight is measured.

<center>
<table><tr><td><img src="usecase3-followupMOHvisit.png" style="width:100%;" alt="Use case 3 Data Transfer Follow up MOH visit"/></td></tr></table>
</center>


The third graph represents the third visit to the Obstetrician at Teaching Hospital Kandy, during which an ultrasound scan was performed. The scan revealed that the femur length (40mm) was lower than the expected range for the period of gestation, but the head circumference (318mm) was larger than expected. Besides, her general well-being and a few other parameters, including weight, were recorded and found to be within the normal range. Considering the patient's medical history and ultrasound findings, the Obstetrician planned an Elective Lower Segment Cesarean (EL/LCSC) delivery at 38 weeks of gestation.

<center>
<table><tr><td><img src="usecase3-thirdKandyvisit.png" style="width:100%;" alt="Use case 3 Data Transfer Third visit Teaching Hospital Kandy"/></td></tr></table>
</center>
=======
<div>
<img src="usecase3-firstMOHvisit.png" alt="Use case 3 First MOH visit" width="65%" height="65%" class="center">
</div>

| Concept   | Resource type | Example
| -------- | ------- |
| Ms. MS - 32-year-old female  | Patient  | [UC3 Mother](Patient-uc3-mother.html)
| Pregnancy | Condition | [UC3 Pregnancy](Condition-uc3-pregnancy.html)
| First visit to the MOH | Encounter | [UC3 First MOH Visit](Encounter-uc3-encounter-firstMOHvisit.html)
| MOH | Location | [UC3 Local MOH](Location-uc3-location-localMOH.html)
| Pregnancy test | Observation | [UC3 Pregnancy Test First MOH Visit](Observation-uc3-pregnancytest-firstMOHVisit.html)
| Body weight | Observation | [UC3 Body Weight First MOH Visit](Observation-uc3-bodyweight-firstMOHvisit.html)
| Body height | Observation | [UC3 Body Height First MOH Visit](Observation-uc3-bodyheight-firstMOHvisit.html)
| Hemoglobin | Observation | [UC3 Hemoglobin First MOH Visit](Observation-uc3-hemoglobin-firstMOHvisit.html)
| Reducing substances | Observation | [UC3 Reducing Substances First MOH Visit](Observation-uc3-reducingsubstances-firstMOHvisit.html)

The second graph represents an example of a follow-up visit to the MHO. Other than general wellbeing, fetal growth by examination and maternal body weight is measured.

<div>
<img src="usecase3-followupMOHvisit.png" alt="Use case 3 Data Transfer Follow up MOH visit" width="65%" height="650%" class="center">
</div>

| Concept   | Resource type | Example
| -------- | ------- |
| Ms. MS - 32-year-old female  | Patient  | [UC3 Mother](Patient-uc3-mother.html)
| Pregnancy | Condition | [UC3 Pregnancy](Condition-uc3-pregnancy.html)
| Follow-up visit to the MOH | Encounter | [UC3 Follow Up MOH Visit](Encounter-uc3-encounter-followupMOHvisit.html)
| MOH | Location | [UC3 Local MOH](Location-uc3-location-localMOH.html)
| Body weight | Observation | [UC3 Body Weight Follow Up MOH Visit](Observation-uc3-bodyweight-followupMOHvisit.html)
| Uterus Fundal Weight | Observation | [UC3 Uterus Fundal Weight Follow Up MOH Visit](Observation-uc3-uterusfundalheight-followupMOHvisit.html)

The third graph represents the third visit to the Obstetrician at Teaching Hospital Kandy, during which an ultrasound scan was performed. The scan revealed that the femur length (40mm) was lower than the expected range for the period of gestation, but the head circumference (318mm) was larger than expected. Besides, her general well-being and a few other parameters, including weight, were recorded and found to be within the normal range. Considering the patient's medical history and ultrasound findings, the Obstetrician planned an Elective Lower Segment Cesarean (EL/LCSC) delivery at 38 weeks of gestation.

<div>
<img src="usecase3-thirdKandyvisit.png" alt="Use case 3 Data Transfer Third visit Teaching Hospital Kandy" width="80%" height="80%" class="center">
</div>

| Concept   | Resource type | Example
| -------- | ------- |
| Ms. MS - 32-year-old female  | Patient  | [UC3 Mother](Patient-uc3-mother.html)
| Pregnancy | Condition | [UC3 Pregnancy](Condition-uc3-pregnancy.html)
| Fetus | Patient | [UC3 Fetus](Patient-uc3-fetus.html)
| Relation mother and fetus | RelatedPerson | [UC3 RelatedPerson Fetus](RelatedPerson-uc3-mother-fetus.html)
| Third visit to the Obstetrician at Teaching Hospital Kandy | Encounter | [UC3 Obstetric Clinic Encounter](Encounter-uc3-encounter-obsclinic.html)
| Third visit to the Obstetrician at Teaching Hospital Kandy | Encounter | [UC3 Obstetric Clinic Encounter](Encounter-uc3-encounter-obsclinic.html)
| Kandy Hospital | Location | [UC3 Kandy Hospital](Location-uc3-location-KandyHospital.html)
| Patient's medical history | FamilyMemberHistory | [UC3 FamilyMemberHistory of Fetus](FamilyMemberHistory-uc3-familymemberhistory.html)
| Head circumference (318mm) | Observation | [UC3 Head Circumference Obstetric Clinic](Observation-uc3-headcircumference-obsclinic.html)
| Femur length (40mm) | Observation | [UC3 Femur Length Obstetric Clinic](Observation-uc3-femurlenght-obsclinic.html)
| Body weight | Observation | ?
| Planned Elective Lower Segment Cesarean (EL/LCSC) delivery at 38 weeks of gestation | Careplan | [UC3 Care Plan](CarePlan-uc3-careplan.html)
>>>>>>> Stashed changes

