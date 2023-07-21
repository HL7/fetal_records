### The need of recognizing a fetus

No one disputes that when a child is born, that the child can be a patient with it’s own unique identifier. The mother herself is also a recognizable patient, but there are no rules for the unborn child in the period when it is conceived as an embryo until its birth. Some systems record the data of the fetus as if it is a body tissue of the mother. Other systems do have some form of resource that resembles a patient. 
There is obviously a need to relate the data to the fetus, because the data is not a characteristic of  the mother, but rather to this specific fetus, for example the femur length. This is even more the case of twins or triplets, where each fetus have their own characteristics that need to be distinguished from each other.

### Questions to answer

But if it is a resource with an identifier, how do you deal with this identifier? On the other   hand certain resources, like a procedure, expect a reference to a subject. Are there restrictions to these subjects? Or is it able to be filled with new type of resource? 
These are some of the questions we will dive into in this project. Additional questions are summed up in the paragraph about project questions.

Ultimately the ambition is to provide guidelines about the handling of data around the fetus. 
As HL7 PCWG we are aware that we cannot enforce how data is structured within an EHR system, but we can set up rules on how data should be communicated between systems. A similar way of handling these data would make the ease of connecting systems to each other and comparison of data much easier.

All countries collect data of pregnancy and birth for their vital health statistics and research purposes. The fact that we might introduce a separate resource could make it more complex. You might need to search data of this specific resource. But this resource does not always exist. This document will also address these issues.

#### Issues we want to solve (project questions)

* This Implementation Guide should address the following questions:
* When do  we consider the fetus as a separate resource?
* Which algorithms of identification of the fetus do we consider?
* Which data do we relate to which subject ( fetus versus mother)?
* What is the impact for procedures and medication if it is specifically meant for the fetus and not the mother?
* Which kind of data do we need for research, surveillance of birth defects and vital statistics?

Some of these questions will be dealt with directly, others can only be answered after we have explained the choices that have been made.

##### When to use a separate resource

At the start of pregnancy when findings are observed and collected the first form of new life starts as an embryo. In general the findings  are either classified as characteristics of the mother as the patient, or are findings attached to the episode of pregnancy. As the pregnancy lingers on, the new life form will develop its own characteristics. The question arises when do we consider relating data to a separate resource (instead of the mother)?
Regardless of which choice of FHIR resource will be chosen for  the new live form, the guideline is to attach the characteristic data to the proper subject. In the episode of pregnancy the main subjects to which data could be related to are either:
* The data are characteristics of the mother as patient
* The data are characteristics of the pregnancy as an episode
* The data are characteristics of the new live form,  whatever resource is chosen.

Obvious examples of characteristics of the new life form are measurements like femur length or heart beat of the new life form. Obvious examples of data attached to the pregnancy are the parity and gravidity of the pregnancy. 
This means that once data are classified as characteristics of the new life form, it should be communicated as data attached to the new life form of resource.

This could mean in certain cases that in some pregnancies data was never communicated with findings attached to a  new life form, because it was never observed and registered. This is for example the case of early demise. This could lead to issues when performing research. For the time being this is left out of scope of the current project.

##### Identification of resource

Which considerations do you need to be aware off when identifying a fetus? This question arises in the case that you would choose a Patient resource with extension as the solution to represent the subject of the new life form. In the case of body site as the solution you would abide by the algorithm to identify body tissues. In the case of new FHIR resource for fetusses you would generate a separate ID for this specific resource.

In the case that you would choose a Patient with extension you have to take account of some special considerations:
* Some countries make use of a national patient identifier for a patient . As far as we know a national patient identifier is only provided as part of the procedure of registration of birth. This is not possible in the case of a fetus. 
* This means that the IT systems must be able to generate a local identifier.. We know that certain EHR’s are capable of this feature. This local ID of the fetus during the pregnancy is usually continued in the patient identity, once the baby is born.
* In case of a National patient identifier systems must be aware that it could receive a Patient resource without the National Patient identifier, because the subjectt is a fetus.
* In case of multiple fetusses each resource will have their own identification. In general the identity would be linked to the position of the fetus in the womb. However the position of the fetusses could change over time and visual interpretation is required to link the identity to the fetus.

##### Relation of data with the subject

As mentioned in paragraph A the data should preferably  be a characteristic of the proper subject. We know that many systems do not follow this rule every time.. For example the (biological) father of the fetus is often not recognized as a separate entity, but that is not the scope in this project. 
In this implementation guide the guideline is, that data should be related to the proper entities:
* Mother
* Fetus or child
* Pregnancy

##### Impact for FHIR resources

Most FHIR resources, especially where requests are involved, expect that the request is meant for a recognizable subject. For example a medication order would normally expect a patient as subject. This could have an impact if the FHIR resource is not capable of handling other subjects than a patient. So for example if a choice is made for a new FHIR resource for a fetus, then all these existing FHIR resources must be capable of recognizing this new resource. 

The first step in this issue is to make the choice how to represent the fetus as a resource. Subsequently we can reconsider if this issue is then still relevant. 

##### Impact for research, surveillance of birth defects and vital statistics

This issue is for the time being set out of scope.
