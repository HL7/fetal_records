#### Use case 2: Result Reporting
##### Description
Once a procedure is performed results will be reported back. This could be intermediate or final results. Part of the results could be about the mother,  and the other part could be about ( one of) the fetus(sus). Also in the case of substance administration usually a confirmation of the administration is reported back. 

In this basic use case we should make clear whether the data are results about the mother, the fetus or the pregnancy as a whole. In FHIR the various results are grouped in the category of diagnostics . If the data belongs to the fetus, are there any restrictions in the diagnostic resources to attach the results to a fetus as a subject?

Medication topics do not fall under diagnostics, but under a separate group called medication. Here you might want to express that the medication substance was administered to the mother, fetus. ( Placenta?). Are there restrictions for any of these subjects in medication? 
For reviewing the data about the fetus let us look at the following storyboard.

>**Congenital Diaphragmatic Hernia in Twin Pregnancy**
> 
>28 yo Gravida 1 Para 0 Mother with a dichorionic/diamniotic twin pregnancy, fetus A antenatally diagnosed with **left congenital diaphragmatic hernia (CDH)** containing small bowel, spleen and stomach in the left hemithorax on level 2 ultrasound at 20 weeks. Evaluation at 24 1/7 weeks revealed Lung-Head Ratio (LHR) of 0.67  via ultrasound and an observed:expected lung volume 0.21 via MRI. Normal karyotype - 46 XY on amniocentesis for both fetuses. fetus B noted to have hypospadias on antenatal ultrasound. 

What this use case addresses: Antenatal observations at specific gestational ages. Indication to differentiate 2 fetal records. For the example we will review:
* The result reporting of the ultrasound and MRI at 24 weeks for fetus A and fetus B.
* The result reporting at birth of twin A and twin B.

The task performing professionals perform the service request such as ultrasound or lab research. The results of the procedure are registered in a separate system and reported back to the requesting EHR. In this section we focus on the data that is communicated to the main EHR. This guideline should make clear what kind of data is being communicated and to which subject this data belongs.
The data  of the results can be categorized in 3 classes:
* data that is clearly only about the mother
* data that is clearly only about (one of) fetus(ses).
* data that is about the pregnancy and shared with mother and fetus.

##### Roles & systems
Order receiver; Procedure performer. The systems are for example lab systems or ultra sound systems.
Order placer: ordering care provider. The systems are the EHR systems from the care provider.
Subject of procedure:mother, fetus, placenta?
Carrier: pregnant woman

The flow of the transactions is reversed. The procedure or order performer fulfills the requested task. This might take some time and the performer knows when it is ready to give feedback to the originator. Some systems also provide intermediate results, but this is optional. This is illustrated with a dotted line in the UML below.  The order placer usually confirms that it has received and can process the received information. 

If the order placer does not comprehend the contents of the transaction, it obviously will send a message that it cannot process the information.
<center>
<table><tr><td><img src="usecase2-roles.png" style="width:60%; height: 60%" alt="Use case 2 roles"/></td></tr></table>
</center>



##### FHIR
The graph below shows the mapping of this use case to FHIR. The FHIR example resources can be found in the [FHIR artifacts](artifacts.html#2) section of this IG.

<center>
<table><tr><td><img src="usecase2.png" style="width:100%;" alt="Use case 2 Result Reporting"/></td></tr></table>
</center>



Notes: The following resources are not included in the list of examples
* Observation 1 - Gravida
* Observation 2 - Para
* Observation 3 - Dichorionic/diamnotic twin pregnancy
* Observation 4 - Small bowel, spleen and stomach in left hemithorax

Open issues/questions:
* how to model “small bowel, spleen and stomach in left hemithorax” + relations to DiagnosticReport 1 and Condition 2
* who is the subject of Observations lung-head ratio and obs:exp lung volume? Is this still about fetus A?
