#par(mar=c(1,1,2,1))

stopifnot(length(colors()) == 657)

SetTextContrastColor <- function(color)
{
  ifelse( mean(col2rgb(color)) > 127, "black", "white")
}
TextContrastColor <- unlist( lapply(colors(), SetTextContrastColor) )
colCount <- 25  # number per row
rowCount <- 27

plot( c(1,colCount), c(0,rowCount), type="n", ylab="", xlab="",
      axes=FALSE, ylim=c(rowCount,0))
title("R colors")
mtext("http://research.stowers-institute.org/efg/R/Color/Chart",
      cex=0.6)

for (j in 0:(rowCount-1))
{
  base <- j*colCount
  remaining <- length(colors()) - base
  RowSize <- ifelse(remaining < colCount, remaining, colCount)
  rect((1:RowSize)-0.5,j-0.5, (1:RowSize)+0.5,j+0.5,
       border="black",
       col=colors()[base + (1:RowSize)])
  text((1:RowSize), j, paste(base + (1:RowSize)), cex=0.7,
       col=TextContrastColor[base + (1:RowSize)])
}
