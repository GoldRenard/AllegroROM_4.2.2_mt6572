.class Lcom/android/browser/TitleBar$2;
.super Ljava/lang/Object;
.source "TitleBar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/TitleBar;->hideAutoLogin(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/TitleBar;


# direct methods
.method constructor <init>(Lcom/android/browser/TitleBar;)V
    .locals 0
    .parameter

    .prologue
    .line 349
    iput-object p1, p0, Lcom/android/browser/TitleBar$2;->this$0:Lcom/android/browser/TitleBar;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .parameter "a"

    .prologue
    .line 352
    iget-object v0, p0, Lcom/android/browser/TitleBar$2;->this$0:Lcom/android/browser/TitleBar;

    #getter for: Lcom/android/browser/TitleBar;->mAutoLogin:Lcom/android/browser/AutologinBar;
    invoke-static {v0}, Lcom/android/browser/TitleBar;->access$000(Lcom/android/browser/TitleBar;)Lcom/android/browser/AutologinBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/browser/AutologinBar;->setVisibility(I)V

    .line 353
    iget-object v0, p0, Lcom/android/browser/TitleBar$2;->this$0:Lcom/android/browser/TitleBar;

    #getter for: Lcom/android/browser/TitleBar;->mBaseUi:Lcom/android/browser/BaseUi;
    invoke-static {v0}, Lcom/android/browser/TitleBar;->access$100(Lcom/android/browser/TitleBar;)Lcom/android/browser/BaseUi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BaseUi;->refreshWebView()V

    .line 354
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .parameter "a"

    .prologue
    .line 362
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .parameter "a"

    .prologue
    .line 358
    return-void
.end method
