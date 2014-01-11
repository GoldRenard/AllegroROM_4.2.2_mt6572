.class Landroid/view/inputmethod/InputMethodManager$2;
.super Lcom/android/internal/view/IInputMethodCallback$Stub;
.source "InputMethodManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/inputmethod/InputMethodManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method constructor <init>(Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0
    .parameter

    .prologue
    .line 540
    iput-object p1, p0, Landroid/view/inputmethod/InputMethodManager$2;->this$0:Landroid/view/inputmethod/InputMethodManager;

    invoke-direct {p0}, Lcom/android/internal/view/IInputMethodCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public finishedEvent(IZ)V
    .locals 1
    .parameter "seq"
    .parameter "handled"

    .prologue
    .line 543
    iget-object v0, p0, Landroid/view/inputmethod/InputMethodManager$2;->this$0:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0, p1, p2}, Landroid/view/inputmethod/InputMethodManager;->finishedEvent(IZ)V

    .line 544
    return-void
.end method

.method public notifyImsPid(I)V
    .locals 0
    .parameter "pid"

    .prologue
    .line 554
    return-void
.end method

.method public sessionCreated(Lcom/android/internal/view/IInputMethodSession;)V
    .locals 0
    .parameter "session"

    .prologue
    .line 549
    return-void
.end method
