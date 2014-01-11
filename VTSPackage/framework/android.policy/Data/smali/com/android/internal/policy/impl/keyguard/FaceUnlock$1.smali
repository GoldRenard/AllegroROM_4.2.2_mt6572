.class Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;
.super Ljava/lang/Object;
.source "FaceUnlock.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/FaceUnlock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/FaceUnlock;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)V
    .locals 0
    .parameter

    .prologue
    .line 355
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;->this$0:Lcom/android/internal/policy/impl/keyguard/FaceUnlock;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "className"
    .parameter "iservice"

    .prologue
    .line 360
    const-string v0, "FULLockscreen"

    const-string v1, "Connected to Face Unlock service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;->this$0:Lcom/android/internal/policy/impl/keyguard/FaceUnlock;

    invoke-static {p2}, Lcom/android/internal/policy/IFaceLockInterface$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/policy/IFaceLockInterface;

    move-result-object v1

    #setter for: Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->access$002(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;Lcom/android/internal/policy/IFaceLockInterface;)Lcom/android/internal/policy/IFaceLockInterface;

    .line 362
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;->this$0:Lcom/android/internal/policy/impl/keyguard/FaceUnlock;

    #getter for: Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->access$100(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 363
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 369
    const-string v0, "FULLockscreen"

    const-string v1, "Unexpected disconnect from Face Unlock service"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;->this$0:Lcom/android/internal/policy/impl/keyguard/FaceUnlock;

    #getter for: Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->access$100(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 371
    return-void
.end method
