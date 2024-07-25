#### Use case 3: Data Transfer
##### Description
This use case is a basic use case where you communicate data from one system to another system. Usually such a data transfer is a combined set of data with information about the mother, the pregnancy or the fetus. 

This of course could be in the various stages of the pregnancy and that has direct consequences on how to compose the set to communicate. Is there only a mother record? Are there fetus medical records? Is there already a child record?

There is more or less general consensus of what a child record should contain and in the elaboration of this use case we will explore the data categories.

>Patient Information:
>Ms. MS is a 32-year-old female residing in a rural village in Sri Lanka. She was born on February 1, 1991, to a healthy couple and was diagnosed with achondroplasia based on clinical diagnosis, as she had macrocephaly and short limbs at birth. Her current address is 88 Factory Road, Peradeniya, and she can be contacted at +94771234567.
>
>Pregnancy Details:
>Ms. MS's pregnancy was confirmed at 8 weeks of gestation, after which she was regularly monitored at the local Medical Officer of Health office on a monthly basis. Additionally, she was seen by an obstetrician once every trimester at Teaching Hospital Kandy.
>At 32 weeks of pregnancy, Ms. MS had her third visit to the Obstetrician at Teaching Hospital Kandy, during which an ultrasound scan was performed. The scan revealed that the femur length (40mm) was lower than the expected range for the period of gestation, but the head circumference (318mm) was larger than expected. Besides, her general well-being and a few other parameters, including weight, were recorded and found to be within the normal range.
>
>Management Plan:
>Considering the patient's medical history and ultrasound findings, the Obstetrician planned an Elective Lower Segment Cesarean (EL/LCSC) delivery at 38 weeks of gestation.

##### Roles & systems
Record initiator: Source provider
Record receiver;  Record receiver.
Subject of procedure: fetus, mother, child or pregnancy.
Carrier: pregnant woman

In this use case a source provider compiles a collection of data from the mother, the fetus and the pregnancy and sends it to a receiving system. The receiving system responds to the initiator to indicate whether it can process the information or else replies that it does not understand what is being sent.  

![Use case 3 roles](usecase3-roles.png "Use case 3 Data Transfer")

### FHIR
![Use case 3](usecase3.png "Use case 3 Data Transfer")