.class Lcom/android/launcher2/LauncherModel$1;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel;->unbindWorkspaceItemsOnMainThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/LauncherModel;

.field final synthetic val$tmpAppWidgets:Ljava/util/ArrayList;

.field final synthetic val$tmpWorkspaceItems:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/android/launcher2/LauncherModel;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 264
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$1;->this$0:Lcom/android/launcher2/LauncherModel;

    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$1;->val$tmpWorkspaceItems:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/android/launcher2/LauncherModel$1;->val$tmpAppWidgets:Ljava/util/ArrayList;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 267
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$1;->val$tmpWorkspaceItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 268
    .local v1, item:Lcom/android/launcher2/ItemInfo;
    invoke-virtual {v1}, Lcom/android/launcher2/ItemInfo;->unbind()V

    goto :goto_0

    .line 270
    .end local v1           #item:Lcom/android/launcher2/ItemInfo;
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$1;->val$tmpAppWidgets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ItemInfo;

    .line 271
    .restart local v1       #item:Lcom/android/launcher2/ItemInfo;
    invoke-virtual {v1}, Lcom/android/launcher2/ItemInfo;->unbind()V

    goto :goto_1

    .line 273
    .end local v1           #item:Lcom/android/launcher2/ItemInfo;
    :cond_1
    return-void
.end method
