.class Lcom/android/browser/PhoneUi$3;
.super Ljava/lang/Object;
.source "PhoneUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/PhoneUi;->onActionModeFinished(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/PhoneUi;

.field final synthetic val$anim1:Landroid/animation/ObjectAnimator;


# direct methods
.method constructor <init>(Lcom/android/browser/PhoneUi;Landroid/animation/ObjectAnimator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 327
    iput-object p1, p0, Lcom/android/browser/PhoneUi$3;->this$0:Lcom/android/browser/PhoneUi;

    iput-object p2, p0, Lcom/android/browser/PhoneUi$3;->val$anim1:Landroid/animation/ObjectAnimator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/android/browser/PhoneUi$3;->val$anim1:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 330
    return-void
.end method
