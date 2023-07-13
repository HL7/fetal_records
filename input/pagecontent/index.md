### Background

#### Introduction

This implementation guide aims to provide guidelines and support on the handling of fetus data in FHIR.

No one disputes that when a child is born, that the child can be a patient with it’s own unique identifier. The mother herself is also a recognizable patient, but there are no rules for the unborn child in the period when it is conceived as an embryo until its birth. Some systems record the data of the foetus as if it is a body tissue of the mother. Other systems do have some form of resource that resembles a patient. 

There is obviously a need to relate the data to the foetus, because the data is not a characteristic of the mother, but rather to this specific foetus, for example the femur length. This is even more the case for twins or triplets, where each foetus have their own characteristics that need to be distinguished from each other.

But if it is a resource with an identifier, how do you deal with this identifier? On the other hand certain resources, like a procedure, expect a reference to a subject. Are there restrictions to these subjects? Or is it able to be filled with new type of resource? 
These are some of the questions we dive into in this project. Additional questions are summed up in the paragraph about project questions.
 
Ultimately the ambition is to provide guidelines about the handling of data around the foetus. 
As HL7 PCWG we are aware that we cannot enforce how data is structured within an EHR system, but we can set up rules on how data should be communicated between systems. A similar way of handling these data would make the ease of connecting systems to each other and comparison of data much easier.

All countries collect data of pregnancy and birth for their vital health statistics and research purposes. The fact that we might introduce a separate resource could make it more complex. You might need to search data of this specific resource. But this resource does not always exist. This document will also address these issues.

#### Goal
The goals of this project include:
* define typical use cases where handling of data of the unborn child frequently occurs. The use cases we are specifically interested in, are the use cases where communication between IT systems are necessary and data has to be transferred from one system to the other. 
* Provide guidance on implementation, use and handling of the relevant FHIR resources and terminology value sets

#### Target audience

#### Scope

As mentioned above: as HL7 we realise that we cannot dictate mandatory rules for the registration of foetal data in systems. The objective of this project is to set guidelines how we can communicate data when a foetus is involved in the healthcare process. 

This project is intended to solely address issues on the informational aspect of data handling in the normal process flow of day to day pregnancy and birth healthcare. We are aware that this subject can easily be misunderstood, but legal, religious or political issues are not part of this project.  This project should also not be misused or quoted by any party to prove any statement for their own conviction. 

#### Issues we want to solve
This project aims to address the following questions:
* In which situations do  we consider the foetus as a separate resource?
* Which algorithms of identification of the foetus do we consider?
* Which type of procedures for a foetus do we consider in scope?
* What is the impact for procedures and medication if it is specifically meant for the foetus and not the mother?
* Which data do we relate to the foetus ( instead of the mother)?
* Which kind of data do we need for research, surveillance of birth defects and vital statistics?


#### Stakeholders

The task of HL7 is to provide technical provisions to support the stakeholders mentioned above in their need of registration and communication of foetal data. In general we can classify the stakeholders in these different groups:
Direct healthcare providers who have direct contact with the pregnant mother:
Midwife, obstetrician, general practitioner, paediatrician, nurses
Paramedical services, research lab technicians and nurses who perform procedures on behalf of the direct healthcare providers such as:
Ultrasound technicians, genetic lab technicians, clinical chemistry technicians.
Governmental institutions who gather and perform research on data about pregnancy, birth and vital health statistics or have a public health task in screening or prevention of certain disorders.

All these stakeholders work generally in their own system. A hospital would have a general EHR system. An ultrasound technician or a lab technician would perform their research in their own specialised system. This leads to the necessity to communicate between different software systems on different hardware environments. This is where HL7 fits in with their standards on communication. 

The governmental institutions also perform their tasks on their own systems which are generally on regional or national level, which results in a one to many communication between this institution and the different providers of data.

#### Roles & systems

#### Methodology
In this project we consider the following methodology to reach our goal;
* Step 1: Define the use cases

    In this chapter we will describe the various use cases which we would like to consider within the scope of our project. Which processes do we need to support? What kind of data are used in these scenarios? And is this data of the mother or from the unborn child? Who are the stakeholders and which systems make use of these use cases? The use cases are described here as abstract patterns. Detailed examples of such use cases can be found in the storyboards in the appendix. The purpose is to categorise the types of data handling into similar use of resources and handling of the flow.

* Step 2: Set the priorities

    We will set priorities to the sequence in which we will address the use cases. It might well be that certain use cases might not be analysed in this stage of the project, but parked for future projects.

* Step 3: Define the data
    
    In this step we take a deeper look into the functional needs of the data. We strive to set a logical data model for the various clinical resources. The set in each use case can be different of course, but when we collect  all the data, we would come to a common set for mother, foetus and child. The consideration here is if we can recognize the data as a feature of the mother, foetus or child. Once we have achieved a consensus on the set, we can consider this as a core set, which contains the most common data used in the pregnancy and birth care. Where possible we try to set an appropriate terminology binding. 

* Step 4: Define the transactions

    In this step we model the transactions in a functional flow. It should be clear who the initiator is and which stakeholders play the role of receiver. What does the initiator do and what do we expect a receiver should do in response. In the use cases systems communicate to other systems. Which transactions do we expect the systems to be able to do?

* Step 5: Define the technical framework

    All previous steps describe data in a functional mode, but for systems to be able to communicate physically you need to define the technical framework. In this project we choose to use the FHIR as the technical framework to communicate the data from one system to another system. Here we run into questions like how to relate the data to appropriate resource such as mother or foetus. Current resources might not yet be capable of relating to resources other than with a patient-id.

### How to read this Guide
The main sections of this IG are:
-  [Background](background.html): The background section provides business context for the implementation guide and information that implementers should be
      familiar with before reading the remainder of the IG.  There could be multiple pages for this.
- Guidance - The Guidance pages document best practices and how to use the profiles and transactions defined in this guide for a couple of use cases. 
    - [Service Request](usecase1.html): This page provides guidance on service requests
    - [Result Reporting](usecase2.html): This page provides guidance on result reporting
    - [Data Transfer](usecase3.html): This page provides guidance on data transfer
- [FHIR Artefacts](artifacts.html): Detailed descriptions and formal definitions of all FHIR artefacts defined in this guide
- Support - The Support pages include useful links and downloads
- [Downloads](downloads.html): Allows downloading a copy of this implementation guide and other useful information
