#' flowtype.js for a better reading experience
#'
#' One and only function of this htmlwidget which runs
#'  \href{https://github.com/simplefocus/flowtype.js}{flowtype.js} to a
#'  \code{CSS selector} of your choice.  By default, \code{body} will be
#'  the \code{CSS selector}, so all text on the page will adjust to flowtype.
#'
#' @examples
#' \dontrun{
#' library("flowtypeR")
#' library("htmltools")
#'
#' #  get NEWS from http://cran.r-project.org/doc/manuals/r-devel/NEWS.html
#' browsable(
#'   tagList(
#'     HTML(
#'       readLines("http://cran.r-project.org/doc/manuals/r-devel/NEWS.html")[8:145]
#'     )
#'     ,flowtype()
#'   )
#' )
#'
#' }
#' @import htmlwidgets
#'
#' @export
flowtype <- function(
  selector = 'body'
  , minimum = NULL
  , maximum = NULL
  , minFont = NULL
  , maxFont = NULL
  , fontRatio = NULL
  # width and height 0 since htmlwidget used for dependencies and JavaScript
  #   so the htmlwidget container should be empty
  , width = 0
  , height = 0
) {

  # forward options using x
  x = list(
    selector = selector
    , options = Filter(
      Negate(is.null)
      ,list(
        minimum = minimum
        ,maximum = maximum
        ,minFont = minFont
        ,maxFont = maxFont
        ,fontRatio = fontRatio
      )
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'flowtype',
    x,
    width = width,
    height = height,
    package = 'flowtypeR'
  )
}

