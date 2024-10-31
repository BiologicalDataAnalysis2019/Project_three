#' Remove burnin and plot posterior trace
#'
#' @param filepath The path to the tab-delimited file you want to process
#' @param burnin The proportion of the trace to discard as burnin
#'
#' @return plot A ggplot object of the posterior trace
#' @export
process_trace <- function(filepath, burnin = .25){
  data <- readr::read_delim(filepath, delim = "\t")
  df <- data %>%
    dplyr::select(Iteration, Posterior, Likelihood, origin_time)
  burn <- round(nrow(df)*burnin)
  smaller <- df[burn:399651, 1:4]
  plt <- ggplot2::ggplot(data = smaller, aes(x = Iteration, y = Posterior)) + geom_line() + theme_bw()
  return(plt)
  }
