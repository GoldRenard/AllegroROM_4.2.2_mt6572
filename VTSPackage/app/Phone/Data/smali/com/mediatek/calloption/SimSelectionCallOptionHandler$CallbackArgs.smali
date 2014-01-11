.class Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;
.super Ljava/lang/Object;
.source "SimSelectionCallOptionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/SimSelectionCallOptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallbackArgs"
.end annotation


# instance fields
.field public args:Ljava/lang/Object;

.field public id:J

.field public number:Ljava/lang/String;

.field public reason:I

.field final synthetic this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;


# direct methods
.method public constructor <init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 93
    iput-object p1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 95
    return-void
.end method

.method public constructor <init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;ILjava/lang/String;JLjava/lang/Object;)V
    .locals 0
    .parameter
    .parameter "argReason"
    .parameter "argNumber"
    .parameter "argId"
    .parameter "argArgs"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput p2, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 108
    iput-object p3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->number:Ljava/lang/String;

    .line 109
    iput-wide p4, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 110
    iput-object p6, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 111
    return-void
.end method
