.class Lcom/cyanogenmod/trebuchet/PagedView$1;
.super Ljava/lang/Object;
.source "PagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/PagedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/PagedView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/PagedView;)V
    .locals 0
    .parameter

    .prologue
    .line 2029
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedView$1;->this$0:Lcom/cyanogenmod/trebuchet/PagedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2032
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedView$1;->this$0:Lcom/cyanogenmod/trebuchet/PagedView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/PagedView;->hideScrollingIndicator(Z)V

    .line 2033
    return-void
.end method
