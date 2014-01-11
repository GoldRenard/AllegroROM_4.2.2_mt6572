.class Lcom/android/systemui/statusbar/BaseStatusBar$1;
.super Landroid/database/ContentObserver;
.source "BaseStatusBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/BaseStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/BaseStatusBar;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/BaseStatusBar;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 151
    iput-object p1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$1;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 3
    .parameter "selfChange"

    .prologue
    const/4 v0, 0x0

    .line 154
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$1;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    iget-object v1, v1, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "device_provisioned"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 156
    .local v0, provisioned:Z
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$1;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    #getter for: Lcom/android/systemui/statusbar/BaseStatusBar;->mDeviceProvisioned:Z
    invoke-static {v1}, Lcom/android/systemui/statusbar/BaseStatusBar;->access$000(Lcom/android/systemui/statusbar/BaseStatusBar;)Z

    move-result v1

    if-eq v0, v1, :cond_1

    .line 157
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$1;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    #setter for: Lcom/android/systemui/statusbar/BaseStatusBar;->mDeviceProvisioned:Z
    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/BaseStatusBar;->access$002(Lcom/android/systemui/statusbar/BaseStatusBar;Z)Z

    .line 158
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$1;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/BaseStatusBar;->updateNotificationIcons()V

    .line 160
    :cond_1
    return-void
.end method
