.class public abstract Lcom/mediatek/activity/CancelableActivity;
.super Landroid/app/Activity;
.source "CancelableActivity.java"


# static fields
.field public static final ACTION_CANCEL_ACTIVITY:Ljava/lang/String; = "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"

.field public static final EXTRA_CANCEL_ID:Ljava/lang/String; = "com.mediatek.activity.CancelableActivity.extra.ID"

.field public static final NULL_CANCEL_ID:I = -0x9a9c3


# instance fields
.field private cancelReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 60
    new-instance v0, Lcom/mediatek/activity/CancelableActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/activity/CancelableActivity$1;-><init>(Lcom/mediatek/activity/CancelableActivity;)V

    iput-object v0, p0, Lcom/mediatek/activity/CancelableActivity;->cancelReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static sendCancelActivityIntent(Landroid/content/Context;I)V
    .locals 2
    .parameter "context"
    .parameter "id"

    .prologue
    .line 111
    const-string v1, "CancelableActivity.sendCancelActivityIntent()"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 114
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 115
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.activity.CancelableActivity.extra.ID"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 117
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 118
    return-void
.end method


# virtual methods
.method protected abstract onActivityCancel(I)V
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 81
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    const-string v0, "CancelableActivity.onCreate() - registering BroadReceiver..."

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lcom/mediatek/activity/CancelableActivity;->cancelReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/activity/CancelableActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 88
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 93
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 94
    iget-object v0, p0, Lcom/mediatek/activity/CancelableActivity;->cancelReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/activity/CancelableActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 95
    return-void
.end method
