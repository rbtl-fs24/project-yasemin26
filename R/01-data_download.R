# 01-data_download.R
install.packages("googlesheets4")
library(googlesheets4)
library(readr)
library(here)

# Authenticate with Google Sheets
gs4_auth(email = "ykurtis@ethz.ch")

# URL of the Google Sheet
sheet_url <- "https://docs.google.com/spreadsheets/d/1_QB4JFjEU0S0xp9QuerYM0XKxN7hzGkg80_MlC1qUgw/edit?resourcekey#gid=790386844"

1# Read the data from the Google Sheet
data <- read_sheet(sheet_url)

# Save the data object to the raw folder as a CSV file
write_csv(data, file = here("data", "raw", "data_downloaded.csv"))

