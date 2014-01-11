.class public Lcom/android/settings/bluetooth/BluetoothDiscoverableTimeoutReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothDiscoverableTimeoutReceiver.java"


# static fields
.field private static final INTENT_DISCOVERABLE_TIMEOUT:Ljava/lang/String; = "android.bluetooth.intent.DISCOVERABLE_TIMEOUT"

.field private static final TAG:Ljava/lang/String; = "BluetoothDiscoverableTimeoutReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static cancelDiscoverableAlarm(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 59
    const-string v3, "BluetoothDiscoverableTimeoutReceiver"

    const-string v4, "cancelDiscoverableAlarm(): Enter"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.bluetooth.intent.DISCOVERABLE_TIMEOUT"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 62
    .local v1, intent:Landroid/content/Intent;
    const-class v3, Lcom/android/settings/bluetooth/BluetoothDiscoverableTimeoutReceiver;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 63
    const/4 v3, 0x0

    const/high16 v4, 0x2000

    invoke-static {p0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 65
    .local v2, pending:Landroid/app/PendingIntent;
    if-eqz v2, :cond_0

    .line 67
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 70
    .local v0, alarmManager:Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 72
    .end local v0           #alarmManager:Landroid/app/AlarmManager;
    :cond_0
    return-void
.end method

.method static setDiscoverableAlarm(Landroid/content/Context;J)V
    .locals 7
    .parameter "context"
    .parameter "alarmTime"

    .prologue
    const/4 v6, 0x0

    .line 38
    const-string v3, "BluetoothDiscoverableTimeoutReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setDiscoverableAlarm(): alarmTime = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.bluetooth.intent.DISCOVERABLE_TIMEOUT"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 41
    .local v1, intent:Landroid/content/Intent;
    const-class v3, Lcom/android/settings/bluetooth/BluetoothDiscoverableTimeoutReceiver;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 42
    invoke-static {p0, v6, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 44
    .local v2, pending:Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 47
    .local v0, alarmManager:Landroid/app/AlarmManager;
    if-eqz v2, :cond_0

    .line 49
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 50
    const-string v3, "BluetoothDiscoverableTimeoutReceiver"

    const-string v4, "setDiscoverableAlarm(): cancel prev alarm"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :cond_0
    invoke-static {p0, v6, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 55
    invoke-virtual {v0, v6, p1, p2, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 56
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 76
    invoke-static {}, Lcom/android/settings/bluetooth/LocalBluetoothAdapter;->getInstance()Lcom/android/settings/bluetooth/LocalBluetoothAdapter;

    move-result-object v0

    .line 78
    .local v0, localBluetoothAdapter:Lcom/android/settings/bluetooth/LocalBluetoothAdapter;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/settings/bluetooth/LocalBluetoothAdapter;->getState()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_0

    .line 80
    const-string v1, "BluetoothDiscoverableTimeoutReceiver"

    const-string v2, "Disable discoverable..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/android/settings/bluetooth/LocalBluetoothAdapter;->setScanMode(I)V

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    const-string v1, "BluetoothDiscoverableTimeoutReceiver"

    const-string v2, "localBluetoothAdapter is NULL!!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
