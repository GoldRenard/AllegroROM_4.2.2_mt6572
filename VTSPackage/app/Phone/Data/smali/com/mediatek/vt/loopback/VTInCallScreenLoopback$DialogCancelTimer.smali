.class public Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DialogCancelTimer"
.end annotation


# instance fields
.field private mAsker:Landroid/app/AlertDialog;

.field private final mSeconds:I

.field private final mTimer:Ljava/util/Timer;

.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method public constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;ILandroid/app/AlertDialog;)V
    .locals 1
    .parameter
    .parameter "seconds"
    .parameter "dialog"

    .prologue
    .line 1282
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1273
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mTimer:Ljava/util/Timer;

    .line 1283
    iput p2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mSeconds:I

    .line 1284
    iput-object p3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;

    .line 1285
    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1271
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Ljava/util/Timer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1271
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mTimer:Ljava/util/Timer;

    return-object v0
.end method


# virtual methods
.method public start()V
    .locals 4

    .prologue
    .line 1291
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mTimer:Ljava/util/Timer;

    new-instance v1, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;

    invoke-direct {v1, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)V

    iget v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mSeconds:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 1301
    return-void
.end method
