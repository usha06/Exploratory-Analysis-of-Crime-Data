###################################### COURSE - DA 5020 SEC 02 [BOS-2-HY]#############################################################
###################################### FINAL PROJECT: CRIME DATA ANALYSIS ###################################################
###################################### USHA KHETAN & JONATHAN AJIT SOLOMON ####################################################
###### Required Packages

install.packages('httr')
install.packages('dplyr')
install.packages('stringr')
install.packages('jsonlite')
install.packages('lubridate')
install.packages('RSQLite')
install.packages('ggmap')
install.packages('plotrix')
require('httr')
require('dplyr')
require('stringr')
require('jsonlite')
require('lubridate')
require('RSQLite')
require('ggplot2')
require('ggmap')
library('plotrix')

 
# Setting the path of the current directory
getwd()
setwd('C:/Users/Jonathan Ajit/Downloads')

###### Phase 1: Scraping Of the DATA.

# Step 1: get the url of the LA county site.

url <- 'https://data.lacounty.gov/views/INLINE/rows.json?accessType=WEBSITE&method=getByIds&asHashes=true&start=0&length=50000&meta=true&%24order=%3Aid'

# Step 2: Prepare the query string for post request to the server 
#          Query string contains the metadata and templating requirement for dynamic loading the data

mystring <- '{
"id": "ivnt-3nrc",
"name": "HEAT MAP:  Violent crimes within the last 12 months",
"category": "Criminal",
"description": "Violent crimes include: CRIMINAL HOMICIDE, FORCIBLE, RAPE, ROBBERY, AGGRAVATED ASSAULT, BURGLARY, LARCENY THEFT, GRAND THEFT AUTO, ARSON",
"displayType": "map",
"moderationStatus": true,
"publicationAppendEnabled": false,
"columns": [{
"id": 246205674,
"name": "CRIME_DATE",
"fieldName": "crime_date",
"position": 1,
"width": 220,
"dataTypeName": "calendar_date",
"tableColumnId": 27639390,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205675,
"name": "CRIME_YEAR",
"fieldName": "crime_year",
"position": 2,
"width": 220,
"dataTypeName": "text",
"tableColumnId": 27639391,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205676,
"name": "CRIME_CATEGORY_NUMBER",
"fieldName": "crime_category_number",
"position": 3,
"width": 352,
"dataTypeName": "number",
"tableColumnId": 27639392,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205677,
"name": "CRIME_CATEGORY_DESCRIPTION",
"fieldName": "crime_category_description",
"position": 4,
"width": 412,
"dataTypeName": "text",
"tableColumnId": 27639393,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205678,
"name": "STATISTICAL_CODE",
"fieldName": "statistical_code",
"position": 5,
"width": 292,
"dataTypeName": "number",
"tableColumnId": 27639394,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205679,
"name": "STATISTICAL_CODE_DESCRIPTION",
"fieldName": "statistical_code_description",
"position": 6,
"width": 436,
"dataTypeName": "text",
"tableColumnId": 27639395,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205680,
"name": "VICTIM_COUNT",
"fieldName": "victim_count",
"position": 7,
"width": 244,
"dataTypeName": "number",
"tableColumnId": 27639396,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205681,
"name": "STREET",
"fieldName": "street",
"position": 8,
"width": 172,
"dataTypeName": "text",
"tableColumnId": 27639397,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205682,
"name": "CITY",
"fieldName": "city",
"position": 9,
"width": 148,
"dataTypeName": "text",
"tableColumnId": 27639398,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205683,
"name": "STATE",
"fieldName": "state",
"position": 10,
"width": 160,
"dataTypeName": "text",
"tableColumnId": 27639399,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205684,
"name": "ZIP",
"fieldName": "zip",
"position": 11,
"width": 136,
"dataTypeName": "text",
"tableColumnId": 27639400,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205685,
"name": "LATITUDE",
"fieldName": "latitude",
"position": 12,
"width": 196,
"dataTypeName": "number",
"tableColumnId": 27639401,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205686,
"name": "LONGITUDE",
"fieldName": "longitude",
"position": 13,
"width": 208,
"dataTypeName": "number",
"tableColumnId": 27639402,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205687,
"name": "GANG_RELATED",
"fieldName": "gang_related",
"position": 14,
"width": 244,
"dataTypeName": "text",
"tableColumnId": 27639403,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205688,
"name": "REPORTING_DISTRICT",
"fieldName": "reporting_district",
"position": 15,
"width": 316,
"dataTypeName": "text",
"tableColumnId": 27639404,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205689,
"name": "STATION_IDENTIFIER",
"fieldName": "station_identifier",
"position": 16,
"width": 316,
"dataTypeName": "text",
"tableColumnId": 27639405,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205690,
"name": "STATION_NAME",
"fieldName": "station_name",
"position": 17,
"width": 244,
"dataTypeName": "text",
"tableColumnId": 27639406,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205691,
"name": "CRIME_IDENTIFIER",
"fieldName": "crime_identifier",
"position": 18,
"width": 292,
"dataTypeName": "number",
"tableColumnId": 27639407,
"format": {},
"flags": null,
"metadata": {}
}, {
"id": 246205692,
"name": "LOCATION",
"fieldName": "geo_crime_location",
"position": 19,
"description": "GEO CODE location based on address. Utilized for map visuliazations",
"width": 316,
"dataTypeName": "location",
"tableColumnId": 27639408,
"format": {},
"flags": null,
"metadata": {}
}],
"displayFormat": {
"viewport": {
"ymin": 33.948191810436,
"xmin": -119.28797079813,
"ymax": 34.523462551476,
"xmax": -117.28694845961
},
"bkgdLayers": [{
"layerKey": "World Street Map (ESRI)",
"opacity": 1
}],
"disableGeolocator": false,
"exclusiveLayers": false,
"viewDefinitions": [{
"uid": "self",
"plot": {
"locationId": 27639408
},
"alias": "HEAT MAP:  Violent crimes within the last 12 months",
"plotStyle": "rastermap"
}]
},
"metadata": {
"custom_fields": {
"Dataset Update Frequency": {
"Update Frequency": "Daily"
},
"Department": {
"Department Name": "Sheriff"
}
},
"renderTypeConfig": {
"visible": {
"map": true,
"table": true
},
"active": {
"table": {
"id": "self"
}
}
},
"availableDisplayTypes": ["map", "table", "fatrow", "page"],
"jsonQuery": {
"where": {
"value": [1, 8],
"operator": "BETWEEN",
"columnFieldName": "crime_category_number",
"metadata": {
"freeform": true,
"unifiedVersion": 2,
"tableColumnId": {
"2661965": 27639392
},
"operator": "BETWEEN"
}
}
},
"rdfSubject": "0"
},
"query": {
"filterCondition": {
"type": "operator",
"value": "AND",
"children": [{
"type": "operator",
"value": "OR",
"children": [{
"type": "operator",
"value": "BETWEEN",
"children": [{
"columnId": 246205676,
"type": "column"
}, {
"type": "literal",
"value": "1"
}, {
"type": "literal",
"value": "8"
}],
"metadata": {
"freeform": true
}
}],
"metadata": {
"tableColumnId": {
"2661965": 27639392
},
"operator": "BETWEEN"
}
}],
"metadata": {
"unifiedVersion": 2
}
}
},
"tags": ["crime sheriff"],
"flags": [],
"originalViewId": "ivnt-3nrc"
}'
  

# STEP 3: POST request to the server.

res <- POST(
  url,
  body = mystring,
  encode = 'json'
)


# STEP 4: Handling the JSON response

result <- paste(rawToChar(res$content), collapse = "")
document <- fromJSON(result)

# STEP 5: Creating the data frame
crime_data_report <- data.frame(document$data)

# STEP 6: Data received from the request contains colnames in encoded form
#          Formatting the columns according to the actual data

colnames(crime_data_report) <- c("updated_meta" ,"CRIME_CATEGORY_NUMBER" , "created_at" ,  "CRIME_CATEGORY_DESCRIPTION" ,
                                 "CRIME_DATE" ,  "CRIME_YEAR"  , "STATISTICAL_CODE" , 
                                 "sid"       ,   "STATISTICAL_CODE_DESCRIPTION" ,  "STATION_NAME"  , "CRIME_IDENTIFIER"  ,
                                 "updated_at" ,  "LOCATION" ,"id" , "created_meta" ,"GANG_RELATED" ,
                                 "STATION_IDENTIFIER", "REPORTING_DISTRICT" ,"VICTIM_COUNT" , 
                                 "STATE" ,  "ZIP"  ,"STREET"  , "CITY"  ,"position", "LATITUDE"  , "LONGITUDE" )




############# Phase 2 : Cleaning of the data
 

# Fetching the data for State = CA and city = Los Angeles.

crime_data_report <- subset(crime_data_report,STATE == 'CA' & CITY == 'LOS ANGELES')

# Separating crime date and time

start <- ymd_hms(crime_data_report$CRIME_DATE)
crimeDate <- as.Date(start)
crimeTime <- format(start,"%H:%M:%S")
crime_data_report$CRIME_DATE <- crimeDate
crime_data_report$CRIME_Time <- crimeTime



######## PHASE 3: STORING THE DATA in MYSQL

# STEP 1: Create DB Connection to connect to the database

db<- dbConnect(SQLite(), dbname = 'CrimeData')

# STEP 2: Defing the structure of the data to be stored in database.

dbSendQuery(conn=db, "Create table CrimeCategory
            ( CategoryID Integer Primary key,
            CategoryName Text
           )")

dbSendQuery(conn = db, "create table CrimeStatistical
            (StatisticalID Integer Primary key,
            StatisticalDescription TEXT)")

dbSendQuery(conn = db,  "CREATE TABLE CrimeIncident (
            Crime_ID INTERGER PRIMARY KEY,
            CategoryID INTEGER,StatisticalID INTEGER,
            DATE DATE, Time DATETIME,
            VictimCount INTEGER,GangRelated varchar(2),
            Street TEXT,City TEXT, State TEXT, StationName TEXT,
            Foreign key(CategoryID) references CrimeCategory(CategoryID),
            Foreign key(StatisticalID) references CrimeStatistical(StatisticalID))")

# STEP 3: Subsetting the  data frame and inserting data into the tables.

categoryData <- unique(data.frame(crime_data_report$CRIME_CATEGORY_NUMBER,crime_data_report$CRIME_CATEGORY_DESCRIPTION))
colnames(categoryData) <- c("CategoryID","CategoryName")
dbWriteTable(conn = db, name = "CrimeCategory",value = categoryData,append = TRUE)

dbReadTable(db,"CrimeCategory")

statisticalData <- unique(data.frame(crime_data_report$STATISTICAL_CODE,crime_data_report$STATISTICAL_CODE_DESCRIPTION))
colnames(statisticalData) <- c("StatisticalID","StatisticalDescription")
dbWriteTable(conn = db, name = "CrimeStatistical",value = statisticalData,append = TRUE)

dbReadTable(db,"CrimeStatistical")

crimeIncidentData <- unique(data.frame(crime_data_report$sid,crime_data_report$CRIME_CATEGORY_NUMBER,crime_data_report$STATISTICAL_CODE,crime_data_report$CRIME_DATE,
                                       crime_data_report$CRIME_Time,crime_data_report$VICTIM_COUNT,crime_data_report$GANG_RELATED,crime_data_report$STREET,crime_data_report$CITY,crime_data_report$STATE,crime_data_report$STATION_NAME))
colnames(crimeIncidentData) <- c("Crime_ID","CategoryID","StatisticalID","DATE","Time","VictimCount","GangRelated","Street","City","State","StationName")
dbWriteTable(conn = db, name = "CrimeIncident",value = crimeIncidentData,append = TRUE)

dbReadTable(db,"CrimeIncident")



###################################  PHASE 4:Retrieving and Analyzing of the data ################

dbConnection <- src_sqlite("CrimeData", create = FALSE)
CrimeIncidentData <- tbl(dbConnection, "CrimeIncident")
CategoryDesc <- tbl(dbConnection, "CrimeCategory")


# Graph 1: Number of Crimes per category
graphData1 <- data.frame(table(crime_data_report$CRIME_CATEGORY_DESCRIPTION))
colnames(graphData1) <- c("CrimeCatgory","Count")

CountCrimeByCategory <- function(){
  CategoryDF <- CrimeIncidentData %>% inner_join(CategoryDesc)  %>%
                group_by(CategoryName)%>% summarise(count= n())
  CategoryDF <- CategoryDF %>% collect()
  return(CategoryDF)
}

CountCrimeByCategory()

p1 <-ggplot(crime_data_report,
       aes(CRIME_CATEGORY_DESCRIPTION )) +
  geom_bar(aes(fill=CRIME_CATEGORY_DESCRIPTION))+scale_fill_manual(values =c("red","green","yellow","orange","blue","purple","violet","black") )+
  ggtitle("Number of crimes per Category")

p1

# Graph 2: CRIMES per MONTH/CATEGORY


month <- month.abb[month(crime_data_report$CRIME_DATE)]
crime_data_report <-cbind(crime_data_report,month)

graphData2 <- data.frame(table(crime_data_report$month,crime_data_report$CRIME_CATEGORY_DESCRIPTION))
colnames(graphData2) <- c("month","crime","count")
graphData2 <- graphData2[order(match(graphData2$month, month.abb)), ]

graphDataMatrix <- graphData2$count
graphDataMatrix <- matrix(graphDataMatrix,ncol = 12,byrow = T)

rownames(graphDataMatrix) <- levels(graphData2$crime)

colnames(graphDataMatrix) <- levels(order(match(graphData2$month,month.abb)))

colnames(graphDataMatrix) <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

par(mar=c(5.1, 2, 8.89, 6.1), xpd=TRUE)
prop <- prop.table(graphDataMatrix,margin=2)
barplot(graphDataMatrix, col=heat.colors(length(rownames(graphDataMatrix))),ylim = c(0,900), main = "Crimes per Month/Category")
legend("topright",inset=c(-.4,-.1), fill=heat.colors(length(rownames(graphDataMatrix))), legend=rownames(graphDataMatrix))


# Graph 3: CRIMES per INTERVAL OF THE DAY

t2 <- strptime(crime_data_report$CRIME_Time,'%H:%M:%S')
temp <- format(t2,'%H')
p3 <- data.frame(as.numeric(temp))
colnames(p3) <- "hourPart"
for(i in 1: length(p3$h)){
  if(p3$hourPart[i]>8 & p3$hourPart[i]<=12){
    p3$time[i] <- "morning"
    
  }else if (p3$hourPart[i]>12 & p3$hourPart[i]<=16){
    p3$time[i] <- "afternoon"
    
  }else if(p3$hourPart[i]>16 & p3$hourPart[i]<=20){
    p3$time[i] <- "evening"
  }else if(p3$hourPart[i]>20 & p3$hourPart[i]<=24) {
    p3$time[i] <- "night"
  }else{
    p3$time[i] <- "late night"
  }
}

crime_data_report <- cbind(crime_data_report,TimeOfDay = p3$time)
graphData3 <- data.frame(table(crime_data_report$TimeOfDay))
colnames(graphData3)<- c("DayTime","Count")

p4 <-ggplot(crime_data_report,
            aes(TimeOfDay )) +
  geom_bar(aes(fill=TimeOfDay))+scale_fill_brewer(palette = "Blues")+theme_bw()+ggtitle('Crimes per Interval of a Day')

p4

# Graph 4: PERCENTAGE of CRIMES PER DAY


crime_data_report$DayOfWeek <- weekdays(as.Date(crime_data_report$CRIME_DATE))

crime_data_report$DayOfWeek <- factor(crime_data_report$DayOfWeek, levels= c("Sunday", "Monday", 
                                         "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

crime_data_report <- crime_data_report[order(crime_data_report$DayOfWeek), ]

graphData4 <- data.frame(table(crime_data_report$DayOfWeek))
colnames(graphData4) <- c("DayOfWeek","Count")


slices <- graphData4$Count
lbls <- graphData4$DayOfWeek
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 

pie3D(slices,labels = lbls, col=rainbow(length(lbls)),radius = 1.5,edges = 200, labelcex = 1,
    main="Percentage of Crimes per Day")


########################################################################################################################
########################################################################################################################




