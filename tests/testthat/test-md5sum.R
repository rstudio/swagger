swagger_ui_version <- gsub(".9999", "", packageVersion("swagger"))
files_location <- swagger::swagger_path()
tmpd <- file.path(tempdir(), "__swagger_rel")
dir.create(tmpd)
for (f in dir(files_location)) {
  test_that(paste0(f, " md5 sum in package match swagger version released md5sum"), {
    dld <- download.file(paste0("https://unpkg.com/swagger-ui-dist@", swagger_ui_version, "/", f),
                         file.path(tmpd, f),
                         mode = "wb",
                         quiet = TRUE)
    expect_equivalent(tools::md5sum(file.path(files_location, f)),
                      tools::md5sum(file.path(tmpd, f)))
  })
}
unlink(tmpd)
