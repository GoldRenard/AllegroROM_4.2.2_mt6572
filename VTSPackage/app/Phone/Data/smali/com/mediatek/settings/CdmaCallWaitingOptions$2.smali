.class Lcom/mediatek/settings/CdmaCallWaitingOptions$2;
.super Ljava/lang/Object;
.source "CdmaCallWaitingOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CdmaCallWaitingOptions;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CdmaCallWaitingOptions;

.field final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CdmaCallWaitingOptions;Landroid/app/Dialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$2;->this$0:Lcom/mediatek/settings/CdmaCallWaitingOptions;

    iput-object p2, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$2;->val$dialog:Landroid/app/Dialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 141
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$2;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 142
    return-void
.end method
