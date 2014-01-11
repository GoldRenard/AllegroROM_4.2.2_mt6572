.class Lcom/mediatek/nfc/NfcSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "NfcSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/nfc/NfcSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/nfc/NfcSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/nfc/NfcSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 59
    iput-object p1, p0, Lcom/mediatek/nfc/NfcSettings$1;->this$0:Lcom/mediatek/nfc/NfcSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 62
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.nfc.action.ADAPTER_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    iget-object v1, p0, Lcom/mediatek/nfc/NfcSettings$1;->this$0:Lcom/mediatek/nfc/NfcSettings;

    #calls: Lcom/mediatek/nfc/NfcSettings;->updatePreferenceEnabledStatus()V
    invoke-static {v1}, Lcom/mediatek/nfc/NfcSettings;->access$000(Lcom/mediatek/nfc/NfcSettings;)V

    .line 66
    :cond_0
    return-void
.end method
