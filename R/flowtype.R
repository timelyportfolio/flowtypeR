#' flowtype.js for a better reading experience
#'
#' One and only function of this htmlwidget which runs
#'  \href{https://github.com/simplefocus/flowtype.js}{flowtype.js} on a
#'  \code{CSS selector} of your choice.  By default, \code{body} will be
#'  the \code{CSS selector}, so all text on the page will adjust to flowtype.
#'
#' @param selector \code{string} of a valid \code{CSS} selector.  \code{body} is the default.
#' @param minimum \code{integer} see \href{https://github.com/simplefocus/FlowType.JS#thresholds}{Thresholds}
#' @param maximum \code{integer} see \href{https://github.com/simplefocus/FlowType.JS#thresholds}{Thresholds}
#' @param minFont \code{integer} see \href{https://github.com/simplefocus/FlowType.JS#thresholds}{Thresholds}
#' @param maxFont \code{integer} see \href{https://github.com/simplefocus/FlowType.JS#thresholds}{Thresholds}
#' @param fontRatio \code{integer} see \href{https://github.com/simplefocus/FlowType.JS#font-size}{Font-size}
#' @param width a valid \code{CSS} size for the width of the htmlwidget container \code{div}.  The default
#'          is \code{0} since we expect the container to be invisible.
#' @param height a valid \code{CSS} size for the height of the htmlwidget container \code{div}.  The default
#'          is \code{0} since we expect the container to be invisible.
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
#' # using about.html from R help
#' about_html <- readLines(file.path(R.home("doc/html"),"about.html"))
#' browsable(
#'   tagList(
#'     tags$h1("with flowtype")
#'     ,tags$div(id="flowtype-resize",style="padding:0em 1em 0em 1em; border: 2px solid gray;"
#'       ,HTML(
#'          about_html[do.call(seq,as.list(grep(x=about_html,pattern="<h2>")+c(0,-1)))]
#'       )
#'     )
#'     ,tags$h1("without flowtype")
#'     ,tags$div(id="flowtype-resize",style="padding:0em 1em 0em 1em; border: 2px dashed gray;"
#'       ,HTML(
#'          about_html[do.call(seq,as.list(grep(x=about_html,pattern="<h2>")+c(0,-1)))]
#'        )
#'     )
#'     ,flowtype(
#'       '#flowtype-resize'
#'       ,minFont = 12
#'       ,fontRatio = 25
#'     )
#'   )
#' )
#' }
#'
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

