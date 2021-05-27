#' Convert GeneID to each others
#'
#' use ?easyConvert() fuction to find the details
#' @param species default is `HUMAN`,currently only support 2 species,the other is `MUS`
#' @param queryList the list to be annotated
#' @param queryType including `ENTREZID`,`SYMBOL`,`ENSEMBL`, correspond to the type of your `querList`
#' @export
easyConvert<-function(species=c("HUMAN","MUS"),queryList,queryType=c("ENTREZID","SYMBOL","ENSEMBL","NCBI")){
  species <- match.arg(species)
  queryType <- match.arg(queryType)

    if(species=="HUMAN"){

      if(queryType=="NCBI"){

        results=as.data.frame(t(sapply(querylist,function(x){
          homodf[grepl(sprintf("\\b%s\\b",x),homodf$NCBI,perl = T),]
        })))

      }else{
        results=eval(parse(text = sprintf("results=homodf[match(queryList,homodf$%s),]",queryType)))
      }
      return(results)
    }
    if(species=="MUS"){

      if(queryType=="NCBI"){

        results=as.data.frame(t(sapply(querylist,function(x){
          musdf[grepl(sprintf("\\b%s\\b",x),musdf$NCBI,perl = T),]
        })))

      }else{
        results=eval(parse(text = sprintf("results=musdf[match(queryList,musdf$%s),]",queryType)))
      }
      return(results)
    }

}
