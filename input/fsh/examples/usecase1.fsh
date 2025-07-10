// Automatically generated from graphBuilder.
// Project: Pregnancy, Fetal and Child Health Record - Use Case 1 - Service Request (id1666689652329)
// View: Initial view

Instance: uc1-mother
InstanceOf: Patient
Title: "UC1 Mother Patient"
Description: "An example of a mother Patient"
Usage: #example
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "123456"
* gender = #female
* birthDate = "1990-03-06"
* link.other = Reference(uc1-mother-relatedperson)
* link.type = #seealso


Instance: uc1-fetus
InstanceOf: IBCMFetalPatient
Title: "UC1 Fetus Patient"
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-fetalStatus"
* extension.valueCode = #potential-for-live-birth
* identifier.type =  http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier.system = "http://example.com/identifiers/fetus"
* identifier.value = "A"
* gender = #female



Instance: uc1-mother-relatedperson
InstanceOf: RelatedPerson
Title: "UC1 RelatedPerson"
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(uc1-fetus)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"

Instance: uc1-practitioner
InstanceOf: Practitioner
Title: "UC1 Practitioner"
Description: "An example of a Practitioner"
Usage: #example
* name.text = "Dr. Hunt"

Instance: uc1-pregnancy
InstanceOf: Condition
Title: "UC1 Pregnancy"
Description: "An example of a pregnancy Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* code =  $sct#364320009 "Pregnancy observable (observable entity)"
* subject = Reference(uc1-mother)


Instance: uc1-gestation21
InstanceOf: Observation
Title: "UC1 Gestational Age 21 weeks"
Description: "An example of a pregnancy duration Observation (21 weeks)"
Usage: #example

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code =  $sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(uc1-mother)
* focus = Reference(uc1-pregnancy)
* valueQuantity = 21.43 'wk' "wk"
* performer = Reference(Practitioner/uc1-practitioner)
* effectiveDateTime = "2024-03-22"


Instance: uc1-gestation37
InstanceOf: Observation
Title: "UC1 Gestational Age 37 weeks"
Description: "An example of a pregnancy duration Observation (37 weeks)"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(Patient/uc1-patient)
* focus = Reference(uc1-pregnancy)
* valueQuantity = 37.71 'wk' "wk"
* performer = Reference(Practitioner/uc1-practitioner)
* effectiveDateTime = "2024-07-14"

// Reference to Patient: Mother
* subject = Reference(uc1-mother)

Instance: uc1-estimatedfetalbodyweight
InstanceOf: Observation
Title: "UC1 Estimated Fetal Body Weight"
Description: "An example of a fetal body weight Observation"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = $loinc#89087-1 "Fetal Body weight Estimated"
* subject = Reference(uc1-fetus)
* valueQuantity = 2960 'g' "g"
* performer = Reference(Practitioner/uc1-practitioner)
* effectiveDateTime = "2024-03-22"
* status = #final


Instance: uc1-399216004
InstanceOf: Condition
Title: "UC1 D-Transposition of the Great Vessels"
Description: "An example of a fetus disorder Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* category.coding[0] = $condition-category#problem-list-item "Problem List Item"
* category.coding[+] =  $sct#414025005 "Disorder of fetus and/or newborn (disorder)"
* code =  $sct#399216004 "D - transposition of the great vessels"
* subject = Reference(uc1-fetus)
* evidence.reference = Reference(uc1-ultrasoundreport)


Instance: uc1-ultrasoundreport
InstanceOf: DiagnosticReport
Title: "UC1 UltraSound Report 21 weeks"
Description: "An example of an ultrasound scan DiagnosticReport (21 weeks)"
Usage: #example
* status = #final
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc1-mother)
* result = Reference(uc1-estimatedfetalbodyweight)


Instance: uc1-ultrasoundscan
InstanceOf: Procedure
Title: "UC1 UltraSound Report 37 weeks"
Description: "An example of an ultrasound scan DiagnosticReport (37 weeks)"
Usage: #example
* status = #completed
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc1-mother)
* report = Reference(uc1-ultrasoundreport)
* supportingInfo = Reference(uc1-gestation37)


Instance: uc1-medicationrequest
InstanceOf: MedicationRequest
Title: "UC1 MedicationRequest Prostaglandin E Infusion"
Description: "An example of a MedicationRequest for the fetus"
Usage: #example
* identifier.use = #official
* identifier.system = "http://www.example.org/prescriptions"
* identifier.value = "12345689"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location#inpatient "Inpatient"
* medication.reference = Reference(Medication/uc1-medication)
* subject = Reference(uc1-fetus)
* supportingInformation = Reference(Observation/uc1-estimatedfetalbodyweight)
* reason.reference = Reference(uc1-399216004)
* note.text = "Administration just after birth following umbilical line placement"
* dosageInstruction.text = "based on a dosing weight of 3kg"
//* dosageInstruction.timing.repeat.when = http://hl7.org/fhir/event-timing#IMD "Immediate"
* dosageInstruction.route =  $sct#58100008 "Intra-arterial route"
* dosageInstruction.method =  $sct#386482009 "Umbilical line tube care"
* dosageInstruction.doseAndRate.rateQuantity = 0.01 'mg/kg/min'
// Reference to Observation: Estimated birth weight
* supportingInformation[1] = Reference(uc1-estimatedfetalbodyweight)

Instance: uc1-medication
InstanceOf: Medication
Title: "UC1 Medication Prostaglandin E"
Description: "An example of a Medication"
Usage: #example
* code = http://snomed.info/sct#418517007 "Prostaglandin group E"
* status = #active


