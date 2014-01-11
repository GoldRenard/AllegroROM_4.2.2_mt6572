.class Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "InterruptibleInOutAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;-><init>(JFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;)V
    .locals 0
    .parameter

    .prologue
    .line 53
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator$1;->this$0:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator$1;->this$0:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    const/4 v1, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->access$002(Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;I)I

    .line 57
    return-void
.end method
