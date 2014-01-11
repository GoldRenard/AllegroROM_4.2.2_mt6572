.class Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;
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
    .line 262
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    .line 266
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v0

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1100(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 267
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #setter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v0, v2}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$502(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)I

    .line 268
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #setter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z
    invoke-static {v0, v2}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$102(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z

    .line 269
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 270
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-virtual {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->resetProgressBar()V

    .line 271
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;

    move-result-object v0

    const v1, 0x7f090039

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-virtual {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->hideTitleSummary()V

    .line 274
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v1

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->playVideo(I)V
    invoke-static {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)V

    .line 275
    return-void
.end method
