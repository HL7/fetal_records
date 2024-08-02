### The need of recognizing a fetus

No one disputes that when a infant is born, the newborn infant can be a patient with its own unique identifier. The mother herself is also a recognizable patient, but prior to this IG  there are no consistent rules for addressing information directly pertinent to fetus prior to birth. Some systems record the data of the fetus as a body tissue of the mother. Other systems do have some form of resource that resembles a patient. 
There exists a need to relate the data, such as specific observations (e.g. femur length) or conditions, to the fetus, because such data are characteristics of the fetus and not the mother. In cases of multples (e.g. twins or triplets) features of each fetus may need to be distinguished from each other.

### Questions to answer

Our goal is to provide guidelines about the communication of data around the fetus. 
As project team from HL7 PCWG we are aware that we cannot enforce how data is structured within an EHR system, but we can set up rules on how data should be communicated between systems. A similar way of handling these data would make the ease of connecting systems to each other and comparison of data much easier.

All countries collect data of pregnancy and birth for their vital health statistics and research purposes. The fact that we set rules how to use certain FHIR resources could make it more complex. You might need to search data of this specific resource. But this resource does not always exist. This document will also address these issues.

#### Issues we want to solve (project questions)

This Implementation Guide will address the following questions:
* which FHIR resource do we use when we relate data to the new life form?
* when do  we consider the fetus as a separate resource?
* which algorithms of identification of the fetus do we consider?
* which data do we relate to which subject ( fetus versus mother)?
* what is the impact for procedures and medication (i.e. other FHIR resources) if it is specifically meant for the fetus and not the mother?
* do we need special considerations for research, surveillance of birth defects and vital statistics?

##### Which FHIR resource do we use?

The FHIR resource that will be used to represent a fetus is a simplified Patient resource. This is a Patient extension that is called:  Patient with fetal status extension.
This decision has been taken in collaboration with the Patient Administration Work group at the HL7 WGM of May 2024 in Dallas (TX). This artifact is explained in detail under the tab of Artifacts.

At first this resource was called the Patient with born status extension, but the subject is not meant to be related to the event of birth. This also collided with concepts and explanation of terms that were used by Public Health in vital statistics, where they preferred to use the term delivery, instead of birth. The CHOICE group has therefore renamed the FHIR extension to reflect that the subject of related data is a fetus. It is all about the subject fetus and has nothing to do with delivery.

Detailed information about the pros and cons of the different options can be found in first release  of the IG of IBCM.

##### Implications for the domain of Child Health

Having chosen for an extension of the FHIR resource Patient does have implications for systems that are active in this sector. This implies that all systems that communicate data about the fetus *must support* this extension.  If a system, for example an EHR, receives a reply where this FHIR extension is used and it does not understand this FHIR resource, then the communication will fail and end up in an error. 

Implementers conforming to a particular profile in the IBCM Implementation Guide:
* SHALL be capable of producing values for the mustSupport elements in the profile 
* SHALL be capable of processing resource instances containing mustSupport data elements, including elements with missing data, without generating an error or causing the application to fail.
* SHOULD be capable of displaying mustSupport data elements for human use, or processing (e.g. storing) them for other purposes.

The sequence when we are introducing the implementation of this new FHIR resource in a certain region, is that all receiving systems should be ready for processing the FHIR extension first, before systems that are transmitting will start using the new FHIR extension. There will be a transition period where receiving systems need to be able to interpret an old method and the new way of communicating with the new FHIR extension.

##### When to use a separate resource

At the start of pregnancy when findings are observed and collected the first form of new life starts as an embryo. In general the findings  are either classified as characteristics of the mother as the patient, or are findings attached to the episode of pregnancy. As the pregnancy lingers on, the embryo will develop its own characteristics. The question arises when do we consider relating data to a separate resource (instead of the mother)?
The guideline is to attach the characteristic data to the proper subject. In the episode of pregnancy the main subjects to which data could be related to are either:
* the data are characteristics of the mother as patient;
* the data are characteristics of the pregnancy as an episode;
* the data are characteristics of the fetus.

Obvious examples of characteristics of the fetus are measurements like femur length or heart beat of the fetus. Obvious examples of data attached to the pregnancy are the parity and gravidity of the pregnancy. 
This means that once data is classified as characteristics of the fetus, it should be communicated as data attached to the fetus as a resource.

This could mean in certain cases that in some pregnancies data was never communicated with findings attached to a fetus, because it was never observed and registered. This is for example the case of an early demise. This could lead to issues when performing research. For the time being this is left out of scope of the current project.

##### Identification of the resource

When communicating data with the Patient with fetus status extension, the FHIR resource has the possibility to contain an identifier. This identifier is not mandatory and in most cases this will not create any issues, because the pregnancy involves only one fetus and is usually accompanied with data about the mother with her identifier. 

However some organizations do prefer to use a unique identifier for the fetus to make the subject identifiable throughout the process and the history. Certainly in the case of multiple fetuses it is necessary to be able to distinguish which data belongs to which fetus. Therefore it could be sensible to always use an identifier when communicating the data with the FHIR resource.

There are some notes to be made about appointing an identifier. This is also dependent on the way the data is stored in the medical records. As mentioned earlier 2 methods are generally used either, as a body tissue or as a pseudo patient 

<center>
<table><tr><td><img src="resource-identification.png" style="width:75%; height: 75%" alt="Resource identification"/></td></tr></table>
</center>

As a guideline we recommend that data is communicated with a persistent identifier throughout the pregnancy episode and perhaps even continued after birth. It is not unusual that a mother and her fetus are being treated in different institutions in a pregnancy episode. For example the episode could start at a midwife practice, then proceed to a hospital, while data is also being processed in an ultrasound lab and perhaps later on the mother and fetus are transferred to a neonatal hospital. There are different systems involved, each with their own capability to generate or accept an identifier in a resource. 

The recommendation to keep the identifier persistent means that the identifier is generated at the start of the process when the requirement is triggered in the first system that wishes to recognize the fetus. If this system uses body tissue as the method to store the related subject, then the identifier of the body tissues is passed on as identifier in the FHIR resource of the patient with fetal status extension. If the first system uses a pseudo patient as the related subject, then the identifier would likely be generated as a patient identifier. 

All subsequent systems that handle data of the subject fetus SHALL be able to retain, reply or pass on the data with the same identifier. 

This could lead to issues in systems that handle data not only from the fetuses, but also from other subjects, where they expect a fixed format ( for example a National patient identifier) for the subject. These systems must be aware that a different format could be received. 
In case of multiple fetuses each resource will have their own identification. In general the identity would be linked to the position of the fetus in the womb. However the position of the fetuses could change over time and visual interpretation is required to link the identity to the fetus.

We have come across different methods of generating an identifier. These methods are mentioned here below, but the list is certainly not limited to these examples:
* the most straightforward method is to use the same method for generating a local patient identifier. Issue of a patient identifier is usually managed in a master patient index. Usually this identifier is continued once the patient is born as the normal patient identifier. Countries that use a National patient identifier cannot use this patient identifier for a fetus, because it has not been issued yet and need to generate a temporary identifier.
* a second method is to add an extension to the patient identifier of the mother, for example by adding an extra digit or letter to the id. Advantage is that the relationship of the mother is obvious. However some systems expect a fixed format of an ID  and the extra digit or letter could lead to an error handling.
* finally some countries have a specific algorithm for generating an identifier. 
    * the Netherlands has an algorithm to identify the pregnancy of a mother. This identifier consists of the National patient identifier and the age of the mother at the (assumed) date of conception divided by 14. Example: the date of conception is 3d October 2011, the woman (born on April 9, 1985) is 9673 days old on that date. The formula provides 691 as an identifier of this pregnancy. If the National ID of the pregnant woman is 100202020. Then the unique pregnancy identifier is 100202020-691.This identifier is of course for the pregnancy and not so much for the fetus. The fetus identifier can be derived from this identifier and in case of multiple fetuses an extra digit or letter could be added.

##### Relation of data with the subject

As mentioned in paragraph A the data should preferably be a characteristic of the proper subject. We know that many systems do not follow this rule every time. For example the (biological) father of the fetus is often not recognized as a separate entity, but that is not the scope in this project. 
In this implementation guide the guideline is, that data should be related to the proper entities:
* mother
* fetus or child
* pregnancy

The relationship between fetus and mother can be expressed in FHIR using the [RelatedPerson](https://hl7.org/fhir/relatedperson.html) resource. 
The type of relationship is expressed in the attribute relationshiptype. Usually, the relationship type would be ‘MTH’ but more specific codes are available to address concepts like biological mother, donor mother and gestational mother. Note that a fetus will have both a RelatedPerson instance for the donor mother and a RelatedPerson instance for the gestational mother in case of egg cell donation. 

##### Impact for FHIR resources

The use of a simplified FHIR patient resource extension has the advantage that many FHIR resources, such as procedures or observation are accustomed to have a patient as a subject. No special adjustments are required for other FHIR resources to be able to place the fetus as subject. This would not be the case if we had invented a new FHIR resource.

##### Impact for research, surveillance of birth defects and vital statistics

Most countries have methods of collecting data for birth and fetal death reporting. Countries do compare their vital statistics on a global level, but there is no universal guideline on how the data should be collected. This is mostly organized on the National level and healthcare institutions and care providers in a certain country are bound to these National agreements. 

The Implementation Guide for the USA for birth and fetal death reporting using FHIR can be found [here](https://hl7.org/fhir/us/bfdr). Other countries might have their own implementation guides on birth and mortality reporting.

These Implementation Guidelines for these vital statistics will be compelling for these countries. Therefore the CHOICE project does not produce specifications that might overlap in this information space and cause confusion with the birth or fetal death reporting. CHOICE does not dictate how data is stored and therefore birth and fetal death reporting should be reported as it has to be done on a National level. 

#### Data categories
When we look at the data in the pregnancy period we can distinguish the following data categories:
* maternal data: data collected around the (pregnant) woman (e.g. blood pressure, body weight, lab results, maternal problems, medication) and her pregnancy (e.g. parity and gravidity). The woman is the subject of this data, the focal subject could be a different entity like the pregnancy.
* child-specific maternal data: data collected around the (pregnant) woman, which are also related to the child. For example, a c-section is done for the delivery of the second child in a multiple pregnancy. The woman is still the subject of this c-section, but the focal subject is the child/fetus.
* fetus data: data collected around the unborn child/fetus (e.g. head circumference, fetal heart rate and position of the fetus). The fetus is the subject of this data.
* child data - data collected around the (newborn) child (e.g. birth weight and apgar score). The child is the subject of this data. Within this category there are two sub categories:
* child data related to the pregnancy - data around the (newborn) child which are collected as part of the pregnancy file, e.g. birthweight, apgar score
* other child data - data around the child which are collected during childhood which are not part of the pregnancy file/related to the pregnancy.

The scope of this Implementation Guide is the fetus data, although for completeness the examples may also contain maternal and child-specific maternal data. Child data is out of scope of this Implementation Guide since in this case the child is born and the data will become attached to a regular FHIR Patient representing the child. After birth the fetalStatus extension will no longer be used.

#### Thoughts about data linkage
Although we do not express any mandatory rules about the storage of the fetus data itself, we did have several conversations about the possibilities and difficulties about this topic. There is one consideration we would like to give along and perhaps revisit in a future project.

At a certain meeting we suggested a structure in the relationship between mother and fetus data. This was the construction.

<center>
<table><tr><td><img src="data-linkage.png" style="width:75%; height: 75%" alt="Data linkage"/></td></tr></table>
</center>

This illustration suggests that the actual data of the diagnostics are attached to the mother as a patient. So the source of the data remains with the mother patient.  The fetus, whether it is a pseudo patient or a body tissue, is only referencing the data of the mother. When the child is born a real patient record is created for the child and data related to the fetus is  copied across to the new child record as well as data from the mother and pregnancy period. In case of demise before birth no child record will be created. The pseudo patient  ceases to exist, but the findings will still be available at the mother record.. 
Our view is that it is better to focus on reuse of data rather than copying and transforming data between a mother record and a patient record. Instead a (restricted) view from the child record on the mother record could be possible, which allows access to all data from the mother record that is medically relevant for the child (as well as the other way around). Of course, this might still be a big challenge in real practice and legal frameworks should be taken into account (especially in special circumstances where the child grows up in foster care for example). But these questions should be addressed by implementers of these kinds of systems.




