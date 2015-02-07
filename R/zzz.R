.onLoad <- function(libname, pkgname){
}

.onAttach <- function(libname, pkgname) {
    packageStartupMessage("prepre - PREprocessing of Pupillary REsponse data\n\n",
                          "Version: ",prepreInfo(FALSE),"\n\n")
}
