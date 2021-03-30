#' Search Alias/synonymous name of Genes
#'
#' use ?searchAlias() fuction to find the details
#' @param species default is `HUMAN`,currently only support 2 species,the other is `MUS`
#' @param queryList the list to be annotated
#' @export
searchAlias<-function(species=c("HUMAN","MUS"),querylist){
  species <- match.arg(species)
  if(species=="HUMAN"){
    result=as.data.frame(t(sapply(querylist,function(x){
      homodf[grepl(sprintf("\\b%s\\b",x),homodf$ALIAS,perl = T),]
    })))
    return(result)
  }
  if(species=="MUS"){
    result=as.data.frame(t(sapply(querylist,function(x){
      musdf[grepl(sprintf("\\b%s\\b",x),musdf$ALIAS,perl = T),]
    })))
    return(results)
  }
  
}
