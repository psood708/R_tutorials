# Load the RSelenium library
library(RSelenium)

# Start a browser session
driver <- rsDriver(browser = "chrome")
remDr <- driver[["client"]]

# Navigate to Google's homepage
remDr$navigate("https://www.google.com")

# Find the search input field and enter a search term
searchInput <- remDr$findElement(using = "css", "#lst-ib")
searchInput$sendKeysToElement(list("RSelenium"))

# Find the search button and click it
searchBtn <- remDr$findElement(using = "css", "[name='btnK']")
searchBtn$clickElement()

# Extract the search results
results <- remDr$findElement(using = "css", "#search")
searchResults <- results$getElementText()

# Close the browser session
remDr$close()
