.class public Lcom/mediatek/bluetooth/BluetoothApplication;
.super Landroid/app/Application;
.source "BluetoothApplication.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BluetoothApplication"


# instance fields
.field private mReceiver:Lcom/mediatek/bluetooth/BluetoothReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    .prologue
    .line 39
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 41
    const-string v1, "BluetoothApplication.onCreate"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 43
    new-instance v1, Lcom/mediatek/bluetooth/BluetoothReceiver;

    invoke-direct {v1}, Lcom/mediatek/bluetooth/BluetoothReceiver;-><init>()V

    iput-object v1, p0, Lcom/mediatek/bluetooth/BluetoothApplication;->mReceiver:Lcom/mediatek/bluetooth/BluetoothReceiver;

    .line 45
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 46
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 47
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 48
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 49
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lcom/mediatek/bluetooth/BluetoothApplication;->mReceiver:Lcom/mediatek/bluetooth/BluetoothReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/bluetooth/BluetoothApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 51
    return-void
.end method

.method public onTerminate()V
    .locals 1

    .prologue
    .line 58
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 60
    const-string v0, "BluetoothApplication.onTerminate"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/BluetoothApplication;->mReceiver:Lcom/mediatek/bluetooth/BluetoothReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/BluetoothApplication;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 63
    return-void
.end method
