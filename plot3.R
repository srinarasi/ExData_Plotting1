plot3<-function(){
    fullData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClass="character")
    reqData<-fullData[fullData$Date=="1/2/2007"| fullData$Date=="2/2/2007",]
    
    timeVector<-strptime(paste(reqData$Date, reqData$Time),"%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot3.png",width = 480, height = 480, units = "px",bg = "white")
    plot(timeVector,as.numeric(reqData$Sub_metering_1),xlab=NA,ylab="Energy sub metering",type="l")
	legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
	points(timeVector,as.numeric(reqData$Sub_metering_2),type="l", col = "red")
	points(timeVector,as.numeric(reqData$Sub_metering_3),type="l", col = "blue")
	dev.off()
}
