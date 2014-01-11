.class final Landroid/app/NativeActivity$InputMethodCallback;
.super Ljava/lang/Object;
.source "NativeActivity.java"

# interfaces
.implements Landroid/view/inputmethod/InputMethodManager$FinishedEventCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/NativeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "InputMethodCallback"
.end annotation


# instance fields
.field mNa:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/NativeActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/app/NativeActivity;)V
    .locals 1
    .parameter "na"

    .prologue
    .line 124
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/app/NativeActivity$InputMethodCallback;->mNa:Ljava/lang/ref/WeakReference;

    .line 126
    return-void
.end method


# virtual methods
.method public finishedEvent(IZ)V
    .locals 2
    .parameter "seq"
    .parameter "handled"

    .prologue
    .line 130
    iget-object v1, p0, Landroid/app/NativeActivity$InputMethodCallback;->mNa:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NativeActivity;

    .line 131
    .local v0, na:Landroid/app/NativeActivity;
    if-eqz v0, :cond_0

    .line 132
    #getter for: Landroid/app/NativeActivity;->mNativeHandle:I
    invoke-static {v0}, Landroid/app/NativeActivity;->access$000(Landroid/app/NativeActivity;)I

    move-result v1

    #calls: Landroid/app/NativeActivity;->finishPreDispatchKeyEventNative(IIZ)V
    invoke-static {v0, v1, p1, p2}, Landroid/app/NativeActivity;->access$100(Landroid/app/NativeActivity;IIZ)V

    .line 134
    :cond_0
    return-void
.end method
