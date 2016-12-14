###################################
## Zack W. Almquist, University of Minnesota
## Script for reading in ESRI Shape files for 
##  SOC 3090 Sociology of Neighborhoods
##
## For informational purposes, not required for course
##
## Data originally obtained from: https://docs.google.com/spreadsheets/d/1SFe54XsiHWlKfg4FO8ubPlAHFZjeswAukTyA5i1p8IQ/edit#gid=0
##                                http://www.mngeo.state.mn.us/chouse/metadata/sdatt1314.html
###################################
library(rgdal)
library(sp)
## Set working directory setwd("YOUR DIRECTORY)
## Download
### crime_2010_2013_centroid.zip
### MplsNeighborhoods.zip
### MplsParks.zip
### MplsPolicePrecincts.zip

### Bit ti change dsn to your local directory
crime_10_13<-rgdal::readOGR(dsn="/Users/almquist/Documents/Classes/Soc3090/MNNeighborhoods/crime_2010_2013_centroid",layer="crime_2010_2013_centroid")
mpls_neighborhoods<-rgdal::readOGR(dsn="/Users/almquist/Documents/Classes/Soc3090/MNNeighborhoods/MplsNeighborhoods",layer="NEIGHBORHOODS")
mpls_parks<-rgdal::readOGR(dsn="/Users/almquist/Documents/Classes/Soc3090/MNNeighborhoods/MplsParks",layer="PARK")
mpls_PolicePrecincts<-rgdal::readOGR(dsn="/Users/almquist/Documents/Classes/Soc3090/MNNeighborhoods/MplsPolicePrecincts",layer="BOUNDARY_POLICE_PRECINCTS")
school_attendance_dist<-rgdal::readOGR(dsn="/Users/almquist/Documents/Classes/Soc3090/MNNeighborhoods/sdatt1314",layer="sd_attendance_1314")

ls()

crime_10_13<-spTransform(crime_10_13, CRS("+proj=longlat +datum=WGS84"))
mpls_neighborhoods<-spTransform(mpls_neighborhoods, CRS("+proj=longlat +datum=WGS84"))
mpls_parks<-spTransform(mpls_parks, CRS("+proj=longlat +datum=WGS84"))
mpls_PolicePrecincts<-spTransform(mpls_PolicePrecincts, CRS("+proj=longlat +datum=WGS84"))
school_attendance_dist<-spTransform(school_attendance_dist, CRS("+proj=longlat +datum=WGS84"))


save(crime_10_13,file="data/crime_10_13.rda")
save(mpls_neighborhoods,file="data/mpls_neighborhoods.rda")
save(mpls_parks,file="data/mpls_parks.rda")
save(mpls_PolicePrecincts,file="data/mpls_PolicePrecincts.rda")
save(school_attendance_dist,file="data/school_attendance_dists.rda")


##################
## Generate US Census 2010 Block files for MPLS
##################
library(UScensus2010)
library(UScensus2010blk)
library(UScensus2010cdp)
mpls_blk<-poly.clipper("minneapolis","MN",level="blk")
save(mpls_blk,file="data/mpls_blk.rda")






