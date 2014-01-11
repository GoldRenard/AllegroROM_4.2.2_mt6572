.class Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$2;
.super Ljava/lang/Object;
.source "AppWidgetResizeFrame.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->snapToWidget(Z)V
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
    .line 442
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$2;->this$0:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 444
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame$2;->this$0:Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->requestLayout()V

    .line 445
    return-void
.end method
