selecteye <- function(samples, eye="autoselect") {

    
    if (!all(names(samples) == c("time","xL","yL","dilL","xR","yR","dilR"))) {
        stop("first argument has unexpected structure, see help(selecteye)")
    }
    
    samples <- data.table(samples)
    
    switch (eye,
        left = {            
            setnames(samples,c("Time","X","Y","Dil","remove1","remove2","remove3"))
        },
        right = {
            setnames(samples,c("Time","X","Y","Dil","remove1","remove2","remove3"))
        },
        {
            ## Kind of a hack, should be a better way to do this...
            if (na.omit(samples$dilL)[100] == -32768) {
                setnames(samples,c("Time","remove1","remove2","remove3","X","Y","Dil"))
            } else {
                setnames(samples,c("Time","X","Y","Dil","remove1","remove2","remove3"))
            }
        }
    )
    samples$remove1 <- NULL
    samples$remove2 <- NULL
    samples$remove3 <- NULL

    setkey(samples,Time)
    return(samples)
}
