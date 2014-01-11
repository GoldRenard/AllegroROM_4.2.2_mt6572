.class Lcom/mediatek/lbs/AgpsSettings$3;
.super Ljava/lang/Object;
.source "AgpsSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsSettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 482
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsSettings$3;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialoginterface"
    .parameter "i"

    .prologue
    .line 484
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$3;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #getter for: Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsSettings;->access$200(Lcom/mediatek/lbs/AgpsSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/mediatek/common/agps/MtkAgpsManager;->setRoamingEnable(Z)V

    .line 485
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings$3;->this$0:Lcom/mediatek/lbs/AgpsSettings;

    #calls: Lcom/mediatek/lbs/AgpsSettings;->updatePage()V
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsSettings;->access$500(Lcom/mediatek/lbs/AgpsSettings;)V

    .line 486
    return-void
.end method
