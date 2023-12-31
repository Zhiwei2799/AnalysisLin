% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/automate_pca.R
\name{automate_pca}
\alias{automate_pca}
\title{Principle Component Analysis}
\usage{
automate_pca(data, scale = TRUE, variance_threshold = 0.9, scree_plot = TRUE)
}
\arguments{
\item{data}{input dataset}

\item{scale}{a logical argument(default TRUE) that determines if appling standardized scaling to the dataset}

\item{variance_threshold}{an argument(default is 0.9) for set a variance_threshold}

\item{scree_plot}{a logical argument(default TRUE) that determines if scree plot is generated}
}
\value{
rotation and score of PCA and scree plot(optional)
}
\description{
Principle Component Analysis
}
\examples{
automate_pca(data(mtcars))
}
