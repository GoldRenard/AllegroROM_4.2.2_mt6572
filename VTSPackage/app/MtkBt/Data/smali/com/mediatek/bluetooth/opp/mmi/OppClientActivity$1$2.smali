.class Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;
.super Ljava/lang/Object;
.source "OppClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mToastResId:I

.field final synthetic this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;)V
    .locals 1
    .parameter

    .prologue
    .line 230
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 232
    const v0, 0x7f050038

    iput v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->mToastResId:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 235
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v1, v1, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v1, v1, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, strDeviceName:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 237
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v1, v1, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v2, v2, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget v3, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->mToastResId:I

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v7

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 246
    :goto_0
    return-void

    .line 241
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v1, v1, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v2, v2, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget v3, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->mToastResId:I

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    const v6, 0x7f05003a

    invoke-virtual {v5, v6}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
