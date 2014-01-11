.class Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$1;
.super Ljava/lang/Object;
.source "AppWidgetResizeFrame.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->onTouchUp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;)V
    .locals 0
    .parameter

    .prologue
    .line 382
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$1;->this$0:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 385
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$1;->this$0:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->snapToWidget(Z)V

    .line 386
    return-void
.end method
