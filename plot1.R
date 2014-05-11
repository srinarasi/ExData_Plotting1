plot1<-function(){
    fullData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClass="character")
    reqData<-fullData[fullData$Date=="1/2/2007"| fullData$Date=="2/2/2007",]
    
    png(filename = "plot1.png",width = 480, height = 480, units = "px",bg = "white")
    hist(as.numeric(reqData$Global_active_power),xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
    dev.off()
}
