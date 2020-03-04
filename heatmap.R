library(ComplexHeatmap)
options(scipen=999)
library(graphics)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")

data = read.csv("ca1_sort_3c.csv")
matrix = as.matrix(data[,3:dim(data)[2]])
rownames(matrix) = data[,2]

row_ha = rowAnnotation(Annotation = as.character(data[,1]),
                              col = list( Annotation = c("Akt" = "#be29ec", 
                                                         "CSC" = "black",
                                                         "Classic stemness" = "red",
                                                         "EMT" = "#00b100",
                                                         "GR signaling" = "darkblue",
                                                         "Keratin" = "orange",
                                                         "Notch signaling" = "#FFD300",
                                                         "Others" = "grey",
                                                         "Oxidative stress" = "#f77fbe",
                                                         "Surface marker" = "#654321",
                                                         "p53" = "#216563") )
                           )

pdf("ca1_sort_3c.pdf",height=11,width=9)
Heatmap(matrix,
show_row_names = TRUE,show_column_names = TRUE,name = "Ct Values",
column_title="", column_title_side = "bottom",cluster_columns=T,cluster_rows=T,
right_annotation = row_ha)
dev.off()

matrix.s <- t(scale(t(matrix)))

pdf("ca1_sort_3c_rowScaled.pdf",height=11,width=9)
Heatmap(matrix.s,
show_row_names = TRUE,show_column_names = TRUE,name = "Ct Values",
column_title="", column_title_side = "bottom",cluster_columns=T,cluster_rows=T,
right_annotation = row_ha)
dev.off()
