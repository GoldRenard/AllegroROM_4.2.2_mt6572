.class Lcom/mediatek/oobe/qsg/QuickStartGuideMain$5;
.super Ljava/lang/Object;
.source "QuickStartGuideMain.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


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
    .line 278
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$5;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 283
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "play error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$5;->this$0:Lcom/mediatek/oobe/qsg/QuickStartGuideMain;

    #calls: Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->releaseMediaPlayer()V
    invoke-static {v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->access$1500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    .line 285
    const/4 v0, 0x0

    return v0
.end method
