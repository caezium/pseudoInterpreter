DECLARE names : ARRAY[1:5] OF STRING
DECLARE iterator, jiterator : INTEGER
DECLARE temp : STRING



DECLARE longest : INTEGER
longest<-0
FOR iterator <- 1 TO 5
	OUTPUT "enter name"
	INPUT names[iterator]
    IF LENGTH(names[iterator]) > longest THEN
        longest <- LENGTH(names[iterator])
    ENDIF
NEXT iterator


//cases where some strings are shorter
FOR iterator <-1 TO 5
    IF LENGTH(names[iterator]) < longest THEN
        FOR jiterator <- 1 TO longest-LENGTH(names[iterator])
            names[iterator]<- names[iterator]+"/"
        NEXT jiterator
    ENDIF
NEXT iterator
  
//65-90, slash '/' is 0
FUNCTION ASCII(string : STRING) RETURNS INTEGER
	DECLARE ascii : INTEGER
	ascii <- 0
	DECLARE s : STRING
	s <- UCASE(string)
	DECLARE letters : ARRAY[1:26] OF CHAR
	letters[1] <- "A"
	letters[2] <- "B"
	letters[3] <- "C"
	letters[4] <- "D"
	letters[5] <- "E"
	letters[6] <- "F"
	letters[7] <- "G"
	letters[8] <- "H"
	letters[9] <- "I"
	letters[10] <- "J"
	letters[11] <- "K"
	letters[12] <- "L"
	letters[13] <- "M"
	letters[14] <- "N"
	letters[15] <- "O"
	letters[16] <- "P"
	letters[17] <- "Q"
	letters[18] <- "R"
	letters[19] <- "S"
	letters[20] <- "T"
	letters[21] <- "U"
	letters[22] <- "V"
	letters[23] <- "W"
	letters[24] <- "X"
	letters[25] <- "Y"
	letters[26] <- "Z"
    
	
	
	FOR iterator<-1 TO LENGTH(s)
		DECLARE flag : BOOLEAN
		flag <- TRUE  
		
		DECLARE asci : INTEGER
		asci <- 0
		
		FOR jiterator<-1 TO 26
			IF flag THEN
				IF SUBSTRING(s,iterator,1) = letters[jiterator] THEN
                    asci <- 64+jiterator
                    flag <- FALSE
				ENDIF
			ENDIF
		NEXT jiterator
        ascii <- ascii*100 + asci
		  

	NEXT iterator
	RETURN ascii

ENDFUNCTION


DECLARE i,j : INTEGER
FOR i <- 1 TO 4
	FOR j <- 1 TO 5 - i
		IF ASCII(names[j]) > ASCII(names[j+1]) THEN
			temp <- names[j]
			names[j] <- names[j+1]
			names[j+1] <- temp
		ENDIF
	NEXT j
NEXT i  

FOR i <- 1 TO 5
	OUTPUT names[i]
NEXT i