

# skip_on_cran()
#
# # only test on `"mac"`
# skip_on_os(
#   setdiff(
#     c("windows", "mac", "linux", "solaris"),
#     "mac"
#   )
# )

skip_if_not_installed("jsonlite")

for (dist_version in c("3", "4", "5")) {

  # read from latest major version installed
  swagger_ui_version <- jsonlite::read_json(
    file.path(swagger_path(dist_version), "package.json")
  )$version

  files_location <- swagger::swagger_path(dist_version)
  tmpd <- file.path(tempdir(), paste0("__swagger_rel", dist_version))
  dir.create(tmpd, showWarnings = FALSE)
  on.exit({
    unlink(tmpd)
  }, add = TRUE)

  for (f in dir(files_location)) {
    # do not test shimmed files
    if (f %in% c("index.html")) {
      next
    }
    test_that(paste0(f, " md5 sum in package match swagger version released md5sum"), {
      dld <- download.file(paste0("https://unpkg.com/swagger-ui-dist@", swagger_ui_version, "/", f),
                           file.path(tmpd, f),
                           mode = "wb",
                           quiet = TRUE)
      expect_equivalent(tools::md5sum(file.path(files_location, f)),
                        tools::md5sum(file.path(tmpd, f)),
                        info = paste0("file: ", f))
    })
  }

}

