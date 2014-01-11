.class Lcom/android/launcher2/MTKUnreadLoader$1;
.super Landroid/os/AsyncTask;
.source "MTKUnreadLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/MTKUnreadLoader;->loadAndInitUnreadShortcuts()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/MTKUnreadLoader;


# direct methods
.method constructor <init>(Lcom/android/launcher2/MTKUnreadLoader;)V
    .locals 0
    .parameter

    .prologue
    .line 127
    iput-object p1, p0, Lcom/android/launcher2/MTKUnreadLoader$1;->this$0:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/launcher2/MTKUnreadLoader$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .parameter "unused"

    .prologue
    .line 130
    iget-object v0, p0, Lcom/android/launcher2/MTKUnreadLoader$1;->this$0:Lcom/android/launcher2/MTKUnreadLoader;

    #calls: Lcom/android/launcher2/MTKUnreadLoader;->loadUnreadSupportShortcuts()V
    invoke-static {v0}, Lcom/android/launcher2/MTKUnreadLoader;->access$000(Lcom/android/launcher2/MTKUnreadLoader;)V

    .line 131
    iget-object v0, p0, Lcom/android/launcher2/MTKUnreadLoader$1;->this$0:Lcom/android/launcher2/MTKUnreadLoader;

    #calls: Lcom/android/launcher2/MTKUnreadLoader;->initUnreadNumberFromSystem()V
    invoke-static {v0}, Lcom/android/launcher2/MTKUnreadLoader;->access$100(Lcom/android/launcher2/MTKUnreadLoader;)V

    .line 132
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 127
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/launcher2/MTKUnreadLoader$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 137
    iget-object v1, p0, Lcom/android/launcher2/MTKUnreadLoader$1;->this$0:Lcom/android/launcher2/MTKUnreadLoader;

    #getter for: Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v1}, Lcom/android/launcher2/MTKUnreadLoader;->access$200(Lcom/android/launcher2/MTKUnreadLoader;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 138
    iget-object v1, p0, Lcom/android/launcher2/MTKUnreadLoader$1;->this$0:Lcom/android/launcher2/MTKUnreadLoader;

    #getter for: Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v1}, Lcom/android/launcher2/MTKUnreadLoader;->access$200(Lcom/android/launcher2/MTKUnreadLoader;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;

    .line 139
    .local v0, callbacks:Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;
    if-eqz v0, :cond_0

    .line 140
    invoke-interface {v0}, Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;->bindUnreadInfoIfNeeded()V

    .line 143
    .end local v0           #callbacks:Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;
    :cond_0
    return-void
.end method
