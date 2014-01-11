.class Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;
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
.field final synthetic this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

.field final synthetic val$uriStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 184
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iput-object p2, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;->val$uriStr:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 188
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;->this$1:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;->val$uriStr:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 190
    return-void
.end method
