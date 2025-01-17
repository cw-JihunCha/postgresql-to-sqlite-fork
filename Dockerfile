FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1
ENV psource=database.dump
ENV starget=sqllight.db
RUN mkdir -p /p2s
WORKDIR /p2s
COPY . ./
RUN sbt one-jar
RUN cp target/scala-2.11/postgresql-to-sqlite_2.11-1.0.1-one-jar.jar pq2sqlite.jar
CMD exec java -jar pq2sqlite.jar -d "$psource" -o "$starget"
