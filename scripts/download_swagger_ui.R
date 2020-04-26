

library(magrittr)
library(devtools)
library(rvest)

(function() {
  swagger_ui_version <- "3.25.0"
  to_location <- file.path(
    ".",
    "inst",
    paste0(
      "dist",
      strsplit(swagger_ui_version, ".", fixed = TRUE)[[1]][[1]]
    )
  )

  unlink(to_location, recursive = TRUE)
  dir.create(to_location, recursive = TRUE)

  swagger_release <- paste0("https://unpkg.com/swagger-ui-dist@", swagger_ui_version, "/")
  files <- read_html(swagger_release) %>% html_nodes(".css-xt128v") %>% html_attr("href")
  lapply(files, function(f) {
    download.file(paste0(swagger_release, f), file.path(to_location, f))
  })

})()
