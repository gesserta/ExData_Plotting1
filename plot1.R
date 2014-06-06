plot1 <- function() {
  ## Read data; set your working directory where file sits
epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
epc$Date<-as.Date(as.character(epc$Date),"%d/%m/%Y")
epc<-subset(epc, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')

epc$Global_active_power<-as.numeric(epc$Global_active_power)
hist(epc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
}
