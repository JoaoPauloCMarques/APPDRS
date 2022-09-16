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
  mode<-a[which.max(a)]
  mode <- names(mode)
  return(as.numeric(mode))
}

