.class Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen$2;
.super Ljava/lang/Object;
.source "PatternUnlockScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 92
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/PatternUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->forgotPattern(Z)V

    .line 95
    return-void
.end method
