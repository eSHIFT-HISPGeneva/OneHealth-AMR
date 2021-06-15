# Logical Model of the AMR One Health Operational Data Store (ODS)
There are several challenges arising from attempting to model a One Health version of AMR in a data warehousing platform such as DHIS2. These can often be framed as drivers that are pulling against each other. The success of a national implementation depends on - amongst other things - finding the right balance between:
* A national surveillance viewpoint vs. the desire for an operational viewpoint that reflects laboratory or clinical needs
* Cleaning data before storing it in a national data warehouse vs. the desire to capture everything and "we'll sort it out later"
* Model Complexity (covering all analytical scenarios) vs. Model Simplicity (covering a proportion of analytical needs)
* Human-centric view of AMR vs. One Health multi-sector views of AMR

This release of the AMR One Health platform has made certain decisions around these balance points, each of which has implications on the design of the data models implemented in DHIS2.

<img align="right" src="https://github.com/eSHIFT-HISPGeneva/OneHealth-AMR/blob/master/docs/images/AMR_OneHealth_DW_Conceptual-reduced.png">

## Operational Data Stores
The data warehouse discipline includes the concept of an Operational Data Store (or ODS). An ODS brings together data from a number of operational systems into one location, with the data retaining much of the original properties of the source systems. While not considered as a data warehouse proper, they can act as staging areas for data before being processed into datawarehouse-type analytical data cubes. Operational reports can query ODS data, and provide an environment for 'digging down into' original source data.
## ODS in DHIS2
With the AMR One Health Platform, a decision was made to treat the Tracked Entity capibility in DHIS2 as the equivalent of an ODS construct. Given the competing drivers indicated above and several factors about the AMR data observed from laboratory or other source systems, the following contraints were assumed:
* A single ODS per domain (animal, human, environment, food, and feed) has been created.
* The ODS data model is simple, reflecting the 'line listing' nature of most AMR data sources.
* Compatiability with the WHONET application, widely used for the management and analysis of microbiology laboratory data, was a central consideration to the deaign.
* A certain 'cleanup' of source system data is assumed as part of the preliminary ETL (extract, transform, load) process for inserting data into the domain ODS's.
* Common metadata lookup lists (pathogens, antimcrobials) were used across the ODS domains to support One Health veiws.
## The ODS Data Model

