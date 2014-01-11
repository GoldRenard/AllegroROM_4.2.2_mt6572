.class Lcom/cyanogenmod/trebuchet/PagedViewIcon$1;
.super Ljava/lang/Object;
.source "PagedViewIcon.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/PagedViewIcon;->resetDrawableState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/PagedViewIcon;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/PagedViewIcon;)V
    .locals 0
    .parameter

    .prologue
    .line 70
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewIcon$1;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewIcon$1;->this$0:Lcom/cyanogenmod/trebuchet/PagedViewIcon;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedViewIcon;->refreshDrawableState()V

    .line 74
    return-void
.end method
