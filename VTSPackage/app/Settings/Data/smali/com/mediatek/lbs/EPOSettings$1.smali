.class Lcom/mediatek/lbs/EPOSettings$1;
.super Ljava/lang/Object;
.source "EPOSettings.java"

# interfaces
.implements Lcom/mediatek/common/epo/MtkEpoStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/lbs/EPOSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/EPOSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/EPOSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 125
    iput-object p1, p0, Lcom/mediatek/lbs/EPOSettings$1;->this$0:Lcom/mediatek/lbs/EPOSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStatusChanged(I)V
    .locals 1
    .parameter "status"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings$1;->this$0:Lcom/mediatek/lbs/EPOSettings;

    #calls: Lcom/mediatek/lbs/EPOSettings;->updateEpoProgressToMmi(I)V
    invoke-static {v0, p1}, Lcom/mediatek/lbs/EPOSettings;->access$000(Lcom/mediatek/lbs/EPOSettings;I)V

    .line 128
    return-void
.end method
