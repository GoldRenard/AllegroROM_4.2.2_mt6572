.class Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;
.super Ljava/lang/Thread;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "simMeStatusQueryThread"
.end annotation


# instance fields
.field simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;)V
    .locals 0
    .parameter
    .parameter "simArgs"

    .prologue
    .line 2892
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2893
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    .line 2894
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x5

    .line 2899
    :try_start_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->mSimMeCategory:[I

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v4, v4, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simId:I

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v5, v5, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simMECategory:I

    aput v5, v3, v4

    .line 2900
    const-string v3, "KeyguardUpdateMonitor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "queryNetworkLock, SimId ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v5, v5, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", simMECategory ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v5, v5, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simMECategory:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2901
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simMECategory:I

    if-ltz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simMECategory:I

    if-le v3, v6, :cond_1

    .line 2917
    :cond_0
    :goto_0
    return-void

    .line 2905
    :cond_1
    const-string v3, "phoneEx"

    invoke-static {v3}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/common/telephony/ITelephonyEx$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/common/telephony/ITelephonyEx;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v4, v4, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simMECategory:I

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v5, v5, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simId:I

    invoke-interface {v3, v4, v5}, Lcom/mediatek/common/telephony/ITelephonyEx;->queryNetworkLock(II)Landroid/os/Bundle;

    move-result-object v0

    .line 2906
    .local v0, bundle:Landroid/os/Bundle;
    const-string v3, "com.android.phone.QUERY_SIMME_LOCK_RESULT"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 2907
    .local v2, query_result:Z
    const-string v3, "KeyguardUpdateMonitor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "queryNetworkLock, query_result ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2908
    if-eqz v2, :cond_2

    .line 2909
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    iget-object v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->mSimMeLeftRetryCount:[I

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    iget v4, v4, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;->simId:I

    const-string v5, "com.android.phone.SIMME_LOCK_LEFT_COUNT"

    const/4 v6, 0x5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    aput v5, v3, v4

    .line 2913
    :goto_1
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->access$1600(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->access$1600(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;)Landroid/os/Handler;

    move-result-object v4

    const/16 v5, 0x130

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$simMeStatusQueryThread;->simArgs:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimArgs;

    invoke-virtual {v4, v5, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2914
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v2           #query_result:Z
    :catch_0
    move-exception v1

    .line 2915
    .local v1, e:Ljava/lang/Exception;
    const-string v3, "KeyguardUpdateMonitor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "queryIccNetworkLock got exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2911
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #bundle:Landroid/os/Bundle;
    .restart local v2       #query_result:Z
    :cond_2
    :try_start_1
    const-string v3, "KeyguardUpdateMonitor"

    const-string v4, "queryIccNetworkLock result fail"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
