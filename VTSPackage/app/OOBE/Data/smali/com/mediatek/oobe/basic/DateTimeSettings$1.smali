.class Lcom/mediatek/oobe/basic/DateTimeSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "DateTimeSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/DateTimeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/DateTimeSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/DateTimeSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 526
    iput-object p1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings$1;->this$0:Lcom/mediatek/oobe/basic/DateTimeSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 529
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings$1;->this$0:Lcom/mediatek/oobe/basic/DateTimeSettings;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 530
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 531
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings$1;->this$0:Lcom/mediatek/oobe/basic/DateTimeSettings;

    invoke-virtual {v1, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 533
    :cond_0
    return-void
.end method
