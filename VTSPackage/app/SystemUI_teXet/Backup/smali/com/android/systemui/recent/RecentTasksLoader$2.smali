.class Lcom/android/systemui/recent/RecentTasksLoader$2;
.super Ljava/lang/Thread;
.source "RecentTasksLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/recent/RecentTasksLoader;->preloadFirstTask()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/recent/RecentTasksLoader;


# direct methods
.method constructor <init>(Lcom/android/systemui/recent/RecentTasksLoader;)V
    .registers 2
    .parameter

    .prologue
    .line 313
    iput-object p1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 315
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    invoke-virtual {v1}, Lcom/android/systemui/recent/RecentTasksLoader;->loadFirstTask()Lcom/android/systemui/recent/TaskDescription;

    move-result-object v0

    .line 316
    .local v0, first:Lcom/android/systemui/recent/TaskDescription;
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    invoke-static {v1}, Lcom/android/systemui/recent/RecentTasksLoader;->access$000(Lcom/android/systemui/recent/RecentTasksLoader;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 317
    :try_start_d
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    iget-boolean v1, v1, Lcom/android/systemui/recent/RecentTasksLoader;->mCancelPreloadingFirstTask:Z

    if-eqz v1, :cond_1f

    .line 318
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    invoke-static {v1}, Lcom/android/systemui/recent/RecentTasksLoader;->access$100(Lcom/android/systemui/recent/RecentTasksLoader;)V

    .line 323
    :goto_18
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/android/systemui/recent/RecentTasksLoader;->mPreloadingFirstTask:Z

    .line 324
    monitor-exit v2

    .line 325
    return-void

    .line 320
    :cond_1f
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    invoke-static {v1, v0}, Lcom/android/systemui/recent/RecentTasksLoader;->access$202(Lcom/android/systemui/recent/RecentTasksLoader;Lcom/android/systemui/recent/TaskDescription;)Lcom/android/systemui/recent/TaskDescription;

    .line 321
    iget-object v1, p0, Lcom/android/systemui/recent/RecentTasksLoader$2;->this$0:Lcom/android/systemui/recent/RecentTasksLoader;

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lcom/android/systemui/recent/RecentTasksLoader;->access$302(Lcom/android/systemui/recent/RecentTasksLoader;Z)Z

    goto :goto_18

    .line 324
    :catchall_2b
    move-exception v1

    monitor-exit v2
    :try_end_2d
    .catchall {:try_start_d .. :try_end_2d} :catchall_2b

    throw v1
.end method
