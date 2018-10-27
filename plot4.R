source("plot2.R")
source("plot3.R")

plot4 <- function(dataset) {
        par(mfcol = c(2, 2))
        plot2(dataset, ylabel = "Global Active Power")
        plot3(dataset)
        plot4a(dataset)
        plot4b(dataset)
}

plot4a <- function(dataset) {
        
}

plot4b <- function(dataset) {
        
}

make_plot4 <- function() {
        make_plot(plot4, 4)
}
