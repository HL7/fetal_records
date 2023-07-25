// Automatically generated from graphBuilder.
// Project: Pregnancy, Fetal and Child Health Record - Use Case 2 - Result Reporting (id1669729437342)
// View: Initial view

Instance: uc2-mother
InstanceOf: Patient
Title: "UC2 Mother Patient"
Description: "An example of a mother Patient"
Usage: #example
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "123456"
* gender = #female
* birthDate = "1994-02-01"
* link[0].other = Reference(RelatedPerson/uc2-mother-fetusA)
* link[0].type = #seealso
* link[1].other = Reference(RelatedPerson/uc2-mother-fetusB)
* link[1].type = #seealso

Instance: uc2-fetusA
InstanceOf: IBCMFetalPatient
Title: "UC2 Fetus A Patient"
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-bornStatus"
* extension.valueCode = #unborn
* identifier.type =  http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier.system = "http://example.com/identifiers/fetus"
* identifier.value = "A"


Instance: uc2-mother-fetusA
InstanceOf: RelatedPerson
Title: "UC2 RelatedPerson Fetus A"
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(Patient/uc2-fetusA)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"


Instance: uc2-fetusB
InstanceOf: IBCMFetalPatient
Title: "UC2 Fetus B Patient"
Description: "An example of a fetus Patient"
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/patient-bornStatus"
* extension.valueCode = #unborn
* identifier.type =  http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier.system = "http://example.com/identifiers/fetus"
* identifier.value = "B"


Instance: uc2-mother-fetusB
InstanceOf: RelatedPerson
Title: "UC2 RelatedPerson Fetus B"
Description: "An example of a RelatedPerson defining the mother relationship from the perspective of the fetus Patient"
Usage: #example
* patient = Reference(uc2-fetusB)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"


Instance: uc2-pregnancy
InstanceOf: Condition
Title: "UC2 Pregnancy"
Description: "An example of a pregnancy Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* code =  $sct#364320009 "Pregnancy observable (observable entity)"
* subject = Reference(uc2-mother)


Instance: uc2-17190001
InstanceOf: Condition
Title: "UC2 Congenital Diaphragmatic Hernia Fetus A"
Description: "An example of a fetus disorder (Congenital diaphragmatic hernia) Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* category.coding[0] = $condition-category#problem-list-item "Problem List Item"
* category.coding[+] =  $sct#414025005 "Disorder of fetus or newborn (disorder)"
* code =  $sct#17190001 "Congenital diaphragmatic hernia (disorder)"
* bodySite =  $sct#5798000 "Diaphragm"
* subject = Reference(Patient/uc2-fetusA)

Instance: uc2-416010008
InstanceOf: Condition
Title: "UC2 Hypospadias Fetus B"
Description: "An example of a fetus disorder (Hypospadias) Condition"
Usage: #example
* clinicalStatus = $condition-clinical-code#active
* category.coding[0] = $condition-category#problem-list-item "Problem List Item"
* category.coding[+] =  $sct#414025005 "Disorder of fetus or newborn (disorder)"
* code =  $sct#416010008 "Hypospadias (disorder)"
* subject = Reference(Patient/uc2-fetusB)

Instance: uc2-lhr
InstanceOf: Observation
Title: "UC2 Lung-Head Ratio Fetus A"
Description: "An example of a fetus Lung-Head Ratio Observation"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#LHR "Lung-Head Ratio"
* subject = Reference(uc2-fetusA)
* valueQuantity = 0.67 '%' "%"


Instance: uc2-karyotype-fetusA
InstanceOf: Observation
Title: "UC2 Karyotype Fetus A"
Description: "An example of a Karyotype Observation"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#734840008 "Karyotype (cell structure)"
* subject = Reference(uc2-fetusA)
* valueCodeableConcept =  $sct#734871004 "Karyotype evaluation normal (finding)"


Instance: uc2-karyotype-fetusB
InstanceOf: Observation
Title: "UC2 Karyotype Fetus B"
Description: "An example of a Karyotype Observation"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#734840008 "Karyotype (cell structure)"
* subject = Reference(uc2-fetusB)
* valueCodeableConcept =  $sct#734871004 "Karyotype evaluation normal (finding)"


Instance: uc2-gestation20
InstanceOf: Observation
Title: "UC2 Gestationale Age 20 weeks"
Description: "An example of a fetal gestational age Observation (20 weeks)"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(uc2-mother)
* focus = Reference(uc2-pregnancy)
* valueQuantity = 20 'wk' "wk"


Instance: uc2-gestation24
InstanceOf: Observation
Title: "UC2 Gestationale Age 24.14 weeks"
Description: "An example of a fetal gestational age Observation (24.14 weeks)"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#57036006 "Fetal gestational age (observable entity)"
* subject = Reference(uc2-mother)
* focus = Reference(uc2-pregnancy)
* valueQuantity = 24.14 'wk' "wk"


Instance: uc2-lungvolume
InstanceOf: Observation
Title: "UC2 Observed:Expected Lung Volume Fetus A"
Description: "An example of an observed:expected lung volume Observation"
Usage: #example
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code =  $sct#xxx "Observed:expected lung volume"
* subject = Reference(uc2-fetusA)
* valueQuantity = 0.21 '%' "%"
* method =  $sct#113091000 "Magnetic resonance imaging (procedure)"


Instance: uc2-ultrasoundreport24
InstanceOf: DiagnosticReport
Title: "UC2 UltraSound Scan 24 weeks"
Description: "An example of an ultrasound scan DiagnosticReport (24 weeks)"
Usage: #example
* status = #final
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc2-mother)
* result[0] = Reference(uc2-lhr)
* result[+] = Reference(uc2-lungvolume)


Instance: uc2-ultrasoundreport20
InstanceOf: DiagnosticReport
Title: "UC2 UltraSound Report 24 weeks"
Description: "An example of an ultrasound scan DiagnosticReport (20 weeks)"
Usage: #example
* status = #final
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc2-mother)


Instance: uc2-amniocentesisreport
InstanceOf: DiagnosticReport
Title: "UC2 Amniocentesis Report"
Description: "An example of an amniocentesis DiagnosticReport"
Usage: #example
* status = #final
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc2-mother)
* result[0] = Reference(uc2-karyotype-fetusA)
* result[+] = Reference(uc2-karyotype-fetusB)


Instance: uc2-ultrasoundscan20
InstanceOf: Procedure
Title: "UC2 UltraSound Scan Procedure 20 weeks"
Description: "An example of an ultrasound scan Procedure (20 weeks)"
Usage: #example
* status = #completed
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc2-mother)
* report = Reference(uc2-ultrasoundreport20)
* supportingInfo = Reference(uc2-gestation20)


Instance: uc2-ultrasoundscan24
InstanceOf: Procedure
Title: "UC2 UltraSound Scan Procedure 24 weeks"
Description: "An example of an ultrasound scan Procedure (24 weeks)"
Usage: #example


* status = #completed
* code =  $sct#241493005 "Ultrasound scan for fetal growth (procedure)"
* subject = Reference(uc2-mother)
* report = Reference(uc2-ultrasoundreport24)
* supportingInfo = Reference(uc2-gestation20)


Instance: uc2-amniocentesis
InstanceOf: Procedure
Title: "UC2 Amniocentesis Procedure"
Description: "An example of an amniocentesis Procedure"
Usage: #example
* status = #completed
* code =  $sct#34536000 "Amniocentesis (procedure)"
* subject = Reference(uc2-mother)
* report = Reference(uc2-amniocentesisreport)

