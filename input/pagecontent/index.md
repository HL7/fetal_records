### Introduction

This implementation guide aims to provide guidelines and support on the handling of fetus data in FHIR. The Project ID: 932

#### Contributors
* Michael Tan (Woxingtan - project lead)
* Mike Padula (Children Hospital of Philadelphia)
* Liesbeth Siderius
* Lilian Minne (Nictiz)
* Shovan Roy (TechIntro, Australia)
* Sahan Damsiri Perera (University of Colombo, Sri Lanka)
* Ben McAlister (Oracle)
* Stephen Chu (Australian Digital Health Agency)
* John Silva
* Rob Hausam (Hausam Consulting LLC)

#### Goal
The goals of this project include:
* define typical use cases where handling of data of the unborn child frequently occurs. The use cases we are specifically interested in, are the use cases where communication between IT systems are necessary and data has to be transferred from one system to the other. 
* Provide guidance on implementation, use and handling of the relevant FHIR resources and terminology value sets

#### Considerations:
To manage our project deliverables and timeline, we will set priorities to use cases and work out the use cases in the sequence of priority. Other use cases will remain open for future projects.

#### Target audience

This implementation guide is meant for IT developers who develop IT systems for the child health and obstetrics sector. These IT systems are not stand alone systems, but usually make part of a framework of systems within an institution or a network  of institutions. A hospital would have a general EHR system. An ultrasound technician or a lab technician would perform their research in their own specialised system. This leads to the necessity to communicate between different software systems on different hardware environments. In this IG we explain how to communicate data of a fetus between systems.

IT vendors will only develop under assignment of their end user. The secondary target of this IG are the stakeholders that sponsor  IT vendors to develop these  communication tools. 
In general we can classify the stakeholders in these different groups:
* Direct healthcare providers who have direct contact with the pregnant mother:
  * Midwife, obstetrician, general practitioner, paediatrician, nurses
* Paramedical services, research lab technicians and nurses who perform procedures on behalf of the direct healthcare providers such as:
  * Ultrasound technicians, genetic lab technicians, clinical chemistry technicians.
* Governmental institutions who gather and perform research on data about pregnancy, birth and vital health statistics or have a public health task in screening or prevention of certain disorders.

All these stakeholders work generally in their own system. 

The governmental and research  institutions also perform their tasks on their own systems which are generally on regional or national level, which results in a one to many communication between this institution and the different providers of data.


#### Scope

##### In scope
The focus of this Implementation Guide is the handling of data of a fetus. This means that we concentrate on the ante natal ( or prenatal) period, because once birth has taken place the data related to the child would be represented with a FHIR resource of patient for the child. 

The objective of this project is to set guidelines on how we can communicate data when a fetus is involved in the healthcare process. 

##### Out of Scope

As HL7 we realise that we cannot dictate mandatory rules for the registration of fetus data in systems. 

Neither are we in the position to dictate the use of certain terminologies. There might be licence issues with certain terminologies.  However we will provide examples as guidance to show how certain values can be expressed.  

This project is intended to solely address issues on the informational aspect of data handling in the normal process flow of day to day pregnancy and birth healthcare. We are aware that this subject can easily be misunderstood, but legal, religious or political issues are not part of this project.  This project should also not be misused or quoted by any party to prove any statement for their own conviction. 
 

### Roles & Systems

In the use cases we provide in this Implementation Guide we have simplified the scenario’s using 2 simple actors.An initiator and a recipient. There are 2 basic patterns:
* The initiator has a service request and the recipient is the potential fulfiller of the request.
* The initiator has data available it wants to exchange with a recipient. Note that the recipient could be the initiator who has placed a service request. 

In chapter 7 ( scenario’s) we elaborate on these roles in the various use cases.
How these systems communicate with each other ( message mechanism or RESTful concept) is less of importance here. It could be either. The focus is on the data content. 

#### Methodology
In this project we consider the following methodology to reach our goal;
* Step 1: Define the use cases

    In this chapter we will describe the various use cases which we would like to consider within the scope of our project. Which processes do we need to support? What kind of data are used in these scenarios? And is this data of the mother or from the unborn child? Who are the stakeholders and which systems make use of these use cases? The use cases are described here as abstract patterns. Detailed examples of such use cases can be found in the storyboards in the appendix. The purpose is to categorise the types of data handling into similar use of resources and handling of the flow.

* Step 2: Set the priorities

    We will set priorities to the sequence in which we will address the use cases. It might well be that certain use cases might not be analysed in this stage of the project, but parked for future projects.

* Step 3: Define the data
    
    In this step we take a deeper look into the functional needs of the data. We strive to set a logical data model for the various clinical resources. The set in each use case can be different of course, but when we collect  all the data, we would come to a common set for mother, fetus and child. The consideration here is if we can recognize the data as a feature of the mother, fetus or child. Once we have achieved a consensus on the set, we can consider this as a core set, which contains the most common data used in the pregnancy and birth care. Where possible we try to set an appropriate terminology binding. 

* Step 4: Define the transactions

    In this step we model the transactions in a functional flow. It should be clear who the initiator is and which stakeholders play the role of receiver. What does the initiator do and what do we expect a receiver should do in response. In the use cases systems communicate to other systems. Which transactions do we expect the systems to be able to do?

* Step 5: Define the technical framework

    All previous steps describe data in a functional mode, but for systems to be able to communicate physically you need to define the technical framework. In this project we choose to use the FHIR as the technical framework to communicate the data from one system to another system. Here we run into questions like how to relate the data to appropriate resource such as mother or fetus. Current resources might not yet be capable of relating to resources other than with a patient-id.

### How to read this Guide
The main sections of this IG are:
-  [Background](background.html): The background section provides business context for the implementation guide and information that implementers should be
      familiar with before reading the remainder of the IG.  There could be multiple pages for this.
- Guidance - The Guidance pages document best practices and how to use the profiles and transactions defined in this guide for a couple of use cases.
    - [Thought Process](thought-process.html): This page provides guidance on the thought process applied while decding and designing the profile to represent a fetus record.
    - [Service Request](use-case1-service-request.html): This page provides guidance on service requests
    - [Result Reporting](use-case2-result-reporting.html): This page provides guidance on result reporting
    - [Data Transfer](use-case3-data-transfer.html): This page provides guidance on data transfer
- [FHIR Artifacts](artifacts.html): Detailed descriptions and formal definitions of all FHIR artifacts defined in this guide
- Support - The Support pages include useful links and downloads
- [Downloads](downloads.html): Allows downloading a copy of this implementation guide and other useful information
