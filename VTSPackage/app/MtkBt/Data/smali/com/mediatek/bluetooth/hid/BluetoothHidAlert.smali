.class public Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;
.super Lcom/android/internal/app/AlertActivity;
.source "BluetoothHidAlert.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "[BT][HID][BluetoothHidAlert]"

.field private static sBindService:Z

.field private static sOnlyOnce:Z


# instance fields
.field mAction:Ljava/lang/String;

.field private mContentView:Landroid/widget/TextView;

.field mDeviceAddr:Ljava/lang/String;

.field mDeviceName:Ljava/lang/String;

.field private mHidServerNotifyConn:Landroid/content/ServiceConnection;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    .line 77
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sBindService:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 69
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceName:Ljava/lang/String;

    .line 71
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    .line 73
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    .line 81
    new-instance v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    .line 272
    new-instance v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$2;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$002(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    return-object p1
.end method

.method static synthetic access$102(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 61
    sput-boolean p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    return p0
.end method

.method private createView()Landroid/view/View;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 161
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030006

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 162
    .local v1, view:Landroid/view/View;
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 163
    .local v0, text:Ljava/lang/String;
    const v2, 0x7f08000d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mContentView:Landroid/widget/TextView;

    .line 164
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mContentView:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 165
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "disconnect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 166
    const v2, 0x7f05001c

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 172
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mContentView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    :cond_1
    return-object v1

    .line 167
    :cond_2
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "unplug"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 168
    const v2, 0x7f05001d

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 169
    :cond_3
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 170
    const v2, 0x7f05001e

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getDeviceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "btAddr"

    .prologue
    .line 216
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 218
    .local v0, mBD:Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 221
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 179
    packed-switch p2, :pswitch_data_0

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 182
    :pswitch_0
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v2, "disconnect"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 183
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->disconnectReq(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 189
    :catch_0
    move-exception v0

    .line 190
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 184
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v2, "unplug"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 185
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->unplugReq(Ljava/lang/String;)V

    goto :goto_0

    .line 186
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v2, "authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->authorizeReq(Ljava/lang/String;Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 197
    :pswitch_1
    const-string v1, "[BT][HID][BluetoothHidAlert]"

    const-string v2, "onClick:BUTTON_NEGATIVE"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    :try_start_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v2, "authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 201
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->authorizeReq(Ljava/lang/String;Z)V

    .line 203
    :cond_3
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->finishActionReq()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 204
    :catch_1
    move-exception v0

    .line 205
    .restart local v0       #e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 179
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    .line 93
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 95
    const-string v2, "[BT][HID][BluetoothHidAlert]"

    const-string v4, "onCreate"

    invoke-static {v2, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    sget-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    if-eqz v2, :cond_7

    .line 98
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 99
    .local v0, data:Landroid/os/Bundle;
    if-eqz v0, :cond_4

    const-string v2, "device_addr"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    iput-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    .line 100
    if-eqz v0, :cond_0

    const-string v2, "action"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_0
    iput-object v3, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    .line 102
    const-string v2, "[BT][HID][BluetoothHidAlert]"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bluetoothHidAlert "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 106
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getDeviceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceName:Ljava/lang/String;

    .line 110
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    .line 111
    .local v1, p:Lcom/android/internal/app/AlertController$AlertParams;
    const v2, 0x108009b

    iput v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mIconId:I

    .line 112
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 113
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "disconnect"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 114
    const v2, 0x7f050008

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 120
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->createView()Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 123
    :cond_3
    const v2, 0x7f05000e

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 124
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 125
    const v2, 0x7f05000f

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 126
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 127
    const/4 v2, 0x0

    sput-boolean v2, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    .line 128
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->setupAlert()V

    .line 133
    .end local v0           #data:Landroid/os/Bundle;
    .end local v1           #p:Lcom/android/internal/app/AlertController$AlertParams;
    :goto_2
    return-void

    .restart local v0       #data:Landroid/os/Bundle;
    :cond_4
    move-object v2, v3

    .line 99
    goto :goto_0

    .line 115
    .restart local v1       #p:Lcom/android/internal/app/AlertController$AlertParams;
    :cond_5
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "unplug"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 116
    const v2, 0x7f050009

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    goto :goto_1

    .line 117
    :cond_6
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v3, "authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 118
    const v2, 0x7f05000a

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    goto :goto_1

    .line 130
    .end local v0           #data:Landroid/os/Bundle;
    .end local v1           #p:Lcom/android/internal/app/AlertController$AlertParams;
    :cond_7
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->dismiss()V

    .line 131
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->cancel()V

    goto :goto_2
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 227
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onDestroy()V

    .line 229
    const-string v0, "[BT][HID][BluetoothHidAlert]"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 258
    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    const/4 v1, 0x3

    if-ne p1, v1, :cond_2

    .line 260
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mAction:Ljava/lang/String;

    const-string v2, "authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 261
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;->authorizeReq(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    :cond_1
    :goto_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    .line 267
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->finish()V

    .line 269
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/internal/app/AlertActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 235
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onPause()V

    .line 237
    const-string v0, "[BT][HID][BluetoothHidAlert]"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    return-void
.end method

.method protected onStart()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 136
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStart()V

    .line 138
    const-string v2, "[BT][HID][BluetoothHidAlert]"

    const-string v3, "onStart"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    .line 141
    .local v1, mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;
    if-nez v1, :cond_0

    .line 142
    const-string v2, "Bluetooth is not available"

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 143
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->finish()V

    .line 158
    :goto_0
    return-void

    .line 146
    :cond_0
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v2

    const/16 v3, 0xd

    if-eq v2, v3, :cond_2

    .line 147
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v3, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v2, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 149
    sput-boolean v4, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sBindService:Z

    .line 154
    :cond_1
    :goto_1
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 155
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "com.mediatek.bluetooth.hid.finish"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 157
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_0

    .line 152
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->finish()V

    goto :goto_1
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 244
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 246
    const-string v0, "[BT][HID][BluetoothHidAlert]"

    const-string v1, "onStop:unbind hid service"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sOnlyOnce:Z

    .line 249
    sget-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sBindService:Z

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mHidServerNotifyConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->unbindService(Landroid/content/ServiceConnection;)V

    .line 252
    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->sBindService:Z

    .line 253
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 254
    return-void
.end method
