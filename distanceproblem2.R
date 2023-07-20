library(ape)
library(TreeDist)
library(TreeTools)

ew_tree <- ReadTntTree("C:/TNT/TNT-bin/projects/project44/ew.tre")
iw10_tree <- ReadTntTree("C:/TNT/TNT-bin/projects/project44/iw10.tre")
iqtree <- read.tree("C:/app/iqtree-1.6.12-Windows/projects/project44/project44.phy.treefile")

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

