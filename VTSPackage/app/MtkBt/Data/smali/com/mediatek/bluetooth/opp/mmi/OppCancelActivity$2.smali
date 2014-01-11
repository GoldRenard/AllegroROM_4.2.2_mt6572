.class Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity$2;
.super Ljava/lang/Object;
.source "OppCancelActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 75
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity$2;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity$2;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;->finish()V

    .line 80
    return-void
.end method
