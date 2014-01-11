.class Lcom/android/settings/TetherApnSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "TetherApnSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/TetherApnSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/TetherApnSettings;


# direct methods
.method constructor <init>(Lcom/android/settings/TetherApnSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 85
    iput-object p1, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    .line 89
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.net.conn.TETHER_CHANGED_DONE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 91
    const-string v2, "TetherApnSettings"

    const-string v3, "onReceive:ConnectivityManager.TETHER_CHANGED_DONE_ACTION"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v2, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    #setter for: Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z
    invoke-static {v2, v5}, Lcom/android/settings/TetherApnSettings;->access$002(Lcom/android/settings/TetherApnSettings;Z)Z

    .line 93
    iget-object v2, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-virtual {v2}, Lcom/android/settings/TetherApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-virtual {v3}, Lcom/android/settings/TetherApnSettings;->getScreenEnableState()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 95
    const-string v2, "TetherApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onReceive:AIRPLANE_MODE state changed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    iget-boolean v4, v4, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v2, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    const-string v3, "state"

    invoke-virtual {p2, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v2, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    .line 97
    iget-object v2, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-virtual {v2}, Lcom/android/settings/TetherApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-virtual {v3}, Lcom/android/settings/TetherApnSettings;->getScreenEnableState()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    goto :goto_0

    .line 98
    :cond_2
    const-string v2, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    const-string v2, "TetherApnSettings"

    const-string v3, "onReceive: ConnectivityManager.ACTION_TETHER_STATE_CHANGED"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v2, "activeArray"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 102
    .local v1, active:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v1, :cond_3

    .line 103
    iget-object v2, p0, Lcom/android/settings/TetherApnSettings$1;->this$0:Lcom/android/settings/TetherApnSettings;

    invoke-virtual {v1}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v3

    #calls: Lcom/android/settings/TetherApnSettings;->updateTetheredState([Ljava/lang/Object;)V
    invoke-static {v2, v3}, Lcom/android/settings/TetherApnSettings;->access$100(Lcom/android/settings/TetherApnSettings;[Ljava/lang/Object;)V

    goto :goto_0

    .line 105
    :cond_3
    const-string v2, "TetherApnSettings"

    const-string v3, "active tether is null , not update tether state."

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
