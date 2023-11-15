FROM mcr.microsoft.com/mssql/server:2022-latest 

USER root

RUN apt-get update
RUN apt-get install -yq curl apt-transport-https gnupg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list | tee /etc/apt/sources.list.d/mssql-server-2022.list 

RUN apt-get install -y mssql-server-fts
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER mssql

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]