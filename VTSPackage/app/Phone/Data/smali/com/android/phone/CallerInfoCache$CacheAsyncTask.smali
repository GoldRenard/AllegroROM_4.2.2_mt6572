.class Lcom/android/phone/CallerInfoCache$CacheAsyncTask;
.super Landroid/os/AsyncTask;
.source "CallerInfoCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/CallerInfoCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CacheAsyncTask"
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
.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field final synthetic this$0:Lcom/android/phone/CallerInfoCache;


# direct methods
.method private constructor <init>(Lcom/android/phone/CallerInfoCache;)V
    .locals 0
    .parameter

    .prologue
    .line 95
    iput-object p1, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->this$0:Lcom/android/phone/CallerInfoCache;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/CallerInfoCache;Lcom/android/phone/CallerInfoCache$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;-><init>(Lcom/android/phone/CallerInfoCache;)V

    return-void
.end method

.method private releaseWakeLock()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 137
    :cond_0
    return-void
.end method


# virtual methods
.method public acquireWakeLockAndExecute()V
    .locals 3

    .prologue
    .line 106
    iget-object v1, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->this$0:Lcom/android/phone/CallerInfoCache;

    #getter for: Lcom/android/phone/CallerInfoCache;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/phone/CallerInfoCache;->access$000(Lcom/android/phone/CallerInfoCache;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 107
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    invoke-static {}, Lcom/android/phone/CallerInfoCache;->access$100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 108
    iget-object v1, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 109
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p0, v1}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 110
    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 95
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .parameter "params"

    .prologue
    .line 114
    invoke-static {}, Lcom/android/phone/CallerInfoCache;->access$200()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Start refreshing cache."

    #calls: Lcom/android/phone/CallerInfoCache;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/phone/CallerInfoCache;->access$300(Ljava/lang/String;)V

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->this$0:Lcom/android/phone/CallerInfoCache;

    #calls: Lcom/android/phone/CallerInfoCache;->refreshCacheEntry()V
    invoke-static {v0}, Lcom/android/phone/CallerInfoCache;->access$400(Lcom/android/phone/CallerInfoCache;)V

    .line 116
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 95
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->onCancelled(Ljava/lang/Void;)V

    return-void
.end method

.method protected onCancelled(Ljava/lang/Void;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 129
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 130
    invoke-direct {p0}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->releaseWakeLock()V

    .line 131
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 95
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 122
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 123
    invoke-direct {p0}, Lcom/android/phone/CallerInfoCache$CacheAsyncTask;->releaseWakeLock()V

    .line 124
    return-void
.end method
