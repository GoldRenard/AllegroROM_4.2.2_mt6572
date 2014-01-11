.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;
.super Landroid/database/ContentObserver;
.source "PhoneStatusBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "x0"

    .prologue
    .line 346
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 7
    .parameter "selfChange"

    .prologue
    const/4 v1, 0x0

    .line 349
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v2, v2, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "user_setup_complete"

    iget-object v4, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$000(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)I

    move-result v4

    invoke-static {v2, v3, v1, v4}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    if-eqz v2, :cond_5b

    const/4 v0, 0x1

    .line 357
    .local v0, userSetup:Z
    :goto_18
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v2, v2, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mSettingsButton:Landroid/widget/ImageView;

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-boolean v2, v2, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mHasFlipSettings:Z

    if-eqz v2, :cond_2d

    .line 358
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v2, v2, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mSettingsButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_5d

    :goto_2a
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 360
    :cond_2d
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v1, v1, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mSettingsPanel:Lcom/android/systemui/statusbar/phone/SettingsPanelView;

    if-eqz v1, :cond_3a

    .line 361
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v1, v1, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mSettingsPanel:Lcom/android/systemui/statusbar/phone/SettingsPanelView;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/phone/SettingsPanelView;->setEnabled(Z)V

    .line 363
    :cond_3a
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$100(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Z

    move-result v1

    if-eq v0, v1, :cond_5a

    .line 364
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v1, v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$102(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;Z)Z

    .line 365
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v1}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$100(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Z

    move-result v1

    if-nez v1, :cond_5a

    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v1, v1, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mStatusBarView:Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;

    if-eqz v1, :cond_5a

    .line 366
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$2;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->animateCollapseQuickSettings()V

    .line 368
    :cond_5a
    return-void

    .end local v0           #userSetup:Z
    :cond_5b
    move v0, v1

    .line 349
    goto :goto_18

    .line 358
    .restart local v0       #userSetup:Z
    :cond_5d
    const/4 v1, 0x4

    goto :goto_2a
.end method
