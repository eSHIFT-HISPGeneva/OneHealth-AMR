# Component JSON files for the DHIS2 One Health AMR system

We've provided the json files in a number of different ways. This set of DHIS2 JSON metadata files is organised by individual metadata object. Users can choose to inspect them and import them into DHIS2 in a sequential manner.

To be valid, the metadata objects __MUST be imported in the following order:__
### ODS Layer (landing point for imported AMR data)
* Permission Groups (usergroups.json)
* Option Sets (optionset-_name_.json)
* Tracker Types and Attributes (trackertypesattributes.json)
* Program Data Elements (dataelement-progs.json)
* Tracker Programs (program-_name_.sjon)
### Analytics Layer (aggregate AMR tables for analytics and reporting)
* Aggregate Data Elements (dataelement-analytics.json)
* Analytics - charts
* Analytics - tables
* Analtics - events
