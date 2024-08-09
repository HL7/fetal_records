// Automatically generated from graphBuilder.
// Project: Achondroplasia_Modeling (id1678031521974)
// View: Before Birth

Instance: uc3-mother
InstanceOf: Patient
Title: "UC3 Mother Patient"
Description: "An example of a mother Patient"
Usage: #example
 
* identifier.value = "ms"
* active = true
* name.given = "MS"
* gender = #female
* birthDate = "1991-02-01"
* address.line = "88, Factory Road"
* address.city = "Peradeniya"
* address.country = "Sri Lanka"
* contact.telecom.system = #phone
* contact.telecom.value = "+94775588745"

// Reference to RelatedPerson: Mother of fetus
* link.other = Reference(RelatedPerson/uc3-mother-fetus)
* link.type = #seealso


Instance: uc3-practitioner
InstanceOf: Practitioner
Title: "UC3 Practitioner"
Description: "An example of a Practitioner"
Usage: #example
* name.text = "Dr. Hart"

Instance: uc3-practitioner2
InstanceOf: Practitioner
Title: "UC3 Practitioner 2"
Description: "An example of a Practitioner"
Usage: #example
* name.text = "Dr. White"


Instance: uc3-encounter-firstMOHvisit
InstanceOf: Encounter
Title: "UC3 First MOH Visit"
Description: "An example of an Encounter of the mother Patient (first MOH Visit)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
* status = #completed
// Reference to Location: Location/Local-MOH
* location.location = Reference(uc3-location-localMOH)



Instance: uc3-location-localMOH
InstanceOf: Location
Title: "UC3 Local MOH"
Description: "Location/Local-MOH"
Usage: #example
 

Instance: uc3-pregnancytest-firstMOHVisit
InstanceOf: Observation
Title: "UC3 Pregnancy Test First MOH Visit"
Description: "An example of a qualitative pregnancy test Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
 // Reference to Encounter: MOH Visit
* encounter = Reference(uc3-encounter-firstMOHvisit)
* code = $loinc#2106-3 "Choriogonadotropin (pregnancy test) [Presence] in Urine"
* valueString = "Positive"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2023-12-19"

Instance: uc3-bodyweight-firstMOHvisit
InstanceOf: Observation
Title: "UC3 Body Weight First MOH Visit"
Description: "An example of a body weight Observation"
Usage: #example

* status = #final
* category = $observation-category#vital-signs "Vital Signs"
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
* code = $loinc#29463-7 "Body weight"
 // Reference to Encounter: MOH Visit
* encounter = Reference(uc3-encounter-firstMOHvisit)
* effectiveDateTime = "2021-07-03"
* valueQuantity = 49 'kg' "kg"
* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2023-12-19"

Instance: uc3-bodyheight-firstMOHvisit
InstanceOf: Observation
Title: "UC3 Body Height First MOH Visit"
Description: "An example of a body height Observation"
Usage: #example

* status = #final
* category = $observation-category#vital-signs "Vital Signs"
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
 // Reference to Encounter: MOH Visit
* encounter = Reference(uc3-encounter-firstMOHvisit)
* code = $loinc#8302-2 "Body height"
* effectiveDateTime = "2021-07-03"
* valueQuantity = 147 'cm' "cm"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2023-12-19"

Instance: uc3-hemoglobin-firstMOHvisit
InstanceOf: Observation
Title: "UC3 Hemoglobin First MOH Visit"
Description: "An example of a hemoglobin Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
 // Reference to Encounter: MOH Visit
* encounter = Reference(uc3-encounter-firstMOHvisit)
* code = $loinc#718-7 "Hemoglobin [Mass/volume] in Blood"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2023-12-19"

Instance: uc3-reducingsubstances-firstMOHvisit
InstanceOf: Observation
Title: "UC3 Reducing Substances First MOH Visit"
Description: "An example of a reducing substances Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
 // Reference to Encounter: MOH Visit
* encounter = Reference(uc3-encounter-firstMOHvisit)

* code = $loinc#5809-9 "Reducing substances [Presence] in Urine"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2023-12-19"


Instance: uc3-encounter-followupMOHvisit
InstanceOf: Encounter
Title: "UC3 Follow Up MOH Visit"
Description: "An example of an Encounter of the mother Patient (MOH Visit Follow Up)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
* status = #completed

// Reference to Location: Location/Local-MOH
* location.location = Reference(uc3-location-localMOH)



Instance: uc3-uterusfundalheight-followupMOHvisit
InstanceOf: Observation
Title: "UC3 Uterus Fundal Height Follow Up MOH Visit"
Description: "An example of a uterus fundal height Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
 // Reference to Encounter: MOH Visit Follow Up
* encounter = Reference(uc3-encounter-followupMOHvisit)

* code = $loinc#11881-0 "Uterus Fundal height Tape measure"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2024-01-30"


Instance: uc3-bodyweight-followupMOHvisit
InstanceOf: Observation
Title: "UC3 Body Weight Follow Up MOH Visit"
Description: "An example of a body weight Observation"
Usage: #example

* status = #final 
* category = $observation-category#vital-signs "Vital Signs"
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
* code = $loinc#29463-7 "Body weight"
 // Reference to Encounter: MOH Visit Follow Up
* encounter = Reference(uc3-encounter-followupMOHvisit)
* effectiveDateTime = "2021-08-02"
* valueQuantity = 50 'kg' "kg"

* performer = Reference(Practitioner/uc3-practitioner)
* effectiveDateTime = "2024-01-30"

Instance: uc3-location-KandyHospital
InstanceOf: Location
Title: "UC3 Kandy Hospital"
Description: "An example of a Location (Kandy Hospital)"
Usage: #example


Instance: uc3-fetus
InstanceOf: Patient
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-fetalStatus"
* extension.valueCode = #potential-for-live-birth
 

Instance: uc3-encounter-obsclinic
InstanceOf: Encounter
Title: "UC3 Obstetric Clinic Encounter"
Description: "An example of an Encounter of the baby Patient (Obs Clinic)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* status = #completed
// Reference to Location: Kandy Hospital
* location.location = Reference(uc3-location-KandyHospital)
 // Reference to Patient: Fetus
* subject = Reference(uc3-fetus)


Instance: uc3-femurlenght-obsclinic
InstanceOf: Observation
Title: "UC3 Femur Length Obstetric Clinic"
Description: "An example of a femur length Observation"
Usage: #example

* status = #final
 // Reference to Patient: Fetus
* subject = Reference(uc3-fetus)
* code = $loinc#11963-6 "Fetal Femur diaphysis [Length] US"
* valueQuantity.value = 40
* valueQuantity.unit = "mm"
 // Reference to Encounter: Obs Clinic
* encounter = Reference(uc3-encounter-obsclinic)

* performer = Reference(Practitioner/uc3-practitioner2)
* effectiveDateTime = "2024-04-09"

Instance: uc3-headcircumference-obsclinic
InstanceOf: Observation
Title: "UC3 Head Circumference Obstetric Clinic"
Description: "An example of a head circumference Observation"
Usage: #example

* status = #final
 // Reference to Patient: Fetus
* subject = Reference(uc3-fetus)
 // Reference to Encounter: Obs Clinic
* encounter = Reference(uc3-encounter-obsclinic)
* code = $loinc#11984-2 "Fetal Head Circumference US"
* valueQuantity.value = 318
* valueQuantity.unit = "mm"

* performer = Reference(Practitioner/uc3-practitioner2)
* effectiveDateTime = "2024-04-09"


Instance: uc3-familymemberhistory
InstanceOf: FamilyMemberHistory
Title: "UC3 FamilyMemberHistory of Fetus"
Description: "An example of the family member history of the fetus Patient"
Usage: #example
 
// Reference to Patient: Fetus
* patient = Reference(uc3-fetus)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"
* status = #partial
* condition.code =  $sct#86268005 "Achondroplasia"


Instance: uc3-careplan
InstanceOf: CarePlan
Description: "Management Plan"
Usage: #example
 
// Reference to Patient: Mother
* subject = Reference(uc3-mother)
// Reference to Encounter: Encounter Obs Clinic
* encounter = Reference(uc3-encounter-obsclinic)
* status = #active

* intent = #plan

Instance: uc3-mother-fetus
InstanceOf: RelatedPerson
Title: "UC3 RelatedPerson Fetus"
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(Patient/uc3-fetus)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"

Instance: uc3-pregnancy
InstanceOf: Condition
Title: "UC3 Pregnancy"
Description: "An example of a pregnancy Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* code =  $sct#364320009 "Pregnancy observable (observable entity)"
* subject = Reference(uc3-mother)