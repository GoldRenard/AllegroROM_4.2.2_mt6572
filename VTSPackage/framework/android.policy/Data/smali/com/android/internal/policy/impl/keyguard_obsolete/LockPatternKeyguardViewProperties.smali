.class public Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;
.super Ljava/lang/Object;
.source "LockPatternKeyguardViewProperties.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewProperties;


# instance fields
.field private final mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private final mUpdateMonitor:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;


# direct methods
.method public constructor <init>(Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;)V
    .locals 0
    .parameter "lockPatternUtils"
    .parameter "updateMonitor"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 42
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->mUpdateMonitor:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    .line 43
    return-void
.end method

.method private isSimPinSecure()Z
    .locals 2

    .prologue
    .line 58
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->mUpdateMonitor:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->getSimState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v0

    .line 59
    .local v0, simState:Lcom/android/internal/telephony/IccCardConstants$State;
    sget-object v1, Lcom/android/internal/telephony/IccCardConstants$State;->PIN_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/android/internal/telephony/IccCardConstants$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/android/internal/telephony/IccCardConstants$State;->PERM_DISABLED:Lcom/android/internal/telephony/IccCardConstants$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public createKeyguardView(Landroid/content/Context;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewCallback;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardWindowController;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;
    .locals 6
    .parameter "context"
    .parameter "callback"
    .parameter "updateMonitor"
    .parameter "controller"

    .prologue
    .line 49
    new-instance v0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewCallback;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardWindowController;)V

    return-object v0
.end method

.method public isSecure()Z
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isSecure()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardViewProperties;->isSimPinSecure()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
