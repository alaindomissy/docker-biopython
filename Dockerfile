FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

# NEEDED in ubuntu docker container (indeed!)
# fix ther errors trying to import pyplot
# see https://github.com/conda/conda/issues/1051
# but not working?
# RUN apt-get install libsm6 libxrender1 libfontconfig1

## INSTALL BLAST THIS WAY !?
############################
#install blast
#
#    ```
#    sudo apt-get install ncbi-blast+
#    ```
#
#the above installs in an outdated version on ubuntu 14.04, which is buggy
#
#    ```
#    $ blastn -version
#    blastn: 2.2.28+
#    Package: blast 2.2.28, build Jun  3 2013 11:17:14
#    ```
#
#do this instead:
#
#    ```
#    conda install -c https://conda.anaconda.org/bioconda blast
#    ```
#
#actually no, it is not working either! so do this instead:
#
#    ```
#    $ wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz
#    $ tar xvfp ncbi-blast-2.3.0+-x64-linux.tar.gz
#    $ export PATH=”$PATH:$HOME/ncbi-blast-2.2.29+/bin”
#    $ mkdir ./ncbi-blast-2.2.29+/db
#    $export BLASTDB=”$HOME/ncbi-blast-2.2.29+/db”

# ubunutu bio cli tools
RUN apt-get install -y \
  libgomp1 \
  ncbi-blast+ \
  bedtools \
  conda install -y -c https://conda.anaconda.org/bioconda blast && \
  conda install -y -c https://conda.anaconda.org/bioconda pybedtools==0.7.4 && \
  conda install -y biopython==1.66

ENV PATH /opt/blast/bin:$PATH


# other bio cli tools
#####################
# RUN apt-get install tabix
# RUN apt-get install igv     # igv not working in container, Twould need to generate graphics file wo X Xserver

# other bio pip packages
#########################
# RUN pip install primer3-py     # would need gcc

# other bio conda packages
##########################
# RUN conda install -y pysam==0.8.4