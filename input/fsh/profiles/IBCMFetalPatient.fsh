

/*
*  ╭──────────────────────────────────────Invariant──────────────────────────────────────────────╮
*  │  The section below describes the different invariants applicable to the profile             │
*  │                                                                                             │
*  ╰─────────────────────────────────────────────────────────────────────────────────────────────╯
*/

Invariant:   ibcm-pat-1
Description: "Patient.birthdate can be present only when the value of extension 'patient-fetalStatus' is not present"
* severity = #error
* expression = "Patient.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/patient-fetalStatus').exists() implies Patient.birthDate.exists().not()"

Invariant:   ibcm-pat-2
Description: "Patient.maritalStatus can be present only when the value of extension 'patient-fetalStatus' is not present"
* severity = #error
* expression = "Patient.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/patient-fetalStatus').exists() implies Patient.maritalStatus.exists().not()"

Invariant:   ibcm-pat-3
Description: "Patient.communication can be present only when the value of extension 'patient-fetalStatus' is not present"
* severity = #error
* expression = "Patient.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/patient-fetalStatus').exists() implies Patient.communication.exists().not()"

/*
   ╭─────────────────────────────────────Profile Definiation────────────────────────────────────────╮
   │  To provide details that are applicable to all profiles extending the base Profile             │
   ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
*/


Profile:        IBCMFetalPatient
Parent:         Patient
Id:             ibcm-fetal-record
Title:          "IBCM Fetal Record Profile"
Description:    "This profile on Patient is used to represent a fetal record that must be the Resource.subject for any Condition (Disorder), Procedure, or Observation etc made about a fetus. For example, a fetal head circumferance or heart rate, the position of the fetus, congential diaphagmatic hernia or fetoscopic endoluminal tracheal occlusion (FETO) procedure."

* . ^short = "Information about a fetus receiving health care services"
* . ^definition = "Demographics and other administrative information about a fetus receiving care or other health-related services."

* obeys ibcm-pat-1 and ibcm-pat-2 and ibcm-pat-3

* extension contains http://hl7.org/fhir/StructureDefinition/patient-fetalStatus named fetalStatus 0..1

* gender and identifier.system and identifier.value and identifier and extension[fetalStatus] MS

* deceased[x]
  * ^short = "Use of this element is not recommended for fetal demise"
  * ^definition = "Indicates if the individual is deceased or not. Please note that the deceased flag SHOULD NOT be used to indicate a fetal demise. Instead a fetal demise SHALL be indicated by the patient-fetalStatus extension with value fetal-demise. Exceptions are cases of fetal death reporting, in conformance to Birth And Fetal Death Reporting (BFDR)."

* multipleBirth[x] MS
* multipleBirth[x] only boolean
  * ^short = "Whether fetus is part of a multiple pregnancy"
  * ^definition = "Indicates whether the fetus is part of a multiple pregnancy."
  * ^comment = "The multipleBirth flag can also be used before birth. For a fetus Patient only the boolean value can be used." 


