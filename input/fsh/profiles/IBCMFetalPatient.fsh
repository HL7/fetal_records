/*
   ╭─────────────────────────────────────Profile Definiation────────────────────────────────────────╮
   │  To provide details that are applicable to all profiles extending the base Profile             │
   ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
*/


Profile:        IBCMFetalPatient
Parent:         Patient
Id:             ibcm-fetal-record
Title:          "IBCM Fetal Record Profile"
Description:    "Profile to represent a fetal record"

* ^extension[structuredefinition-fmm].valueInteger = 0
* ^extension[structuredefinition-standards-status].valueCode = #draft

* extension contains http://hl7.org/fhir/StructureDefinition/patient-bornStatus named bornStatus 0..1

* gender and identifier.system and identifier.value and identifier and extension[bornStatus] MS


/*
*  ╭──────────────────────────────────────Example────────────────────────────────────────────────╮
*  │  The section below describes the different examples confirming to the resource              │
*  │                                                                                             │
*  ╰─────────────────────────────────────────────────────────────────────────────────────────────╯
*/

