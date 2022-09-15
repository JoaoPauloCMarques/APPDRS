# a<-c(car$speed)
# a<-table(car$speed)
# a<-a[which.max(a)]
# a<-names(a)
# as.numeric(a)
jp_mode<-function(x){
  a<-table(x)
  mode<-a[which.max(a)]
  mode <- names(mode)
  return(as.numeric(mode))
}

