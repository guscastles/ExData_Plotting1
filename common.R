library(tidyr)
library(dplyr)
library(lubridate)

fetch_data <- function() {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        dest_file <- url %>% download_data
        dataset <- dest_file %>% read_data
}

download_data <- function(url) {
        url_decoded <- URLdecode(url)
        dest_file <- tail(unlist(strsplit(url_decoded, "/")), 1)
        if (!file.exists(dest_file)) {
                download.file(url, destfile = dest_file)
                unzip(dest_file)
        }
        dest_file
}

read_data <- function(file_name) {
        
        change_datatypes <- function(data_set) {
                data_set["Date"] <- data_set %>%
                        select(Date) %>%
                        mutate(Date = dmy(Date))
                data_set["Time"] <- data_set %>%
                        select(Time) %>%
                        mutate(Time = as.POSIXct(strptime(Time, format = "%H:%M:%S")))
                data_set
        }
        
        change_columns <- function(data_set) {
                header <- read.delim("household_power_consumption.txt", nrows = 1,
                                     sep = ";", header = TRUE)
                colnames(data_set) <- colnames(header)
                data_set
        }
        
        dataset <- read.delim("household_power_consumption.txt", skip = 66637,
                              nrows = 2880, sep = ";", header = FALSE)
        dataset %>% change_columns %>% change_datatypes
}

create_labels <- function(date) {
        dates <- unique(date)
        first <- weekdays(dates[1], abbreviate = TRUE)
        middle <- weekdays(dates[ceiling(length(dates) / 2) + 1], abbreviate = TRUE)
        last <- weekdays(tail(dates, 1) + 1, abbreviate = TRUE)
        c(first, middle, last)
}
