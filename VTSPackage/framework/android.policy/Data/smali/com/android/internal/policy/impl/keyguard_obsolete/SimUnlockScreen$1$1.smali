.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;
.super Ljava/lang/Object;
.source "SimUnlockScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->onSimLockChangedResponse(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

.field final synthetic val$success:Z


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 218
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iput-boolean p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mSimUnlockProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    .line 223
    :cond_0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->val$success:Z

    if-eqz v0, :cond_1

    .line 226
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->reportSimUnlocked()V

    .line 227
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 233
    :goto_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock()V

    .line 234
    return-void

    .line 229
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mHeaderText:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x10402e3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 230
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mPinText:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$500(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1$1;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    const/4 v1, 0x0

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mEnteredDigits:I
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$602(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;I)I

    goto :goto_0
.end method
