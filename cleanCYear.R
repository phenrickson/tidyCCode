# for a "CCC_YYYY" variable that has been constructed using CYear, make changes to clean up issues within the COW universe
# ie, clean up issues with Yugoslavia, etc

# requires 
source("makeCYear.R")

changes<- # Matrix of changes which will be made within this function
        changes<-data.frame("input"=vector(),
                            "styear"=vector(),
                            "endyear"=vector(),
                            "output"=vector())

# Input CCode, Year Start, Year End, Output CCode

# Germany
changes[nrow(changes)+1,]<-c("255", 1946, 1990, "260")
changes[nrow(changes)+1,]<-c("260", 1991, 2014, "255")
changes[nrow(changes)+1,]<-c("265", 1991, 2014, "255")

# Czechoslovakia
changes[nrow(changes)+1,]<-c("315", 1993, 2014, "316")
changes[nrow(changes)+1,]<-c("316", 1816, 1993, "315")

# Serbia
changes[nrow(changes)+1,]<-c("341", 1917, 1992, "345")
changes[nrow(changes)+1,]<-c("340", 1917, 1992, "345")
changes[nrow(changes)+1,]<-c("345", 1992, 2014, "340")

# Yemen
changes[nrow(changes)+1,]<-c("678", 1991, 2014, "679")
changes[nrow(changes)+1,]<-c("680", 1991, 2014, "679")

# Vietnam
changes[nrow(changes)+1,]<-c("815", 1816, 2014, "816")

#Austria
changes[nrow(changes)+1,]<-c("305", 1816, 1918, "300")
changes[nrow(changes)+1,]<-c("300", 1918, 2014, "305")

# italy
changes[nrow(changes)+1,]<-c("324", 1816, 1860, "325")

# Russia
changes[nrow(changes)+1,]<-c("364", 1922, 1991, "365")

## anymore to add just get added at the end here

# now, make a matrix with two columns
# input: problematic cyears
# output: fixed cyears

foo<-foreach(i=1:nrow(changes)) %do% {
        years<-changes[i,2]:changes[i,3]
        years<-sapply(years, toString)
        
        makeCYear(changes[i,1], years)
}

bar<-foreach(i=1:nrow(changes)) %do% {
        years<-changes[i,2]:changes[i,3]
        years<-sapply(years, toString)
        
        makeCYear(changes[i,4], years)
}

input<-unlist(foo)
output<-unlist(bar)

changes.table<-data.table("input"=input,
                          "output"=output)

rm(foo,bar, changes, input, output, years, i)


# test run
#ccode<-c(2, 20, 300, 255, 265, 345)
#year<-c(1900, 1920, 1955, 1950, 1995, 1945)
#cyear<-makeCYear(ccode, year)


# Here's the actual function

cleanCYear <-
function(cyear){
        
        require(dplyr)
        require(foreach)
        require(doParallel)
        
        check<-cyear
        
        # check against the input column of the problem matrix
        p_obs<-which(check %in% changes.table[,1]==T)
        p_cyears<-check[p_obs]
        
        p_cyears<-data.table("input"=p_cyears)

        # join up with table of changes
        hold<-left_join(p_cyears, changes.table, copy=F)
        
        # grab the output and slot it in
        check[p_obs]<-hold$output
        
        out<-check
        
        return(out)
        
}

