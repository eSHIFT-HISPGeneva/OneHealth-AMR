Last updated: 24/05/2021

Generic Version 1.1

DHIS2 Version : 2.36

Demo:

Username: Password:

# Overview

This One Health AMR repository consists of a set of metadata packages, interoperability mapping files, and support documents that allow countries to instantiate a basic end-to-end (lab/patient systems to national-level analytics) cross-sector (animal, food, human, environment, drug use) Antimicrobial Resistance surveillance system based on several readily available open-source components.

The One Health AMR package was developed using DHIS2 Version. This work was completed in collaboration with the Foundation for Innovative New Diagnostics (FIND) on a Global AMR Innovation Fund (GAMRIF) project. To use the package, it is recommended that you install it into a DHIS2 instance using DHIS2 2.36 or above. If you will be setting this up on a new instance, please refer to the [DHIS2 installation guide](https://docs.dhis2.org/master/en/dhis2_system_administration_guide/installation.html).

# Installation

Installation of the module consists of several steps:

1. Adjusting default values in the metadata file **before** import
2. Importing the metadata file into DHIS2.
3. Configuring the imported metadata.
4. Adapting the program after being imported
5. Installation of OpenInterop
6. Installation of GLASS Reporting and Aggregation Scripts

It is recommended to first read through each section before starting the installation and configuration process in DHIS2.

# Requirements

It is recommended to use a fresh installation of DHIS2 for the One Health AMR System.

To install the module, an administrator user account on DHIS2 is required. The procedure outlined in this document should be tested in a test/staging environment before being performed on a production instance of DHIS2.

Great care should be taken to ensure that the server itself and the DHIS2 application is well secured, to restrict access to the data being collected. Details on securing a DHIS2 system is outside the scope of this documentation, and we refer to the [DHIS2 documentation](http://dhis2.org/documentation).

# Adjusting Metadata Default Values

# Importing metadata

The .json metadata file is imported through the [Import/Export](https://docs.dhis2.org/master/en/user/html/import_export.html) app of DHIS2. It is advisable to use the &quot;dry run&quot; feature to identify issues before attempting to do an actual import of the metadata. If &quot;dry run&quot; reports any issues or conflicts, see the [import conflicts](https://docs.dhis2.org/en/topics/metadata/tuberculosis/tb-case-surveillance-tracker-installation.html#handling-import-conflicts) section below.

If the &quot;dry run&quot;/&quot;validate&quot; import works without error, attempt to import the metadata. If the import succeeds without any errors, you can proceed to [configure](https://docs.dhis2.org/en/topics/metadata/tuberculosis/tb-case-surveillance-tracker-installation.html#additional-configuration) the module. In some cases, import conflicts or issues are not shown during the &quot;dry run&quot;, but appear when the actual import is attempted. In this case, the import summary will list any errors that need to be resolved.

## Handling import conflicts

**NOTE:**  If you are importing into a new DHIS2 instance, you will not have to worry about import conflicts, as there is nothing in the database you are importing to to conflict with. Follow the instructions to import the metadata then please proceed to the &quot;[Additional configuration](https://docs.dhis2.org/en/topics/metadata/tuberculosis/tb-case-surveillance-tracker-installation.html#additional-configuration)&quot; section.

There are a number of different conflicts that may occur, though the most common is that there are metadata objects in the configuration package with a name, shortname and/or code that already exists in the target database. There are a couple of alternative solutions to these problems, with different advantages and disadvantages. Which one is more appropriate will depend, for example, on the type of object for which a conflict occurs.

### Alternative 1

Rename the existing object in your DHIS2 database for which there is a conflict. The advantage of this approach is that there is no need to modify the .json file, as changes are instead done through the user interface of DHIS2. This is likely to be less error prone. It also means that the configuration package is left as is, which can be an advantage for example when training material and documentation based on the configuration package will be used.

### Alternative 2

Rename the object for which there is a conflict in the .json file. The advantage of this approach is that the existing DHIS2 metadata is left as-is. This can be a factor when there is training material or documentation such as SOPs of data dictionaries linked to the object in question, and it does not involve any risk of confusing users by modifying the metadata they are familiar with.

Note that for both alternative 1 and 2, the modification can be as simple as adding a small pre/post-fix to the name, to minimise the risk of confusion.

### Alternative 3

A third and more complicated approach is to modify the .json file to re-use existing metadata. For example, in cases where an option set already exists for a certain concept (e.g. &quot;sex&quot;), that option set could be removed from the .json file and all references to its UID replaced with the corresponding option set already in the database. The big advantage of this (which is not limited to the cases where there is a direct import conflict) is to avoid creating duplicate metadata in the database. There are some key considerations to make when performing this type of modification:

- it requires expert knowledge of the detailed metadata structure of DHIS2
- the approach does not work for all types of objects. Certain types of objects have dependencies which are complicated to solve in this way, for example related to disaggregations.
- future updates to the configuration package will be complicated.

# Additional configuration

Once all metadata has been successfully imported, there are a few steps that need to be taken before the module is functional.

## Sharing

First, you will have to use the _Sharing_ functionality of DHIS2 to configure which users (user groups) should see the metadata and data associated with the programme as well as who can register/enter data into the program. By default, sharing has been configured for the following:

- Tracked entity type
- Program
- Program stages
- Dashboards

There are user groups that come with the package:

-

By default the following is assigned to these user groups

You will want to assign your users to the appropriate user group based on their role within the system. You may want to enable sharing for other objects in the package depending on your set up. Refer to the [DHIS2 Documentation](https://docs.dhis2.org/master/en/dhis2_user_manual_en/about-sharing-of-objects.html) for more information on configuring sharing.

## User Roles

Users will need user roles in order to engage with the various applications within DHIS2. The following minimum roles are recommended:

1. Tracker data analysis : Can see event analytics and access dashboards, event reports, event visualizer, data visualizer, pivot tables, reports and maps.
2. Tracker data capture : Can add data values, update tracked entities, search tracked entities across org units and access tracker capture

Refer to the [DHIS2 Documentation](http://dhis2.org/documentation) for more information on configuring user roles.

Default User Roles

## Organisation Units

You must assign the program to organisation units within your own hierarchy in order to be able to see the program in tracker capture.

# Adapting the One Health AMR System

Once the programme has been imported, you might want to make certain modifications to the programme. Examples of local adaptations that _could_ be made include:

- Adding additional data elements (pathogens and antibiotics)
- Adapting data element/option names according to national conventions.
- Adding translations to variables and/or the data entry form.
- Adding pathogens and antibiotics to aggregate reporting
- Creating custom breakpoints

## Qualitative and Quantitative AST Results

The current version of the One Health AMR System has been designed to handle qualitative antimicrobial susceptibility testing results for the purposes of aggregate reporting. Due to the complexity of interpretation of quantitative results, the automated breakpoint functionality is not complete. However, automatic interpretation of quantitative results is possible, and can be implemented into the system using program indicators to calculate R/S/I values using either EUCAST or CLSI breakpoint standards.

The example system has an incomplete EUCAST automated interpretation system, and analysts can query for their own purposes.

# Data Elements

The default configuration of the One Health AMR System includes the following data elements, as defined by the World Health Organization list of priority pathogens and antibiotics:

## Pathogens

| **Data Element** | **UID** |
| --- | --- |
| Acinetobacter baumannii |
 |
| Pseudomonas aeruginosa |
 |
| Klebsiella pneumonia |
 |
| Escherichia coli |
 |
| Serratia sp. |
 |
| Proteus sp. |
 |
| Providencia sp. |
 |
| Morganella sp. |
 |
| Enterococcus faecium |
 |
| Staphylococcus aureus |
 |
| Helicobacter pylori |
 |
| Campylobacter |
 |
| Salmonella sp. |
 |
| Neisseria gonorrhoeae |
 |
| Streptococcus pneumoniae |
 |
| Haemophilus influenzae |
 |
| Shigella sp. |
 |

## Antibiotics

| **Data Element** | **UID** |
| --- | --- |
| Amikacin |
 |
| Amoxicillin |
 |
| Amoxicillin oral |
 |
| Amoxicillin-clavulanic acid |
 |
| Ampicillin |
 |
| Ampicillin-sulbactam |
 |
| Azithromycin |
 |
| Aztreonam |
 |
| Benzylpenicillin |
 |
| Cefaclor |
 |
| Cefadroxil |
 |
| Cefalexin |
 |
| Cefazolin |
 |
| Cefepime |
 |
| Cefiderocol |
 |
| Cefixime |
 |
| Cefixime |
 |
| Cefotaxime |
 |
| Cefotaxime |
 |
| Cefoxitin |
 |
| Cefpodoxime |
 |
| Ceftaroline |
 |
| Ceftazidime |
 |
| Ceftazidime-avibactam |
 |
| Ceftbiprole |
 |
| Ceftibuten |
 |
| Ceftobiprole |
 |
| Ceftobripole |
 |
| Ceftolozane-tazobactam |
 |
| Ceftriaxone |
 |
| Ceftriaxone |
 |
| Cefuroxime |
 |
| Chloramphenicol |
 |
| Ciprofloxacin |
 |
| Clarithromycin |
 |
| Clindamycin |
 |
| Colistin |
 |
| Dalbavancin |
 |
| Daptomycin |
 |
| Delafloxacin |
 |
| Doripenem |
 |
| Doxycycline |
 |
| Eravacycline |
 |
| Ertapenem |
 |
| Erythromycin |
 |
| Fosfomycin |
 |
| Fusidic acid |
 |
| Gentamicin |
 |
| Imipenem |
 |
| Imipenem-relebactam |
 |
| Lefamulin |
 |
| Levofloxacin |
 |
| Linezolid |
 |
| Mecillinam oral |
 |
| Meropenem |
 |
| Meropenem-vaborbactam |
 |
| Metronidazole |
 |
| Minocycline |
 |
| Moxifloxacin |
 |
| Nalidixic Acid |
 |
| Nitrofurantoin |
 |
| Nitroxoline |
 |
| Norfloxacin |
 |
| Ofloxacin |
 |
| Oritavancin |
 |
| Piperacillin |
 |
| Piperacillin-tazobactam |
 |
| Quinupristin-dalfopristin |
 |
| Rifampicin |
 |
| Roxithromycin |
 |
| Spectinomycin |
 |
| Tedizolid |
 |
| Teicoplanin |
 |
| Telavancin |
 |
| Telithromycin |
 |
| Temocillin |
 |
| Tetracycline |
 |
| Ticarcillin |
 |
| Ticarcillin-clavulanic acid |
 |
| Tigecycline |
 |
| Tobramycin |
 |
| Trimethoprim |
 |
| Trimethoprim-sulfamethoxazole |
 |
| Vancomycin |
 |
