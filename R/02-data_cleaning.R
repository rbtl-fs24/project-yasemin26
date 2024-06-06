# 02-data_cleaning.R
library(readr)
library(dplyr)
library(here)

# import data
raw_data_file <- here("data", "raw", "data_downloaded.csv")
data <- read_csv(raw_data_file)

# Specify the columns to delete by their indices
columns_to_delete <- c(1, 2, 5, 6, 7, 9, 10, 11, 13, 14, 15, 17, 18, 19, 21, 22, 23, 25, 26, 27, 34)

# Delete the specified columns
cleaned_data1 <- data |> 
  select(-all_of(columns_to_delete))


# Add row numbers
cleaned_data1 <- cleaned_data1 |> 
  mutate(RowNumber = row_number())

# Rename columns
cleaned_data <- cleaned_data1 |> 
  rename(
    gender = 'What is your gender?',
    political_leaning = 'What is your political leaning?',
    climate_change = 'Climate change average',
    personal_behaviour = 'Personal bahavior on climate change',
    waste_average = 'Waste management average',
    travel_average = 'Travel Smart Average',
    eat_average = 'Eat Sustainable average',
    energy_average = 'Conserve energy average',
    waste_tokens = 'Waste Management (recycling, waste reduction, waste decomposition etc.) - Please allocate your tokens.',
    travel_tokens = 'Travel smart (use bikes, fly less, use public transport etc.) - Please allocate your tokens.',
    eat_tokens = 'Eat sustainably (eat less meat, choose local and seasonal food etc.) - Please allocate your tokens.',
    energy_tokens = 'Conserve Energy (turn off lights, reduce heating etc.) - Please allocate your tokens.'
  )

print(cleaned_data)

write_csv(cleaned_data, file = here("data", "processed", "cleaned_capstone_data.csv"))

