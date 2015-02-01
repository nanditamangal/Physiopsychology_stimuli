setwd('~/Desktop/SLEEP/SleepExercise/')
dat <-  read.csv('test3.csv')
dat <-  dat[2,]
nrow(dat)
ncol(dat)

selections <- read.csv('test4.csv')


col2<-colnames(dat)
col3<-grep("^S[0-9]+_AAT[0-9]+$",selections$which)
selections_excludeAATs <- selections[col3,]
col4<-subset(selections_excludeAATs, select=("which"))
col2<-col2[!is.element(col2,col4$which)]
print (col2)
col5<-col2[grep("^S[0-9]+_AAT[0-9]+$",col2)]
print(col5)
datAAT <- subset(dat, select=(col5))


col2<-colnames(dat)
col3<-grep("^S[0-9]+_PARA$",selections$which)
selections_PARAs <- selections[col3,]


nrow(daAAT)
ncol(datAAT)
nrow(datneu)
ncol(datneu)

ncol(selections_PARAs)
colAATs <- col5
i<- NULL
write("<item run_story_negative_options>", file ="output.txt",append=TRUE)
counter <- 1
for (i in 1:nrow(selections_PARAs)) {
  usage1 <- selections_PARAs[i,1]
  usage4<- sub("anger","", usage1)
  usage2 <- (selections_PARAs[i,2])
  usage3 <- sub("_PARA","", usage2)
  print(usage3)
  grepfind <- paste(usage3,sep="","_AAT[0-9]+$")
  print(grepfind)
  #find all X value for S[0-9]_ATTX
  colAATs<-col5[grep(grepfind,col5)]
  datAATs <- subset(datAAT, select=(colAATs))
  
  
  
 
  for(j in 1:ncol(datAATs))
  {
    write(paste("/",counter,"= \"", datAATs[1,j],"\"",sep=""),file="output.txt", append=TRUE)
    counter <- counter + 1    
  }
  
}
write("</item>", file ="output.txt",append=TRUE)

for (i in 1:ncol(datAAT)) {
  print(colnames(datAAT)[i])
  dat2<- (datAAT[1,i])
  dat2<- levels(dat2)
  option <- NULL
  for (j in 1:4)
  {
      statement<- (dat2[j])
      if(nchar(statement)>3)
      {
         option <- statement
      }
  }
  print(option)
  write(colnames(datAAT)[i], file = "output.txt", append=TRUE)
  write(option, file = "output.txt", append=TRUE)  
}

i <- NULL
columns_neu <- grep("^neu_select_[0-9]+",colnames(dat))



datneu <- dat[,columns_neu]
for (i in 1:ncol(datneu)) {
  print(colnames(datneu)[i])
  dat2<- (datneu[1,i])
  dat2<- levels(dat2)
  option <- NULL
  for (j in 1:4)
  {
    statement<- (dat2[j])
    if(nchar(statement)>3)
    {
      option <- statement
    }
  }
  print(option)
  write(colnames(datneu)[i], file = "output.txt", append=TRUE)
  write(option, file = "output.txt", append=TRUE)  
}


colnames(datAAT)[1]
dat[1,1]
dat2<- (dat[1,1])
attributes(dat2)
levels(dat2)[3]

columns_AAT <- grep("^S[0-9]+_AAT[0-9]+$",col2)
print(columns_AAT)


datAAT <- dat[,columns_AAT]
