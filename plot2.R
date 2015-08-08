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

## clear memory
remove(datafull,datadate1,datadate2)


## plot line graph and export as png to file
png("plot2.png",width=480,height=480)
plot(as.numeric(datadate$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")

##set x axis as day
axis(1, at = c(1,length(datadate$Date)/2,length(datadate$Date)), labels = c("Thu", "Fri", "Sat"), las = 0)

dev.off()
