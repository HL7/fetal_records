#### Use case 1: Medication request
##### Description
A request is placed to to administer (medication) substance to a fetus. The request is processed with different possible states (of reply). These states are not relevant for the discussion about the fetus.

Point of the discussion is how to make clear for which subject the request procedure is meant. Is the medication request meant for the mother or is it meant for the fetus? There could be more than one fetus.

The second question is if there are any restrictions in the medication administration to be performed when it is meant for a fetus. It is possible that certain resources require a real patient with an ID as the subject. This would make it impossible for the fetus to be the subject of the medication request unless we demand a change.

>**Postnatal intervention - d-transposition of the great arteries with intact ventricular septum**
>
>A 32 yo Gravida 3 Para 2002 Mother with a history of *hypertension* on *labetolol* during this pregnancy was diagnosed with female fetus with **d-transpositon of the great arteries** (SCTID: 399216004) on fetal echocardiography at 21 3/7 weeks gestation. Most recent U/S at 37 5/7 weeks revealed an *estimated fetal weight* of 2.960 kg.
>
>**Prostoglandin E infusion** 0.01 mg/kg/min was ordered based on a dosing weight of 3kg to be initiated just after birth following umbilical line placement. 

What this use case addresses: medication ordering prior to delivery, assigning a condition to a fetus prior to birth,  assigning gestation specific observation. The issue here is how to make clear that the medication request is meant to suppress high blood pressure of the child immediately after it is born and not the mother. The child does not have a medical record yet, but the medication request has to be prepared before or during labor and administered to the child immediately after birth, The medication administration might have to be recorded. 

##### Roles & systems
Order placer: ordering care provider. The order placing system is usually an EHR from the obstetrician. 
Order receiver; Procedure performer. Order receiving systems are for example ultrasound systems, lab systems.
Subject of procedure: mother or  fetus
Carrier: pregnant woman

As mentioned before we have an order placer and an order performer.
The order placer takes the initiative at a specific moment and the order performer reacts whenever a request has been generated.

<center>
<table><tr><td><img src="usecase1-roles.png" style="width:60%; height: 60%" alt="Use case 1 roles"/></td></tr></table>
</center>


##### FHIR
The graph below shows the mapping of this use case to FHIR. The FHIR example resources can be found in the [FHIR artifacts](artifacts.html#2) section of this IG.

<center>
<table><tr><td><img src="usecase1.png" style="width:100%;" alt="Use case 1 Medication Request"/></td></tr></table>
</center>


Note: the following resources are not included in the list of examples
* Condition 1 - Hypertension on labetolo
* Observation 1 - Gravida
* Observation 2 - Para
* Procedure 1 - Fetal echocardiography
* Procedure 3 - Umbilical line placement