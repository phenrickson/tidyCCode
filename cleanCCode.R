### Input a vector of ccodes
### Return vector of ccodes that are all three digit characters
### eg, 2 -> "002"
### eg, 20-> "020"

cleanCCode <-
        cleanCCode<-function(ccode){
                sapply(ccode, function(x){
                        
                        if(is.na(x)==T) {x<-NA} else
                                
                                if (nchar(x)==1) {x<-paste("00", sep="", x) } else 
                                        
                                        if (nchar(x)==2) {x<-paste("0", sep="", x) } else
                                                
                                                if (nchar(x)>=3) {x<-as.character(x)} else
                                                        
                                                        return(x)}, simplify=T)
        }


cleanCCode(1)

