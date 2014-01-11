.class Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;
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
    .line 233
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const v3, 0x7f09003b

    const/4 v2, 0x0

    .line 237
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-virtual {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    const-string v0, "QuickStartGuideMain"

    const-string v1, "finishGuickStartGuide"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->finishGuickStartGuide()V
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    .line 260
    :goto_0
    return-void

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v0

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1100(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1

    .line 244
    const-string v0, "QuickStartGuideMain"

    const-string v1, "go to last QSG page"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #setter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z
    invoke-static {v0, v2}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$702(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z

    .line 246
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v1

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->playVideo(I)V
    invoke-static {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)V

    .line 248
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1100(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->updateTitleSummary(I)V

    .line 249
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    .line 250
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1300(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 251
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1400(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/view/SurfaceView;

    move-result-object v0

    const v1, 0x7f020037

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundResource(I)V

    .line 252
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    const/4 v1, 0x1

    #setter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z
    invoke-static {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$102(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z

    .line 253
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 254
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$508(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    goto :goto_0

    .line 256
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$508(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    .line 257
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-virtual {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->hideTitleSummary()V

    .line 258
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v1

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->playVideo(I)V
    invoke-static {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)V

    goto :goto_0
.end method
