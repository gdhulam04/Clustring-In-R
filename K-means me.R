data("USArrests")            #load the data
df = scale(USArrests)       # scalling the data
head(df)                    # view the first 6 rows of the data
head(df, n = 2)             # view the first 2 rows of the data
kmeans = kmeans(x, iter.max = 10, nstart = 1)
         kmeans(x, centers = 2, iter.max = 8, nstart = 2)

library(factoextra)                  
fviz_nbclust(df, kmeans, method = "wss") +
    geom_vline(xintercept = 4, linetype = 2)         

# Compute k-means with k = 4
set.seed(123)
km.res = kmeans(df, 4, nstart = 25)
print(km.res)

# Cluster number for each of the observations
km.res$cluster

head(km.res$cluster, 4)

# Cluster size
km.res$size

# Cluster means
km.res$centers

# Visualizing k-means clusters
fviz_cluster(km.res, data = df,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
             ellipse.type = "euclid", # Concentration ellipse
             star.plot = TRUE, # Add segments from centroids to items
             repel = TRUE, # Avoid label overplotting (slow)
             ggtheme = theme_minimal()
)













