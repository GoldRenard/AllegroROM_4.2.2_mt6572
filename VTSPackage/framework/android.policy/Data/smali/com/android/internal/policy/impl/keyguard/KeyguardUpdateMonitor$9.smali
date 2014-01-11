.class synthetic Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$9;
.super Ljava/lang/Object;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 2247
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->values()[Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$9;->$SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType:[I

    :try_start_0
    sget-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$9;->$SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType:[I

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$9;->$SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType:[I

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PUK:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$9;->$SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType:[I

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_ME:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
