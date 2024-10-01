meanr = function(path, column){
  dataframe = read_csv(path)
  result =  dataframe %>%
    filter(!is.na({{column}})) %>%  
    #   summarise(max_value = max(weight))
    summarise(mean_value = mean(weight))
  return(result)
}