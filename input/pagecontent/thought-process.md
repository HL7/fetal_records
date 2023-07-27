### FHIR resources & Extensions

When we look at the data in the pregnancy period we can distinguish the following data categories:
* Maternal data: data collected around the (pregnant) woman (e.g. blood pressure, body weight, lab results, maternal problems, medication) and her pregnancy (e.g. parity and gravidity). The woman is the subject of this data, the focal subject could be a different entity like the pregnancy.
* Child-specific maternal data: data collected around the (pregnant) woman, which are also related to the child. For example, a c-section is done for the delivery of the second child in a multiple pregnancy. The woman is still the subject of this c-section, but the focal subject is the child/fetus.
* Fetus data: data collected around the unborn child/fetus (e.g. headcircumference, fetal heart rate and position of the fetus). The fetus is the subject of this data.
* Child data - data collected around the (newborn) child (e.g. birth weight and apgar score). The child is the subject of this data. Within this category there are two sub categories:
  * Child data related to the pregnancy - data around the (newborn) child which are collected as part of the pregnancy file, e.g. birthweight, apgar score
  * Other child data - data around the child which are collected during childhood which are not part of the pregnancy file/related to the pregnancy.

#### Considerations for fetus as a subject
For fetus data and child-specific maternal data we need a fetus entity to link the data to. In this  An important target of the project is to weigh the different options and settle for a decision.  The following options have been reviewed:

##### Option 1: Body Structur
BodyStructure - use the BodyStructure resource for a fetus (although it feels a bit awkward, this is a valid use of the BodyStructure resource in FHIR)
* Pro’s
  * No new FHIR resource required
  * Fetus starts as body tissue in the pregnant woman, BodyStructure is related to the pregnant woman
  * Systems do not need to support an actual Patient resource for the unborn fetus
     * In regular single pregnancies there might be no need for this
     * In case of abortions/miscarriages it can be undesired to have a Patient record in place 
     * No complex authorization required to view Patient data of another Patient entity
* Con’s
  * A fetus is a living organism, not a body structure
  * A fetus has its own body structures
  * In case the fetus is unhealthy/has medical problems/etc. a fetus record can be created, in this case a Patient resource will be needed
  * Changes in other FHIR resources are still required e.g.
     * References to BodyStructure
     * Relating BodyStructure to both (pregnant) woman and the born child

##### Option 2: Fetus resource
Fetus resource - create a new FHIR resource for a fetus
* Pro’s
  * Flexibility in the design of the fetus model
  * Fetus + fetus data can be related to the mother Patient without having to solve complex issues around authorization
  * Resource is relevant for all birth care use cases around the world
  * fetus + fetus data can be related to mothers data. This is the big advantage of digital health. For example mother is drinking alcohol can be related to head measurement of fetus, and later the child’s development.
  * Fetus + fetus data can be related to the mother
  * …..Patient without having to solve complex issues around authorization
  * Resource is relevant for all birth care use cases around the world.
  * Provides global data on causes of congenital anomalies and developmental disabilities.


* Con’s
  * Requires a new FHIR resource
  * Requires changes in other FHIR resources where references to the fetus entity are needed (e.g. subject of an Observation)

##### Option 3: Patient extension
Patient - use the Patient resource for a fetus with an additional extension to indicate the born status of the patient.
* Pro’s
  * No new FHIR resource required
  * Patient resource already contains all required elements for a fetus
  * Less or no changes required in other FHIR resources as the necessary references to Patient resource are already in place
  * By using the born status extension one can exclude unborn patients from a Patient list (e.g. useful in case of abortions/miscarriages)
  * The extension can either be a standard extension or standard element in the Patient resource
* Con’s
  * Complexity around authorization as we need to handle authorization for more than one Patient resource instance in a patient scope

The workgroup has decided to model a fetus as a Patient (third option). We considered the following alternatives:
##### Extension for born status with a boolean value (true/false)
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus>
* Pro’s
  * Low impact on normative content
  * If a fetus is demised it can be captured in the deceased[X] element which is in line with the modelling of a decedent fetus in the BFDR: <http://build.fhir.org/ig/HL7/fhir-bfdr/Patient-patient-decedent-fetus-not-named.html>
* Con’s
  * What will be the effect if you cannot digest the extension?
  * Status born will never be used, because by then the fetus has become a child patient

##### Extension for born status with a coded value (born/unborn/demised/unknown)
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus2>
* Pro’s
  * Low impact on normative content
* Con’s
  * What will be the effect if you cannot digest the extension?
  * Status born will never be used, because by then the fetus has become a child patient
  * Status demised can also be captured in existing element 

##### Birthdate unavailable and date absent reason unborn
* Profile: <https://simplifier.net/internationalbirthandchildmodel/fetus3>
* Pro’s
  * Low impact on normative content
  * Requires no addition of extensions
* Con’s
  * Data absent reason has a required binding on a generic list of codes which is used across resources/elements, while the code unborn is very specific

##### Replace birthDate with a birth[x] choice element which has the options birthDate (implying the patient is born) and bornBoolean.
* Logical model: <https://simplifier.net/internationalbirthandchildmodel/fetus4>
* Note that only the choice element is added in this model since the rest would be an exact copy of the Patient resource
* Pro’s
  * Requires no addition of extensions or use of data absent reason in a very specific context
  * Modelling is in line with elements like deceased[x] where a date value implies boolean value is true
  * Also provides option to include time of birth in a dateTime (optional)
  * Con’s
  
High impact on normative content, requires a Patient2

#### Final choice
The patient resource is a FHIR resource that is maintained by the Patient Administration Work Group. The project team has discussed previously mentioned options with PCWG and PAWG. This has been recorded in Jira under FHIR_39466. The decision was taken in January 2023 during the HL7 WGM in Henderson. The Patient resource with extension with a coded value ( option 3B) is viewed as the best choice. 

The extension has been included in FHIR R5. Description of the extension
HL7.FHIR.UV.EXTENSIONS\Patient Born Status - FHIR v5.0.0

Terminology binding forSearch p BornStatus:
HL7.FHIR.UV.EXTENSIONS\born status - FHIR v5.0.0

Link to FHIR documentation about how to relate a mother and a child in FHIR: <https://www.hl7.org/fhir/patient.html#maternity>.

#### Mapping from BodyStructure

The guideline is that HL7 expects that  data related to the new life form is communicated with the use of FHIR resource ICBM Fetal record profile as the subject as explained in this Implementation Guide. If a system is not familiar with the concept of a fetus as a ICBM fetal record and uses body structure to store it’s data within the EHR, then we still expect that systems perform a conversion to map the data to the FHIR resource ICBM fetal record.

There are of course differences between BodyStructure and the ICBM Fetal record. How does this map?
* The identifier of BodyStructure maps into the identifier of the ICBM fetal record..
* BodyStructure has 1..1 relationship with Patient which is the mother. This would be communicated through RelatedPerson with the ICBM fetal record.
* BodyStructure has no gender, which Patient does have. This can be filled with unknown
* IncludedStructure is not used in ICBM fetal record, but the fact that a ICBM fetal record is used makes it clear that is is about a fetus.
