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
swagger_path <- function() {
  system.file("dist", package = "swagger")
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
swagger_index <- function() {
  system.file("dist/index.html", package = "swagger")
}
