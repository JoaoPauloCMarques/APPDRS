#include <Rcpp.h>
using namespace Rcpp;

// This is a simple function using Rcpp that creates an R list
// containing a character vector and a numeric vector.
//
// Learn more about how to use Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//
// and browse examples of code using Rcpp at:
//
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
float jp_cpp_media (NumericVector jp){
  float somatorio = 0;
  int n = jp.size();
  for (int i = 0; i < n; i=i+1){
    somatorio = somatorio + jp[i];
  }
  float media_jp = somatorio/n;

  return media_jp;
}






