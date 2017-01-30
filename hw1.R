commonURL="https://www.fhwa.dot.gov/bridge/nbi/2012/"
stateURL=vector(length=51)
state.abb=sort(c(state.abb,"DC"))
for(i in 1:51){
  stateURL[i]=paste(commonURL,state.abb[i],"12.txt",sep="")
}

bridge12=vector(length = 9)

for(i in 1:51){
  conn <- file(stateURL[i],open="r")
  linn <-readLines(conn)
  for (i in 1:length(linn)){
    s=linn[i]
    stateCod=substr(s,1,3)
    placeCode=substr(s,30,32)
    deck=substr(s,259,259)
    sups=substr(s,260,260)
    subs=substr(s,261,261)
    id=substr(s,130,146)
    year=substr(s,157,160)
    dayave=substr(s,165,170)
    maxspan=substr(s,218,222)
    row=c(stateCod,placeCode,deck,sups,subs,id,year,dayave,maxspan)
    bridge12=rbind(row,bridge12)
    
  }
  close(conn)
  
}
dim(bridge12)


#test AK
bridge12=vector(length = 9)
conn <- file(stateURL[1],open="r")
linn <-readLines(conn)
for (i in 1:length(linn)){
  s=linn[i]
  stateCod=substr(s,1,3)
  placeCode=substr(s,30,32)
  deck=substr(s,259,259)
  sups=substr(s,260,260)
  subs=substr(s,261,261)
  id=substr(s,130,146)
  year=substr(s,157,160)
  dayave=substr(s,165,170)
  maxspan=substr(s,218,222)
  row=c(stateCod,placeCode,deck,sups,subs,id,year,dayave,maxspan)
  bridge12=rbind(row,bridge12)
  
}
close(conn)