#' Produces the string for one day of the song.
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#'
#' @export
sing_day <- function(dataset, line, phrase_col){

  phrases <- dataset %>% pull({{phrase_col}})
  dayname <- dataset$Day.in.Words[line]
  toRet <- glue("On the {dayname} day of Christmas, my true love sent to me,")
  #????
  if(line ==1){
    get_line <- function(line){
      return (phrases[line])
    }
  }
  else{
    get_line <- function(line){
      if(line == 1)
        return(paste("and", phrases[line]))
      return (phrases[line])
    }
  }
  after_comma <- paste(rev(map_chr(1:line, get_line)), collapse=',\n' )
  return(paste(toRet, after_comma, sep = '\n'))
}
