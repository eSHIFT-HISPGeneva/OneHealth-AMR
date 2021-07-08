library(RPostgreSQL)
library(rlang)
library(plyr)
library(dplyr)
library(DBI)
library(RCurl)

con <- dbConnect(PostgreSQL(), dbname = 'glass2', host = 'localhost', port = 5432, user = 'xxxxxx', password = 'xxxxxx')

ESCCOL <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:eco&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl;ur;st&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01CA01X;J01DD02;J01DD08;J01MA02;J01XB01;J01DD04;J01DH51;J01MA12;J01DH02;PenicillinG;J01EE04&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
ESCCOL <- read.table(text = ESCCOL, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(ESCCOL) >= 1){
ESCCOL$Pathogen = c('ESCCOL')}
names(ESCCOL)[1] <- "status"
ESCCOL


KLEPNE <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:kpn&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:ur;st;bl&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01DD02;J01DD08;J01MA02;J01XB01;J01DD04;J01DD01;J01DH51;J01MA12;J01DH02;J01EE03&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
KLEPNE <- read.table(text = KLEPNE, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(KLEPNE) >= 1){
  KLEPNE$Pathogen = c('KLEPNE')}
names(KLEPNE)[1] <- "status"
KLEPNE


ACISPP <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:ac-&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:ur;st;bl&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01DD02;J01DD08;J01MA02;J01XB01;J01DD04;J01DD01;J01DH51;J01MA12;J01DH02;J01EE03&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
ACISPP <- read.table(text = ACISPP, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(ACISPP) >= 1){
  ACISPP$Pathogen = c('ACISPP')}
names(ACISPP)[1] <- "status"
ACISPP


NEIGON <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:ac-&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01GB06;J01FA10;J01DD02;J01DD08;J01MA02;J01DD04;J01DD01;J01GB03;J01MA12&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
NEIGON <- read.table(text = NEIGON, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(NEIGON) >= 1){
  NEIGON$Pathogen = c('NEIGON')}
names(NEIGON)[1] <- "status"
NEIGON


SALSPP <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:sal&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01DD02;J01DD08;J01MA02;J01DD04;J01DH51;J01MA12;J01DH02&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
SALSPP <- read.table(text = SALSPP, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(SALSPP) >= 1){
  SALSPP$Pathogen = c('SALSPP')}
names(SALSPP)[1] <- "status"
SALSPP



STAAUR <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:sau&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl;ur;st&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01CF04&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
STAAUR <- read.table(text = STAAUR, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(STAAUR) >= 1){
  STAAUR$Pathogen = c('STAAUR')}
names(STAAUR)[1] <- "status"
STAAUR


STRPNE <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:LAST_YEAR&dimension=JkrGmcLg6Zm.C25kY3E21zv&dimension=JkrGmcLg6Zm.opkhFoeEz9m:IN:spn&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl&dimension=JkrGmcLg6Zm.DYsNDR4nCWB&dimension=JkrGmcLg6Zm.gaCDwmKm768:IN:J01CA01X;J01DD02;J01DD08;J01DD01;J01DD04;J01CF04;PenicillinG;J01EA01&dimension=JkrGmcLg6Zm.TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
STRPNE <- read.table(text = STRPNE, sep =",", header = TRUE, stringsAsFactors = FALSE)
# SXT
if(nrow(STRPNE) >= 1){
  STRPNE$Pathogen = c('STRPNE')}
names(STRPNE)[1] <- "status"
STRPNE


# # Combine all data into one frame.
glass <- rbind(ESCCOL, KLEPNE, ACISPP, NEIGON, SALSPP, STAAUR, STRPNE)
glass

# Renaming the header
names(glass)[2] <- "pathogen"
names(glass)[4] <- "sex"
names(glass)[6] <- "age"
names(glass)[3] <- "specimen"
names(glass)[7] <- "country"
names(glass)[8] <- "year"
names(glass)[9] <- "value"
names(glass)[5] <- "antibiotic"


# Replace NA with blank
glass <- glass %>% replace(., is.na(.), "")

# Replacing null status by replacing with X
glass <- glass %>% mutate(status = ifelse(status == '', 'X', status))

# Replacing null age with UNK
glass <- glass %>% mutate(age = ifelse(age == '', 'UNK', age))

# Changing gender with capital latter
glass <- glass %>% mutate(sex = ifelse(sex == 'f', 'F', sex))
glass <- glass %>% mutate(sex = ifelse(sex == 'm', 'M', sex))
glass <- glass %>% mutate(sex = ifelse(sex == '', 'UNK', sex))

# glass

# Renaming age from uid to code
glass <- glass %>% mutate(age = ifelse(age == 'y6vwuHXxddO', '<1', age))
glass <- glass %>% mutate(age = ifelse(age == 'jf5Zr4sleyX', '01<04', age))
glass <- glass %>% mutate(age = ifelse(age == 'VUF8eXjrbjC', '05<14', age))
glass <- glass %>% mutate(age = ifelse(age == 'LF7HNYtqIr5', '15<24', age))
glass <- glass %>% mutate(age = ifelse(age == 'T51pNS4GE9a', '25<34', age))
glass <- glass %>% mutate(age = ifelse(age == 'eQslOKgf0Wp', '35<44', age))
glass <- glass %>% mutate(age = ifelse(age == 'G2ur1JRd6uL', '45<54', age))
glass <- glass %>% mutate(age = ifelse(age == 'Dh89WgJK9vt', '55<64', age))
glass <- glass %>% mutate(age = ifelse(age == 'dGbMkILwzzN', '65<74', age))
glass <- glass %>% mutate(age = ifelse(age == 'Z6eawM1m33G', '75<84', age))
glass <- glass %>% mutate(age = ifelse(age == 'VKJhxU3XeVU', '85<', age))
glass <- glass %>% mutate(age = ifelse(age == '', 'UNK', age))

# glass

# # Renaming antibiotic
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DH51', 'IMP', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01MA02', 'CIP', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01CA01X', 'AMP', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DD04', 'CRO', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DD01', 'CTX', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01GB03', 'GEN', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01FA10', 'AZM', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DD02', 'CAZ', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DD08', 'CFM', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01XB01', 'COL', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DH51', 'IPM', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01MA12', 'LVX', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01DH02', 'MEM', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'J01AA08', 'MNO', antibiotic))
glass <- glass %>% mutate(antibiotic = ifelse(antibiotic == 'PenicillinG', 'PEN', antibiotic))

unique(glass$antibiotic)

# # Renaming specimen
glass <- glass %>% mutate(specimen = ifelse(specimen == 'bl', 'BLOOD', specimen))
glass <- glass %>% mutate(specimen = ifelse(specimen == 'ur', 'URINE', specimen))
glass <- glass %>% mutate(specimen = ifelse(specimen == 'st', 'STOOL', specimen))
glass <- glass %>% mutate(specimen = ifelse(specimen == 'gn', 'GENITAL', specimen))

glass$code = paste(glass$pathogen, glass$specimen, glass$sex, glass$age, glass$antibiotic, glass$year, sep="=")

glass

# year <- tail(glass$year, 1)
glass_unique <- glass$year
glass_unique <- unique(glass_unique)
glass_unique <- paste0(unlist(glass_unique), collapse = ',')

# //////////////---------------- Sample file starting -------------/////////////////////

Sample_file <- getURL(paste0("https://showcase.find.amr.health/dhis2amr01/api/29/analytics/events/aggregate/wsHfxYEgte5.csv?dimension=ou:yHpoZaC3HVr&dimension=pe:THIS_YEAR;LAST_YEAR&dimension=JkrGmcLg6Zm.NoTuZ3jydbw:IN:bl;st;ur&dimension=DYsNDR4nCWB&dimension=TRm4iaYikdK-oPyVHCMErH0&stage=JkrGmcLg6Zm&displayProperty=NAME&outputType=EVENT&outputIdScheme=NAME&paging=false"), userpwd="glass_report:Pa55word!", httpauth = 1L)
Sample_file <- read.table(text = Sample_file, sep =",", header = TRUE, stringsAsFactors = FALSE)

Sample_file


# Renaming the header
names(Sample_file)[2] <- "sex"
names(Sample_file)[3] <- "age"
names(Sample_file)[1] <- "specimen"
names(Sample_file)[4] <- "country"
names(Sample_file)[5] <- "year"
names(Sample_file)[6] <- "value"

# Replacing null age with UNK
Sample_file <- Sample_file %>% mutate(age = ifelse(age == '', 'UNK', age))

# Changing gender with capital latter
Sample_file <- Sample_file %>% mutate(sex = ifelse(sex == 'f', 'F', sex))
Sample_file <- Sample_file %>% mutate(sex = ifelse(sex == 'm', 'M', sex))
Sample_file <- Sample_file %>% mutate(sex = ifelse(sex == '', 'UNK', sex))

# Renaming age from uid to code
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'y6vwuHXxddO', '<1', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'jf5Zr4sleyX', '01<04', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'VUF8eXjrbjC', '05<14', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'LF7HNYtqIr5', '15<24', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'T51pNS4GE9a', '25<34', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'eQslOKgf0Wp', '35<44', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'G2ur1JRd6uL', '45<54', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'Dh89WgJK9vt', '55<64', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'dGbMkILwzzN', '65<74', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'Z6eawM1m33G', '75<84', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == 'VKJhxU3XeVU', '85<', age))
Sample_file <- Sample_file %>% mutate(age = ifelse(age == '', 'UNK', age))

# # Renaming specimen
Sample_file <- Sample_file %>% mutate(specimen = ifelse(specimen == 'bl', 'BLOOD', specimen))
Sample_file <- Sample_file %>% mutate(specimen = ifelse(specimen == 'ur', 'URINE', specimen))
Sample_file <- Sample_file %>% mutate(specimen = ifelse(specimen == 'st', 'STOOL', specimen))
Sample_file <- Sample_file %>% mutate(specimen = ifelse(specimen == 'gn', 'GENITAL', specimen))

Sample_file$code = paste(Sample_file$specimen, Sample_file$sex, Sample_file$age, Sample_file$year, sep="=")

Sample_file

# ========================PROCCESSING====================

# RIS starting execution ----------------------------------
delete_RIS_data <- function(glass_unique){
  
  query <- paste("delete from ris where year  in ", paste("(", glass_unique, ")"))
  # query <- paste("delete from irsxes where year  in 2015, 2016")
  dbSendQuery(con, query)
  
  print('========= RIS REPORT =========')
  msg <- paste("Successfully deleted RIS data for: ", glass_unique)
  print(msg)
}

# Save to database
insert_RIS_data <- function(){
  dbWriteTable(con, name = 'ris', value = as.data.frame(glass), row.names = FALSE, append = TRUE)
  msg <- paste("Successfully uploaded RIS data for: ", glass_unique)
  print(msg)
}

delete_RIS_data(glass_unique)
insert_RIS_data()
# ========================== END for RIS ================================

# Sample file starting execution ----------------------------------
delete_SF_data <- function(glass_unique){
  query <- paste("delete from sample_files where year in ", paste("(", glass_unique, ")"))
  dbSendQuery(con, query)
  
  print('========= SAMPLE FILE REPORT =========')
  msg <- paste("Successfully deleted Sample File data for: ", glass_unique)
  print(msg)
}


# Save to database
insert_SF_data <- function(){
  myquery <- dbWriteTable(con, name = 'sample_files', value = as.data.frame(Sample_file), row.names = FALSE, append = TRUE)
  msg <- paste("Successfully uploaded Sample File data for: ", glass_unique)
  print(msg)
}

delete_SF_data(glass_unique)
insert_SF_data()
# ========================== END for Sample file ================================
 

dbDisconnect(con)

