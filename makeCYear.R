# input a matrix with ccode and year columns
# return a character variable "CCC_YYYY"

source("cleanCCode.R")

makeCYear <-
function(ccode, year){
        
        # clean the ccodes 
        source("cleanCCode.R")
        clean_ccode<-cleanCCode(ccode)
        
        # paste them together
        cyear<-paste(clean_ccode, sep="_", year)
        
        # make anything with NA an NA
        cyear[grep("NA_", cyear)]<-NA
        
        return(cyear)
}


makeCYear(2, 1990)




