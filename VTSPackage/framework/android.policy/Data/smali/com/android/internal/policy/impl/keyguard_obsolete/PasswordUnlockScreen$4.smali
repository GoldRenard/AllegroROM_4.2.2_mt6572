.class Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$4;
.super Ljava/lang/Object;
.source "PasswordUnlockScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$imm:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 187
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;

    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$4;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 189
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock()V

    .line 190
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PasswordUnlockScreen$4;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->showInputMethodPicker()V

    .line 191
    return-void
.end method
