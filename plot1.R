## read data
datafull <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE) 

##commands to check and understand the dataset
#str(datafull)
#class(datafull)
#names(datafull)
#dim(datafull)
#class(datafull$Date[1])

## extract dates 1/2/2007 and 2/2/2007 and combine them into one dataset
datadate1 <- datafull[datafull$Date == "1/2/2007",]
datadate2 <- datafull[datafull$Date == "2/2/2007",]
datadate <- rbind(datadate1,datadate2)

## clear memory
remove(datafull,datadate1,datadate2)

## plot histogram and export as png to file
png("plot1.png",width=480,height=480)
hist(as.numeric(datadate$Global_active_power),main = "Global Active Power", col="red",xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()