.class Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PackageUpdatedTask"
.end annotation


# static fields
.field public static final OP_ADD:I = 0x1

.field public static final OP_NONE:I = 0x0

.field public static final OP_REMOVE:I = 0x3

.field public static final OP_UNAVAILABLE:I = 0x4

.field public static final OP_UPDATE:I = 0x2


# instance fields
.field mOp:I

.field mPackages:[Ljava/lang/String;

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel;I[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "op"
    .parameter "packages"

    .prologue
    .line 2059
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2060
    iput p2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->mOp:I

    .line 2061
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->mPackages:[Ljava/lang/String;

    .line 2062
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 2065
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mApp:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$800(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/LauncherApplication;

    move-result-object v4

    .line 2067
    .local v4, context:Landroid/content/Context;
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->mPackages:[Ljava/lang/String;

    .line 2068
    .local v10, packages:[Ljava/lang/String;
    iget v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->mOp:I

    packed-switch v13, :pswitch_data_0

    .line 2090
    :cond_0
    const/4 v0, 0x0

    .line 2091
    .local v0, added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    const/4 v7, 0x0

    .line 2093
    .local v7, modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_1

    .line 2094
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    invoke-direct {v0, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2095
    .restart local v0       #added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->added:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 2097
    :cond_1
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->modified:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_2

    .line 2098
    new-instance v7, Ljava/util/ArrayList;

    .end local v7           #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->modified:Ljava/util/ArrayList;

    invoke-direct {v7, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2099
    .restart local v7       #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->modified:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 2104
    :cond_2
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 2105
    .local v12, removedPackageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->removed:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_3

    .line 2106
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    iget-object v13, v13, Lcom/cyanogenmod/trebuchet/AllAppsList;->removed:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 2108
    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2111
    :cond_3
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v13

    if-eqz v13, :cond_4

    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mCallbacks:Ljava/lang/ref/WeakReference;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Ljava/lang/ref/WeakReference;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;

    move-object v3, v13

    .line 2112
    .local v3, callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    :goto_0
    if-nez v3, :cond_5

    .line 2113
    const-string v13, "Trebuchet.LauncherModel"

    const-string v14, "Nobody to tell about the new app.  Launcher is probably loading."

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2160
    :goto_1
    return-void

    .line 2070
    .end local v0           #added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    .end local v3           #callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    .end local v7           #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    .end local v12           #removedPackageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_0
    move-object v2, v10

    .local v2, arr$:[Ljava/lang/String;
    array-length v6, v2

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_2
    if-ge v5, v6, :cond_0

    aget-object v9, v2, v5

    .line 2072
    .local v9, p:Ljava/lang/String;
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    invoke-virtual {v13, v4, v9}, Lcom/cyanogenmod/trebuchet/AllAppsList;->addPackage(Landroid/content/Context;Ljava/lang/String;)V

    .line 2070
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2076
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v9           #p:Ljava/lang/String;
    :pswitch_1
    move-object v2, v10

    .restart local v2       #arr$:[Ljava/lang/String;
    array-length v6, v2

    .restart local v6       #len$:I
    const/4 v5, 0x0

    .restart local v5       #i$:I
    :goto_3
    if-ge v5, v6, :cond_0

    aget-object v9, v2, v5

    .line 2078
    .restart local v9       #p:Ljava/lang/String;
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    invoke-virtual {v13, v4, v9}, Lcom/cyanogenmod/trebuchet/AllAppsList;->updatePackage(Landroid/content/Context;Ljava/lang/String;)V

    .line 2076
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 2083
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v9           #p:Ljava/lang/String;
    :pswitch_2
    move-object v2, v10

    .restart local v2       #arr$:[Ljava/lang/String;
    array-length v6, v2

    .restart local v6       #len$:I
    const/4 v5, 0x0

    .restart local v5       #i$:I
    :goto_4
    if-ge v5, v6, :cond_0

    aget-object v9, v2, v5

    .line 2085
    .restart local v9       #p:Ljava/lang/String;
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mBgAllAppsList:Lcom/cyanogenmod/trebuchet/AllAppsList;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$1600(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/AllAppsList;

    move-result-object v13

    invoke-virtual {v13, v9}, Lcom/cyanogenmod/trebuchet/AllAppsList;->removePackage(Ljava/lang/String;)V

    .line 2083
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 2111
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v9           #p:Ljava/lang/String;
    .restart local v0       #added:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    .restart local v7       #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    .restart local v12       #removedPackageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_4
    const/4 v3, 0x0

    goto :goto_0

    .line 2117
    .restart local v3       #callbacks:Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
    :cond_5
    if-eqz v0, :cond_6

    .line 2118
    move-object v1, v0

    .line 2119
    .local v1, addedFinal:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v13

    new-instance v14, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$1;

    invoke-direct {v14, p0, v3, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$1;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;)V

    invoke-virtual {v13, v14}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    .line 2128
    .end local v1           #addedFinal:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    :cond_6
    if-eqz v7, :cond_7

    .line 2129
    move-object v8, v7

    .line 2130
    .local v8, modifiedFinal:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v13

    new-instance v14, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$2;

    invoke-direct {v14, p0, v3, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$2;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;)V

    invoke-virtual {v13, v14}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    .line 2139
    .end local v8           #modifiedFinal:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    :cond_7
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_8

    .line 2140
    iget v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->mOp:I

    const/4 v14, 0x4

    if-eq v13, v14, :cond_9

    const/4 v11, 0x1

    .line 2141
    .local v11, permanent:Z
    :goto_5
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v13

    new-instance v14, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$3;

    invoke-direct {v14, p0, v3, v12, v11}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$3;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;Ljava/util/ArrayList;Z)V

    invoke-virtual {v13, v14}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    .line 2151
    .end local v11           #permanent:Z
    :cond_8
    iget-object v13, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;->this$0:Lcom/cyanogenmod/trebuchet/LauncherModel;

    #getter for: Lcom/cyanogenmod/trebuchet/LauncherModel;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler;
    invoke-static {v13}, Lcom/cyanogenmod/trebuchet/LauncherModel;->access$200(Lcom/cyanogenmod/trebuchet/LauncherModel;)Lcom/cyanogenmod/trebuchet/DeferredHandler;

    move-result-object v13

    new-instance v14, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$4;

    invoke-direct {v14, p0, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask$4;-><init>(Lcom/cyanogenmod/trebuchet/LauncherModel$PackageUpdatedTask;Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;)V

    invoke-virtual {v13, v14}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 2140
    :cond_9
    const/4 v11, 0x0

    goto :goto_5

    .line 2068
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
