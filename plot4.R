plot4<-function(){
    fullData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClass="character")
    reqData<-fullData[fullData$Date=="1/2/2007"| fullData$Date=="2/2/2007",]
    
    timeVector<-strptime(paste(reqData$Date, reqData$Time),"%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot4.png",width = 480, height = 480, units = "px",bg = "white")
    par(mfrow=c(2,2))
    
    plot(timeVector,as.numeric(reqData $Global_active_power),xlab=NA,ylab="Global Active Power",type="l")
    
    plot(timeVector,as.numeric(reqData$Voltage),xlab="datetime",ylab="Voltage",type="l")
            
    plot(timeVector,as.numeric(reqData$Sub_metering_1),xlab=NA,ylab="Energy sub metering",type="l")
    points(timeVector,as.numeric(reqData$Sub_metering_2),xlab=NA,ylab="Energy sub metering",type="l",col="red")
    points(timeVector,as.numeric(reqData$Sub_metering_3),xlab=NA,ylab="Energy sub metering",type="l",col="blue")
    legend("topright", lwd=1,col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
    
    plot(timeVector,as.numeric(reqData$Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l")

	dev.off()
}
