.class public Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;
.super Landroid/app/Activity;
.source "BluetoothServerAuthorize.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# static fields
.field public static final ACTION_CANCEL:Ljava/lang/String; = "com.mediatek.bluetooth.extra.action_cancel"

.field public static final ACTION_RETURN:Ljava/lang/String; = "com.mediatek.bluetooth.extra.action_return"

.field public static final AUTHORIZE_ALWAYS_ALLOWED:Ljava/lang/String; = "com.mediatek.bluetooth.extra.authorize_always_allowed"

.field public static final AUTHORIZE_RESULT:Ljava/lang/String; = "com.mediatek.bluetooth.extra.authorize_result"

.field private static final AUTHORIZE_TIMEOUT_IND:I = 0x65

.field public static final DEVICE_NAME:Ljava/lang/String; = "com.mediatek.bluetooth.extra.device_name"

.field public static final RESULT_CANCEL:I = 0x3

.field public static final RESULT_OTHERS:I = 0x5

.field public static final RESULT_TIMEOUT:I = 0x4

.field public static final RESULT_USER_ACCEPT:I = 0x1

.field public static final RESULT_USER_REJECT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "BluetoothServerAuthorize"

.field public static final TIMEOUT_VALUE:Ljava/lang/String; = "com.mediatek.bluetooth.extra.timeout_value"


# instance fields
.field private mAlwaysAllowed:Landroid/widget/CheckBox;

.field private mAlwaysAllowedValue:Z

.field private mCancelFilter:Landroid/content/IntentFilter;

.field private mCancelReceiver:Landroid/content/BroadcastReceiver;

.field private mCurrentDialog:I

.field private mDeviceName:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mInfoDialog:Landroid/app/AlertDialog;

.field private mMessageView:Landroid/widget/TextView;

.field private mResultSent:Z

.field private mReturnAction:Ljava/lang/String;

.field private mSessionKey:Ljava/lang/String;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mSessionKey:Ljava/lang/String;

    .line 108
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mDeviceName:Ljava/lang/String;

    .line 110
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    .line 112
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelFilter:Landroid/content/IntentFilter;

    .line 114
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mReturnAction:Ljava/lang/String;

    .line 116
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mResultSent:Z

    .line 118
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z

    .line 120
    new-instance v0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$1;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mHandler:Landroid/os/Handler;

    .line 145
    new-instance v0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z

    return p1
.end method

.method private buildDialog(Ljava/lang/String;)Landroid/app/AlertDialog;
    .locals 8
    .parameter "deviceName"

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 184
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 185
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    new-array v2, v5, [Ljava/lang/CharSequence;

    const v4, 0x7f050076

    invoke-virtual {p0, v4}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v7

    .line 188
    .local v2, items:[Ljava/lang/CharSequence;
    new-array v1, v5, [Z

    aput-boolean v7, v1, v7

    .line 192
    .local v1, checked:[Z
    const v4, 0x7f050072

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v7

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, msg:Ljava/lang/String;
    const-string v4, "BluetoothServerAuthorize"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "buildDialog : items="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v2, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const v4, 0x108009b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f05006c

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->createView(Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f050070

    invoke-virtual {v4, v5, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f050075

    invoke-virtual {v4, v5, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 207
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    return-object v4
.end method

.method private createView(Ljava/lang/String;)Landroid/view/View;
    .locals 3
    .parameter "msg"

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f03

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mView:Landroid/view/View;

    .line 155
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mView:Landroid/view/View;

    const/high16 v1, 0x7f08

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mMessageView:Landroid/widget/TextView;

    .line 156
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mMessageView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mView:Landroid/view/View;

    const v1, 0x7f080001

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowed:Landroid/widget/CheckBox;

    .line 160
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowed:Landroid/widget/CheckBox;

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowed:Landroid/widget/CheckBox;

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 162
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowed:Landroid/widget/CheckBox;

    new-instance v1, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;

    invoke-direct {v1, p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 173
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mView:Landroid/view/View;

    return-object v0
.end method

.method private sendAuthResult(I)V
    .locals 4
    .parameter "res"

    .prologue
    .line 134
    iget-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mResultSent:Z

    if-nez v1, :cond_0

    .line 136
    const-string v1, "BluetoothServerAuthorize"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendAuthResult("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mReturnAction:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 138
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.bluetooth.extra.authorize_result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 139
    const-string v1, "com.mediatek.bluetooth.extra.authorize_always_allowed"

    iget-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 140
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendBroadcast(Landroid/content/Intent;)V

    .line 141
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mResultSent:Z

    .line 143
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 276
    packed-switch p2, :pswitch_data_0

    .line 290
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 291
    return-void

    .line 278
    :pswitch_0
    const-string v0, "BluetoothServerAuthorize"

    const-string v1, "Positive button pressed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V

    goto :goto_0

    .line 283
    :pswitch_1
    const-string v0, "BluetoothServerAuthorize"

    const-string v1, "Negative button pressed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V

    goto :goto_0

    .line 276
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    .line 212
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 214
    const-string v4, "BluetoothServerAuthorize"

    const-string v5, "onCreate()"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 216
    .local v2, intent:Landroid/content/Intent;
    const-string v4, "com.mediatek.bluetooth.extra.device_name"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 217
    .local v1, deviceName:Ljava/lang/String;
    const-string v4, "com.mediatek.bluetooth.extra.action_cancel"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, cancel:Ljava/lang/String;
    const-string v4, "com.mediatek.bluetooth.extra.action_return"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mReturnAction:Ljava/lang/String;

    .line 219
    const-string v4, "com.mediatek.bluetooth.extra.timeout_value"

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 220
    .local v3, timeout:I
    const-string v4, "BluetoothServerAuthorize"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Device name: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const-string v4, "BluetoothServerAuthorize"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cancel filter : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    if-eqz v0, :cond_1

    .line 232
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelFilter:Landroid/content/IntentFilter;

    .line 236
    :goto_0
    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->buildDialog(Ljava/lang/String;)Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    .line 237
    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 238
    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 241
    if-lez v3, :cond_0

    .line 242
    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mHandler:Landroid/os/Handler;

    const/16 v6, 0x65

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    int-to-long v6, v3

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 244
    :cond_0
    return-void

    .line 234
    :cond_1
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelFilter:Landroid/content/IntentFilter;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 270
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 271
    const-string v0, "BluetoothServerAuthorize"

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .parameter "dialog"

    .prologue
    .line 294
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->finish()V

    .line 295
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 257
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 258
    const-string v1, "BluetoothServerAuthorize"

    const-string v2, "onPause()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    :goto_0
    const/4 v1, 0x5

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V

    .line 265
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 266
    return-void

    .line 261
    :catch_0
    move-exception v0

    .line 262
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const-string v1, "BluetoothServerAuthorize"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 248
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 249
    const-string v0, "BluetoothServerAuthorize"

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelFilter:Landroid/content/IntentFilter;

    if-eqz v0, :cond_0

    .line 251
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mCancelFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 253
    :cond_0
    return-void
.end method
