/*
   ╭─────────────────────────────────────Profile Definiation────────────────────────────────────────╮
   │  To provide details that are applicable to all profiles extending the base Profile             │
   ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
*/


Profile:        IBCMFetalPatient
Parent:         Patient
Id:             ibcm-fetal-record
Title:          "IBCM Fetal Record"
Description:    "Profile to represent a fetal record"

* ^extension[structuredefinition-fmm].valueInteger = 0
* ^extension[structuredefinition-standards-status].valueCode = #draft

* extension contains http://hl7.org/fhir/StructureDefinition/patient-bornStatus named bornStatus 0..1


* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains
    identifierFetal 0..1 
* identifier[identifierFetal] only FetalIdentifier



* name.text and name.given and name.use and name.prefix and name.suffix and name.family and telecom and gender and birthDate and identifier[identifierFetal] and identifier and address and active and contact and extension[bornStatus] MS






/*
*  ╭──────────────────────────────────────Example────────────────────────────────────────────────╮
*  │  The section below describes the different examples confirming to the resource              │
*  │                                                                                             │
*  ╰─────────────────────────────────────────────────────────────────────────────────────────────╯
*/

