.class Lcom/mediatek/lbs/AgpsEpoSettings$1;
.super Ljava/lang/Object;
.source "AgpsEpoSettings.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsEpoSettings;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsEpoSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsEpoSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 218
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsEpoSettings$1;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1
    .parameter "o"
    .parameter "arg"

    .prologue
    .line 220
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsEpoSettings$1;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #calls: Lcom/mediatek/lbs/AgpsEpoSettings;->updateLocationToggles()V
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$000(Lcom/mediatek/lbs/AgpsEpoSettings;)V

    .line 221
    return-void
.end method
