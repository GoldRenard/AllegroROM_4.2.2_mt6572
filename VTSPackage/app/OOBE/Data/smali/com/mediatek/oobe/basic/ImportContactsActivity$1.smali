.class Lcom/mediatek/oobe/basic/ImportContactsActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 235
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$1;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 239
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, action:Ljava/lang/String;
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ImportContactsActivity receive:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 243
    :cond_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$1;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateSimPreference()V
    invoke-static {v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$100(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    .line 247
    :cond_1
    :goto_0
    return-void

    .line 244
    :cond_2
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 245
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$1;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->disableSimPreference()V
    invoke-static {v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$200(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    goto :goto_0
.end method
