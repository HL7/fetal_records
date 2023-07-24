/*
   ╭─────────────────────────────────────Data Ttype Profile Definiation─────────────────────────────╮
   │  To provide details that are applicable to all profiles extending this abstract Base Profile   │
   ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
*/

Profile:        FetalIdentifier
Parent:         Identifier
Id:             fetal-record-identifier
Title:          "IBCM Fetus Identifier profile"
Description:    "DataType Profile to represent Identifier of a fetal record in context."


* system 1..1
* value 1..1
* type =  http://terminology.hl7.org/CodeSystem/v2-0203#PI
* type and system and value MS