.class public Lcom/android/phone/TelephonyDebugService;
.super Landroid/app/Service;
.source "TelephonyDebugService.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mDebugService:Lcom/android/internal/telephony/DebugService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string v0, "TelephonyDebugService"

    sput-object v0, Lcom/android/phone/TelephonyDebugService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 33
    new-instance v0, Lcom/android/internal/telephony/DebugService;

    invoke-direct {v0}, Lcom/android/internal/telephony/DebugService;-><init>()V

    iput-object v0, p0, Lcom/android/phone/TelephonyDebugService;->mDebugService:Lcom/android/internal/telephony/DebugService;

    .line 37
    sget-object v0, Lcom/android/phone/TelephonyDebugService;->TAG:Ljava/lang/String;

    const-string v1, "TelephonyDebugService()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void
.end method


# virtual methods
.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/phone/TelephonyDebugService;->mDebugService:Lcom/android/internal/telephony/DebugService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/internal/telephony/DebugService;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 45
    const/4 v0, 0x0

    return-object v0
.end method
