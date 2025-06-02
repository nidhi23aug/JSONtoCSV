#JSON to clean flat CSV--- Need to Change Identify Records by delimiter Line when going through a new JSON file. 


library(stringr)
library(dplyr)
library(readr)

lines <- readLines("Downloads/2025_05_22__REAL_SEARCH_Results_PubFinder.txt")

# Identify records by delimiter line (dashes) - Edited it for Pubfinder
record_starts <- grep("^\\s*-{5,}\\s*$", lines)
record_starts <- c(record_starts, length(lines) + 1)

# Extract relevant info
records <- list()
for (i in seq_along(record_starts[-length(record_starts)])) {
  block <- lines[(record_starts[i] + 1):(record_starts[i + 1] - 1)]
  block <- block[str_detect(block, ":")]
  
  # Extract key-value pairs
  kv <- str_split_fixed(block, ":", n = 2)
  keys <- str_trim(kv[, 1])
  values <- str_trim(kv[, 2])
  record <- as.list(setNames(values, keys))
  records[[i]] <- record
}

# Bind all into a dataframe, filling missing fields with NA
df <- bind_rows(records)

# Save to CSV
write_csv(df, "Desktop/Pubfinder_Sheet.csv")

