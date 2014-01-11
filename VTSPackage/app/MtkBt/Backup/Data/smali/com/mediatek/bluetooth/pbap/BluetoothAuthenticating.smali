.class public Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;
.super Lcom/android/internal/app/AlertActivity;
.source "BluetoothAuthenticating.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field public static final ACTION_CANCEL:Ljava/lang/String; = "com.mediatek.bluetooth.extra.action_cancel"

.field public static final ACTION_RETURN:Ljava/lang/String; = "com.mediatek.bluetooth.extra.action_return"

.field public static final AUTHENTICATE_RESULT:Ljava/lang/String; = "com.mediatek.bluetooth.extra.authenticate_result"

.field public static final AUTHETICATE_CODE:Ljava/lang/String; = "com.mediatek.bluetooth.extra.autheticate_code"

.field private static final AUTHETICATE_TIMEOUT_IND:I = 0x65

.field public static final DEVICE_NAME:Ljava/lang/String; = "com.mediatek.bluetooth.extra.device_name"

.field public static final RESULT_CANCEL:I = 0x3

.field public static final RESULT_OTHERS:I = 0x5

.field public static final RESULT_TIMEOUT:I = 0x4

.field public static final RESULT_USER_ACCEPT:I = 0x1

.field public static final RESULT_USER_REJECT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "BluetoothAuthenticating"

.field public static final TIMEOUT_VALUE:Ljava/lang/String; = "com.mediatek.bluetooth.extra.timeout_value"


# instance fields
.field private mCancelFilter:Landroid/content/IntentFilter;

.field private mCancelReceiver:Landroid/content/BroadcastReceiver;

.field private mHandler:Landroid/os/Handler;

.field private mPara:Lcom/android/internal/app/AlertController$AlertParams;

.field private mPasscodeEdit:Landroid/widget/EditText;

.field private mResultSent:Z

.field private mReturnAction:Ljava/lang/String;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    .line 61
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mView:Landroid/view/View;

    .line 65
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    .line 67
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mReturnAction:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mResultSent:Z

    .line 102
    new-instance v0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$1;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mHandler:Landroid/os/Handler;

    .line 115
    new-instance v0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V

    return-void
.end method

.method private createView()Landroid/view/View;
    .locals 3

    .prologue
    .line 203
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "createView"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030001

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mView:Landroid/view/View;

    .line 207
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mView:Landroid/view/View;

    const v1, 0x7f080002

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPasscodeEdit:Landroid/widget/EditText;

    .line 209
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mView:Landroid/view/View;

    return-object v0
.end method

.method private sendResult(I)V
    .locals 4
    .parameter "res"

    .prologue
    .line 124
    const-string v1, "BluetoothAuthenticating"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Authenticate : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mResultSent:Z

    if-nez v1, :cond_0

    .line 127
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mReturnAction:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 128
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.bluetooth.extra.authenticate_result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 129
    const-string v1, "com.mediatek.bluetooth.extra.autheticate_code"

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPasscodeEdit:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendBroadcast(Landroid/content/Intent;)V

    .line 131
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mResultSent:Z

    .line 133
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private setUpDialog()V
    .locals 2

    .prologue
    .line 186
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "setUpDialog"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    .line 190
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    const v1, 0x108009b

    iput v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mIconId:I

    .line 191
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    const v1, 0x7f050068

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 193
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    const v1, 0x7f05006e

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 194
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, v0, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 195
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    const v1, 0x7f05006f

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 196
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, v0, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 198
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPara:Lcom/android/internal/app/AlertController$AlertParams;

    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->createView()Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 199
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->setupAlert()V

    .line 200
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v2, 0x2

    .line 213
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "onClick"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const/4 v0, -0x1

    if-ne p2, v0, :cond_2

    .line 216
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "positive button"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mPasscodeEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 218
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V

    .line 227
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->finish()V

    .line 228
    return-void

    .line 220
    :cond_1
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "passcode is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V

    goto :goto_0

    .line 223
    :cond_2
    const/4 v0, -0x2

    if-ne p2, v0, :cond_0

    .line 224
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "negative button"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 137
    const-string v3, "BluetoothAuthenticating"

    const-string v4, "OnCreate"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 140
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 143
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "com.mediatek.bluetooth.extra.action_cancel"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, cancel:Ljava/lang/String;
    const-string v3, "com.mediatek.bluetooth.extra.action_return"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mReturnAction:Ljava/lang/String;

    .line 145
    const-string v3, "com.mediatek.bluetooth.extra.timeout_value"

    const/4 v4, -0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 146
    .local v2, timeout:I
    if-eqz v0, :cond_1

    .line 147
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.mediatek.bluetooth.extra.action_cancel"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    .line 152
    :goto_0
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->setUpDialog()V

    .line 154
    if-lez v2, :cond_0

    .line 155
    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x65

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    int-to-long v5, v2

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 157
    :cond_0
    return-void

    .line 149
    :cond_1
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 170
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onDestroy()V

    .line 172
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 161
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStart()V

    .line 163
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 166
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 176
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "onStop()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelFilter:Landroid/content/IntentFilter;

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->mCancelReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 181
    :cond_0
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V

    .line 182
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 183
    return-void
.end method
