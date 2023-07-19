// Automatically generated from graphBuilder.
// Project: Achondroplasia_Modeling (id1678031521974)
// View: Before Birth

Instance: cfsb1678031552105
InstanceOf: Patient
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


Instance: cfsb1678032682677
InstanceOf: Encounter
Description: "An example of an Encounter of the mother Patient (first MOH Visit)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
* status = #completed
// Reference to Location: Location/Local-MOH
* location.location = Reference(cfsb1678032872351)



Instance: cfsb1678032872351
InstanceOf: Location
Description: "Location/Local-MOH"
Usage: #example
 

Instance: cfsb1678032962708
InstanceOf: Observation
Description: "An example of a qualitative pregnancy test Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit
* encounter = Reference(cfsb1678032682677)
* identifier.system = "$loinc"
* code = $loinc#2106-3
* code.text = "Pregnancy test, qualitative"
* valueString = "Positive"


Instance: cfsb1678033209571
InstanceOf: Observation
Description: "An example of a body weight Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
* code = $loinc#3141-9
* code.text = "Body weight Measured"
 // Reference to Encounter: MOH Visit
* encounter = Reference(cfsb1678032682677)


Instance: cfsb1678033304138
InstanceOf: Observation
Description: "An example of a body height Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit
* encounter = Reference(cfsb1678032682677)
* code = $loinc#3137-7
* code.text = "Body height Measured"


Instance: cfsb1678033379360
InstanceOf: Observation
Description: "An example of a hemoglobin Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit
* encounter = Reference(cfsb1678032682677)
* code = $loinc#718-7
* code.text = "Hemoglobin [Mass/volume] in Blood"


Instance: cfsb1678033472437
InstanceOf: Observation
Description: "An example of a reducing substances Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit
* encounter = Reference(cfsb1678032682677)

* code = $loinc#5809-9
* code.text = "Reducing substances [Presence] in Urine"


Instance: cfsb1678033657903
InstanceOf: Encounter
Description: "An example of an Encounter of the mother Patient (MOH Visit Follow Up)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
* status = #completed

// Reference to Location: Location/Local-MOH
* location.location = Reference(cfsb1678032872351)



Instance: cfsb1678033768865
InstanceOf: Observation
Description: "An example of a uterus fundal height Observation"
Usage: #example

* status = #final
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit Follow Up
* encounter = Reference(cfsb1678033657903)

* code = $loinc#11881-0
* code.text = "Uterus Fundal height Tape measure"


Instance: cfsb1678033874792
InstanceOf: Observation
Description: "An example of a body weight Observation"
Usage: #example

* status = #final 
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
 // Reference to Encounter: MOH Visit Follow Up
* encounter = Reference(cfsb1678033657903)
* code = $loinc#3141-9
* code.text = "Body weight Measured"


Instance: cfsb1678034144351
InstanceOf: Encounter
Description: "An example of an admission Encounter of the mother Patient"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
* status = #completed
* length.value = 1
// Reference to Location: Kandy Hospital
* location.location = Reference(cfsb1678034462190)


Instance: cfsb1678034462190
InstanceOf: Location
Description: "An example of a Location (Kandy Hospital)"
Usage: #example

Instance: cfsb1678034484567
InstanceOf: Procedure
Description: "Child birth"
Usage: #example
 
// Reference to Patient: Mother
* subject = Reference(cfsb1678031552105)
* status = #completed
* code =  $sct#387713003
* code.text = "Cesarean section"
 // Reference to Encounter: Admission
* encounter = Reference(cfsb1678034144351)
 // Reference to Location: Kandy Hospital
* location = Reference(cfsb1678034462190)
* reason.concept.coding.code =  $sct#118997002
* reason.concept.text = "Pregnancy with antenatal problem"


Instance: cfsb1678034617442
InstanceOf: Patient
Description: "An example of a baby Patient"
Usage: #example
 

Instance: cfsb1678035177721
InstanceOf: Encounter
Description: "An example of an Encounter of the baby Patient (Obs Clinic)"
Usage: #example

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* status = #completed
// Reference to Location: Kandy Hospital
* location.location = Reference(cfsb1678034462190)
 // Reference to Patient: Fetus
* subject = Reference(cfsb1678034617442)


Instance: cfsb1678035296785
InstanceOf: Observation
Description: "An example of a femur length Observation"
Usage: #example

* status = #final
 // Reference to Patient: Fetus
* subject = Reference(cfsb1678034617442)
* code = $loinc#LP6702-7
* code.text = "Ultrasound Estimated from FL"
* valueQuantity.value = 40
* valueQuantity.unit = "mm"
 // Reference to Encounter: Obs Clinic
* encounter = Reference(cfsb1678035177721)


Instance: cfsb1678035441094
InstanceOf: Observation
Description: "An example of a head circumference Observation"
Usage: #example

* status = #final
 // Reference to Patient: Fetus
* subject = Reference(cfsb1678034617442)
 // Reference to Encounter: Obs Clinic
* encounter = Reference(cfsb1678035177721)
* code = $loinc#LP6713-4
* code.text = "Ultrasound Estimated from HC"
* valueQuantity.value = 318
* valueQuantity.unit = "mm"


Instance: cfsb1678036069583
InstanceOf: FamilyMemberHistory
Description: "An example of the family member history of the fetus Patient"
Usage: #example
 
// Reference to Patient: Fetus
* patient = Reference(cfsb1678034617442)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"
* status = #partial
* condition.code =  $sct#86268005 "Achondroplasia"
