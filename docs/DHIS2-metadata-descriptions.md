# Creating a One Health AMR JSON insertion package

## 5 Tracker Programs

<img align="right" src="https://github.com/eSHIFT-HISPGeneva/OneHealth-AMR/blob/master/docs/images/AMRTrackerPrograms-reduced.png"> There are five Tracker Programs in the AMR One Health Platform. The key difference between them is the look-up list values for Specimen Type, and the attributes stored for each type of entity (e.g., the human program includes age and sex demographic attributes, whereas animal will include species attributes etc.).

The Specimen Type lookup list values are derived from the values and codes used by WHONET to support compatibility with one of the most widely used AMR laboratory tools.

## Tracker Program Model

<img align="right" src="https://github.com/eSHIFT-HISPGeneva/OneHealth-AMR/blob/master/docs/images/AMRTrackerStage-reduced.png"> The original model used during our AMR country pilots implemented a simple line-listing, with an antimicrobial data element for every possible qualitative and quantitative test result for a given pathogen and sample type. This model proved to be unwieldy as the system scaled due to the complexity of the coding necessary to generate aggregate results with so many data elements.

The current model uses a single data element to represent the antimicrobial (a lookup list) and two data elements to represent the possible test results (qualitative and quantitative). These are modelled as a single repeating stage within each of the domain Tracker Programs. Details of the specimen type, pathogen, laboratory, and other identifiers or demographic information are stored as program attributes.

## Inserting Data via the API

Version 2.36 of DHIS2 introduced a new API end point for creating and manipulating Tracked Entities and Program Enrollments. To maintain backwards compatibility, the current release documents the use of the 2.33 API end point, i.e. **/api/33/trackedEntityInstances****.**

A successful package registers a new instance of an entity, enrolls that entity in the appropriate tracker program, and inserts the repeated event stage data (repeated as many times as necessary, typically corresponding to a panel of test results for a given sample of a pathogen). 

The generic human example below includes:

- two human-only attributes (age and sex),
- three common attributes (sample-type, pathogen, and laboratory),
- two identifier attributes (sample id, and patient id)
- two qualitative test results for different antimicrobials:

```json
{
  "trackedEntityType": "trackedEntityType-UID",
  "orgUnit": "orgUnit-UID",
  "attributes": [
    {
        "attribute": "ID_Specimen-UID",
        "value": "xxxxxxx"
    },
    {
        "attribute": "ID_OriginatingEntity-UID",
        "value": "xxxxxxx"
    },
    {
        "attribute": "Pathogen-UID",
        "value": "eco"
    },
    {
        "attribute": "SpecimenType-UID",
        "value": "sf"
    },
    {
        "attribute": "Laboratory-UID ",
        "value": "lab-orgUnit-UID"
    },
    {
        "attribute": "Sex-UID",
        "value": "x"
    },
    {
        "attribute": "Age (Years)-UID",
        "value": "n"
    }
  ],
  "enrollments":[
    {
      "orgUnit": "orgUnit-UID ",
      "program": "program-UID",
      "enrollmentDate": "datetime",
      "incidentDate": "datetime",
      "events": [
        {
          "program": "program-UID",
          "programStage": "programStage-UID",
          "orgUnit": "orgUnit-UID",
          "status": "COMPLETED",
          "storedBy": "xxxxx",
          "eventDate": "datetime",
          "dataValues": [
            {
              "dataElement": "Antimicrobial-UID",
              "value": "J01CR05"
            },
            {
              "dataElement": "Result(Qualitative)-UID",
              "value": "S"
            }
          ]
        },
        {
          "program": "program-UID",
          "programStage": "programStage-UID",
          "orgUnit": "orgUnit-UID",
          "status": "COMPLETED",
          "storedBy": "admin",
          "eventDate": "datetime",
          "dataValues": [
            {
              "dataElement": "gaCDwmKm768",
              "value": "J01DD01"
            },
            {
              "dataElement": "Result(Qualitative)-UID",
              "value": "S"
            }
          ]
        }
      ]
    }
  ]
}
```


## Reference UIDs for the JSON Package

The following UIDs should be used to replace the placeholders in the example version.

### Tracked Entity Types

| **id** | **displayName** |
| --- | --- |
| **tuhi0maUrlh** | AMR Entity |

### Tracked Entity Attributes

| **id** | **displayName** |
| --- | --- |
| **BXdKAz7qu0K** | Age (Days) |
| **nZHB18RzReF** | Age (Months) |
| **TRm4iaYikdK** | Age (Years) |
| **qaQzslMuVac** | ID\_OH\_AMR |
| **QznE0JyWMCT** | ID\_OriginatingEntity |
| **eaqQd1d6yAV** | ID\_Specimen |
| **DYsNDR4nCWB** | Sex |
| **opkhFoeEz9m** | Pathogen |
| **LQZywhYcISY** | Laboratory |
| **NoTuZ3jydbw** | Specimen Type (Human) |
| **Cex2g45wMZy** | Specimen Type (Animal) |
| **HkkJZJ70OZq** | Specimen Type (Environment) |
| **oWzw3X5aKL3** | Specimen Type (Food) |
| **lFyQfRk7yUv** | Specimen Type (Feed) |

### Program UID&#39;s

| **id** | **displayName** |
| --- | --- |
| **sWf6NXIupFI** | AMR - Animal |
| **KY3o3VKandt** | AMR - Environment |
| **s2F33R4jnPZ** | AMR - Feed |
| **XEGGvL8giPs** | AMR - Food |
| **wsHfxYEgte5** | AMR - Human |

### Program Stage UID&#39;s

| **id** | **displayName** |
| --- | --- |
| **kGfHGNWI6iQ** | Animal Details |
| **UEI3oCYQtIk** | Environment Details |
| **EgVowusOFav** | Feed Details |
| **o4y0K2eRSUT** | Food Details |
| **JkrGmcLg6Zm** | Human Details |

### Data Element UID&#39;s

| **id** | **displayName** |
| --- | --- |
| **gaCDwmKm768** | Antimicrobial |
| **sjggkgBfIWE** | Result (Quantitative) |
| **C25kY3E21zv** | Result (Qualitative) |

##


## Mapping Lookups for the JSON Package

Below are the mapping options for the values placeholders in the generic JSON package. If the source data is from WHONET, most of the values (except Antimicrobial) can be passed through.

### Sex Tracked Entity Attribute Mappings (DYsNDR4nCWB)

| **Mapping Code** | **Display Name** |
| --- | --- |
| **f** | Female |
| **m** | Male |
| **u** | Sex Unstated |

### Result (Qualitative) Mappings (C25kY3E21zv)

| **Mapping Code** | **Display Name** |
| --- | --- |
| **I** | Intermediate |
| **NS** | Non-Susceptible |
| **R** | Resistant |
| **S** | Susceptible |

### Specimen Type (Feed) Mappings (nm0NfU92Elb)

| **Mapping Code** | **Display Name** |
| --- | --- |
| **conc** | Concentrate |
| **treat** | Dog treat |
| **feedsupp** | Feed supplement |
| **mealblood** | Meal, blood |
| **mealbone** | Meal, bone |
| **mealfeath** | Meal, feather |
| **mealfb** | Meal, feather and blood |
| **mealfish** | Meal, fish |
| **mealmeat** | Meal, meat |
| **mealmb** | Meal, meat and bone |
| **mealvisc** | Meal, viscera |
| **natprep** | Natural preparation |
| **soypellet** | Soybean Pellet |

### Specimen Type (Animal) Mappings (vxGMPZ98rVp)

| **code** | **name** |
| --- | --- |
| **carc** | Carcass |
| **carcrinse** | Carcass, rinse |
| **carcsponge** | Carcass, sponge |
| **carcswab** | Carcass, swab |
| **cecum** | Cecal contents |
| **pooledorg** | Chicken, pooled day-old chick organs |
| **yolksac** | Chicken, yolk sac of day-old chicks |
| **cloaca** | Cloacal swab |
| **eggcont** | Egg contents |
| **eggshell** | Eggshell |
| **st** | Stool |

### Specimen Type (Environment) Mappings (xhIBAlnWwpP)

| **code** | **name** |
| --- | --- |
| **pendrag** | Animal pen, drag swab |
| **penstool** | Animal pen, feces from floor |
| **penfood** | Animal pen, food supply |
| **penshoe** | Animal pen, shoe covers |
| **penwat** | Animal pen, water supply |
| **cage** | Cage |
| **comp** | Compost |
| **equip** | Equipment |
| **incub** | Incubator |
| **ppe** | Personal Protective Equipment (PPE) |
| **plank** | Plankton |
| **sed** | Sediment |
| **soil** | Soil |
| **surf** | Surface |
| **truck** | Truck |
| **uten** | Utensils |
| **wat** | Water (unspecified) |
| **wahuman** | Water for human consumption |
| **wacity** | Water, city aquaduct |
| **waest** | Water, estuary |
| **walake** | Water, lake |
| **wamun** | Water, municipal aquaduct |
| **waproc** | Water, processed |
| **wariv** | Water, river |
| **wasea** | Water, seawater |
| **watreat** | Water, treated |
| **watuntreat** | Water, untreated |
| **watwaste** | Water, wastewater |
| **watwell** | Water, well |

### Specimen Type (Food) Mappings (G2zKKZR8w7h)

| **code** | **name** |
| --- | --- |
| **1** | Dairy product (unspecified) |
| **1.1** | Milk |
| **1.2** | Fermented milk |
| **1.3** | Condensed milk |
| **1.4** | Cream |
| **1.5** | Milk powder |
| **1.6** | Cheese |
| **1.7** | Ice cream, pudding, yoghurt |
| **1.8** | Whey |
| **2** | Fat, oil (unspecified) |
| **2.1** | Vegetable oil, animal fat |
| **2.2** | Butter, margarine |
| **2.3** | Fat emulsion |
| **2.4** | Fat-based dessert |
| **3** | Sherbet, sorbet |
| **4** | Fruit, vegetable, nuts (unspecified) |
| **4.1** | Fruit |
| **4.1.1** | Fresh fruit |
| **4.1.2** | Processed fruit |
| **4.2** | Vegetable, nuts |
| **4.2.1** | Fresh vegetable |
| **4.2.2** | Processed vegetables and nuts |
| **5** | Confectionery (unspecified) |
| **5.1** | Chocolate |
| **5.2** | Candy |
| **5.3** | Chewing gum |
| **5.4** | Topping |
| **6** | Cereal, cereal product (unspecified) |
| **6.1** | Whole grain, including rice |
| **6.2** | Flour |
| **6.3** | Breakfast cereal |
| **6.4** | Pasta |
| **6.5** | Cereal dessert |
| **6.6** | Batter |
| **7** | Baked good (unspecified) |
| **7.1** | Bread |
| **7.2** | Fine baked good |
| **8** | Meat, meat product (unspecified) |
| **8.1** | Fresh meat |
| **8.2** | Processed meat (whole pieces) |
| **8.3** | Processed meat (comminuted) |
| **8.4** | Sausage casings |
| **9** | Fish, shellfish (unspecified) |
| **9.1** | Fish, shellfish (fresh) |
| **9.1.1** | Fish (fresh) |
| **9.1.2** | Shellfish (fresh) |
| **9.2** | Fish, shellfish (processed) |
| **9.3** | Fish, shellfish (semi-processed) |
| **10** | Egg, egg products (unspecified) |
| **10.1** | Fresh egg |
| **10.2** | Egg product |
| **10.3** | Preserved egg |
| **10.4** | Egg-based desert |
| **11** | Sweetener (unspecified) |
| **11.1** | White sugar |
| **11.2** | Other sugars and syrups |
| **11.3** | Honey |
| **11.4** | Table-top sweeteners |
| **12** | Salts, spices, soups, sauces, etc. (unspecified) |
| **12.1** | Salt |
| **12.2** | Spice |
| **12.3** | Vinegar |
| **12.4** | Mustard |
| **12.5** | Soup |
| **12.6** | Sauce |
| **13** | Food for particular nutritional use (unspecified) |
| **13.1** | Infant formula |
| **13.2** | Weaning food |
| **13.3** | Dietetic food (medical) |
| **13.4** | Dietetic food (weight loss) |
| **13.5** | Dietetic food (other) |
| **13.6** | Food supplement |
| **14** | Beverage (unspecified) |
| **14.1** | Non-alcoholic beverage |
| **14.1.1** | Water |
| **14.1.2** | Juice |
| **14.1.3** | Nectar |
| **14.1.4** | Soft drink |
| **14.1.5** | Coffee, tea |
| **14.2** | Alcohol |
| **15** | Ready-to-eat food (unspecified) |
| **15.1** | Snack |
| **15.2** | Processed nuts |
| **16** | Composite food, other food |

### Specimen Type (Human) Mappings (IvVVi4ft0v8)

| **code** | **name** |
| --- | --- |
| **an** | Abdomen |
| **ab** | Abdominal fluid |
| **as** | Abscess |
| **ad** | Abscess, abdominal |
| **de** | Abscess, dental |
| **ac** | Abscess, perirectal |
| **pt** | Abscess, peritonsillar |
| **ak** | Abscess, skin |
| **ap** | Appendix |
| **ar** | Arm |
| **at** | Aspirate |
| **fn** | Aspirate, fine-needle |
| **au** | Autopsy |
| **ax** | Axilla |
| **bi** | Bile |
| **bx** | Biopsy |
| **bl** | Blood |
| **bv** | Blood vessel |
| **bo** | Bone |
| **bm** | Bone marrow |
| **bn** | Brain |
| **bt** | Breast |
| **mi** | Breast milk |
| **br** | Bronchial |
| **ba** | Broncho-alveolar lavage |
| **bs** | Burns |
| **bu** | Bursa |
| **ca** | Catheter |
| **cs** | Catheter site |
| **cc** | Catheter, central |
| **ch** | Catheter, peripheral |
| **cp** | Catheter, permanent |
| **cu** | Catheter, umbilical |
| **sf** | Cerebrospinal fluid |
| **cx** | Cervix |
| **co** | Conjunctiva |
| **cr** | Cornea |
| **cm** | Culture medium |
| **cy** | Cyst |
| **cb** | Cyst, Bartholin&#39;s |
| **di** | Dialysis fluid |
| **dn** | Drain |
| **dr** | Drainage |
| **du** | Duodenum |
| **ea** | Ear |
| **em** | Ear, middle |
| **eo** | Ear, outer |
| **ee** | Empyema |
| **ep** | Empyema, pleural |
| **es** | Empyema, subdural |
| **ec** | Endocardium |
| **en** | Environmental |
| **ed** | Epididymis |
| **eg** | Epiglottis |
| **eh** | Esophagus |
| **ey** | Eyes |
| **fa** | Fallopian tube |
| **fi** | Fistula |
| **fl** | Fluid |
| **fo** | Food |
| **ft** | Foot |
| **fd** | Foot, diabetic |
| **fb** | Foreign body |
| **fu** | Furuncle |
| **gb** | Gallbladder |
| **ga** | Gastric fluid |
| **gn** | Genital |
| **gf** | Genital, female |
| **gm** | Genital, male |
| **gl** | Gland |
| **gr** | Groin |
| **hr** | Hair |
| **ha** | Hand |
| **hd** | Head |
| **he** | Heart |
| **hv** | Heart valve |
| **hp** | Heart valve, prosthetic |
| **hi** | Hip |
| **hf** | Hip fluid |
| **ig** | Inguinal |
| **it** | Insect |
| **iu** | Intra-uterine device |
| **is** | Isolate |
| **jt** | Joint |
| **jf** | Joint fluid |
| **ki** | Kidney |
| **kn** | Knee |
| **kf** | Knee fluid |
| **la** | Laboratory |
| **lx** | Larynx |
| **lg** | Leg |
| **lp** | Lip |
| **li** | Liver |
| **lo** | Lochia |
| **lu** | Lung |
| **ln** | Lymph node |
| **mc** | Meconium |
| **me** | Mediastinum |
| **mb** | Mini-BAL |
| **mo** | Mouth |
| **mu** | Muscle |
| **nl** | Nail |
| **np** | Nasopharynx |
| **nk** | Neck |
| **nv** | Nerve |
| **no** | Nose |
| **og** | Organ |
| **ot** | Other |
| **ov** | Ovary |
| **pm** | Pacemaker |
| **pn** | Pancreas |
| **lv** | Pelvis |
| **pg** | Penile discharge |
| **pe** | Penis |
| **pd** | Pericardial fluid |
| **pi** | Perineum |
| **pl** | Placenta |
| **pa** | Plasma |
| **pf** | Pleural fluid |
| **po** | Prostate |
| **pu** | Prostatic fluid |
| **pr** | Prosthesis |
| **pb** | Prosthesis, bone |
| **sh** | Prosthesis, shunt |
| **pv** | Prosthesis, vascular |
| **pc** | Protected brush catheter |
| **ps** | Pus |
| **qc** | Quality control |
| **ex** | Quality control, external |
| **re** | Rectal |
| **rc** | Rectouterine pouch (Douglas&#39; cul-de-sac) |
| **rs** | Research |
| **rp** | Respiratory |
| **rl** | Respiratory, lower |
| **ru** | Respiratory, upper |
| **sv** | Salivary gland |
| **tp** | Scotch tape test for parasites |
| **cd** | Screen for C. difficile |
| **mr** | Screen for MRSA |
| **vr** | Screen for VRE |
| **sc** | Screening |
| **se** | Secretion |
| **sm** | Semen |
| **sr** | Serum |
| **su** | Shunt fluid |
| **si** | Sinus |
| **sk** | Skin |
| **sl** | Spleen |
| **sp** | Sputum |
| **sa** | Sputum for acid-fast bacilli |
| **in** | Sputum, induced |
| **st** | Stool |
| **sg** | String test for parasites |
| **sb** | Swab |
| **te** | Testes |
| **th** | Throat |
| **ti** | Tissue |
| **tn** | Tonsils |
| **to** | Tooth |
| **tr** | Tracheal |
| **ta** | Tracheal aspirate |
| **ul** | Ulcer |
| **ud** | Ulcer, decubitis |
| **ux** | Ulcer, external |
| **ui** | Ulcer, internal |
| **um** | Umbilical cord |
| **us** | Umbilicus |
| **un** | Unknown |
| **ue** | Urethra |
| **ur** | Urine |
| **ub** | Urine, bladder |
| **uc** | Urine, catheter |
| **cv** | Urine, clean-voided |
| **fv** | Urine, first-voided |
| **uk** | Urine, kidney |
| **uo** | Urine, nephrostomy |
| **uz** | Urine, non-catheterized |
| **ua** | Urine, suprapubic aspirate |
| **uu** | Urine, unknown source |
| **ut** | Uterus |
| **va** | Vagina |
| **wa** | Water |
| **wo** | Worm |
| **wd** | Wound |
| **wt** | Wound, sternal |
| **sw** | Wound, surgical |

### Pathogen Mappings (Wsk4NARIElI)

| **code** | **name** |
| --- | --- |
| **ade** | Achromobacter xylosoxidans ss. denitrificans |
| **aba** | Acinetobacter baumannii |
| **alw** | Acinetobacter lwoffii |
| **ac-** | Acinetobacter sp. |
| **asa** | Aeromonas salmonicida |
| **bcs** | Bacillus sp. |
| **pce** | Burkholderia cepacia |
| **caj** | Campylobacter jejuni |
| **cal** | Candida albicans |
| **crs** | Candida auris |
| **cdu** | Candida dubliniensis |
| **tca** | Candida famata |
| **cgl** | Candida glabrata |
| **ckr** | Candida krusei |
| **cpa** | Candida parapsilosis |
| **cal** | Candida paratropicalis |
| **can** | Candida sp. |
| **ctr** | Candida tropicalis |
| **cxa** | Candida, not albicans |
| **cdi** | Citrobacter diversus |
| **cfr** | Citrobacter freundii |
| **ci-** | Citrobacter sp. |
| **cba** | Corynebacterium sp. |
| **cne** | Cryptococcus neoformans |
| **cry** | Cryptococcus sp. |
| **eag** | Enterobacter agglomerans |
| **ecl** | Enterobacter cloacae |
| **en-** | Enterobacter sp. |
| **efa** | Enterococcus faecalis |
| **efm** | Enterococcus faecium |
| **ega** | Enterococcus gallinarum |
| **ent** | Enterococcus sp. |
| **eco** | Escherichia coli |
| **157** | Escherichia coli O157:H7 |
| **esc** | Escherichia sp. |
| **saj** | Granulicatella adiacens |
| **hin** | Haemophilus influenzae |
| **hxb** | Haemophilus influenzae (not type b) |
| **hib** | Haemophilus influenzae (type b) |
| **hal** | Hafnia alvei |
| **hpy** | Helicobacter pylori |
| **eae** | Klebsiella aerogenes |
| **eae** | Klebsiella mobilis |
| **kox** | Klebsiella oxytoca |
| **kpn** | Klebsiella pneumoniae |
| **kpn-** | Klebsiella pneumoniae ss. pneumoniae |
| **kkr** | Kocuria kristinae |
| **kro** | Kocuria rosea |
| **lmo** | Listeria monocytogenes |
| **mlu** | Micrococcus luteus |
| **mly** | Micrococcus lylae |
| **mic** | Micrococcus sp. |
| **mix** | Mixed bacterial species present |
| **bca** | Moraxella (Branh.) catarrhalis |
| **mmo** | Morganella morganii ss. morganii |
| **ngo** | Neisseria gonorrhoeae |
| **nme** | Neisseria meningitidis |
| **nma** | Neisseria meningitidis, serogroup a |
| **nmc** | Neisseria meningitidis, serogroup c |
| **135** | Neisseria meningitidis, serogroup W135 |
| **nmy** | Neisseria meningitidis, serogroup Y |
| **ne-** | Neisseria sp. |
| **xep** | No enteric pathogens found |
| **xxx** | No growth |
| **xpa** | No pathogens found |
| **xsa** | No Salmonella found |
| **xsg** | No significant growth found |
| **nor** | Normal flora |
| **eag** | Pantoea agglomerans |
| **pmi** | Proteus mirabilis |
| **pr-** | Proteus sp. |
| **pae** | Pseudomonas aeruginosa |
| **pma** | Pseudomonas maltophilia |
| **ppu** | Pseudomonas putida |
| **ps-** | Pseudomonas sp. |
| **sen** | Salmonella Enteritidis |
| **saa** | Salmonella Paratyphi A |
| **sab** | Salmonella Paratyphi B |
| **sac** | Salmonella Paratyphi C |
| **sal** | Salmonella sp. |
| **sat** | Salmonella Typhi |
| **sam** | Salmonella Typhimurium |
| **snt** | Salmonella, non-Typhi |
| **sma** | Serratia marcescens |
| **shc** | Shigella boydii |
| **sha** | Shigella dysenteriae |
| **d01** | Shigella dysenteriae serotype 1 |
| **shb** | Shigella flexneri |
| **shd** | Shigella sonnei |
| **shi** | Shigella Sp. |
| **sep** | Staphylococcus albus |
| **sau** | Staphylococcus aureus |
| **sau1** | Staphylococcus aureus ss. aureus |
| **sep** | Staphylococcus epidermidis |
| **shl** | Staphylococcus haemolyticus |
| **sho** | Staphylococcus hominis |
| **slu** | Staphylococcus lugdunensis |
| **sap** | Staphylococcus saprophyticus |
| **sap1** | Staphylococcus saprophyticus ss. saprophyticus |
| **sta** | Staphylococcus sp. |
| **swa** | Staphylococcus warneri |
| **scn** | Staphylococcus, coagulase negative |
| **sc+** | Staphylococcus, coagulase positive |
| **pma** | Stenotrophomonas maltophilia |
| **sgc** | Streptococcus agalactiae |
| **smt** | Streptococcus mitis |
| **spn** | Streptococcus pneumoniae |
| **spy** | Streptococcus pyogenes |
| **sso** | Streptococcus sobrinus |
| **str** | Streptococcus sp. |
| **svi** | Streptococcus viridans, alpha-hem. |
| **bsa** | Streptococcus, beta-haem. Group A |
| **bsb** | Streptococcus, beta-haem. Group B |
| **bsc** | Streptococcus, beta-haem. Group C |
| **bse** | Streptococcus, beta-haem. Group E |
| **bsf** | Streptococcus, beta-haem. Group F |
| **bsg** | Streptococcus, beta-haem. Group G |
| **cgl** | Torulopsis glabrata |
| **vic** | Vibrio cholerae |

### Antimicrobial Mappings (gaCDwmKm768)

| **code** | **name** |
| --- | --- |
| **J01GB06** | Amikacin |
| **J01CA04** | Amoxicillin |
| **J01CR02** | Amoxicillin/clavulanic Acid |
| **AmphotericinB** | Amphotericin B |
| **J01CA01X** | Ampicillin |
| **J01CR01** | Ampicillin/sulbactam |
| **J01GB12** | Arbekacin |
| **J01FA10** | Azithromycin |
| **J01CA09** | Azlocillin |
| **J01DF01** | Aztreonam |
| **J01CA06** | Bacampicillin |
| **J01CE08** | Benzathine benzylpenicillin |
| **J01CE01** | Benzylpenicillin |
| **J01DH05** | Biapenem |
| **J01CA03** | Carbenicillin |
| **J01DB10** | Cefacetrile |
| **J01DC04** | Cefaclor |
| **J01DB05** | Cefadroxil |
| **J01DB01** | Cefalexin |
| **J01DB03** | Cefalotin |
| **J01DC03** | Cefamandole |
| **J01DB08** | Cefapirin |
| **J01DB07** | Cefatrizine |
| **J01DB06** | Cefazedone |
| **J01DB04** | Cefazolin |
| **J01DC13** | Cefbuperazone |
| **J01DD17** | Cefcapene pivoxil |
| **J01DD15** | Cefdinir |
| **J01DD16** | Cefditoren pivoxil |
| **J01DE01** | Cefepime |
| **J01DD10** | Cefetamet pivoxil |
| **J01DD08** | Cefixime |
| **J01DD05** | Cefmenoxime |
| **J01DC09** | Cefmetazole |
| **J01DC12** | Cefminox |
| **J01DD09** | Cefodizime |
| **J01DC06** | Cefonicid |
| **J01DD12** | Cefoperazone |
| **J01DC11** | Ceforanide |
| **J01DD01** | Cefotaxime |
| **J01DC05** | Cefotetan |
| **J01DC07** | Cefotiam |
| **J01DC07** | Cefotiam hexetil |
| **J01DC01** | Cefoxitin |
| **J01DE03** | Cefozopran |
| **J01DD11** | Cefpiramide |
| **J01DE02** | Cefpirome |
| **J01DD13** | Cefpodoxime proxetil |
| **J01DC10** | Cefprozil |
| **J01DB09** | Cefradine |
| **J01DB11** | Cefroxadine |
| **J01DI02** | Ceftaroline fosamil |
| **J01DD02** | Ceftazidime |
| **J01DD52** | Ceftazidime-avibactam |
| **J01DD18** | Cefteram pivoxil |
| **J01DB12** | Ceftezole |
| **J01DD14** | Ceftibuten |
| **J01DD07** | Ceftizoxime |
| **J01DI01** | Ceftobiprole medocaril |
| **J01DI54** | Ceftolozane-tazobactam |
| **J01DD04** | Ceftriaxone |
| **J01DC02** | Cefuroxime |
| **CefuroximeAxetilOral** | Cefuroxime axetil oral |
| **CefuroximeParenteral** | Cefuroxime parenteral |
| **J01BA01** | Chloramphenicol |
| **J01AA03** | Chlortetracycline |
| **J01MA02** | Ciprofloxacin |
| **J01FA09** | Clarithromycin |
| **J01FF01** | Clindamycin |
| **J01XX03** | Clofoctol |
| **J01CE07** | Clometocillin |
| **J01CF02** | Cloxacillin |
| **J01XB01** | Colistin |
| **J01XA04** | Dalbavancin |
| **J01FG02** | Dalfopristin-quinupristin |
| **J01XX09** | Daptomycin |
| **J01MA23** | Delafloxacin |
| **J01GB09** | Dibekacin |
| **J01CF01** | Dicloxacillin |
| **J01FA13** | Dirithromycin |
| **J01DH04** | Doripenem |
| **J01AA02** | Doxycycline |
| **J01MA04** | Enoxacin |
| **J01AA13** | Eravacycline |
| **J01DH03** | Ertapenem |
| **J01FA01** | Erythromycin |
| **J01DI03** | Faropenem |
| **J01MA08** | Fleroxacin |
| **J01DC14** | Flomoxef |
| **J01CF05** | Flucloxacillin |
| **Fluconazole** | Fluconazole |
| **J01MB07** | Flumequine |
| **J01XX01** | Fosfomycin (IV) |
| **J01XX01** | Fosfomycin (oral) |
| **J01XC01** | Fusidic Acid |
| **J01MA19** | Garenoxacin |
| **J01MA16** | Gatifloxacin |
| **J01MA15** | Gemifloxacin |
| **J01GB03** | Gentamicin |
| **J01DH51** | Imipenem/cilastatin |
| **J01GB11** | Isepamicin |
| **Itraconazole** | Itraconazole |
| **J01FA07** | Josamycin |
| **J01GB04** | Kanamycin |
| **J01DD06** | Latamoxef |
| **J01MA12** | Levofloxacin |
| **J01FF02** | Lincomycin |
| **J01XX08** | Linezolid |
| **J01MA07** | Lomefloxacin |
| **J01AA04** | Lymecycline |
| **J01CA11** | Mecillinam |
| **J01DH02** | Meropenem |
| **J01DH52** | Meropenem-vaborbactam |
| **J01AA05** | Metacycline |
| **J01XD01** | Metronidazole (IV) |
| **P01AB01** | Metronidazole (oral) |
| **J01CA10** | Mezlocillin |
| **J01FA03** | Midecamycin |
| **J01AA08** | Minocycline (IV) |
| **J01AA08** | Minocycline (oral) |
| **J01MA14** | Moxifloxacin |
| **J01CF06** | Nafcillin |
| **Nalidixic Acid** | Nalidixic Acid |
| **J01GB05** | Neomycin |
| **J01GB07** | Netilmicin |
| **J01XE01** | Nitrofurantoin |
| **J01MA06** | Norfloxacin |
| **J01MA01** | Ofloxacin |
| **J01FA05** | Oleandomycin |
| **J01XA05** | Oritavancin |
| **J01CF04** | Oxacillin |
| **J01AA06** | Oxytetracycline |
| **J01MA18** | Pazufloxacin |
| **J01MA03** | Pefloxacin |
| **J01CE06** | Penamecillin |
| **PenicillinG** | Penicillin G |
| **J01CE05** | Pheneticillin |
| **J01CE02** | Phenoxymethylpenicillin |
| **J01CA12** | Piperacillin |
| **J01CR05** | Piperacillin/tazobactam |
| **J01CA02** | Pivampicillin |
| **J01CA08** | Pivmecillinam |
| **J01XB02** | Polymyxin B |
| **J01FG01** | Pristinamycin |
| **J01CE09** | Procaine benzylpenicillin |
| **J01MA17** | Prulifloxacin |
| **J01GB10** | Ribostamycin |
| **J04AB04** | Rifabutin |
| **J04AB02** | Rifampicin |
| **J04AB03** | Rifamycin |
| **A07AA11** | Rifaximin |
| **J01FA06** | Roxithromycin |
| **J01MA10** | Rufloxacin |
| **J01GB08** | Sisomicin |
| **J01MA21** | Sitafloxacin |
| **J01MA09** | Sparfloxacin |
| **J01XX04** | Spectinomycin |
| **J01FA02** | Spiramycin |
| **J01RA04** | Spiramycin/metronidazole |
| **J01GA01** | Streptomycin |
| **J01CA16** | Sulbenicillin |
| **J01EE02** | Sulfadiazine/trimethoprim |
| **J01EB02** | Sulfamethizole/trimethoprim |
| **J01EE01** | Sulfamethoxazole/trimethoprim |
| **J01EE03** | Sulfametrole/trimethoprim |
| **J01EE04** | Sulfamoxole/trimethoprim |
| **Sulfonamides** | Sulfonamides |
| **J01CR04** | Sultamicillin |
| **J01DH06** | Tebipenem |
| **J01XX11** | Tedizolid |
| **J01XA02** | Teicoplanin |
| **J01XA03** | Telavancin |
| **J01FA15** | Telithromycin |
| **J01CA17** | Temocillin |
| **J01AA07** | Tetracycline |
| **J01BA02** | Thiamphenicol |
| **J01CA13** | Ticarcillin |
| **J01AA12** | Tigecycline |
| **J01GB01** | Tobramycin |
| **J01MA22** | Tosufloxacin |
| **J01EA01** | Trimethoprim |
| **J01XA01** | Vancomycin (IV) |
| **A07AA09** | Vancomycin (oral) |

## Showcase Organizational Unit mappings

Organizational Unit mappings depend on the target DHIS2 implementation. For the showcase, the hierarchy is based on the structure used by the DHIS2 community for demonstration purposes (Sierra Leone). One sub-national level is represented, along with several example human and animal laboratories.

| **Id** | **Nanme** | **Level** |
| --- | --- | --- |
| **yHpoZaC3HVr** | Sierra Leone | National |
| **O6uvpzGd5pu** | Bo | Sub-national |
| **RkBmUlPuzVd** | H: Laboratory 01 | Human Lab in Bo |
| **fdc6uOvgoji** | Bombali | Sub-national |
| **lc3eMKXaEfw** | Bonthe | Sub-national |
| **jUb8gELQApl** | Kailahun | Sub-national |
| **PMa2VCrupOd** | Kambia | Sub-national |
| **kJq2mPyFEHo** | Kenema | Sub-national |
| **qhqAxPSTUXp** | Koinadugu | Sub-national |
| **Vth0fbpFcsO** | Kono | Sub-national |
| **jmIPBj66vD6** | Moyamba | Sub-national |
| **TEQlaapDQoK** | Port Loko | Sub-national |
| **bL4ooGhyHRQ** | Pujehun | Sub-national |
| **eIQbndfxQMb** | Tonkolili | Sub-national |
| **at6UHUQatSo** | Western Area | Sub-national |

##


## Example JSON Human Package
```json
{
  "trackedEntityType": "tuhi0maUrlh",
  "orgUnit": "O6uvpzGd5pu",
  "attributes": [
    {
        "attribute": "eaqQd1d6yAV",
        "value": "AMR-1.1-SPECIMEN-Test02"
    },
    {
        "attribute": "QznE0JyWMCT",
        "value": "AMR-1.1-PATIENT-Test02"
    },
    {
        "attribute": "opkhFoeEz9m",
        "value": "eco"
    },
    {
        "attribute": "NoTuZ3jydbw",
        "value": "sf"
    },
    {
        "attribute": "LQZywhYcISY",
        "value": "RkBmUlPuzVd"
    },
    {
        "attribute": "DYsNDR4nCWB",
        "value": "m"
    },
    {
        "attribute": "TRm4iaYikdK",
        "value": "14"
    }
  ],
  "enrollments":[
    {
      "orgUnit": "O6uvpzGd5pu",
      "program": "wsHfxYEgte5",
      "enrollmentDate": "2020-03-20T00:00:00.0",
      "incidentDate": "2020-03-20T00:00:00.0",
      "events": [
        {
          "program": "wsHfxYEgte5",
          "programStage": "JkrGmcLg6Zm",
          "orgUnit": "O6uvpzGd5pu",
          "status": "COMPLETED",
          "storedBy": "admin",
          "eventDate": "2020-03-20T00:00:00.0",
          "dataValues": [
            {
              "dataElement": "gaCDwmKm768",
              "value": "J01CR05"
            },
            {
              "dataElement": "C25kY3E21zv",
              "value": "S"
            }
          ]
        },
        {
          "program": "wsHfxYEgte5",
          "programStage": "JkrGmcLg6Zm",
          "orgUnit": "O6uvpzGd5pu",
          "status": "COMPLETED",
          "storedBy": "admin",
          "eventDate": "2020-03-20T00:00:00.0",
          "dataValues": [
            {
              "dataElement": "gaCDwmKm768",
              "value": "J01DD01"
            },
            {
              "dataElement": "C25kY3E21zv",
              "value": "S"
            }
          ]
        },
        {
          "program": "wsHfxYEgte5",
          "programStage": "JkrGmcLg6Zm",
          "orgUnit": "O6uvpzGd5pu",
          "status": "COMPLETED",
          "storedBy": "admin",
          "eventDate": "2020-03-20T00:00:00.0",
          "dataValues": [
            {
              "dataElement": "gaCDwmKm768",
              "value": "J01GB03"
            },
            {
              "dataElement": "C25kY3E21zv",
              "value": "R"
            }
          ]
        }
      ]
    }
  ]
}
```

The screenshot below is the result of inserting the above JSON package.
<img src="https://github.com/eSHIFT-HISPGeneva/OneHealth-AMR/blob/master/docs/images/TrackerJSONInsertResult.png">
