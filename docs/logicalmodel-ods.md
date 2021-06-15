# Logical Model of the AMR One Health Operational Data Store (ODS)
There are several challenges arising from attempting to model a One Health version of AMR in a data warehousing platform such as DHIS2. These can often be framed as drivers that are pulling against each other. The success of a national implementation depends on - amongst other things - finding the right balance between:
* A national surveillance viewpoint vs. the desire for an operational viewpoint that reflects laboratory or clinical needs
* Cleaning data before storing it in a national data warehouse vs. the desire to capture everything and "we'll sort it out later"
* Model Complexity (covering all analytical scenarios) vs. Model Simplicity (covering a proportion of analytical needs)
* Human-centric view of AMR vs. One Health multi-sector views of AMR

This release of the AMR One Health platform has made certain decisions around these balance points, each of which has implications on the design of the data models implemented in DHIS2.

<img align="right" src="https://github.com/eSHIFT-HISPGeneva/OneHealth-AMR/blob/master/docs/images/AMR_OneHealth_DW_Conceptual-reduced.png">

## Data Warehouses and Operational Data Stores
The data warehouse discipline includes the concept of an Operational Data Store or ODS. An ODS is designed as 
