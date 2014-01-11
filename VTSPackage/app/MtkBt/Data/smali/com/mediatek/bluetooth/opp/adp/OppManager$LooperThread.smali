.class Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;
.super Ljava/lang/Thread;
.source "OppManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/opp/adp/OppManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LooperThread"
.end annotation


# instance fields
.field private mCallback:Landroid/os/Handler$Callback;

.field public mHandler:Landroid/os/Handler;

.field private mThreadPriority:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILandroid/os/Handler$Callback;)V
    .locals 2
    .parameter "name"
    .parameter "threadPriority"
    .parameter "callback"

    .prologue
    .line 990
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 991
    iput p2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mThreadPriority:I

    .line 992
    iput-object p3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mCallback:Landroid/os/Handler$Callback;

    .line 995
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mCallback:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    .line 996
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1000
    iget v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mThreadPriority:I

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1001
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 1003
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1004
    return-void
.end method
