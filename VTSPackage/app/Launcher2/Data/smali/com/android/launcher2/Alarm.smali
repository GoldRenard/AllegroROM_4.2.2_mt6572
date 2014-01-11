.class public Lcom/android/launcher2/Alarm;
.super Ljava/lang/Object;
.source "Alarm.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "Alarm"


# instance fields
.field private mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

.field private mAlarmPending:Z

.field private mAlarmTriggerTime:J

.field private mHandler:Landroid/os/Handler;

.field private mWaitingForCallback:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Alarm;->mAlarmPending:Z

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Alarm;->mHandler:Landroid/os/Handler;

    .line 37
    return-void
.end method


# virtual methods
.method public alarmPending()Z
    .locals 1

    .prologue
    .line 94
    iget-boolean v0, p0, Lcom/android/launcher2/Alarm;->mAlarmPending:Z

    return v0
.end method

.method public cancelAlarm()V
    .locals 3

    .prologue
    .line 61
    const-string v0, "Alarm"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cancel alarm here: mAlarmListener = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Alarm;->mAlarmPending:Z

    .line 66
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const-wide/16 v7, 0x0

    const/4 v6, 0x0

    .line 70
    iput-boolean v6, p0, Lcom/android/launcher2/Alarm;->mWaitingForCallback:Z

    .line 71
    iget-wide v2, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    cmp-long v2, v2, v7

    if-eqz v2, :cond_0

    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 75
    .local v0, currentTime:J
    const-string v2, "Alarm"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "run: mAlarmTriggerTime = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", currentTime = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mAlarmListener = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-wide v2, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    cmp-long v2, v2, v0

    if-lez v2, :cond_1

    .line 82
    iget-object v2, p0, Lcom/android/launcher2/Alarm;->mHandler:Landroid/os/Handler;

    iget-wide v3, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    sub-long/2addr v3, v0

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 83
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/launcher2/Alarm;->mWaitingForCallback:Z

    .line 91
    .end local v0           #currentTime:J
    :cond_0
    :goto_0
    return-void

    .line 85
    .restart local v0       #currentTime:J
    :cond_1
    iput-boolean v6, p0, Lcom/android/launcher2/Alarm;->mAlarmPending:Z

    .line 86
    iget-object v2, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    if-eqz v2, :cond_0

    .line 87
    iget-object v2, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-interface {v2, p0}, Lcom/android/launcher2/OnAlarmListener;->onAlarm(Lcom/android/launcher2/Alarm;)V

    goto :goto_0
.end method

.method public setAlarm(J)V
    .locals 6
    .parameter "millisecondsInFuture"

    .prologue
    const/4 v5, 0x1

    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 47
    .local v0, currentTime:J
    iput-boolean v5, p0, Lcom/android/launcher2/Alarm;->mAlarmPending:Z

    .line 48
    add-long v2, v0, p1

    iput-wide v2, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    .line 50
    const-string v2, "Alarm"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setAlarm: currentTime = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", millisecondsInFuture = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mAlarmListener = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-boolean v2, p0, Lcom/android/launcher2/Alarm;->mWaitingForCallback:Z

    if-nez v2, :cond_0

    .line 54
    iget-object v2, p0, Lcom/android/launcher2/Alarm;->mHandler:Landroid/os/Handler;

    iget-wide v3, p0, Lcom/android/launcher2/Alarm;->mAlarmTriggerTime:J

    sub-long/2addr v3, v0

    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 55
    iput-boolean v5, p0, Lcom/android/launcher2/Alarm;->mWaitingForCallback:Z

    .line 57
    :cond_0
    return-void
.end method

.method public setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V
    .locals 0
    .parameter "alarmListener"

    .prologue
    .line 40
    iput-object p1, p0, Lcom/android/launcher2/Alarm;->mAlarmListener:Lcom/android/launcher2/OnAlarmListener;

    .line 41
    return-void
.end method
