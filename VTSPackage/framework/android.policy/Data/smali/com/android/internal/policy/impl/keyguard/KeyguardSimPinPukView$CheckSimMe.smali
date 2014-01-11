.class abstract Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;
.super Ljava/lang/Thread;
.source "KeyguardSimPinPukView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CheckSimMe"
.end annotation


# instance fields
.field private final mPasswd:Ljava/lang/String;

.field private mResult:I

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;


# direct methods
.method protected constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "passwd"
    .parameter "simId"

    .prologue
    .line 591
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 592
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->mPasswd:Ljava/lang/String;

    .line 593
    return-void
.end method

.method static synthetic access$1100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 587
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->mResult:I

    return v0
.end method


# virtual methods
.method abstract onSimMeCheckResponse(I)V
.end method

.method public run()V
    .locals 4

    .prologue
    .line 599
    :try_start_0
    const-string v1, "KeyguardSimPinPukView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CheckMe, mSimId ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    iget v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    const-string v1, "phoneEx"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/common/telephony/ITelephonyEx$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/common/telephony/ITelephonyEx;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->mPasswd:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    iget v3, v3, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->mSimId:I

    invoke-interface {v1, v2, v3}, Lcom/mediatek/common/telephony/ITelephonyEx;->supplyNetworkDepersonalization(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->mResult:I

    .line 602
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    new-instance v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe$1;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;)V

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 614
    :goto_0
    return-void

    .line 607
    :catch_0
    move-exception v0

    .line 608
    .local v0, e:Landroid/os/RemoteException;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    new-instance v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe$2;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe$2;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;)V

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
