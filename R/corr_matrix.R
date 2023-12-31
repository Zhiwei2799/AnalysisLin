#' @title Correlation Matrix
#' @description
#'   Column 1: row names (variable 1 for the correlation test).   
#'   
#'   Column 2: column names (variable 2 for the correlation test).    
#'   
#'   Column 3: the correlation coefficients.    
#'   
#'   Column 4: the p-values of the correlations.   
#'   
#' @param data input dataset
#' @param type pearson or spearman correlation, default is pearson
#' @param decreasing sort the data frame by absolute correlation values, default is sorted by decreasing value
#' @param corrplot generate a correlation matrix plot, default is true
#' @param order Character, the ordering method of the correlation matrix.     
#'   'hclust' for the hierarchical clustering order (default).         
#'   'original' for the original order.       
#'   'AOE' for the angular order of the eigenvectors.   
#'   'FPC' for the first principal component order.    
#'   'alphabet' for alphabetical order.        
#' @param sig.level Significant level. default is 0.01. If correlation p-value is less than 0.01, wipe away the corresponding glyph.
#' @param addCoef.col Color of coefficients added on the graph, if NULL(dafult), add no coefficients
#' @param number.cex Size of the coefficents values
#' @return a data frame which contain rows names, column names, correlation coefficients, and p-values
#' @return a plot of correlation if corrplot is set to be true
#' @export
#'
#' @examples corr_matrix(data(mtcars),type='pearson')
corr_matrix <- function(data, type ='pearson', decreasing = TRUE,corrplot=FALSE, order='hclust',sig.level = 0.01,addCoef.col=NULL,number.cex=NULL) {
  if (!require(Hmisc)) install.packages('Hmisc')
  if (!require(corrplot)) install.packages('corrplot')
  library(Hmisc)
  library(corrplot)
  suppressPackageStartupMessages(library(Hmisc))
  suppressPackageStartupMessages(library(corrplot))
  cormat <- rcorr(as.matrix(data),type = type)$r
  pmat <- rcorr(as.matrix(data),type = type)$P
  pmat[is.na(pmat)] <- 0
  ut <- upper.tri(cormat)

  data <- data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor = cormat[ut],
    p = pmat[ut]
  )
  data <- data[order(abs(data$cor), decreasing=decreasing), ]
  if (corrplot){
    corrplot(cormat, type="upper", order= order, addCoef.col = addCoef.col, number.cex = number.cex,
                          p.mat = pmat, sig.level = sig.level, insig = 'blank')
  }
  return(data)
}
