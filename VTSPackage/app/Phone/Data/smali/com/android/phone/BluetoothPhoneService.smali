.class public Lcom/android/phone/BluetoothPhoneService;
.super Landroid/app/Service;
.source "BluetoothPhoneService.java"


# static fields
.field private static final DBG:Z = true

.field private static final MODIFY_PHONE_STATE:Ljava/lang/String; = "android.permission.MODIFY_PHONE_STATE"

.field private static final TAG:Ljava/lang/String; = "BluetoothPhoneService"

.field private static final VDBG:Z = true


# instance fields
.field private mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private final mBinder:Landroid/bluetooth/IBluetoothHeadsetPhone$Stub;

.field private mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 83
    new-instance v0, Lcom/android/phone/BluetoothPhoneService$1;

    invoke-direct {v0, p0}, Lcom/android/phone/BluetoothPhoneService$1;-><init>(Lcom/android/phone/BluetoothPhoneService;)V

    iput-object v0, p0, Lcom/android/phone/BluetoothPhoneService;->mBinder:Landroid/bluetooth/IBluetoothHeadsetPhone$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/BluetoothPhoneService;)Lcom/android/phone/BluetoothHandsfree;
    .locals 1
    .parameter "x0"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService;->mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 153
    const-string v0, "BluetoothPhoneService"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService;->mBinder:Landroid/bluetooth/IBluetoothHeadsetPhone$Stub;

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 48
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 50
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/BluetoothPhoneService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 51
    iget-object v1, p0, Lcom/android/phone/BluetoothPhoneService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v1, :cond_0

    .line 52
    const-string v1, "BluetoothPhoneService"

    const-string v2, "mAdapter null"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :goto_0
    return-void

    .line 58
    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 59
    .local v0, phoneApp:Lcom/android/phone/PhoneGlobals;
    iget-object v1, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v0, v1}, Lcom/android/phone/BluetoothHandsfree;->init(Landroid/content/Context;Lcom/android/internal/telephony/CallManager;)Lcom/android/phone/BluetoothHandsfree;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/BluetoothPhoneService;->mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 75
    const-string v0, "Stopping Bluetooth BluetoothPhoneService Service"

    invoke-static {v0}, Lcom/android/phone/BluetoothPhoneService;->log(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    .line 66
    const-string v0, "BluetoothPhoneService"

    const-string v1, "Stopping Bluetooth BluetoothPhoneService Service: device does not have BT"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    invoke-virtual {p0}, Lcom/android/phone/BluetoothPhoneService;->stopSelf()V

    .line 69
    :cond_0
    const-string v0, "BluetoothPhoneService"

    const-string v1, "BluetoothPhoneService started"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return-void
.end method
