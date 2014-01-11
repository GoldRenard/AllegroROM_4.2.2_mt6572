.class Lcom/mediatek/beam/BeamShareHistory$1;
.super Landroid/database/ContentObserver;
.source "BeamShareHistory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/beam/BeamShareHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/beam/BeamShareHistory;


# direct methods
.method constructor <init>(Lcom/mediatek/beam/BeamShareHistory;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 133
    iput-object p1, p0, Lcom/mediatek/beam/BeamShareHistory$1;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 2
    .parameter "selfChange"
    .parameter "uri"

    .prologue
    .line 136
    const-string v0, "BeamShareHistory"

    const-string v1, "ContentObserver, onChange()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$1;->this$0:Lcom/mediatek/beam/BeamShareHistory;

    #getter for: Lcom/mediatek/beam/BeamShareHistory;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/mediatek/beam/BeamShareHistory;->access$000(Lcom/mediatek/beam/BeamShareHistory;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 138
    return-void
.end method
