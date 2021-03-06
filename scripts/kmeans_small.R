#This was developed to figure out why everything was falling into the same cluster. 
#SOmethingin the data about the 'small' data set is causing all the clustering to fall into one or two clusters only.

setwd("~/Ananth/Research/research_code/scripts")
source("functions.R")
setwd("~/Ananth/Research/research_code/results_workspace/HiBench-24March/march-24/")

    all_files=c("hadoop2.7/tiny/metrics_sort_run.csv", "hadoop2.10/tiny/metrics_sort_run.csv", "hadoop3.2.1/tiny/metrics_sort_run.csv",
    "hadoop2.7/tiny/metrics_terasort_run.csv", "hadoop2.10/tiny/metrics_terasort_run.csv", "hadoop3.2.1/tiny/metrics_terasort_run.csv",
    "hadoop2.7/tiny/metrics_wordcount_run.csv", "hadoop2.10/tiny/metrics_wordcount_run.csv", "hadoop3.2.1/tiny/metrics_wordcount_run.csv",
    "hadoop2.7/tiny/metrics_aggregation_run.csv", "hadoop2.10/tiny/metrics_aggregation_run.csv", #, "hadoop3.2.1/tiny/metrics_bayes_run.csv")
    "hadoop2.7/tiny/metrics_pagerank_run.csv", "hadoop2.10/tiny/metrics_pagerank_run.csv",
    "hadoop2.7/tiny/metrics_scan_run.csv", "hadoop2.10/tiny/metrics_scan_run.csv",
    "hadoop2.7/tiny/metrics_join_run.csv", "hadoop2.10/tiny/metrics_join_run.csv" )

    all_files=c("hadoop2.7/small/metrics_sort_run.csv", "hadoop2.10/small/metrics_sort_run.csv", "hadoop3.2.1/small/metrics_sort_run.csv",
    "hadoop2.7/small/metrics_terasort_run.csv", "hadoop2.10/small/metrics_terasort_run.csv", "hadoop3.2.1/small/metrics_terasort_run.csv",
    "hadoop2.7/small/metrics_wordcount_run.csv", "hadoop2.10/small/metrics_wordcount_run.csv", "hadoop3.2.1/small/metrics_wordcount_run.csv",
    "hadoop2.7/small/metrics_aggregation_run.csv", "hadoop2.10/small/metrics_aggregation_run.csv", 
    "hadoop2.7/small/metrics_pagerank_run.csv", "hadoop2.10/small/metrics_pagerank_run.csv",
    "hadoop2.7/small/metrics_scan_run.csv", "hadoop2.10/small/metrics_scan_run.csv",
    "hadoop2.7/small/metrics_join_run.csv", "hadoop2.10/small/metrics_join_run.csv" )

    all_files=c("hadoop2.7/large/metrics_sort_run.csv", "hadoop2.10/large/metrics_sort_run.csv", "hadoop3.2.1/large/metrics_sort_run.csv",
    "hadoop2.7/large/metrics_terasort_run.csv", "hadoop2.10/large/metrics_terasort_run.csv", "hadoop3.2.1/large/metrics_terasort_run.csv",
    "hadoop2.7/large/metrics_wordcount_run.csv", "hadoop2.10/large/metrics_wordcount_run.csv", "hadoop3.2.1/large/metrics_wordcount_run.csv",
    "hadoop2.7/large/metrics_aggregation_run.csv", "hadoop2.10/large/metrics_aggregation_run.csv", 
    "hadoop2.7/large/metrics_pagerank_run.csv", "hadoop2.10/large/metrics_pagerank_run.csv",
    "hadoop2.7/large/metrics_scan_run.csv", "hadoop2.10/large/metrics_scan_run.csv",
    "hadoop2.7/large/metrics_join_run.csv", "hadoop2.10/large/metrics_join_run.csv" )
    
    all_files = c("hadoop2.7/tiny/metrics_sort_run.csv", "hadoop2.10/tiny/metrics_sort_run.csv", "hadoop3.2.1/tiny/metrics_sort_run.csv",
    "hadoop2.7/tiny/metrics_sort_prep.csv", "hadoop2.10/tiny/metrics_sort_prep.csv", "hadoop3.2.1/tiny/metrics_sort_prep.csv",
    "hadoop2.7/tiny/metrics_terasort_run.csv", "hadoop2.10/tiny/metrics_terasort_run.csv", "hadoop3.2.1/tiny/metrics_terasort_run.csv",
    "hadoop2.7/tiny/metrics_wordcount_run.csv", "hadoop2.10/tiny/metrics_wordcount_run.csv", "hadoop3.2.1/tiny/metrics_wordcount_run.csv",
    "hadoop2.7/tiny/metrics_aggregation_run.csv", "hadoop2.10/tiny/metrics_aggregation_run.csv", #, "hadoop3.2.1/tiny/metrics_bayes_run.csv")
    "hadoop2.7/tiny/metrics_pagerank_run.csv", "hadoop2.10/tiny/metrics_pagerank_run.csv",
    "hadoop2.7/tiny/metrics_scan_run.csv", "hadoop2.10/tiny/metrics_scan_run.csv",
    "hadoop2.7/tiny/metrics_join_run.csv", "hadoop2.10/tiny/metrics_join_run.csv",
    
   
    "hadoop2.7/large/metrics_sort_run.csv", "hadoop2.10/large/metrics_sort_run.csv", "hadoop3.2.1/large/metrics_sort_run.csv",
    "hadoop2.7/large/metrics_terasort_run.csv", "hadoop2.10/large/metrics_terasort_run.csv", "hadoop3.2.1/large/metrics_terasort_run.csv",
    "hadoop2.7/large/metrics_wordcount_run.csv", "hadoop2.10/large/metrics_wordcount_run.csv", "hadoop3.2.1/large/metrics_wordcount_run.csv",
    "hadoop2.7/large/metrics_aggregation_run.csv", "hadoop2.10/large/metrics_aggregation_run.csv", 
    "hadoop2.7/large/metrics_pagerank_run.csv", "hadoop2.10/large/metrics_pagerank_run.csv",
    "hadoop2.7/large/metrics_scan_run.csv", "hadoop2.10/large/metrics_scan_run.csv",
    "hadoop2.7/large/metrics_join_run.csv", "hadoop2.10/large/metrics_join_run.csv"
    )

    all_files=c(
    
    "hadoop-2.7.7/tiny/metrics_sort_run.csv", 
    "hadoop-2.7.7/tiny/metrics_terasort_run.csv", 
    "hadoop-2.7.7/tiny/metrics_wordcount_run.csv", 
    "hadoop-2.7.7/tiny/metrics_aggregation_run.csv", 
    #"hadoop-2.7.7/tiny/metrics_pagerank_run.csv", 
    "hadoop-2.7.7/tiny/metrics_scan_run.csv", 
    "hadoop-2.7.7/tiny/metrics_join_run.csv", 

    "hadoop-2.7.7/small/metrics_sort_run.csv", 
    "hadoop-2.7.7/small/metrics_terasort_run.csv", 
    "hadoop-2.7.7/small/metrics_wordcount_run.csv", 
    "hadoop-2.7.7/small/metrics_aggregation_run.csv", 
  #  "hadoop-2.7.7/small/metrics_pagerank_run.csv", 
    "hadoop-2.7.7/small/metrics_scan_run.csv", 
    "hadoop-2.7.7/small/metrics_join_run.csv", 
    
    "hadoop-2.7.7/large/metrics_sort_run.csv", 
    "hadoop-2.7.7/large/metrics_terasort_run.csv", 
    "hadoop-2.7.7/large/metrics_wordcount_run.csv", 
    "hadoop-2.7.7/large/metrics_aggregation_run.csv", 
   # "hadoop-2.7.7/large/metrics_pagerank_run.csv", 
    "hadoop-2.7.7/large/metrics_scan_run.csv", 
    "hadoop-2.7.7/large/metrics_join_run.csv",
    
    "hadoop-2.10.0/large/metrics_sort_run.csv", 
    "hadoop-2.10.0/large/metrics_terasort_run.csv", 
    "hadoop-2.10.0/large/metrics_wordcount_run.csv", 
    "hadoop-2.10.0/large/metrics_aggregation_run.csv", 
    "hadoop-2.10.0/large/metrics_scan_run.csv", 
    "hadoop-2.10.0/large/metrics_join_run.csv",
   
    "hadoop-2.10.0/small/metrics_sort_run.csv", 
    "hadoop-2.10.0/small/metrics_terasort_run.csv", 
    "hadoop-2.10.0/small/metrics_wordcount_run.csv", 
    "hadoop-2.10.0/small/metrics_aggregation_run.csv", 
    "hadoop-2.10.0/small/metrics_scan_run.csv", 
    "hadoop-2.10.0/small/metrics_join_run.csv",
   
    "hadoop-2.10.0/tiny/metrics_sort_run.csv", 
    "hadoop-2.10.0/tiny/metrics_terasort_run.csv", 
    "hadoop-2.10.0/tiny/metrics_wordcount_run.csv", 
    "hadoop-2.10.0/tiny/metrics_aggregation_run.csv", 
    "hadoop-2.10.0/tiny/metrics_scan_run.csv", 
    "hadoop-2.10.0/tiny/metrics_join_run.csv",
    
    "hadoop-3.2.1/large/metrics_sort_run.csv", 
    "hadoop-3.2.1/large/metrics_terasort_run.csv", 
    "hadoop-3.2.1/large/metrics_wordcount_run.csv", 
   
    "hadoop-3.2.1/small/metrics_sort_run.csv", 
    "hadoop-3.2.1/small/metrics_terasort_run.csv", 
    "hadoop-3.2.1/small/metrics_wordcount_run.csv", 

   
    "hadoop-3.2.1/tiny/metrics_sort_run.csv", 
    "hadoop-3.2.1/tiny/metrics_terasort_run.csv", 
    "hadoop-3.2.1/tiny/metrics_wordcount_run.csv"


    )

    numclusters = 6
  
    fullData = data.frame()
    count = 1
    vlines = array(0, length(all_files))
    for(i in 1:length(all_files))
    {
        inputfile = all_files[i]
        newDataWithNA = read.csv(inputfile)
        newDataWithNA[newDataWithNA < 0 ] <- NA
        newDataWithNA[newDataWithNA == Inf] <- NA
        newDataWithNA = newDataWithNA[, c(1:ncol(newDataWithNA))]
        newData <- na.omit(newDataWithNA)
        if(nrow(fullData) == 0)
        {
            fullData <- newData
        } else
        {
            fullData = rbind(fullData, newData)
        }
        rows = nrow(newData)
        if (count == 1)
        {
            vlines[count] = rows 
        } else {
            vlines[count] = rows + vlines[count - 1]
        }
        count=count + 1
    }
    fd <-fullData
    
#     for(i in 1:nrow(fd))
#     {
#         if (fd[i, 1] > 3 )
#             fd[i,1] = 3
#         if(fd[i, 2] > 1000 )
#             fd[i, 2] = 1000 
#         if(fd[i, 3] > 1000 )
#             fd[i, 3] = 1000
#         if(fd[i, 4] > 2 )
#             fd[i, 4] = 2    
#     }
    
    #fd=fd[, c(1,2,4,7)]
    kmeansObject6 = dokmeans(fd, 6)
    kmeansObject10 = dokmeans(fd, 10)
    #km = kmeans(metrics, numclusters, iter.max=100, nstart=1, algorithm="Lloyd")

    withCluster=cbind(fd, kmeansObject$cluster)
    colnames(withCluster)[ncol(withCluster)] = "Cluster"

    index=1
    for( j in 1:length(vlines))
    {
        if (j == 1) start = 1
        else start = vlines[j - 1]
        end = vlines[j]
        #filename=out_filenames[j]
        #print( paste("File: " , filename , " Title: " , titles[j]))
        
        #p = plotWithVLines(withCluster[c(start:end), ], vlines, end - start + 1, all_files[j], numclusters)
        #plot(p)
        #ggsave(paste(index, "png", sep="."), p)
        
         index=index + 1
#        phasecount=countPhaseDistribution(withCluster[c(start:end),],  6)
#        phaseCountFrame <-data.frame(
#        phase=c(1:6),
#        counts=phasecount
    }

    #ggplot(withCluster) + geom_point(aes(x=IPC,y=BranchInstructionsRatio,color=Cluster))
par(mfrow=c(3,2))
for(i in 1:numclusters)
{
    wc=subset(withCluster, withCluster$Cluster == i)
    plot(wc$BranchInstructionsRatio, wc[["IPC"]], main=paste("Cluster:", i), ylim=c(0, 2))
}


pcaout=prcomp(withCluster[ , c(1,2,3,4,5,6)], center=TRUE, scale=TRUE)
