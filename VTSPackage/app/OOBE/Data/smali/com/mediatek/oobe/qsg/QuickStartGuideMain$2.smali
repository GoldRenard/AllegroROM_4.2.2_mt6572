.class Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;
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
    .line 212
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    .line 215
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #setter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z
    invoke-static {v0, v2}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$102(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z

    .line 216
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 217
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mGroupButtons:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$300(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 218
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextButtons:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$400(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 219
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I
    invoke-static {v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->updateProgress(I)V

    .line 220
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-virtual {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->hideTitleSummary()V

    .line 221
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$600(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$700(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$600(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 224
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #getter for: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$800(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->startVideoPlayback()V
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$900(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    .line 230
    :cond_0
    return-void
.end method
