#' Convert GeneID to each others
#'
#' use ?easyConvert() fuction to find the details
#' @param species default is `HUMAN`,currently only support 2 species,the other is `MUS`
#' @param queryList the list to be annotated
#' @param queryType including `ENTREZID`,`SYMBOL`,`ENSEMBL`, correspond to the type of your `querList`
#' @export
easyConvert<-function(species="HUMAN",queryList,queryType=c("ENTREZID","SYMBOL","ENSEMBL")){
  if(length(species)!=1|length(queryType)!=1){
    stop("参数错误，请仔细核查")
  }else{
    if(species=="HUMAN"){
      results=eval(parse(text = sprintf("results=homodf[match(queryList,homodf$%s),]",queryType)))
      return(results)
    }
    if(species=="MUS"){
      results=eval(parse(text = sprintf("results=musdf[match(queryList,musdf$%s),]",queryType)))
      return(results)
    }
  }
}
