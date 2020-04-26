test_that("dist3 files md5sum same as source with matching swagger version", {
  swagger_ui_version <- gsub(".9999", "", packageVersion("swagger"))
  files_location <- swagger::swagger_path()
  for (f in dir(files_location)) {
    tmpf <- tempfile()
    download.file(paste0("https://unpkg.com/swagger-ui-dist@", swagger_ui_version, "/", f),
                  tmpf)
    expect_equivalent(tools::md5sum(tmpf),
                      tools::md5sum(file.path(files_location, f)))
    unlink(tmpf)
  }
})
