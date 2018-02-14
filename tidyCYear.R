# running through all previous functions

## input vectors of ccodes and years
## return a character vector of 'CCC_YYYY'
## resulting character vector has been cleaned to take care of country/year clashes in the cow universe

source("cleanCYear.R")

tidyCYear <-
function(ccode, year){
        
        # clean the ccode
        clean_ccode<-cleanCCode(ccode)
        
        # make cyear
        cyear<-makeCYear(clean_ccode, year)
        
        # clean cyear
        clean_cyear<-cleanCYear(cyear)
        
        return(clean_cyear)
}

# test
#ccode<-c(2, 20, 300, 255, 265, 345)
#year<-c(1900, 1920, 1955, 1950, 1995, 1945)


#tidyCYear(ccode, year)
