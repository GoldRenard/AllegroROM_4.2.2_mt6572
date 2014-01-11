.class Lcom/mediatek/oobe/qsg/QuickStartGuideMain$1;
.super Ljava/lang/Object;
.source "QuickStartGuideMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/qsg/QuickStartGuideMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V
    .locals 0
    .parameter

    .prologue
    .line 206
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$1;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 209
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$1;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->finishGuickStartGuide()V
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    .line 210
    return-void
.end method
