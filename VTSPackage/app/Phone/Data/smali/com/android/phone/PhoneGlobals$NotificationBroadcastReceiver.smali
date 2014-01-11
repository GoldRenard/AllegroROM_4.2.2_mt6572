.class public Lcom/android/phone/PhoneGlobals$NotificationBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhoneGlobals.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneGlobals;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotificationBroadcastReceiver"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2149
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private clearMissedCallNotification(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 2206
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/phone/ClearMissedCallsService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2207
    .local v0, clearIntent:Landroid/content/Intent;
    const-string v1, "com.android.phone.intent.CLEAR_MISSED_CALLS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2208
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 2209
    return-void
.end method

.method private closeSystemDialogs(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 2201
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2202
    .local v0, intent:Landroid/content/Intent;
    sget-object v1, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 2203
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 2152
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 2154
    .local v0, action:Ljava/lang/String;
    const-string v6, "PhoneGlobals"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Broadcast from Notification: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2156
    const-string v6, "com.android.phone.ACTION_HANG_UP_ONGOING_CALL"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2157
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v6

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v6}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/CallManager;)Z

    .line 2198
    :goto_0
    return-void

    .line 2158
    :cond_0
    const-string v6, "com.android.phone.ACTION_CALL_BACK_FROM_NOTIFICATION"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2160
    invoke-direct {p0, p1}, Lcom/android/phone/PhoneGlobals$NotificationBroadcastReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    .line 2161
    invoke-direct {p0, p1}, Lcom/android/phone/PhoneGlobals$NotificationBroadcastReceiver;->clearMissedCallNotification(Landroid/content/Context;)V

    .line 2162
    const-string v6, "keyguard"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/KeyguardManager;

    .line 2163
    .local v4, km:Landroid/app/KeyguardManager;
    invoke-virtual {v4}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2164
    const-string v6, "PhoneGlobals"

    const-string v7, "Disable keyguard!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2166
    :try_start_0
    const-string v6, "activity"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    invoke-static {v6}, Landroid/app/ActivityManagerNative;->asInterface(Landroid/os/IBinder;)Landroid/app/IActivityManager;

    move-result-object v1

    .line 2167
    .local v1, am:Landroid/app/IActivityManager;
    invoke-interface {v1}, Landroid/app/IActivityManager;->dismissKeyguardOnNextActivity()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2174
    .end local v1           #am:Landroid/app/IActivityManager;
    :goto_1
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.intent.action.CALL_PRIVILEGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2175
    .local v2, callIntent:Landroid/content/Intent;
    const/high16 v6, 0x1080

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2177
    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2168
    .end local v2           #callIntent:Landroid/content/Intent;
    :catch_0
    move-exception v3

    .line 2169
    .local v3, e:Landroid/os/RemoteException;
    const-string v6, "PhoneGlobals"

    const-string v7, "RemoteException happened in NotificationBroadcastReceiver.onReceive()."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2172
    .end local v3           #e:Landroid/os/RemoteException;
    :cond_1
    const-string v6, "PhoneGlobals"

    const-string v7, "Keyguard not enable!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2178
    .end local v4           #km:Landroid/app/KeyguardManager;
    :cond_2
    const-string v6, "com.android.phone.ACTION_SEND_SMS_FROM_NOTIFICATION"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 2180
    invoke-direct {p0, p1}, Lcom/android/phone/PhoneGlobals$NotificationBroadcastReceiver;->closeSystemDialogs(Landroid/content/Context;)V

    .line 2181
    invoke-direct {p0, p1}, Lcom/android/phone/PhoneGlobals$NotificationBroadcastReceiver;->clearMissedCallNotification(Landroid/content/Context;)V

    .line 2183
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.SENDTO"

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2184
    .local v5, smsIntent:Landroid/content/Intent;
    const/high16 v6, 0x1000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2189
    :try_start_1
    invoke-virtual {p1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 2190
    :catch_1
    move-exception v3

    .line 2191
    .local v3, e:Landroid/content/ActivityNotFoundException;
    const-string v6, "PhoneGlobals"

    const-string v7, "start sms activity fail, sms is not available"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2195
    .end local v3           #e:Landroid/content/ActivityNotFoundException;
    .end local v5           #smsIntent:Landroid/content/Intent;
    :cond_3
    const-string v6, "PhoneGlobals"

    const-string v7, "Received hang-up request from notification, but there\'s no call the system can hang up."

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
