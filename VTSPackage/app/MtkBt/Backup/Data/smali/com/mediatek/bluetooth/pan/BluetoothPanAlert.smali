.class public Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;
.super Lcom/android/internal/app/AlertActivity;
.source "BluetoothPanAlert.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final BLUETOOTHNOTIFYALERT:I = 0x1

.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "[BT][PAN][BluetoothPanAlert]"

.field private static sOnlyOnce:Z


# instance fields
.field mAction:Ljava/lang/String;

.field private mContentView:Landroid/widget/TextView;

.field mDeviceAddr:Ljava/lang/String;

.field mDeviceName:Ljava/lang/String;

.field private mPanAction:Landroid/content/ServiceConnection;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    .line 68
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    .line 72
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    .line 80
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mPanAction:Landroid/content/ServiceConnection;

    .line 92
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$2;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$002(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;)Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    return-object p1
.end method

.method private createView()Landroid/view/View;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 176
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030007

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 177
    .local v1, view:Landroid/view/View;
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 178
    .local v0, text:Ljava/lang/String;
    const v2, 0x7f08000d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mContentView:Landroid/widget/TextView;

    .line 179
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mContentView:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 180
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_GN_device_authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 181
    const v2, 0x7f050044

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 189
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mContentView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    :cond_1
    return-object v1

    .line 182
    :cond_2
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_NAP_device_authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 183
    const v2, 0x7f050045

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 184
    :cond_3
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_GN_device_connected"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 185
    const v2, 0x7f050048

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 186
    :cond_4
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_NAP_device_connected"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    const v2, 0x7f050049

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getDeviceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "btAddr"

    .prologue
    .line 230
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 232
    .local v0, mBD:Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_0

    .line 233
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 235
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v4, 0x1

    .line 198
    packed-switch p2, :pswitch_data_0

    .line 225
    :cond_0
    :goto_0
    sput-boolean v4, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    .line 226
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->finish()V

    .line 227
    return-void

    .line 200
    :pswitch_0
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_GN_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_NAP_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 202
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;->authorizeRspAction(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 203
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_GN_device_connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_NAP_device_connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    :cond_3
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;->disconnectPanDeviceAction(Ljava/lang/String;)V

    goto :goto_0

    .line 212
    :pswitch_1
    const-string v1, "[BT][PAN][BluetoothPanAlert]"

    const-string v2, "onClick:BUTTON_NEGATIVE"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_GN_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_NAP_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    :cond_4
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;->authorizeRspAction(Ljava/lang/String;Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 198
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

    .line 108
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 110
    const-string v2, "[BT][PAN][BluetoothPanAlert]"

    const-string v4, "onCreate"

    invoke-static {v2, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    sget-boolean v2, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    if-eqz v2, :cond_8

    .line 113
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 114
    .local v0, data:Landroid/os/Bundle;
    if-eqz v0, :cond_4

    const-string v2, "device_addr"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    .line 115
    if-eqz v0, :cond_0

    const-string v2, "action"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_0
    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    .line 117
    const-string v2, "[BT][PAN][BluetoothPanAlert]"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bluetoothPanAlert "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 121
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getDeviceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceName:Ljava/lang/String;

    .line 125
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    .line 126
    .local v1, p:Lcom/android/internal/app/AlertController$AlertParams;
    const v2, 0x108009b

    iput v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mIconId:I

    .line 127
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 128
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_GN_device_authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 129
    const v2, 0x7f050042

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 137
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->createView()Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 140
    :cond_3
    const v2, 0x7f05004a

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 141
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 142
    const v2, 0x7f05004b

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 143
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 144
    const/4 v2, 0x0

    sput-boolean v2, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    .line 145
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->setupAlert()V

    .line 147
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 152
    .end local v0           #data:Landroid/os/Bundle;
    .end local v1           #p:Lcom/android/internal/app/AlertController$AlertParams;
    :goto_2
    return-void

    .restart local v0       #data:Landroid/os/Bundle;
    :cond_4
    move-object v2, v3

    .line 114
    goto :goto_0

    .line 130
    .restart local v1       #p:Lcom/android/internal/app/AlertController$AlertParams;
    :cond_5
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_NAP_device_authorize"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 131
    const v2, 0x7f050043

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    goto :goto_1

    .line 132
    :cond_6
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_GN_device_connected"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 133
    const v2, 0x7f050046

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    goto :goto_1

    .line 134
    :cond_7
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v3, "bt_pan_NAP_device_connected"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 135
    const v2, 0x7f050047

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    goto :goto_1

    .line 149
    .end local v0           #data:Landroid/os/Bundle;
    .end local v1           #p:Lcom/android/internal/app/AlertController$AlertParams;
    :cond_8
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->dismiss()V

    .line 150
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->cancel()V

    goto :goto_2
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 241
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onDestroy()V

    .line 243
    const-string v0, "[BT][PAN][BluetoothPanAlert]"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 246
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 268
    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    const/4 v1, 0x3

    if-ne p1, v1, :cond_3

    .line 269
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_GN_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mAction:Ljava/lang/String;

    const-string v2, "bt_pan_NAP_device_authorize"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 272
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mDeviceAddr:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;->authorizeRspAction(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    :cond_2
    :goto_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    .line 278
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->finish()V

    .line 280
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/android/internal/app/AlertActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1

    .line 273
    :catch_0
    move-exception v0

    .line 274
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 250
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onPause()V

    .line 252
    const-string v0, "[BT][PAN][BluetoothPanAlert]"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    return-void
.end method

.method protected onStart()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 157
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStart()V

    .line 159
    const-string v1, "[BT][PAN][BluetoothPanAlert]"

    const-string v2, "onStart"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 162
    .local v0, mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;
    if-nez v0, :cond_0

    .line 163
    const-string v1, "Bluetooth is not available"

    invoke-static {p0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 164
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->finish()V

    .line 173
    :goto_0
    return-void

    .line 167
    :cond_0
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v1

    const/16 v2, 0xd

    if-eq v1, v2, :cond_1

    .line 168
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mPanAction:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v1, v2, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    .line 171
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->finish()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 258
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 260
    const-string v0, "[BT][PAN][BluetoothPanAlert]"

    const-string v1, "onStop:unbind pan service"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->sOnlyOnce:Z

    .line 263
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mPanAction:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->unbindService(Landroid/content/ServiceConnection;)V

    .line 264
    return-void
.end method
