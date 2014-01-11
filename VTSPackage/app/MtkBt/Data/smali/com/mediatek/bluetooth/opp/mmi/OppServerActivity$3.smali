.class Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$3;
.super Ljava/lang/Object;
.source "OppServerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 192
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$3;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 197
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity$3;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;

    const/4 v1, 0x1

    #calls: Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->finishPushActivity(Z)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;->access$000(Lcom/mediatek/bluetooth/opp/mmi/OppServerActivity;Z)V

    .line 198
    return-void
.end method
