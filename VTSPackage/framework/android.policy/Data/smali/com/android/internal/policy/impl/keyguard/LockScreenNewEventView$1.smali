.class Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;
.super Ljava/lang/Object;
.source "LockScreenNewEventView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)V
    .locals 0
    .parameter

    .prologue
    .line 45
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->mCount:I
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->access$000(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)I

    move-result v1

    #calls: Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setNumberImp(I)V
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->access$100(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;I)V

    .line 49
    return-void
.end method
