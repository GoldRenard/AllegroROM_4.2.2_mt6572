.class Lcom/mediatek/settings/CallRejectListModify$2;
.super Ljava/lang/Object;
.source "CallRejectListModify.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CallRejectListModify;->configureActionBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallRejectListModify;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CallRejectListModify;)V
    .locals 0
    .parameter

    .prologue
    .line 320
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListModify$2;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 323
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify$2;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListModify;->finish()V

    .line 324
    return-void
.end method
