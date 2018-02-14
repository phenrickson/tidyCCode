# tidyCCode
This is a series of functions for cleaning Correlates of War country codes for the purpose of merging datasets.

CoW's country codes are used frequently, but there are many issues in terms of how some countries have been coded. 

For example, Germany is sometimes coded as 255 and sometimes as 260 during the years 1945-1990. When merging datasets, these inconsistencies can lead to missigness and failed merges.

I wrote a function which identifies and cleans the problematic country-years for ccodes.  'tidyCYear' allows a user to input ccodes and years and return a character vector of 'CCC_YYYY' format. This variable can then be used as the variable on which to merge datasets.


There are four functions in this repository. All must be downloaded and sourced in order for the main function, tidyCYear, to run correctly.

# main function (requires background functions to be sourced)
tidyCYear is the penultimate function and uses a country's ccode and year to produce a character 'XXX_YYYY' vector
 
 # background functions
cleanCCode converts an existing country code to a consistent vector format 'XXX' (eg, 2 -> 002, 20 -> 020)


makeCYear converts ccodes and years into a character vector of 'CCC_YYYY' format

cleanCYear inputs a character vector of 'CCC_YYY' format and makes corrections; it then produces a character vector of 'CCC_YYY' format
