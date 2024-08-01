### Introduction

This implementation guide aims to provide guidelines and support on the handling of fetus data in FHIR. The Project ID: 932

#### Contributors
* Michael Tan (Woxingtan - project lead)
* Mike Padula (Children Hospital of Philadelphia)
* Liesbeth Siderius (Youth Health Care Almere)
* Lilian Minne (Nictiz)
* Shovan Roy (TechIntro, Australia)
* Sahan Damsiri Perera (University of Colombo, Sri Lanka)
* Ben McAlister (Oracle)
* Stephen Chu (Australian Digital Health Agency)
* John Silva (Vermonster, LLC)
* Rob Hausam (Hausam Consulting LLC)
* Carina Vorisek (Berlin Institute of Health Charite)
* Minna Maria Hernandez (Norwegian Directorate of Health)

#### Goal
The goals of this project include:
* Define typical use cases where handling of data of the unborn child frequently occurs. The use cases we are specifically interested in, are the use cases where communication between IT systems are necessary and data has to be transferred from one system to the other. 
* Provide guidance on implementation, use and handling of the relevant FHIR resources and terminology value sets.

#### Considerations:
To manage our project deliverables and timeline, we will set priorities to use cases and work out the use cases in the sequence of priority. Other use cases will remain open for future projects.

#### Target audience

This implementation guide is meant for IT developers who develop IT systems for the child health and obstetrics sector. These IT systems are not stand alone systems, but usually make part of a framework of systems within an institution or a network  of institutions. A hospital would have a general EHR system. An ultrasound technician or a lab technician would perform their research in their own specialized system. This leads to the necessity to communicate between different software systems on different hardware environments. In this IG we explain how to communicate data of a fetus between systems.

The secondary target of this IG are the stakeholders who provide these assignments for the IT vendors to develop these  communication tools. 
In general we can classify the stakeholders in these different groups:
* direct healthcare providers who have direct contact with the pregnant mother:
    * midwife, obstetrician, neonatologists, general practitioner, paediatrician, nurses and other relevant healthcare professionals.
* paramedical services, research lab technicians and nurses who perform procedures on behalf of the direct healthcare providers such as:
    * ultrasound technicians, genetic lab technicians, clinical chemistry technicians.
* governmental institutions who gather and perform research on data about pregnancy, birth and vital health statistics or have a public health task in screening or prevention of certain disorders.

All these stakeholders work generally in their own system. 

The governmental and research institutions also perform their tasks on their own systems which are generally on regional or national level, which results in a one to many communication between this institution and the different providers of data.


#### Scope

##### In scope
This Implementation Guide focuses on referencing data relevant to the fetus as the subject. A "fetus" refers to the unborn offspring that develops from a mammal embryo in utero. In humans, the fetal stage of development begins at approximately 9 weeks gestation and ends at birth or delivery. Outcomes for a fetus include the delivery of a liveborn infant, or may result in a fetal demise when the fetus is determined to be nonviable (i.e., no longer capable of survival) while still in utero or at the time of delivery. When a fetus without any signs of life (e.g., heart rate, spontaneous movement) and is delivered beyond a specific gestational age (>20 weeks in the US, >24 weeks in the UK, >28 weeks per the World Health Organization), the fetus is deemed to be stillborn. We concentrate on the communication of data in the ante natal (or prenatal) period, because once birth has taken place the data related to the newborn infant would be represented with a FHIR resource of Patient. 

The objective of this project is to set guidelines on how we can communicate data when a fetus is involved in the healthcare process. 

##### Out of Scope

As HL7 we realize that we cannot dictate mandatory rules how the fetal data should be stored in systems. Some systems store the data with the mother as subject, while others use a different subject. 

Neither are we in the position to dictate the use of certain terminologies. There might be license issues with certain terminologies. However we will provide examples as guidance to show how certain values can be expressed.  

This project is intended to solely address issues on the informational aspect of data handling in the regular process flow of day to day pregnancy and birth healthcare. We are aware that this subject can easily be misunderstood, but legal, religious or political issues are not part of this project. This project should also not be misused or quoted by any party to prove any statement for their own conviction. 


### Roles & Systems

In the use cases we provide in this Implementation Guide we have simplified the scenario’s using 2 simple actors. An initiator and a recipient. There are 2 basic patterns:
* the initiator has a service request and the recipient is the potential fulfiller of the request.
* the initiator has data available it wants to exchange with a recipient. Note that the recipient could be the initiator who has placed a service request. 

Under the tab of "Guidance" we elaborate on these roles in the various use cases.
How these systems communicate with each other ( message mechanism or RESTful concept) is less of importance here. It could be either. The focus is on the data content and the use of FHIR resources. 


### How to read this Guide
The main sections of this IG are:
-  [Background](background.html): The background section provides business context for the implementation guide and information that implementers should be
      familiar with before reading the remainder of the IG. There could be multiple pages for this.
- Guidance - The Guidance pages document best practices and how to use the profiles and transactions defined in this guide for a couple of use cases.
    - [Introduction](guidance.html): This page provides an introduction of the scenario's.
    - [Medication Request](use-case1-medication-request.html): This page provides guidance on medication requests
    - [Result Reporting](use-case2-result-reporting.html): This page provides guidance on result reporting
    - [Data Transfer](use-case3-data-transfer.html): This page provides guidance on data transfer
- [FHIR Artifacts](artifacts.html): Detailed descriptions and formal definitions of all FHIR artifacts defined in this guide
- Support - The Support pages include useful links and downloads
- [Downloads](downloads.html): Allows downloading a copy of this implementation guide and other useful information
