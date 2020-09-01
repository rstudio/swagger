

library(magrittr)
library(devtools)
library(rvest)

local({

  swagger_ui_version <- "3.32.5"
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
    # files are large and make CRAN upset
    if (grepl("\\.map$", f)) return()
    # files are not included in html
    if (grepl("es-bundle", f)) return()

    res <- download.file(paste0(swagger_release, f), file.path(to_location, f), mode = "wb")
    if (res != 0L) {
      message(paste("Download of", f, "failed."))
    }
    names(res) <- f
    res == 0
  })

})
