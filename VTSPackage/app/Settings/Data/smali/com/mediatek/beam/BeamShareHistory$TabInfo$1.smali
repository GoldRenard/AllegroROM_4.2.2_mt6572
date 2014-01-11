.class Lcom/mediatek/beam/BeamShareHistory$TabInfo$1;
.super Ljava/lang/Object;
.source "BeamShareHistory.java"

# interfaces
.implements Landroid/widget/TabHost$TabContentFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/beam/BeamShareHistory$TabInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mediatek/beam/BeamShareHistory$TabInfo;


# direct methods
.method constructor <init>(Lcom/mediatek/beam/BeamShareHistory$TabInfo;)V
    .locals 0
    .parameter

    .prologue
    .line 311
    iput-object p1, p0, Lcom/mediatek/beam/BeamShareHistory$TabInfo$1;->this$1:Lcom/mediatek/beam/BeamShareHistory$TabInfo;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createTabContent(Ljava/lang/String;)Landroid/view/View;
    .locals 1
    .parameter "tag"

    .prologue
    .line 314
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareHistory$TabInfo$1;->this$1:Lcom/mediatek/beam/BeamShareHistory$TabInfo;

    #calls: Lcom/mediatek/beam/BeamShareHistory$TabInfo;->buildTabSpec()Landroid/view/View;
    invoke-static {v0}, Lcom/mediatek/beam/BeamShareHistory$TabInfo;->access$600(Lcom/mediatek/beam/BeamShareHistory$TabInfo;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
