.class Lcom/android/browser/PhoneUi$1;
.super Ljava/lang/Object;
.source "PhoneUi.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


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


# direct methods
.method constructor <init>(Lcom/android/browser/PhoneUi;)V
    .locals 0
    .parameter

    .prologue
    .line 296
    iput-object p1, p0, Lcom/android/browser/PhoneUi$1;->this$0:Lcom/android/browser/PhoneUi;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 301
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 306
    iget-object v0, p0, Lcom/android/browser/PhoneUi$1;->this$0:Lcom/android/browser/PhoneUi;

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mTitleBar:Lcom/android/browser/TitleBar;

    invoke-virtual {v0}, Lcom/android/browser/TitleBar;->getNavigationBar()Lcom/android/browser/NavigationBarBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/NavigationBarBase;->getUrlInputView()Lcom/android/browser/UrlInputView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/UrlInputView;->showDropDown()V

    .line 307
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 312
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .parameter "animation"

    .prologue
    .line 317
    return-void
.end method
