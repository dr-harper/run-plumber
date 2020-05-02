FROM amanas/r-runtime

LABEL maintainer="Andrés Mañas Mañas"

EXPOSE 8080

WORKDIR /app

COPY . .

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8080)"]

RUN ["app.R"]
