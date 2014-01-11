.class public final enum Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;
.super Ljava/lang/Enum;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SimLockType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

.field public static final enum SIM_LOCK_ME:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

.field public static final enum SIM_LOCK_PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

.field public static final enum SIM_LOCK_PUK:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1602
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    const-string v1, "SIM_LOCK_PIN"

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    .line 1603
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    const-string v1, "SIM_LOCK_PUK"

    invoke-direct {v0, v1, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PUK:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    .line 1604
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    const-string v1, "SIM_LOCK_ME"

    invoke-direct {v0, v1, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_ME:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    .line 1601
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_PUK:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->SIM_LOCK_ME:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->$VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1601
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;
    .locals 1
    .parameter "name"

    .prologue
    .line 1601
    const-class v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;
    .locals 1

    .prologue
    .line 1601
    sget-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->$VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    invoke-virtual {v0}, [Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType;

    return-object v0
.end method
