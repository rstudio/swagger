

library(magrittr)
library(devtools)

(function() {
  swagger_ui_version <- "3.26.0"
  to_location <- file.path(
    devtools::as.package(".")$path,
    "inst",
    paste0(
      "dist",
      strsplit(swagger_ui_version, ".", fixed = TRUE)[[1]][[1]]
    )
  )

  tmp_location <- tempdir()
  on.exit({
    unlink(tmp_location)
  })

  unlink(to_location, recursive = TRUE)
  dir.create(to_location, recursive = TRUE)
  system(paste0("wget -r -p -l 15 -nH -P ", tmp_location, " https://unpkg.com/swagger-ui-dist@", swagger_ui_version, "/"))

  file.path(tmp_location, paste0("swagger-ui-dist@", swagger_ui_version), "") %>%
    dir(full.names = TRUE) %>%
    lapply(file.copy, to = to_location)

})()
