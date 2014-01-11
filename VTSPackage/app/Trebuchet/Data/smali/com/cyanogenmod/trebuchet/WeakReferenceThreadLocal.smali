.class abstract Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 164
    .local p0, this:Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;,"Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->mThreadLocal:Ljava/lang/ThreadLocal;

    .line 166
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 175
    .local p0, this:Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;,"Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal<TT;>;"
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->mThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 177
    .local v2, reference:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    if-nez v2, :cond_0

    .line 178
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->initialValue()Ljava/lang/Object;

    move-result-object v0

    .line 179
    .local v0, obj:Ljava/lang/Object;,"TT;"
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->mThreadLocal:Ljava/lang/ThreadLocal;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    move-object v1, v0

    .line 187
    .end local v0           #obj:Ljava/lang/Object;,"TT;"
    .local v1, obj:Ljava/lang/Object;,"TT;"
    :goto_0
    return-object v1

    .line 182
    .end local v1           #obj:Ljava/lang/Object;,"TT;"
    :cond_0
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 183
    .restart local v0       #obj:Ljava/lang/Object;,"TT;"
    if-nez v0, :cond_1

    .line 184
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->initialValue()Ljava/lang/Object;

    move-result-object v0

    .line 185
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->mThreadLocal:Ljava/lang/ThreadLocal;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_1
    move-object v1, v0

    .line 187
    .end local v0           #obj:Ljava/lang/Object;,"TT;"
    .restart local v1       #obj:Ljava/lang/Object;,"TT;"
    goto :goto_0
.end method

.method abstract initialValue()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, this:Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;,"Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal<TT;>;"
    .local p1, t:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;->mThreadLocal:Ljava/lang/ThreadLocal;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 172
    return-void
.end method
