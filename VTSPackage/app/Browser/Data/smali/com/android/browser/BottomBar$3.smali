.class Lcom/android/browser/BottomBar$3;
.super Ljava/lang/Object;
.source "BottomBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/BottomBar;->initLayout(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BottomBar;


# direct methods
.method constructor <init>(Lcom/android/browser/BottomBar;)V
    .locals 0
    .parameter

    .prologue
    .line 117
    iput-object p1, p0, Lcom/android/browser/BottomBar$3;->this$0:Lcom/android/browser/BottomBar;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/browser/BottomBar$3;->this$0:Lcom/android/browser/BottomBar;

    #getter for: Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;
    invoke-static {v0}, Lcom/android/browser/BottomBar;->access$000(Lcom/android/browser/BottomBar;)Lcom/android/browser/UiController;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/BottomBar$3;->this$0:Lcom/android/browser/BottomBar;

    #getter for: Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;
    invoke-static {v0}, Lcom/android/browser/BottomBar;->access$000(Lcom/android/browser/BottomBar;)Lcom/android/browser/UiController;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/android/browser/BottomBar$3;->this$0:Lcom/android/browser/BottomBar;

    #getter for: Lcom/android/browser/BottomBar;->mUiController:Lcom/android/browser/UiController;
    invoke-static {v0}, Lcom/android/browser/BottomBar;->access$000(Lcom/android/browser/BottomBar;)Lcom/android/browser/UiController;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->goForward()V

    .line 122
    :cond_0
    return-void
.end method
