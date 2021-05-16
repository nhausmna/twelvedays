#' Puts the various parts of speech together into a full phrase.
#'
#' @param num An integer
#' @param num_word A string corresponding to the integer
#' @param item A string
#' @param verb A string
#' @param adjective A string
#' @param location A string
#'
#' @return A string containing the words in grammatical order.
#'
#' @import stringr
#' @import glue
#' @import dplyr
#' @import purrr
#'
#' @export



make_phrase <- function(num, num_word, item, verb, adjective, location){
  if(num == 1)
    return(glue("a {item} {location}."))
  item <- pluralize_gift(item)
  if(!is.na(verb))
    return(glue("{num_word} {item} {verb}"))
  if(!is.na(adjective))
    return(glue("{num_word} {adjective} {item}"))
  return(glue("{num_word} {item} {location}"))
}

