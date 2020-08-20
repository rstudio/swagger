.onLoad <- function(...) {

  if ("plumber" %in% loadedNamespaces()) {
    plumber_register_ui()
  } else {
    setHook(packageEvent("plumber", "onLoad"), function(...) {
      plumber_register_ui()
    })
  }
}



plumber_register_ui <- function() {

  register_ui <- tryCatch(
    # will trigger onload
    plumber::register_ui,
    error = function(err) {
      function(...) {
        return()
      }
    }
  )

  register_ui(
    name = "swagger",
    index = function(version = "3", ...) {
      swagger_spec(
        api_path = 'window.location.origin + window.location.pathname.replace(/\\(__swagger__\\\\/|__swagger__\\\\/index.html|__docs__\\\\/|__docs__\\\\/index.html\\)$/, "") + "openapi.json"',
        version = version
      )
    },
    static = function(version = "3", ...) {
      swagger_path(version)
    }
  )
}
