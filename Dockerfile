# Use the biobakery base image
FROM biobakery/base:1.1

RUN apt-get update && \
    apt-get install -y texlive pandoc && \
    /opt/conda/bin/conda install biobakery_workflows==0.13.2 && \
    /opt/conda/bin/conda install hclust2 && \
    /opt/conda/bin/conda install r && \
    /opt/conda/bin/R -q -e "install.packages('vegan', repos='http://cran.r-project.org')" && \
    /opt/conda/bin/conda install samtools=0.1.19 && \
    ln -s /opt/conda/bin/metaphlan_databases /opt/conda/bin/db_v20 && \
    /opt/conda/bin/conda clean --all --yes && \
    apt-get clean
