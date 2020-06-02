#set working directory
setwd("C:/Users/Chua Shi Xian/Desktop/Bachelor of Computer Science (Information Systems)/2019-20/Semester 2 2019-20/Intro to Data Science/Tutorials/Assignment 8 (Latest)")

#load library data.table
library(data.table)

DT<-fread("./household_power_consumption 2.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#output histogram to PNG
plot(DT.filter$Global_active_power~DT.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
