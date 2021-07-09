# Layer JSON files for the DHIS2 One Health AMR system

We've provided the json files in a number of different ways. This set of files organised the DHIS2 JSON metadata files by logical layer. Users can choose to import them into DHIS2 in the following order:
### ODS Layer (landing point for imported AMR data)
* [ODS metadata file](oh_amr_ods_layer.json)
### Aggregate Layer (aggregated version of the AMR data)
* [Aggregate metadata file](oh_amr_aggregate_layer.json)
### Analytics Layer (aggregate AMR tables for analytics and reporting)
* [Analytics metadata file](oh_amr_analytics_layer.json)

Note: Before importing the analytics layer, it is necessary to search and replace the placeholder national uid "replace_national_UID" with the DHIS2 UID for the organisation unit at the top the organisational tree (normally the country UID for national systems).

