

/*
*  ╭──────────────────────────────────────Invariant──────────────────────────────────────────────╮
*  │  The section below describes the different invariants applicable to the profile             │
*  │                                                                                             │
*  ╰─────────────────────────────────────────────────────────────────────────────────────────────╯
*/

Invariant:   ibcm-pat-1
Description: "Patient.birthdate can be present only when the value of extension 'patient-bornStatus' is not present or if present then the value is set to 'born'"
* severity = #error
* expression = "Patient.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/patient-bornStatus' and value != 'born').exists() implies Patient.birthDate.exists().not()"

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

* obeys ibcm-pat-1

* ^extension[structuredefinition-fmm].valueInteger = 0
* ^extension[structuredefinition-standards-status].valueCode = #draft
* ^extension[structuredefinition-wg].valueCode = #pc

* extension contains http://hl7.org/fhir/StructureDefinition/patient-fetalStatus named fetalStatus 0..1

* gender and identifier.system and identifier.value and identifier and extension[fetalStatus] MS



