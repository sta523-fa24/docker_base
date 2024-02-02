FROM rocker/r-ubuntu:22.04

ADD Rprofile.site /usr/lib/R/etc/Rprofile.site

RUN install.r devtools rmarkdown tidyverse gifski \
 && installGithub.r rundel/checklist

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb \
    && DEBIAN_FRONTEND=noninteractive apt install ./quarto-1.3.450-linux-amd64.deb \
    && rm quarto-1.3.450-linux-amd64.deb

RUN apt-get update \
 && apt-get install -y pandoc libmagick++-dev


CMD ["bash"]
