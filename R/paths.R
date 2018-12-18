#' Path to Swagger Resources
#'
#' Retrieves the path to swagger resources.
#'
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
swagger_path <- function() {
  swagger_path3()
}
#' @export
#' @rdname swagger_path
swagger_path3 <- function() {
  system.file("dist3", package = "swagger")
}

#' Path to Swagger Index
#'
#' Retrieves the path to the swagger index file.
#'
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
swagger_index <- function() {
  swagger_index3()
}
#' @export
#' @rdname swagger_index
swagger_index3 <- function() {
  system.file("dist/index.html", package = "swagger")
}


#' Swagger Index File with OpenAPI Path
#'
#' Produces a \code{index.html} file that will attempt to access a provided API path.
#'
#' @param apiPath Path to an openAPI specification
#' @return large string containing the contents of \code{\link{swagger_index}()} with
#'   the appropriate speicification path changed to the \code{apiPath} value.
#' @examples
#' if (interactive()) {
#'   swagger_spec("https://developer.uspto.gov/ibd-api/swagger.json")
#' }
#' @export
#' @rdname swagger_spec
swagger_spec <- function(apiPath = "http://petstore.swagger.io/v2/swagger.json") {
  swagger_spec3(apiPath = apiPath)
}
#' @export
#' @rdname swagger_spec
swagger_spec3 <- function(apiPath = "http://petstore.swagger.io/v2/swagger.json") {

  index_file <- swagger_index()
  index_txt <- paste0(readLines(index_file), collapse = "\n")
  index_txt <- sub("\"(http|https)://petstore.swagger.io/v2/swagger.json\"", apiPath, index_txt)

  index_txt
}
