.class Lcom/android/settings/ApnEditor$3;
.super Landroid/telephony/PhoneStateListener;
.source "ApnEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/ApnEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/ApnEditor;


# direct methods
.method constructor <init>(Lcom/android/settings/ApnEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 263
    iput-object p1, p0, Lcom/android/settings/ApnEditor$3;->this$0:Lcom/android/settings/ApnEditor;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 4
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 267
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 269
    iget-object v1, p0, Lcom/android/settings/ApnEditor$3;->this$0:Lcom/android/settings/ApnEditor;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Lcom/android/settings/ApnEditor;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 270
    .local v0, telephonyManager:Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/android/settings/ApnEditor$3;->this$0:Lcom/android/settings/ApnEditor;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    #setter for: Lcom/android/settings/ApnEditor;->mIsCallStateIdle:Z
    invoke-static {v2, v1}, Lcom/android/settings/ApnEditor;->access$1402(Lcom/android/settings/ApnEditor;Z)Z

    .line 271
    invoke-static {}, Lcom/android/settings/ApnEditor;->access$600()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[onCallStateChanged][mIsCallStateIdle="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/ApnEditor$3;->this$0:Lcom/android/settings/ApnEditor;

    #getter for: Lcom/android/settings/ApnEditor;->mIsCallStateIdle:Z
    invoke-static {v3}, Lcom/android/settings/ApnEditor;->access$1400(Lcom/android/settings/ApnEditor;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    iget-object v1, p0, Lcom/android/settings/ApnEditor$3;->this$0:Lcom/android/settings/ApnEditor;

    invoke-virtual {v1}, Lcom/android/settings/ApnEditor;->invalidateOptionsMenu()V

    .line 273
    return-void

    .line 270
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
