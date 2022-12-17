# a<-c(car$speed)
# a<-table(car$speed)
# a<-a[which.max(a)]
# a<-names(a)
# as.numeric(a)

law <- function(x,y,z){
  a<-rep("Sim", times=x)
  b<-rep("Não", times=y)
  populacao<-c(a,b)
  b<-c()
  for(i in 1:z){
    n<-sample(populacao,i)
    j<-table(n)
    if (length(j) == 1 & names(j)[1] == "Não"  ){
      porcentagem_de_sim <- 0
    }else if(length(j) == 1 & names(j)[1] == "Sim") {
      porcentagem_de_sim <- 100
    }else if (length(j) == 2) { porcentagem_de_sim <- ( (j[2]/sum(j)) ) * 100}
    b<-append(b,porcentagem_de_sim)
  }
  return(b)
}

jp_mode<-function(x){
  a<-table(x)
  b<-sort(a, decreasing = TRUE)
  c<-b[which.max(b)]
  d<-b[-which.max(b)]
  if(any(c==d) ==  TRUE){
    texto1<-c("Há mais de uma moda!\n")
    texto2<-c("Linha 1: escores.\n")
    texto3<-c("Linha 2: número de repetição.\n")
    cat(texto1)
    cat(texto2)
    cat(texto3)
    print(b)
  }else if(any(c==d) ==  FALSE){
    return(as.numeric(names(c)))
  }
}

jp_porc<-function(x){
  a<-cbind(table(x))
  b<-round((a/sum(a))*100, digits = 1)
  return(b)
}

jp_character_to_numeric <- function(x) {
  x <- gsub(" ", "", x)
  split <- strsplit(x, ",", fixed = FALSE)[[1]]
  x <- as.numeric(split)
  return(x)
}

open_prop_estimate <- function(){
  system("C:\\SystemFile206A\\dll\\fx2\\fx3\\prop_estimate.exe", intern = FALSE,
         ignore.stdout = TRUE, ignore.stderr = TRUE,
         wait = TRUE, input = NULL, show.output.on.console = FALSE,
         minimized = FALSE, invisible = FALSE, timeout = 0)
}

