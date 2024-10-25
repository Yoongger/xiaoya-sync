package cn.yoongger.xiaoyasync;

import cn.yoongger.xiaoyasync.util.Util;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * @Author Yoongger
 * @Date 2024/10/25 17:29
 * @Version 1.0.0
 */
@Log4j2
@Service
public class ScheduledTask {

    @Autowired
    private SyncService syncService;

    /**
     * 每日更新
     */
    @Scheduled(cron = "0 0 6,18 * * ?")
    public void syncUpdatedDaily() {
        Util.randomSleep();
        syncService.syncFiles("每日更新/");
    }

    /**
     * 全量同步
     */
    @Scheduled(fixedDelay = 1000 * 60 * 60 * 24 * 3, initialDelay = 1000 * 60 * 60)
    public void syncAll() {
        syncService.syncFiles("");
    }
}
