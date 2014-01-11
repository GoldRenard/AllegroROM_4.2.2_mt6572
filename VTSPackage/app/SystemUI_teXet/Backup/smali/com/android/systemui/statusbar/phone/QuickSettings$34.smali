.class Lcom/android/systemui/statusbar/phone/QuickSettings$34;
.super Landroid/content/BroadcastReceiver;
.source "QuickSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .registers 2
    .parameter

    .prologue
    .line 1008
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$34;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 1011
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1012
    .local v0, action:Ljava/lang/String;
    const-string v3, "android.provider.Contacts.PROFILE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    const-string v3, "android.intent.action.USER_INFO_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 1015
    :cond_14
    :try_start_14
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/app/IActivityManager;->getCurrentUser()Landroid/content/pm/UserInfo;

    move-result-object v3

    iget v2, v3, Landroid/content/pm/UserInfo;->id:I

    .line 1016
    .local v2, userId:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettings$34;->getSendingUserId()I

    move-result v3

    if-ne v3, v2, :cond_29

    .line 1017
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$34;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/QuickSettings;->reloadUserInfo()V
    :try_end_29
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_29} :catch_2a

    .line 1024
    .end local v2           #userId:I
    :cond_29
    :goto_29
    return-void

    .line 1019
    :catch_2a
    move-exception v1

    .line 1020
    .local v1, e:Landroid/os/RemoteException;
    const-string v3, "QuickSettings"

    const-string v4, "Couldn\'t get current user id for profile change"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_29
.end method
