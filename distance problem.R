library(ape)
library(TreeDist)
library(TreeTools)

# ew.tre
ew_tree <- ReadTntTree("C:/TNT/TNT-bin/projects/project44/ew.tre")

# iw10.tre
iw10_tree <- ReadTntTree("C:/TNT/TNT-bin/projects/project44/iw10.tre")

# project44.phy.treefile
iqtree <- read.tree("C:/app/iqtree-1.6.12-Windows/projects/project44/project44.phy.treefile")

# 计算距离
distance1 <- ClusteringInfoDistance(ew_tree, iqtree)
distance2 <- ClusteringInfoDistance(iw10_tree, iqtree)
distance3 <- ClusteringInfoDistance(ew_tree, iw10_tree)
print(distance3)

# 构建距离矩阵
distance_matrix <- matrix(c(distance1, distance2, distance3),, nrow = 2, ncol = 2, byrow = TRUE)

# 打印距离矩阵
print(distance_matrix)
