## read data
datafull <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE) 


##commands to check and understand the dataset
##str(datafull)
##class(datafull)
##names(datafull)
##dim(datafull)
##class(datafull$Date[1])

## extract dates 1/2/2007 and 2/2/2007 and combine them into one dataset
datadate1 <- datafull[datafull$Date == "1/2/2007",]
datadate2 <- datafull[datafull$Date == "2/2/2007",]
datadate <- rbind(datadate1,datadate2)

## clear unused items from memory
remove(datafull,datadate1,datadate2)

## combine date and time columns
datetimecombine <- paste(datadate$Date,datadate$Time)

## convert to date format and store as data frame
dfdate <- data.frame(strptime(datetimecombine,format="%d/%m/%Y %H:%M:%S",tz=""))

##change column name of data frame
colnames(dfdate) <- "Date_time"

## add datetime column to existing dataset
newdatadate <- cbind(dfdate,datadate)

## clear unused items from memory
remove(datetimecombine,dfdate)

## plot line graph and export as png to file
png("plot4.png",width=480,height=480)

## create 2x2 plots
par(mfrow=c(2,2))

## plot 1
plot(newdatadate$Date_time,as.numeric(newdatadate$Global_active_power),type="l",ylab="Global Active Power",xlab="")

## plot 2
plot(newdatadate$Date_time,as.numeric(newdatadate$Voltage),type="l",ylab=names(newdatadate)[6],xlab="datetime")

## plot 3
plot(newdatadate$Date_time,as.numeric(newdatadate$Sub_metering_1),type="l",col="black",ylab="Energy sub metering",xlab="")

## add second line to same plot
lines(newdatadate$Date_time,as.numeric(newdatadate$Sub_metering_2),type="l",col="red")

## add third line to same plot
lines(newdatadate$Date_time,as.numeric(newdatadate$Sub_metering_3),type="l",col="blue")

## create legend. use column name to set legend labels
legend("topright", lty=1, col = c("black","blue", "red"), legend = c(names(newdatadate[8]),names(newdatadate[9]),names(newdatadate[10])), bty="n")

## plot 4
plot(newdatadate$Date_time,as.numeric(newdatadate$Global_reactive_power),type="l",ylab=names(newdatadate)[5],xlab="datetime")


dev.off()

