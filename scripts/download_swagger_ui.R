

library(magrittr)
library(devtools)
library(rvest)

(function() {
  swagger_ui_version <- "3.31.1"
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
  lapply(files[-grep(".map$", files)], function(f) {
    res <- download.file(paste0(swagger_release, f), file.path(to_location, f), mode = "wb")
    if (res != 0L) {
      message(paste("Download of", f, "failed."))
    }
    names(res) <- f
    res == 0
  })

})()
