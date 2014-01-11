.class Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$3;
.super Ljava/lang/Object;
.source "PasswordUnlockScreen.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;-><init>(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 166
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 174
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->mResuming:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$3;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock()V

    .line 177
    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 171
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 168
    return-void
.end method
