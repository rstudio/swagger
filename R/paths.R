match_version <- function(version = "5") {
  version <- as.character(version)
  match.arg(version, c("3", "4", "5"), several.ok = FALSE)
}


#' Path to Swagger Resources
#'
#' Retrieves the path to swagger resources.
#'
#' @template param-version
#' @examples
#'
#' if (interactive()) {
#'   browseURL(swagger_path())
#' } else {
#'   print(paste("You can explore swagger resources under: ", swagger_path()))
#' }
#'
#' @export
#' @rdname swagger_path
swagger_path <- function(version = "5") {
  system.file(
    paste0("dist", match_version(version)),
    package = "swagger"
  )
}

#' Path to Swagger Index
#'
#' Retrieves the path to the swagger index file.
#'
#' @template param-version
#' @examples
#'
#' if (interactive()) {
#'   browseURL(swagger_index())
#' } else {
#'   print(paste("You can use swagger under: ", swagger_index()))
#' }
#'
#' @export
#' @rdname swagger_index
swagger_index <- function(version = "5") {
  file.path(swagger_path(version = version), "index.html")
}


#' Swagger Index File with OpenAPI Path
#'
#' Produces the content for a \code{index.html} file that will attempt
#' to access a provided API path.
#'
#' @param api_path Path to paste into the an OpenAPI specification file
#' @template param-version
#' @return large string containing the contents of \code{\link{swagger_index}()} with
#'   the appropriate specification path changed to the \code{api_path} value.
#' @examples
#' if (interactive()) {
#'   swagger_spec("https://developer.uspto.gov/ibd-api/swagger.json")
#' }
#' @export
#' @rdname swagger_spec
swagger_spec <- function(
  api_path = "\"http://petstore.swagger.io/v2/swagger.json\"",
  version = "5"
) {

  index_file <- swagger_index(version = version)
  index_txt <- paste0(readLines(index_file), collapse = "\n")

  if (version %in% c("3", "4", "5")) {
    index_txt <-
      sub(
        "\"(http|https)://petstore.swagger.io/v2/swagger.json\"",
        api_path,
        index_txt
      )
  } else {
    stop("swagger_spec not implemented for version: ", version)
  }

  index_txt
}
