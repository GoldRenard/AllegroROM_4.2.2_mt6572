.class final Lcom/cyanogenmod/trebuchet/LauncherModel$2;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;->checkItemInfo(Lcom/cyanogenmod/trebuchet/ItemInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

.field final synthetic val$itemId:J

.field final synthetic val$stackTrace:[Ljava/lang/StackTraceElement;


# direct methods
.method constructor <init>(JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 303
    iput-wide p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$itemId:J

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$stackTrace:[Ljava/lang/StackTraceElement;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 305
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherModel;->sBgLock:Ljava/lang/Object;

    monitor-enter v1

    .line 306
    :try_start_0
    iget-wide v2, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$itemId:J

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$item:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$2;->val$stackTrace:[Ljava/lang/StackTraceElement;

    invoke-static {v2, v3, v0, v4}, Lcom/cyanogenmod/trebuchet/LauncherModel;->checkItemInfoLocked(JLcom/cyanogenmod/trebuchet/ItemInfo;[Ljava/lang/StackTraceElement;)V

    .line 307
    monitor-exit v1

    .line 308
    return-void

    .line 307
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
