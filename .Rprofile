options(repos=structure(c(CRAN="http://cran.rstudio.com/")))
options(max.print = 1000)

up <- function () update.packages(ask = FALSE)
q <- function () quit(save = 'no')

lf <- function (dir) list.files(dir)
# I usually keep my files in a data dir
lfd <- function () list.files('data')

# Lines added by the Vim-R-plugin command :RpluginConfig (2014-Jul-22 09:42):
if (interactive()){
    options(warn = -1)
    tryCatch({
        if (nchar(Sys.getenv("DISPLAY")) > 1) {
            options(editor = 'gvim -f -c "set ft=r"')
        }
        else {
            options(editor = 'vim -c "set ft=r"')
        }
        if (require(colorout, quietly = TRUE)) {
            if (Sys.getenv("TERM") != "linux" && Sys.getenv("TERM") != ""){
                # Choose the colors for R output among 256 options.
                # You should run show256Colors() and help(setOutputColors256) to
                # know how to change the colors according to your taste:
                setOutputColors256(verbose = FALSE)
            }
        }
        require(setwidth, quietly = TRUE)
        require(vimcom, quietly = TRUE)
    },
    finally = {
        options(warn = 0)
    })

}

# https://stat.ethz.ch/pipermail/r-help/2004-June/053343.html
# Multiple return value
list <- structure(NA,class="result")
"[<-.result" <- function(x,...,value) {
   args <- as.list(match.call())
   args <- args[-c(1:2,length(args))]
   length(value) <- length(args)
   for(i in seq(along=args)) {
     a <- args[[i]]
     if(!missing(a)) eval.parent(substitute(a <- v,list(a=a,v=value[[i]])))
   }
   x
}

setwidth <- function(width = NULL, scale_width = .95) {
    term_width <- Sys.getenv("COLUMNS")
    if (term_width == "") {
        if (!is.null(width)) {
            options(width = width)
        } else {
            print("COLUMNS is not set in the env.")
        }
    } else {
        options(width = as.integer(term_width)*scale_width)
    }
}
setwidth()
