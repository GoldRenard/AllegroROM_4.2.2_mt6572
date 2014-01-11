.class Lcom/android/browser/UrlInputView$2;
.super Ljava/lang/Object;
.source "UrlInputView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/UrlInputView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/UrlInputView;


# direct methods
.method constructor <init>(Lcom/android/browser/UrlInputView;)V
    .locals 0
    .parameter

    .prologue
    .line 148
    iput-object p1, p0, Lcom/android/browser/UrlInputView$2;->this$0:Lcom/android/browser/UrlInputView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/android/browser/UrlInputView$2;->this$0:Lcom/android/browser/UrlInputView;

    const/4 v1, 0x2

    #calls: Lcom/android/browser/UrlInputView;->changeState(I)V
    invoke-static {v0, v1}, Lcom/android/browser/UrlInputView;->access$000(Lcom/android/browser/UrlInputView;I)V

    .line 151
    return-void
.end method
