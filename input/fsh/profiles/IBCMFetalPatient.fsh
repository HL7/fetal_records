

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
Description:    "Profile to represent a fetal record which will be used to collect data around the unborn child/fetus (e.g. headcircumference, fetal heart rate and position of the fetus)"

* . ^short = "Information about a fetus receiving health care services"
* . ^definition = "Demographics and other administrative information about a fetus receiving care or other health-related services."

* obeys ibcm-pat-1

* ^extension[structuredefinition-fmm].valueInteger = 0
* ^extension[structuredefinition-standards-status].valueCode = #draft
* ^extension[structuredefinition-wg].valueCode = #pc

* extension contains http://hl7.org/fhir/StructureDefinition/patient-bornStatus named bornStatus 0..1

* gender and identifier.system and identifier.value and identifier and extension[bornStatus] MS



