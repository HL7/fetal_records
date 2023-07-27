### Fetus Model

#### Pregnancy, fetus and child record
During a pregnancy we monitor the health of a (pregnant) woman and her (un)born child(ren) and capture their data in a pregnancy record (or maternal record). 
When we look at the data collected in the pregnancy period we can distinguish the following data categories:
* Maternal data: data collected around the (pregnant) woman (e.g. blood pressure, body weight, lab results, maternal problems, medication) and her pregnancy (e.g. parity and gravidity). The woman is the subject of this data, the focal subject could be a different entity like the pregnancy.
* Child-specific maternal data: data collected around the (pregnant) woman, which are also related to the child. For example, a c-section is done for the delivery of the second child in a multiple pregnancy. The woman is still the subject of this c-section, but the focal subject is the child/fetus.
* Fetus data: data collected around the unborn child/fetus (e.g. headcircumference, fetal heart rate and position of the fetus). The fetus is the subject of this data.
* Child data: data collected around the (newborn) child (e.g. birth weight and apgar score). The child is the subject of this data. 

It is important to note that when we are talking about child data in the pregnancy record, we are referring to child data related to the pregnancy, e.g. data around the (newborn) child which are collected as part of the pregnancy file like birthweight and apgar score. In a medical perspective, this data is both an important measure of the health of the mother (and future pregnancies) as well as the health of the (newborn) child.
Other child data, collected in a later stage during childhood, are not part of the pregnancy record.

After birth, part of the data from the pregnancy record will be transfered to the child record. This mainly includes fetus and child data, but even part of the maternal data, e.g. vaccinations and alcohol use, are important medical data for the child.

In this IG we mainly focus on the fetus data and the relation of the fetus data to the maternal and child data. There are numerous medical scenario's that require the creation of a separate fetus record, e.g. in the case of fetal surgery or an in utero medication administration to the fetus. 

#### Considerations for fetus as a subject
For fetus data and child-specific maternal data we need a fetus entity to link the data to. An important target of the project is to weigh the different options and settle for a decision.  

The following options have been reviewed, which will be explained in more detail in the next paragraphs:
* BodyStructure
* Fetus resource
* Patient extension

##### Option 1: BodyStructure
BodyStructure - use the BodyStructure resource for a fetus
* Pro’s
  * No new FHIR resource required
  * Fetus starts as body tissue in the pregnant woman, BodyStructure is related to the pregnant woman
  * Systems do not need to support an actual Patient resource for the unborn fetus
     * In regular single pregnancies there might be no need for this
     * In case of abortions/miscarriages it can be undesired to have a Patient record in place 
     * No complex authorization required to view Patient data of another Patient entity
  * Systems already use this resource in their implementations
* Con’s
  * A fetus is a living organism, not a body structure
  * A fetus has its own body structures
  * In case the fetus is unhealthy/has medical problems/etc. a fetus record can be created, in this case a Patient resource will be required
  * Changes in other FHIR resources are still required e.g.
     * References to BodyStructure
     * Relating BodyStructure to both (pregnant) woman and the born child
     * Which means we will either need to change existing references from Observation, MedicationRequest, Procedure to include BodyStructure, or create extensions

##### Option 2: Fetus resource
Fetus resource - create a new FHIR resource for a fetus
* Pro’s
  * Flexibility in the design of the fetus model
  * Fetus data can be related to the mother Patient without having to solve complex issues around authorization
  * Resource is relevant for all birth care use cases around the world
  * Fetus data can be related to mothers data. This is the big advantage of digital health. For example mother is drinking alcohol can be related to head measurement of fetus, and later the child’s development.
  * Provides global data on causes of congenital anomalies and developmental disabilities.
* Con’s
  * Requires a new FHIR resource
  * Requires changes in other FHIR resources where references to the fetus entity are needed (e.g. subject of an Observation)

##### Option 3: Patient resource
Patient - use the Patient resource for a fetus, e.g. with an additional extension to indicate the born status of the patient.
* Pro’s
  * No new FHIR resource required
  * Patient resource already contains all required elements for a fetus
  * Less or no changes required in other FHIR resources as the necessary references to Patient resource are already in place
  * By using the born status extension one can exclude unborn patients from a Patient list (e.g. useful in case of abortions/miscarriages)
  * The extension can either be a standard extension or standard element in the Patient resource
* Con’s
  * Complexity around authorization as we need to handle authorization for more than one Patient resource instance in a patient scope

##### Final decision - Option 3: Patient extension
The workgroup has decided to model a fetus as a Patient (third option) since the fetus is a subject of care which has its own observations, conditions, etc. It should be possible to relate these data to a fetus subject. 
Also, the impact of using BodyStructure or a new FHIR resource for fetus would have a higher impact since it would require a lot of adaptations in other resources that should be able to reference the fetus resource.
Finally, this decision aligns with other IG's, such as the BFDR where a demised fetus is also modeled as a Patient (Decedent Patient).

#### Considerations for using the Patient resouce
We considered the following alternatives as described in the paragraphs below:
* Extension for born status with a boolean value (true/false)
* Extension for born status with a coded value (born/unborn/demised/unknown)
* Birthdate unavailable and date absent reason unborn
* Replace birthDate with a birth[x] choice element which has the options birthDate (implying the patient is born) and bornBoolean.

##### Option 1: Extension for born status with a boolean value (true/false)
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus>
* Pro’s
  * Low impact on normative content
  * If a fetus is demised it can be captured in the deceased[X] element which is in line with the modelling of a decedent fetus in the BFDR: <http://build.fhir.org/ig/HL7/fhir-bfdr/Patient-patient-decedent-fetus-not-named.html>
* Con’s
  * What will be the effect if you cannot digest the extension?
  * Status born will never be used, because by then the fetus has become a child patient

##### Option 2: Extension for born status with a coded value (born/unborn/demised/unknown)
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus2>
* Pro’s
  * Low impact on normative content
* Con’s
  * What will be the effect if you cannot digest the extension?
  * Status born will never be used, because by then the fetus has become a child patient
  * Status demised can also be captured in existing element 

##### Option 3: Birthdate unavailable and date absent reason unborn
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus3>
* Pro’s
  * Low impact on normative content
  * Requires no addition of extensions
* Con’s
  * Data absent reason has a required binding on a generic list of codes which is used across resources/elements, while the code unborn is very specific

##### Option 4: Replace birthDate with a birth[x] choice element which has the options birthDate (implying the patient is born) and bornBoolean.
* Logical model: <https://simplifier.net/internationalbirthandchildmodel/fetus4>
* Note that only the choice element is added in this model since the rest would be an exact copy of the Patient resource
* Pro’s
  * Requires no addition of extensions or use of data absent reason in a very specific context
  * Modelling is in line with elements like deceased[x] where a date value implies boolean value is true
  * Also provides option to include time of birth in a dateTime (optional)
* Con’s
  * High impact on normative content, requires a Patient2

#### Final choice
The patient resource is a FHIR resource that is maintained by the Patient Administration Work Group. The project team has discussed previously mentioned options with PCWG and PAWG. This has been recorded in Jira under FHIR_39466. The decision was taken in January 2023 during the HL7 WGM in Henderson. The Patient resource with extension with a coded value ( option 3B) is viewed as the best choice. 

The extension has been included in FHIR R5. Description of the extension: [HL7.FHIR.UV.EXTENSIONS\Patient Born Status - FHIR v5.0.0](http://hl7.org/fhir/extensions/StructureDefinition-patient-bornStatus.html)

Terminology binding for BornStatus: [HL7.FHIR.UV.EXTENSIONS\born status - FHIR v5.0.0](http://hl7.org/fhir/extensions/ValueSet-patient-bornstatus.html)

#### Relation of fetus and mother
For the relation of the fetus and the mother, we follow the existing guidelines for relating a mother and a child in FHIR:[https://www.hl7.org/fhir/patient.html#maternity](https://www.hl7.org/fhir/patient.html#maternity)

#### Mapping from BodyStructure

The guideline is that HL7 expects that  data related to the new life form is communicated with the use of FHIR resource ICBM Fetal record profile as the subject as explained in this Implementation Guide. If a system is not familiar with the concept of a fetus as a ICBM fetal record and uses body structure to store it’s data within the EHR, then we still expect that systems perform a conversion to map the data to the FHIR resource ICBM fetal record.

There are of course differences between BodyStructure and the ICBM Fetal record. How does this map?
* The identifier of BodyStructure maps into the identifier of the ICBM fetal record.
* BodyStructure has 1..1 relationship with Patient which is the mother. This would be communicated through RelatedPerson with the ICBM fetal record.
* BodyStructure has no gender, which Patient does have. This can be filled with unknown
* IncludedStructure is not used in ICBM fetal record, but the fact that a ICBM fetal record is used makes it clear that is is about a fetus.
