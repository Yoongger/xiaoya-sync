FROM eclipse-temurin:8u422-b05-jre-jammy
LABEL authors=yoongger description="同步小雅emby媒体库" title=xiaoya-sync
COPY ./target/xiaoyasync.jar /xiaoyasync.jar
VOLUME ["/data", "/log"]
ENV TZ=Asia/Shanghai
ENV runAfterStartup="0"
ENV excludeList=""
ENV syncUrl=""
ENV syncDir=""
ENV dockerAddress=""
ENV tgToken=""
ENV tgUserId=""
ENV tgUserName="bot"
ENV logLevel=""
ENV retryDownEmptyFile="0"
ENV JAVA_OPTS="-Xms32m -Xmx512m"
ENV cron.daily=
ENV cron.all=
ENTRYPOINT ["sh","-c","java -jar $JAVA_OPTS -XX:+UseG1GC -XX:+OptimizeStringConcat -XX:+PrintGCDetails -Xloggc:/log/gc.log -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/log /xiaoyasync.jar"]