.class public Lcom/android/phone/CallTime;
.super Landroid/os/Handler;
.source "CallTime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/CallTime$CallTimeHandler;,
        Lcom/android/phone/CallTime$CallTimeReceiver;,
        Lcom/android/phone/CallTime$PeriodicTimerCallback;,
        Lcom/android/phone/CallTime$OnTickListener;
    }
.end annotation


# static fields
.field private static final ACTION_REMINDER:Ljava/lang/String; = "calltime_minute_reminder"

.field private static final CALL_TIME_UPDATE:I = 0x6f

.field private static final DBG:Z = true

.field private static final INTERVAL_TIME:I = 0x32

.field private static final LOG_TAG:Ljava/lang/String; = "PHONE/CallTime"

.field private static final MILLISECOND_TO_SECOND:I = 0x3e8

.field private static final MINUTE_TIME:I = 0x3c

.field private static final MINUTE_TO_MS:I = 0xea60

.field static final PROFILE:Z = true

.field private static final PROFILE_STATE_NONE:I = 0x0

.field private static final PROFILE_STATE_READY:I = 0x1

.field private static final PROFILE_STATE_RUNNING:I = 0x2

.field private static sCallTimeHanderThreadLooper:Landroid/os/Looper;

.field private static sProfileState:I

.field private static sSharePref:Landroid/content/SharedPreferences;


# instance fields
.field mAlarm:Landroid/app/AlarmManager;

.field mAlarmEnable:Z

.field private mCall:Lcom/android/internal/telephony/Call;

.field mCtx:Landroid/content/Context;

.field private mInterval:J

.field private mLastReportedTime:J

.field private mListener:Lcom/android/phone/CallTime$OnTickListener;

.field mReceiver:Lcom/android/phone/CallTime$CallTimeReceiver;

.field mReminderPendingIntent:Landroid/app/PendingIntent;

.field private mTimerCallback:Lcom/android/phone/CallTime$PeriodicTimerCallback;

.field private mTimerRunning:Z

.field private mTimerThreadHandler:Lcom/android/phone/CallTime$CallTimeHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 92
    const/4 v0, 0x0

    sput v0, Lcom/android/phone/CallTime;->sProfileState:I

    .line 105
    sput-object v1, Lcom/android/phone/CallTime;->sSharePref:Landroid/content/SharedPreferences;

    .line 115
    sput-object v1, Lcom/android/phone/CallTime;->sCallTimeHanderThreadLooper:Landroid/os/Looper;

    return-void
.end method

.method public constructor <init>(Lcom/android/phone/CallTime$OnTickListener;)V
    .locals 6
    .parameter "listener"

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 121
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 108
    iput-object v2, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    .line 109
    iput-object v2, p0, Lcom/android/phone/CallTime;->mCtx:Landroid/content/Context;

    .line 112
    iput-boolean v5, p0, Lcom/android/phone/CallTime;->mAlarmEnable:Z

    .line 122
    iput-object p1, p0, Lcom/android/phone/CallTime;->mListener:Lcom/android/phone/CallTime$OnTickListener;

    .line 123
    new-instance v2, Lcom/android/phone/CallTime$PeriodicTimerCallback;

    invoke-direct {v2, p0}, Lcom/android/phone/CallTime$PeriodicTimerCallback;-><init>(Lcom/android/phone/CallTime;)V

    iput-object v2, p0, Lcom/android/phone/CallTime;->mTimerCallback:Lcom/android/phone/CallTime$PeriodicTimerCallback;

    .line 125
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/CallTime;->mCtx:Landroid/content/Context;

    .line 126
    iget-object v2, p0, Lcom/android/phone/CallTime;->mCtx:Landroid/content/Context;

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    iput-object v2, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    .line 127
    iget-object v2, p0, Lcom/android/phone/CallTime;->mCtx:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "calltime_minute_reminder"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v5, v3, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/CallTime;->mReminderPendingIntent:Landroid/app/PendingIntent;

    .line 128
    new-instance v2, Lcom/android/phone/CallTime$CallTimeReceiver;

    invoke-direct {v2, p0}, Lcom/android/phone/CallTime$CallTimeReceiver;-><init>(Lcom/android/phone/CallTime;)V

    iput-object v2, p0, Lcom/android/phone/CallTime;->mReceiver:Lcom/android/phone/CallTime$CallTimeReceiver;

    .line 129
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 130
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "calltime_minute_reminder"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 131
    iget-object v2, p0, Lcom/android/phone/CallTime;->mCtx:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/phone/CallTime;->mReceiver:Lcom/android/phone/CallTime$CallTimeReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 133
    const-class v3, Lcom/android/phone/CallTime;

    monitor-enter v3

    .line 134
    :try_start_0
    sget-object v2, Lcom/android/phone/CallTime;->sCallTimeHanderThreadLooper:Landroid/os/Looper;

    if-nez v2, :cond_0

    .line 135
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "CallTimeHandlerThread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 136
    .local v1, handlerThread:Landroid/os/HandlerThread;
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 137
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    sput-object v2, Lcom/android/phone/CallTime;->sCallTimeHanderThreadLooper:Landroid/os/Looper;

    .line 139
    .end local v1           #handlerThread:Landroid/os/HandlerThread;
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    new-instance v2, Lcom/android/phone/CallTime$CallTimeHandler;

    sget-object v3, Lcom/android/phone/CallTime;->sCallTimeHanderThreadLooper:Landroid/os/Looper;

    invoke-direct {v2, p0, v3}, Lcom/android/phone/CallTime$CallTimeHandler;-><init>(Lcom/android/phone/CallTime;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/phone/CallTime;->mTimerThreadHandler:Lcom/android/phone/CallTime$CallTimeHandler;

    .line 141
    return-void

    .line 139
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 82
    invoke-static {p0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static getCallDuration(Lcom/android/internal/telephony/Call;)J
    .locals 11
    .parameter "call"

    .prologue
    .line 258
    const-wide/16 v3, 0x0

    .line 259
    .local v3, duration:J
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v1

    .line 260
    .local v1, connections:Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 262
    .local v2, count:I
    const/4 v8, 0x0

    .line 263
    .local v8, tReminder:Z
    const/4 v9, 0x1

    if-ne v2, v9, :cond_1

    .line 264
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 265
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v3

    .line 276
    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateElapsedTime, count="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", duration="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 277
    return-wide v3

    .line 267
    :cond_1
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v2, :cond_0

    .line 268
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 269
    .restart local v0       #c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v6

    .line 270
    .local v6, t:J
    cmp-long v9, v6, v3

    if-lez v9, :cond_2

    .line 271
    move-wide v3, v6

    .line 267
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 285
    const-string v0, "PHONE/CallTime"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CallTime] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    return-void
.end method

.method static setTraceReady()V
    .locals 2

    .prologue
    .line 300
    sget v0, Lcom/android/phone/CallTime;->sProfileState:I

    if-nez v0, :cond_0

    .line 301
    const/4 v0, 0x1

    sput v0, Lcom/android/phone/CallTime;->sProfileState:I

    .line 302
    const-string v0, "trace ready..."

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 306
    :goto_0
    return-void

    .line 304
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "current trace state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/android/phone/CallTime;->sProfileState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private updateElapsedTime(Lcom/android/internal/telephony/Call;)V
    .locals 5
    .parameter "call"

    .prologue
    .line 226
    iget-object v2, p0, Lcom/android/phone/CallTime;->mListener:Lcom/android/phone/CallTime$OnTickListener;

    if-eqz v2, :cond_0

    .line 227
    invoke-static {p1}, Lcom/android/phone/CallTime;->getCallDuration(Lcom/android/internal/telephony/Call;)J

    move-result-wide v0

    .line 228
    .local v0, duration:J
    iget-object v2, p0, Lcom/android/phone/CallTime;->mListener:Lcom/android/phone/CallTime$OnTickListener;

    const-wide/16 v3, 0x3e8

    div-long v3, v0, v3

    invoke-interface {v2, v3, v4}, Lcom/android/phone/CallTime$OnTickListener;->onTickForCallTimeElapsed(J)V

    .line 230
    .end local v0           #duration:J
    :cond_0
    return-void
.end method


# virtual methods
.method cancelTimer()V
    .locals 2

    .prologue
    .line 218
    const-string v0, "cancelTimer()..."

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Lcom/android/phone/CallTime;->mTimerThreadHandler:Lcom/android/phone/CallTime$CallTimeHandler;

    iget-object v1, p0, Lcom/android/phone/CallTime;->mTimerCallback:Lcom/android/phone/CallTime$PeriodicTimerCallback;

    invoke-virtual {v0, v1}, Lcom/android/phone/CallTime$CallTimeHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 220
    const/16 v0, 0x6f

    invoke-virtual {p0, v0}, Lcom/android/phone/CallTime;->removeMessages(I)V

    .line 221
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/CallTime;->mTimerRunning:Z

    .line 222
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->stopReminder()V

    .line 223
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 146
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 158
    :goto_0
    return-void

    .line 148
    :pswitch_0
    const-string v0, "receive CALL_TIME_UPDATE message"

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->isTraceRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->stopTrace()V

    .line 152
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/CallTime;->mTimerRunning:Z

    .line 153
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->periodicUpdateTimer()V

    goto :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x6f
        :pswitch_0
    .end packed-switch
.end method

.method isTraceReady()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 309
    sget v1, Lcom/android/phone/CallTime;->sProfileState:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isTraceRunning()Z
    .locals 2

    .prologue
    .line 313
    sget v0, Lcom/android/phone/CallTime;->sProfileState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method periodicUpdateTimer()V
    .locals 9

    .prologue
    .line 187
    iget-boolean v5, p0, Lcom/android/phone/CallTime;->mTimerRunning:Z

    if-nez v5, :cond_3

    .line 188
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/phone/CallTime;->mTimerRunning:Z

    .line 190
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 191
    .local v2, now:J
    iget-wide v5, p0, Lcom/android/phone/CallTime;->mLastReportedTime:J

    iget-wide v7, p0, Lcom/android/phone/CallTime;->mInterval:J

    add-long v0, v5, v7

    .line 193
    .local v0, nextReport:J
    :goto_0
    cmp-long v5, v2, v0

    if-ltz v5, :cond_0

    .line 194
    iget-wide v5, p0, Lcom/android/phone/CallTime;->mInterval:J

    add-long/2addr v0, v5

    goto :goto_0

    .line 197
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "periodicUpdateTimer() @ "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 198
    iget-object v5, p0, Lcom/android/phone/CallTime;->mTimerThreadHandler:Lcom/android/phone/CallTime$CallTimeHandler;

    iget-object v6, p0, Lcom/android/phone/CallTime;->mTimerCallback:Lcom/android/phone/CallTime$PeriodicTimerCallback;

    invoke-virtual {v5, v6, v0, v1}, Lcom/android/phone/CallTime$CallTimeHandler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 199
    iput-wide v0, p0, Lcom/android/phone/CallTime;->mLastReportedTime:J

    .line 201
    iget-object v5, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    if-eqz v5, :cond_1

    .line 202
    iget-object v5, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    .line 204
    .local v4, state:Lcom/android/internal/telephony/Call$State;
    sget-object v5, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_1

    .line 205
    iget-object v5, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    invoke-direct {p0, v5}, Lcom/android/phone/CallTime;->updateElapsedTime(Lcom/android/internal/telephony/Call;)V

    .line 209
    .end local v4           #state:Lcom/android/internal/telephony/Call$State;
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->isTraceReady()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 210
    invoke-virtual {p0}, Lcom/android/phone/CallTime;->startTrace()V

    .line 215
    .end local v0           #nextReport:J
    .end local v2           #now:J
    :cond_2
    :goto_1
    return-void

    .line 213
    :cond_3
    const-string v5, "periodicUpdateTimer: timer already running, bail"

    invoke-static {v5}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method reset()V
    .locals 4

    .prologue
    .line 182
    const-string v0, "reset()..."

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 183
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/phone/CallTime;->mInterval:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/phone/CallTime;->mLastReportedTime:J

    .line 184
    return-void
.end method

.method setActiveCallMode(Lcom/android/internal/telephony/Call;)V
    .locals 3
    .parameter "call"

    .prologue
    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setActiveCallMode("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 169
    iput-object p1, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    .line 172
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lcom/android/phone/CallTime;->mInterval:J

    .line 173
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.android.phone_preferences"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/android/phone/CallTime;->sSharePref:Landroid/content/SharedPreferences;

    .line 175
    sget-object v0, Lcom/android/phone/CallTime;->sSharePref:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 176
    const-string v0, "setActiveCallMode: can not find \'com.android.phone_preferences\'..."

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 178
    :cond_0
    invoke-static {p1}, Lcom/android/phone/CallTime;->getCallDuration(Lcom/android/internal/telephony/Call;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/android/phone/CallTime;->startReminder(J)V

    .line 179
    return-void
.end method

.method public setCallTimeListener(Lcom/android/phone/CallTime$OnTickListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 282
    iput-object p1, p0, Lcom/android/phone/CallTime;->mListener:Lcom/android/phone/CallTime$OnTickListener;

    .line 283
    return-void
.end method

.method startReminder(J)V
    .locals 9
    .parameter "duration"

    .prologue
    const-wide/32 v7, 0xea60

    const-wide/32 v5, 0xc350

    .line 358
    sget-object v3, Lcom/android/phone/CallTime;->sSharePref:Landroid/content/SharedPreferences;

    if-nez v3, :cond_1

    .line 376
    :cond_0
    :goto_0
    return-void

    .line 362
    :cond_1
    iget-object v3, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    iget-object v4, p0, Lcom/android/phone/CallTime;->mReminderPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, v4}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 363
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/phone/CallTime;->mAlarmEnable:Z

    .line 364
    rem-long v0, p1, v7

    .line 365
    .local v0, rem:J
    cmp-long v3, v0, v5

    if-gez v3, :cond_2

    .line 366
    sub-long p1, v5, v0

    .line 371
    :goto_1
    sget-object v3, Lcom/android/phone/CallTime;->sSharePref:Landroid/content/SharedPreferences;

    const-string v4, "minute_reminder_key"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 372
    .local v2, tReminder:Z
    if-eqz v2, :cond_0

    .line 373
    iget-object v3, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    const/4 v4, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    add-long/2addr v5, p1

    iget-object v7, p0, Lcom/android/phone/CallTime;->mReminderPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_0

    .line 368
    .end local v2           #tReminder:Z
    :cond_2
    sub-long v3, v7, v0

    add-long p1, v3, v5

    goto :goto_1
.end method

.method startTrace()V
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 317
    sget v6, Lcom/android/phone/CallTime;->sProfileState:I

    if-ne v6, v4, :cond_4

    :goto_0
    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_3

    .line 321
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    const-string v6, "phoneTrace"

    invoke-virtual {v4, v6, v5}, Lcom/android/phone/PhoneGlobals;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    .line 322
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 323
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 325
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "callstate"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 326
    .local v0, baseName:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".data"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 327
    .local v1, dataFile:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".key"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 329
    .local v3, keyFile:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    .end local v2           #file:Ljava/io/File;
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 330
    .restart local v2       #file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 331
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 334
    :cond_1
    new-instance v2, Ljava/io/File;

    .end local v2           #file:Ljava/io/File;
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 335
    .restart local v2       #file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 336
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 339
    :cond_2
    const/4 v4, 0x2

    sput v4, Lcom/android/phone/CallTime;->sProfileState:I

    .line 340
    const-string v4, "startTrace"

    invoke-static {v4}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 341
    const/high16 v4, 0x80

    invoke-static {v0, v4}, Landroid/os/Debug;->startMethodTracing(Ljava/lang/String;I)V

    .line 343
    .end local v0           #baseName:Ljava/lang/String;
    .end local v1           #dataFile:Ljava/lang/String;
    .end local v2           #file:Ljava/io/File;
    .end local v3           #keyFile:Ljava/lang/String;
    :cond_3
    return-void

    :cond_4
    move v4, v5

    .line 317
    goto/16 :goto_0
.end method

.method stopReminder()V
    .locals 2

    .prologue
    .line 380
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/CallTime;->mAlarmEnable:Z

    .line 381
    iget-object v0, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/android/phone/CallTime;->mReminderPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 382
    return-void
.end method

.method stopTrace()V
    .locals 2

    .prologue
    .line 347
    sget v0, Lcom/android/phone/CallTime;->sProfileState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 348
    const/4 v0, 0x0

    sput v0, Lcom/android/phone/CallTime;->sProfileState:I

    .line 349
    const-string v0, "stopTrace"

    invoke-static {v0}, Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V

    .line 350
    invoke-static {}, Landroid/os/Debug;->stopMethodTracing()V

    .line 353
    :cond_0
    return-void
.end method

.method updateRminder()V
    .locals 8

    .prologue
    .line 386
    iget-object v2, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    if-eqz v2, :cond_0

    .line 387
    iget-object v2, p0, Lcom/android/phone/CallTime;->mCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    .line 388
    .local v1, state:Lcom/android/internal/telephony/Call$State;
    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_0

    .line 389
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v0, v2, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    .line 390
    .local v0, notifier:Lcom/android/phone/CallNotifier;
    invoke-virtual {v0}, Lcom/android/phone/CallNotifier;->onTimeToReminder()V

    .line 391
    iget-object v2, p0, Lcom/android/phone/CallTime;->mAlarm:Landroid/app/AlarmManager;

    const/4 v3, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/32 v6, 0xea60

    add-long/2addr v4, v6

    iget-object v6, p0, Lcom/android/phone/CallTime;->mReminderPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 395
    .end local v0           #notifier:Lcom/android/phone/CallNotifier;
    .end local v1           #state:Lcom/android/internal/telephony/Call$State;
    :cond_0
    return-void
.end method
