.class Lcom/cyanogenmod/trebuchet/DragView$3;
.super Ljava/lang/Object;
.source "DragView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DragView;->show(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragView;)V
    .locals 0
    .parameter

    .prologue
    .line 260
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView$3;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragView$3;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DragView;->mAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 263
    return-void
.end method
