.class Lcom/cyanogenmod/trebuchet/DragLayer$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DragLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DragLayer;->animateView(Lcom/cyanogenmod/trebuchet/DragView;Landroid/animation/ValueAnimator$AnimatorUpdateListener;ILandroid/animation/TimeInterpolator;Ljava/lang/Runnable;ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

.field final synthetic val$animationEndStyle:I

.field final synthetic val$onCompleteRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragLayer;Ljava/lang/Runnable;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 608
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->val$onCompleteRunnable:Ljava/lang/Runnable;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->val$animationEndStyle:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 610
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->val$onCompleteRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 613
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->val$animationEndStyle:I

    packed-switch v0, :pswitch_data_0

    .line 623
    :goto_0
    return-void

    .line 615
    :pswitch_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->clearAnimatedView()V

    goto :goto_0

    .line 618
    :pswitch_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$3;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    #calls: Lcom/cyanogenmod/trebuchet/DragLayer;->fadeOutDragView()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->access$300(Lcom/cyanogenmod/trebuchet/DragLayer;)V

    goto :goto_0

    .line 613
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
