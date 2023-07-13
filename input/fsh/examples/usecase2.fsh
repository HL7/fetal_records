// Automatically generated from graphBuilder.
// Project: Pregnancy, Fetal and Child Health Record - Use Case 2 - Result Reporting (id1669729437342)
// View: Initial view

Instance: us2-mother
InstanceOf: Patient
Description: "An example of a mother Patient"
Usage: #example
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "123456"
* gender = #female
* birthDate = "1994-02-01"
* link[0].other = Reference(RelatedPerson/us2-mother-fetusA)
* link[0].type = #seealso
* link[1].other = Reference(RelatedPerson/us2-mother-fetusB)
* link[1].type = #seealso

Instance: us2-fetusA
InstanceOf: Patient
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-bornStatus"
* extension.valueCode = #unborn
* identifier.system = "http://hl7.org/fhir/identifiers/fetus"
* identifier.value = "A"


Instance: us2-mother-fetusA
InstanceOf: RelatedPerson
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(Patient/us2-fetusA)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"


Instance: us2-fetusB
InstanceOf: Patient
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-bornStatus"
* extension.valueCode = #unborn
* identifier.system = "http://hl7.org/fhir/identifiers/fetus"
* identifier.value = "B"


Instance: us2-mother-fetusB
InstanceOf: RelatedPerson
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(us2-fetusB)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"


Instance: us2-pregnancy
InstanceOf: Condition
Description: "An example of a pregnancy Condition"
Usage: #example
* clinicalStatus = #active
* code = http://snomed.info/sct#364320009 "Pregnancy observable (observable entity)"
* subject = Reference(us2-mother)


Instance: us2-17190001
InstanceOf: Condition
Description: "An example of a fetus disorder (Congenital diaphragmatic hernia) Condition"
Usage: #example
* clinicalStatus = #active
* category = http://snomed.info/sct#414025005 "Disorder of fetus or newborn (disorder)"
* code = http://snomed.info/sct#17190001 "Congenital diaphragmatic hernia (disorder)"
* bodySite.extension.url = "http://hl7.org/fhir/StructureDefinition/bodysite-laterality"
* bodySite.extension.valueCodeableConcept = http://snomed.info/sct#7771000 "Left"
* bodySite = http://snomed.info/sct#5798000 "Diaphragm"
* subject = Reference(Patient/us2-fetusA)

Instance: us2-416010008
InstanceOf: Condition
Description: "An example of a fetus disorder (Hypospadias) Condition"
Usage: #example
* clinicalStatus = #active
* category = http://snomed.info/sct#414025005 "Disorder of fetus or newborn (disorder)"
* code = http://snomed.info/sct#416010008 "Hypospadias (disorder)"
* subject = Reference(Patient/us2-fetusB)

Instance: us2-lhr
InstanceOf: Observation
Description: "An example of a fetus Lung-Head Ratio Observation"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#LHR "Lung-Head Ratio"
* subject = Reference(us2-fetusA)
* valueQuantity = 0.67 '%' "%"


Instance: us2-karyotype-fetusA
InstanceOf: Observation
Description: "An example of a Karyotype Observation"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#734840008 "Karyotype (cell structure)"
* subject = Reference(us2-fetusA)
* valueCodeableConcept = http://snomed.info/sct#734871004 "Karyotype evaluation normal (finding)"


Instance: us2-karyotype-fetusB
InstanceOf: Observation
Description: "An example of a Karyotype Observation"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#734840008 "Karyotype (cell structure)"
* subject = Reference(us2-fetusB)
* valueCodeableConcept = http://snomed.info/sct#734871004 "Karyotype evaluation normal (finding)"


Instance: us2-gestation20
InstanceOf: Observation
Description: "An example of a fetal gestational age Observation (20 weeks)"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(us2-mother)
* focus = Reference(us2-pregnancy)
* valueQuantity = 20 'wk' "wk"


Instance: us2-gestation24
InstanceOf: Observation
Description: "An example of a fetal gestational age Observation (24.14 weeks)"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(us2-mother)
* focus = Reference(us2-pregnancy)
* valueQuantity = 24.14 'wk' "wk"


Instance: us2-lungvolume
InstanceOf: Observation
Description: "An example of an observed:expected lung volume Observation"
Usage: #example
* status = #final
* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"
* code = http://snomed.info/sct#xxx "Observed:expected lung volume"
* subject = Reference(us2-fetusA)
* valueQuantity = 0.21 '%' "%"
* method = http://snomed.info/sct#113091000 "Magnetic resonance imaging (procedure)"


Instance: us2-ultrasoundreport24
InstanceOf: DiagnosticReport
Description: "An example of an ultrasound scan DiagnosticReport (24 weeks)"
Usage: #example
* status = #final
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us2-mother)
* result[0] = Reference(us2-lhr)
* result[+] = Reference(us2-lungvolume)


Instance: us2-ultrasoundreport20
InstanceOf: DiagnosticReport
Description: "An example of an ultrasound scan DiagnosticReport (20 weeks)"
Usage: #example
* status = #final
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us2-mother)


Instance: us2-amniocentesisreport
InstanceOf: DiagnosticReport
Description: "An example of an amniocentesis DiagnosticReport"
Usage: #example
* status = #final
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us2-mother)
* result[0] = Reference(us2-karyotype-fetusA)
* result[+] = Reference(us2-karyotype-fetusB)


Instance: us2-ultrasoundscan20
InstanceOf: Procedure
Description: "An example of an ultrasound scan Procedure (20 weeks)"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension.valueReference = Reference(us2-gestation20)
* status = #completed
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us2-mother)
* report = Reference(us2-ultrasoundreport20)


Instance: us2-ultrasoundscan24
InstanceOf: Procedure
Description: "An example of an ultrasound scan Procedure (24 weeks)"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension.valueReference = Reference(us2-gestation24)
* status = #completed
* code = http://snomed.info/sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(us2-mother)
* report = Reference(us2-ultrasoundreport24)


Instance: us2-amniocentesis
InstanceOf: Procedure
Description: "An example of an amniocentesis Procedure"
Usage: #example
* status = #completed
* code = http://snomed.info/sct#34536000 "Amniocentesis (procedure)"
* subject = Reference(us2-mother)
* report = Reference(us2-amniocentesisreport)

