.class Lcom/mediatek/nfc/MtkNfcEnabler$1;
.super Landroid/content/BroadcastReceiver;
.source "MtkNfcEnabler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/nfc/MtkNfcEnabler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/nfc/MtkNfcEnabler;


# direct methods
.method constructor <init>(Lcom/mediatek/nfc/MtkNfcEnabler;)V
    .locals 0
    .parameter

    .prologue
    .line 51
    iput-object p1, p0, Lcom/mediatek/nfc/MtkNfcEnabler$1;->this$0:Lcom/mediatek/nfc/MtkNfcEnabler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 54
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.nfc.action.ADAPTER_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    iget-object v1, p0, Lcom/mediatek/nfc/MtkNfcEnabler$1;->this$0:Lcom/mediatek/nfc/MtkNfcEnabler;

    const-string v2, "android.nfc.extra.ADAPTER_STATE"

    const/4 v3, 0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    #calls: Lcom/mediatek/nfc/MtkNfcEnabler;->handleNfcStateChanged(I)V
    invoke-static {v1, v2}, Lcom/mediatek/nfc/MtkNfcEnabler;->access$000(Lcom/mediatek/nfc/MtkNfcEnabler;I)V

    .line 59
    :cond_0
    return-void
.end method
