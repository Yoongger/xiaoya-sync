# xiaoya-sync

注意，这个docker容器会占用1GB的内存

同步小雅emby媒体库，每天早上晚上六点同步，服务启动也会执行一次。扫描一次大概10分钟。

自动删除本地过时文件夹及文件（小雅媒体库网站不存在的文件及文件夹，不会删除其他目录的文件），
只会同步以下指定文件夹：
```
每日更新/
电影/2023/
纪录片（已刮削）/
音乐/演唱会/
音乐/狄更斯：音乐剧 (2023)/
```

# 开发计划
- [x] 1.增加启动是否执行任务的开关
- [ ] 2.增加线程数配置，增加排除列表功能
- [ ] 3...

## docker部署 


```
部署前参数需要修改
/volume1/docker-data/xiaoya/xiaoya修改成媒体库路径
runAfterStartup  启动是否立即执行默认1启用，不启用填0
excludeList 排除列表 默认为空 不进行同步及删除的目录例如每日更新/动漫/.*,每日更新/动漫剧场版/.*
threadPoolNum 设置线程数默认199，设置越大占用内存CPU越高，同步速度相应会快一些
```

docker CLI安装

```
docker run -d \
--name=xiaoya-sync \
--network="host" \
-e TZ=Asia/Shanghai \
-e runAfterStartup=1 \
-e excludeList="" \
-e threadPoolNum="199" \
-v /volume1/docker-data/xiaoya/xiaoya:/data \
jacksaoding/xiaoya-sync:latest
```

docker compose安装

```
version: "3"
services:
  app:
    container_name: xiaoya-sync
    image: 'jacksaoding/xiaoya-sync:latest'
    network_mode: "host"
    environment:
      TZ: Asia/Shanghai
      runAfterStartup: 1
      excludeList: ""
      threadPoolNum: 199
    volumes:
      - /volume1/docker-data/xiaoya/xiaoya:/data
```
