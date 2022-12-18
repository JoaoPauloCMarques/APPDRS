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


CLT <- function(number_of_yes,number_of_no,sample_size,amount_of_sampling){
  # Program made for to try CENTRAL LIMITE THEOREM of binominal distribution.
  # Every binominal distribution is normal.
  yes<-rep("yes", times=number_of_yes) # Porcentage of "Yes" in population: 1%.
  no<-rep("no", times=number_of_no) # Porcentage of "No" in population: 99%.
  population<-c(yes, no) # Population
  binominal_proportion_sampling_distribution <-c() # Initializing vector.

  for(i in 1:amount_of_sampling){ # one hundred sampling
    n<-sample(population,sample_size) #sample size: 2000
    percentage_of_yes<-(table(n)[2]/sum(table(n))) * 100
    binominal_proportion_sampling_distribution<-append(binominal_proportion_sampling_distribution,percentage_of_yes)
  }

  return(binominal_proportion_sampling_distribution)
}
