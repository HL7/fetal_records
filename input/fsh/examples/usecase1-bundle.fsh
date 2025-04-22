Instance: usecase1-bundle
InstanceOf: Bundle
Title: "UC1 Bundle"
Description: "Example of a Bundle containing all resources of UC1"
Usage: #example 
* type = #collection
* insert addentry(Patient, uc1-mother)
* insert addentry(Patient, uc1-fetus)
* insert addentry(RelatedPerson, uc1-mother-relatedperson)
* insert addentry(Practitioner, uc1-practitioner)
* insert addentry(Condition, uc1-pregnancy)
* insert addentry(Observation, uc1-gestation21)
* insert addentry(Observation, uc1-gestation37)
* insert addentry(Observation, uc1-estimatedfetalbodyweight)
* insert addentry(Condition, uc1-399216004)
* insert addentry(DiagnosticReport, uc1-ultrasoundreport)
* insert addentry(Procedure, uc1-ultrasoundscan)
* insert addentry(MedicationRequest, uc1-medicationrequest)
* insert addentry(Medication, uc1-medication)