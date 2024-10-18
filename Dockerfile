FROM rocker/r-ubuntu:22.04

ADD Rprofile.site /usr/lib/R/etc/Rprofile.site

RUN install.r devtools rmarkdown tidyverse gifski png \
 && installGithub.r rundel/checklist

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.5.56/quarto-1.5.56-linux-amd64.deb \
    && DEBIAN_FRONTEND=noninteractive apt install ./quarto-*-linux-amd64.deb \
    && rm quarto-*-linux-amd64.deb

RUN apt-get update \
 && apt-get install -y pandoc libmagick++-dev


CMD ["bash"]
