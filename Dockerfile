FROM r-base
COPY . /myscripts
WORKDIR /myscripts
CMD ["Rscript", "myscript.R"]
