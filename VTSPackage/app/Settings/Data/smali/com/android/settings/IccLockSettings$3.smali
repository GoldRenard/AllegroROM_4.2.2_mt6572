.class Lcom/android/settings/IccLockSettings$3;
.super Ljava/lang/Object;
.source "IccLockSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/IccLockSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/IccLockSettings;


# direct methods
.method constructor <init>(Lcom/android/settings/IccLockSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 180
    iput-object p1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 182
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    #getter for: Lcom/android/settings/IccLockSettings;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/android/settings/IccLockSettings;->access$700(Lcom/android/settings/IccLockSettings;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr;->getResult()I

    move-result v0

    .line 183
    .local v0, nRet:I
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    #getter for: Lcom/android/settings/IccLockSettings;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/android/settings/IccLockSettings;->access$700(Lcom/android/settings/IccLockSettings;)Lcom/mediatek/CellConnService/CellConnMgr;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    #getter for: Lcom/android/settings/IccLockSettings;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/android/settings/IccLockSettings;->access$700(Lcom/android/settings/IccLockSettings;)Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x4

    if-eq v1, v0, :cond_0

    .line 184
    const-string v1, "IccLockSettings"

    const-string v2, "mCell Mgr Result is not OK"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    #setter for: Lcom/android/settings/IccLockSettings;->mIsShouldBeFinished:Z
    invoke-static {v1, v3}, Lcom/android/settings/IccLockSettings;->access$1002(Lcom/android/settings/IccLockSettings;Z)Z

    .line 186
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    invoke-virtual {v1}, Lcom/android/settings/IccLockSettings;->finish()V

    .line 193
    :goto_0
    return-void

    .line 189
    :cond_0
    const-string v1, "IccLockSettings"

    const-string v2, "mServiceComplete + Enable mPinToggle"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    #getter for: Lcom/android/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;
    invoke-static {v1}, Lcom/android/settings/IccLockSettings;->access$900(Lcom/android/settings/IccLockSettings;)Landroid/preference/CheckBoxPreference;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 192
    iget-object v1, p0, Lcom/android/settings/IccLockSettings$3;->this$0:Lcom/android/settings/IccLockSettings;

    const/4 v2, 0x0

    #setter for: Lcom/android/settings/IccLockSettings;->mIsUnlockFollow:Z
    invoke-static {v1, v2}, Lcom/android/settings/IccLockSettings;->access$1102(Lcom/android/settings/IccLockSettings;Z)Z

    goto :goto_0
.end method
