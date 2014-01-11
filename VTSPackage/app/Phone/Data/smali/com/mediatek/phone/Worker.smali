.class public final Lcom/mediatek/phone/Worker;
.super Landroid/os/HandlerThread;
.source "Worker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/Worker$WrapperCloseCursor;,
        Lcom/mediatek/phone/Worker$MyHandler;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/mediatek/phone/Worker; = null

.field private static final MSG_QUIT:I = 0x64

.field private static final TAG:Ljava/lang/String; = "Worker"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mLooper:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Lcom/mediatek/phone/Worker;

    invoke-direct {v0}, Lcom/mediatek/phone/Worker;-><init>()V

    sput-object v0, Lcom/mediatek/phone/Worker;->INSTANCE:Lcom/mediatek/phone/Worker;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "Worker_Thread"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method public static getWorkerInstance()Lcom/mediatek/phone/Worker;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/mediatek/phone/Worker;->INSTANCE:Lcom/mediatek/phone/Worker;

    return-object v0
.end method


# virtual methods
.method public postJob(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mediatek/phone/Worker;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/Worker;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 62
    :goto_0
    return-void

    .line 60
    :cond_0
    const-string v0, "Worker"

    const-string v1, "mHandler == null!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public prepair()V
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mediatek/phone/Worker;->mLooper:Landroid/os/Looper;

    if-nez v0, :cond_0

    .line 35
    sget-object v0, Lcom/mediatek/phone/Worker;->INSTANCE:Lcom/mediatek/phone/Worker;

    invoke-virtual {v0}, Lcom/mediatek/phone/Worker;->start()V

    .line 36
    invoke-virtual {p0}, Lcom/mediatek/phone/Worker;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/Worker;->mLooper:Landroid/os/Looper;

    .line 37
    new-instance v0, Lcom/mediatek/phone/Worker$MyHandler;

    iget-object v1, p0, Lcom/mediatek/phone/Worker;->mLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/phone/Worker$MyHandler;-><init>(Lcom/mediatek/phone/Worker;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/mediatek/phone/Worker;->mHandler:Landroid/os/Handler;

    .line 41
    :goto_0
    return-void

    .line 39
    :cond_0
    const-string v0, "Worker"

    const-string v1, "donothing!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/mediatek/phone/Worker;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/mediatek/phone/Worker;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 50
    :cond_0
    return-void
.end method
