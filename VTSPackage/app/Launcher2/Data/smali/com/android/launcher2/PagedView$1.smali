.class Lcom/android/launcher2/PagedView$1;
.super Ljava/lang/Object;
.source "PagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/PagedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/PagedView;


# direct methods
.method constructor <init>(Lcom/android/launcher2/PagedView;)V
    .locals 0
    .parameter

    .prologue
    .line 2084
    iput-object p1, p0, Lcom/android/launcher2/PagedView$1;->this$0:Lcom/android/launcher2/PagedView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2087
    iget-object v0, p0, Lcom/android/launcher2/PagedView$1;->this$0:Lcom/android/launcher2/PagedView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/PagedView;->hideScrollingIndicator(Z)V

    .line 2088
    return-void
.end method
