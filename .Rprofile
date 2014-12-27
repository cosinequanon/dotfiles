options(repos=structure(c(CRAN="http://cran.rstudio.com/")))

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
