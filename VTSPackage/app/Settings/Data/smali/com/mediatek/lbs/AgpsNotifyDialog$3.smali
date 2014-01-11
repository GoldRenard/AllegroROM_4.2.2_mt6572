.class Lcom/mediatek/lbs/AgpsNotifyDialog$3;
.super Ljava/lang/Object;
.source "AgpsNotifyDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsNotifyDialog;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 260
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$3;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 262
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$3;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 263
    return-void
.end method
