#set working directory
setwd("C:/Users/Chua Shi Xian/Desktop/Bachelor of Computer Science (Information Systems)/2019-20/Semester 2 2019-20/Intro to Data Science/Tutorials/Assignment 8 (Latest)")

#load library data.table
library(data.table)

DT<-fread("./household_power_consumption 2.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

# Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#plot the graph with legends
#mar stands for margin and oma stands for outer margin area
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(DT.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
