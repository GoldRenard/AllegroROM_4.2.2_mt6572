.class public Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;
.super Ljava/lang/Object;
.source "VTInCallScreenFlagsLoopback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VTConnectionStarttime"
.end annotation


# instance fields
.field public mConnection:Lcom/android/internal/telephony/Connection;

.field public mStarttime:J

.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;


# direct methods
.method public constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;)V
    .locals 0
    .parameter

    .prologue
    .line 168
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 169
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->reset()V

    .line 170
    return-void
.end method


# virtual methods
.method public reset()V
    .locals 2

    .prologue
    .line 176
    const-string v0, "VTConnectionStarttime"

    const-string v1, "reset..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->mConnection:Lcom/android/internal/telephony/Connection;

    .line 178
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->mStarttime:J

    .line 179
    return-void
.end method
