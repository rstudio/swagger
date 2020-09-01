
#' Plumber `register_doc()` information
#'
#' Normally documentation is registered in the `.onLoad()` method of the package.
#' To avoid a circular dependency with `swagger` when `plumber` are starting up,
#' `plumber` must retrieve this information manually on it's startup.
#'
#' See the examples for how documentation should regularly be registered.
#'
#' @keywords internal
#' @export
#' @examples
#' \dontrun{
#' ## Suggested setup for other packages trying to register visual docs for plumber
#' .onLoad <- function(...) {
#'   plumber_register_ui <- function() {
#'     tryCatch({
#'       do.call(plumber::register_ui, plumber_docs())
#'     }, error = function(e) {
#'       message("Error registering swagger docs. Error: ", e)
#'     })
#'   }
#'
#'   setHook(packageEvent("plumber", "onLoad"), function(...) {
#'     plumber_register_ui()
#'   })
#'   if ("plumber" %in% loadedNamespaces()) {
#'     plumber_register_ui()
#'   }
#' }
#' }
plumber_docs <- function() {
  list(
    name = "swagger",
    index = function(version = "3", ...) {
      swagger_spec(
        api_path = paste0(
          "window.location.origin + ",
          "window.location.pathname.replace(",
            "/\\(",
              "__swagger__\\\\/|",
              "__swagger__\\\\/",
              "index.html|",
              "__docs__\\\\/|",
              "__docs__\\\\/",
              "index.html",
            "\\)$/, ",
            "\"\"",
          ') + "openapi.json"'
        ),
        version = version
      )
    },
    static = function(version = "3", ...) {
      swagger_path(version)
    }
  )
}
