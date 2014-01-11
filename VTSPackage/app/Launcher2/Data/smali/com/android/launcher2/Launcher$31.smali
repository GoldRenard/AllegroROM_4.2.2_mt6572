.class Lcom/android/launcher2/Launcher$31;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->bindComponentUnreadChanged(Landroid/content/ComponentName;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$component:Landroid/content/ComponentName;

.field final synthetic val$unreadNum:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/content/ComponentName;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4589
    iput-object p1, p0, Lcom/android/launcher2/Launcher$31;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$31;->val$component:Landroid/content/ComponentName;

    iput p3, p0, Lcom/android/launcher2/Launcher$31;->val$unreadNum:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 4591
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 4593
    .local v0, start:J
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bindComponentUnreadChanged begin: component = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Launcher$31;->val$component:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", unreadNum = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/Launcher$31;->val$unreadNum:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", start = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4596
    iget-object v2, p0, Lcom/android/launcher2/Launcher$31;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 4597
    iget-object v2, p0, Lcom/android/launcher2/Launcher$31;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Launcher$31;->val$component:Landroid/content/ComponentName;

    iget v4, p0, Lcom/android/launcher2/Launcher$31;->val$unreadNum:I

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/Workspace;->updateComponentUnreadChanged(Landroid/content/ComponentName;I)V

    .line 4600
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/Launcher$31;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$2700(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizePagedView;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 4601
    iget-object v2, p0, Lcom/android/launcher2/Launcher$31;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$2700(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizePagedView;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Launcher$31;->val$component:Landroid/content/ComponentName;

    iget v4, p0, Lcom/android/launcher2/Launcher$31;->val$unreadNum:I

    invoke-virtual {v2, v3, v4}, Lcom/android/launcher2/AppsCustomizePagedView;->updateAppsUnreadChanged(Landroid/content/ComponentName;I)V

    .line 4604
    :cond_1
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bindComponentUnreadChanged end: current time = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", time used = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4608
    return-void
.end method
