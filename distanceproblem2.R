library(ape)
library(TreeDist)
library(TreeTools)

ew_tree <- ReadTntTree("ew.tre", "./")
iw10_tree <- ReadTntTree("iw10.tre", "./")
iqtree <- read.tree("project44.phy.treefile")

Relabel <- function(tree) {
  tree$tip.label <- gsub("_ | ", "", tree$tip.label)
  tree
}
ew_tree <- lapply(ew_tree, Relabel)
iw10_tree <- lapply(iw10_tree, Relabel)

distance1 <- ClusteringInfoDistance(ew_tree, iqtree)
distance2 <- ClusteringInfoDistance(iw10_tree, iqtree)
distance3 <- ClusteringInfoDistance(ew_tree, iw10_tree)
distance_matrix <- matrix(c(distance1, distance2, distance3), byrow = TRUE)
print(distance_matrix)

