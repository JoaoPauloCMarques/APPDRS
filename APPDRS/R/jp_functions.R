law <- function(x,y,z){
  a<-rep("Sim", times=x)
  b<-rep("Não", times=y)
  populacao<-c(a,b)
  populacao<-sample(populacao,length(populacao)) # To Shuffle population
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
  population<-sample(population,length(population)) # shuffle population
  binominal_proportion_sampling_distribution <-c() # Initializing vector.

  for(i in 1:amount_of_sampling){ # one hundred sampling
    n<-sample(population,sample_size) #sample size: 2000
    percentage_of_yes<-(table(n)[2]/sum(table(n))) * 100
    binominal_proportion_sampling_distribution<-append(binominal_proportion_sampling_distribution,percentage_of_yes)
  }

  return(binominal_proportion_sampling_distribution)
}


# Population Standard Deviation Function made by me:
jp_pop_sd <- function(vector){
  x<- vector - mean(vector)
  y<-x^2
  z<-sum(y)
  a<-z/length(vector)
  b<-sqrt(a)
  return(b)
}




create_yes_no <- function(yes,no,sample_size){
  yes<-rep("yes", times=yes)
  no<-rep("no", times=no )
  population_jp<-c(yes, no) # Population
  population_jp<-sample(population_jp,length(population_jp)) # To Shufle the population

  sample_jp <- sample(population_jp,sample_size)

  #percentage_of_yes<-(table(sample_jp)[2]/sum(table(sample_jp))) * 100
  frequency_of_yes<- table(sample_jp)[2]
  #percentage_of_yes<-round(percentage_of_yes, digits = 2)
  return(frequency_of_yes)
}



populacao_infinita <- function(x,y){

  pi_plan <- x / 100
  w_plan <- (y*2) / 100

  N <- 4 * ( (pi_plan * (1-pi_plan)) / (w_plan)^2  ) * (1.96)^2

  if (N * pi_plan <= 10){ # This value should be greater than 10 to use the above equation.
    omega_plan <- (pi_plan * ( 1 - pi_plan )) / (w_plan)^2
    N <- (  ( (2*omega_plan)-1 ) + ( sqrt( (((2*omega_plan)-1))^2  +((1/((w_plan)^2)) -1 )))) * (1.96)^2
  }

  return( cat("É necessário um N amostral de:",round(N, digits = 0),", para 95% de confiança.") )
}


populacao_finita <- function(x,y,z){

  pi_plan <- x / 100
  w_plan <- (y*2) / 100

  N <- 4 * ( (pi_plan * (1-pi_plan)) / (w_plan)^2  ) * (1.96)^2

  if (N * pi_plan <= 10){ # This value should be greater than 10 to use the above equation.
    omega_plan <- (pi_plan * ( 1 - pi_plan )) / (w_plan)^2
    N <- (  ( (2*omega_plan)-1 ) + ( sqrt( (((2*omega_plan)-1))^2  +((1/((w_plan)^2)) -1 )))) * (1.96)^2
  }

  n_finite <- ( z / (N+z) ) * N

  return( cat("É necessário um N amostral de:",round(n_finite, digits = 0),", para 95% de confiança.") )
}








