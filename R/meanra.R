#' Calculate means of a given column in dataframe
#'
#' @param path Path to a comma-separated values file
#' @param column The column for which you'd like the mean
#'
#' @return result A numerical value representing the mean
#' @export
meanr = function(path, column){
  dataframe = readr::read_csv(path)
  result =  dataframe %>%
    dyplr::filter(!is.na({{column}})) %>%
    #   summarise(max_value = max(weight))
    dplyr::summarise(mean_value = mean(weight))
  return(result)
}
