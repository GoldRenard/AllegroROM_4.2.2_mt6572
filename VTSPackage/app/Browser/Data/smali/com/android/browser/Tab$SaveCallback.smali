.class Lcom/android/browser/Tab$SaveCallback;
.super Ljava/lang/Object;
.source "Tab.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Tab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SaveCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field mResult:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1986
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/browser/Tab$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1986
    invoke-direct {p0}, Lcom/android/browser/Tab$SaveCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceiveValue(Ljava/lang/Boolean;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 1991
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/browser/Tab$SaveCallback;->mResult:Z

    .line 1992
    monitor-enter p0

    .line 1993
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1994
    monitor-exit p0

    .line 1995
    return-void

    .line 1994
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1986
    check-cast p1, Ljava/lang/Boolean;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/Tab$SaveCallback;->onReceiveValue(Ljava/lang/Boolean;)V

    return-void
.end method
