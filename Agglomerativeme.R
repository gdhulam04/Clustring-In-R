data("USArrests")      #load the data
df = scale(USArrests)  #standardize the data
head(df, nrow = 6)     #show the first 6 rows
#compute the dissimilarity matrix
# df = standardized the data
res.dist = dist(df,method = "euclidean") 
as.matrix(res.dist)[1:6, 1:6]
res.hc = hclust(d = res.dist, method = "ward.D") # hclust() is used to create the hierarchical tree

#First install factoextra for dendrogram:
install.packages("factoextra")
library(factoextra)
fviz_dend(res.hc, cex = 0.5,) # size of labels

# Before performing hierarchical clustering of the observations, we use the scale() function
xsc=scale (USArrests)
plot(hclust (dist(xsc), method ="ward.D"), main =" Hierarchical Clustering with Scaled Features ")

cutree(res.hc, 3)

# Compute cophentic distance
res.coph <- cophenetic(res.hc)

# Correlation between cophenetic distance and
# the original distance
cor(res.dist, res.coph)

# Different method
res.hc2 = hclust(d = res.dist, method = "centroid")
cor(res.dist, cophenetic(res.hc2))

# cut the tree into 4 groups
grp = cutree(res.hc, k=4)  #cut tree into 4 groups
head(grp, n = 5)           
table(grp)                 #Number of members in each cluster

# Get the names for the members of cluster 1
rownames(df)[grp == 1]

# Cut in 4 groups and color by groups
fviz_dend(res.hc, k = 4,   # Cut in four groups
          cex = 0.5,       # label size
          k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE     # Add rectangle around groups
)

fviz_cluster(list(data = df, cluster = grp),
             palette = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
             ellipse.type = "convex", # Concentration ellipse
             repel = TRUE, # Avoid label overplotting (slow)
             show.clust.cent = FALSE, ggtheme = theme_minimal())


library("cluster")
# Agglomerative Nesting (Hierarchical Clustering)
res.agnes <- agnes(x = USArrests, # data matrix
                   stand = TRUE, # Standardize the data
                   metric = "euclidean", # metric for distance matrix
                   method = "ward" # Linkage method
)

fviz_dend(res.agnes, cex = 0.6, k = 4)







    