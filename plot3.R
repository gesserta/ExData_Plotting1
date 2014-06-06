plot3 <- function() {
  ## Read data; set your working directory where file sits
  epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
  epc$DateTime<-paste(epc$Date,epc$Time)
  epc$DateTime.c<-strptime(epc$DateTime, format="%d/%m/%Y %H:%M:%S")
  
  epc$Date<-as.Date(as.character(epc$Date),"%d/%m/%Y")
  epc<-subset(epc, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')
  epc$Global_active_power<-as.numeric(epc$Global_active_power)
  epc$Sub_metering_1<-as.numeric(epc$Sub_metering_1)
  epc$Sub_metering_2<-as.numeric(epc$Sub_metering_2)
  epc$Sub_metering_3<-as.numeric(epc$Sub_metering_3)
  
  plot(epc$DateTime.c,epc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(epc$DateTime.c,epc$Sub_metering_2,col="red")
  lines(epc$DateTime.c,epc$Sub_metering_3,col="blue")
  legend("topright", names(epc)[7:9], lty="solid",col=c("black","red","blue"))
  
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}