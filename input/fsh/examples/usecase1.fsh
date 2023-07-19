// Automatically generated from graphBuilder.
// Project: Pregnancy, Fetal and Child Health Record - Use Case 1 - Service Request (id1666689652329)
// View: Initial view

Instance: us1-mother
InstanceOf: Patient
Description: "An example of a mother Patient"
Usage: #example
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "123456"
* gender = #female
* birthDate = "1990-03-06"
* link.other = Reference(us1-mother-relatedperson)
* link.type = #seealso


Instance: us1-fetus
InstanceOf: IBCMFetalPatient
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-bornStatus"
* extension.valueCode = #unborn
* identifier.type =  http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier.system = "http://hl7.org/fhir/identifiers/fetus"
* identifier.value = "A"
* gender = #female


Instance: us1-mother-relatedperson
InstanceOf: RelatedPerson
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(us1-fetus)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"


Instance: us1-pregnancy
InstanceOf: Condition
Description: "An example of a pregnancy Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* code = http://snomed.info/sct#364320009 "Pregnancy observable (observable entity)"
* subject = Reference(us1-mother)


Instance: us1-gestation21
InstanceOf: Observation
Description: "An example of a pregnancy duration Observation (21 weeks)"
Usage: #example

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = https://snomed.info/sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(us1-mother)
* focus = Reference(us1-pregnancy)
* valueQuantity = 21.43 'wk' "wk"


Instance: us1-gestation37
InstanceOf: Observation
Description: "An example of a pregnancy duration Observation (37 weeks)"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(Patient/us1-patient)
* focus = Reference(us1-pregnancy)
* valueQuantity = 37.71 'wk' "wk"

// Reference to Patient: Mother
* subject = Reference(us1-mother)

Instance: us1-estimatedfetalbodyweight
InstanceOf: Observation
Description: "An example of a fetal body weight Observation"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = https://loinc.org#89087-1 "Fetal Body weight Estimated"
* subject = Reference(us1-fetus)
* valueQuantity = 2960 'g' "g"

* status = #final


Instance: us1-399216004
InstanceOf: Condition
Description: "An example of a fetus disorder Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* category.coding[0] = $condition-category#problem-list-item "Problem List Item"
* category.coding[+] = http://snomed.info/sct#414025005 "Disorder of fetus or newborn (disorder)"
* code = http://snomed.info/sct#399216004 "D - transposition of the great vessels"
* subject = Reference(us1-fetus)
* evidence.reference = Reference(us1-ultrasoundreport)


Instance: us1-ultrasoundreport
InstanceOf: DiagnosticReport
Description: "An example of an ultrasound scan DiagnosticReport (21 weeks)"
Usage: #example
* status = #final
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us1-mother)
* result = Reference(us1-estimatedbirthweight)


Instance: us1-ultrasoundscan
InstanceOf: Procedure
Description: "An example of an ultrasound scan DiagnosticReport (37 weeks)"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension.valueReference = Reference(us1-gestation37)
* status = #completed
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us1-mother)
* report = Reference(us1-ultrasoundreport)


Instance: us1-medicationrequest
InstanceOf: MedicationRequest
Description: "An example of a MedicationRequest for the fetus"
Usage: #example
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/prescriptions"
* identifier.value = "12345689"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location#inpatient "Inpatient"
* medication.reference = Reference(Medication/med0310)
* subject = Reference(us1-fetus)
* supportingInformation = Reference(Observation/us1-estimatedFetalWeight)
* reason.reference = Reference(us1-399216004)
* note.text = "Administration just after birth following umbilical line placement"
* dosageInstruction.text = "based on a dosing weight of 3kg"
//* dosageInstruction.timing.repeat.when = http://hl7.org/fhir/event-timing#IMD "Immediate"
* dosageInstruction.route = http://snomed.info/sct#58100008 "Intra-arterial route"
* dosageInstruction.method = http://snomed.info/sct#86482009 "Umbilical line tube care"
* dosageInstruction.doseAndRate.rateQuantity = 0.01 'mg/kg/min'
// Reference to Observation: Estimated birth weight
* supportingInformation[1] = Reference(us1-estimatedbirthweight)

