setwd("C:/Users/BPM/Downloads/DataScience/Assignment/M04-A1")

datafull <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE) 

if (!require("lubridate")) install.packages("lubridate")
library(lubridate)

##str(datafull)
##class(datafull)
##names(datafull)
##dim(datafull)
##class(datafull$Date[1])

dmy(datafull$Date[1])
datadate1 <- datafull[datafull$Date == "1/2/2007",]
datadate2 <- datafull[datafull$Date == "2/2/2007",]
datadate <- rbind(datadate1,datadate2)

remove(datafull,datadate1,datadate2)


png("plot2.png",width=480,height=480)
plot(as.numeric(datadate$Global_active_power),type="l",ylab="Global Active Power (kilowatts",xaxt="n",xlab="")

axis(1, at = c(1,length(datadate$Date)/2,length(datadate$Date)), labels = c("Thu", "Fri", "Sat"), las = 0)

dev.off()
