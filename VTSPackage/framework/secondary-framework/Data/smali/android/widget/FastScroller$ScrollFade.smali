.class public Landroid/widget/FastScroller$ScrollFade;
.super Ljava/lang/Object;
.source "FastScroller.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/FastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScrollFade"
.end annotation


# static fields
.field static final ALPHA_MAX:I = 0xd0

.field static final FADE_DURATION:J = 0xc8L


# instance fields
.field mFadeDuration:J

.field mStartTime:J

.field final synthetic this$0:Landroid/widget/FastScroller;


# direct methods
.method public constructor <init>(Landroid/widget/FastScroller;)V
    .locals 0
    .parameter

    .prologue
    .line 883
    iput-object p1, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getAlpha()I
    .locals 9

    .prologue
    const-wide/16 v7, 0xd0

    .line 897
    iget-object v3, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    invoke-virtual {v3}, Landroid/widget/FastScroller;->getState()I

    move-result v3

    const/4 v4, 0x4

    if-eq v3, v4, :cond_0

    .line 898
    const/16 v0, 0xd0

    .line 907
    :goto_0
    return v0

    .line 901
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 902
    .local v1, now:J
    iget-wide v3, p0, Landroid/widget/FastScroller$ScrollFade;->mStartTime:J

    iget-wide v5, p0, Landroid/widget/FastScroller$ScrollFade;->mFadeDuration:J

    add-long/2addr v3, v5

    cmp-long v3, v1, v3

    if-lez v3, :cond_1

    .line 903
    const/4 v0, 0x0

    .local v0, alpha:I
    goto :goto_0

    .line 905
    .end local v0           #alpha:I
    :cond_1
    iget-wide v3, p0, Landroid/widget/FastScroller$ScrollFade;->mStartTime:J

    sub-long v3, v1, v3

    mul-long/2addr v3, v7

    iget-wide v5, p0, Landroid/widget/FastScroller$ScrollFade;->mFadeDuration:J

    div-long/2addr v3, v5

    sub-long v3, v7, v3

    long-to-int v0, v3

    .restart local v0       #alpha:I
    goto :goto_0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 911
    iget-object v0, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    invoke-virtual {v0}, Landroid/widget/FastScroller;->getState()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 912
    invoke-virtual {p0}, Landroid/widget/FastScroller$ScrollFade;->startFade()V

    .line 921
    :goto_0
    return-void

    .line 916
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FastScroller$ScrollFade;->getAlpha()I

    move-result v0

    if-lez v0, :cond_1

    .line 917
    iget-object v0, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    iget-object v0, v0, Landroid/widget/FastScroller;->mList:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->invalidate()V

    goto :goto_0

    .line 919
    :cond_1
    iget-object v0, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FastScroller;->setState(I)V

    goto :goto_0
.end method

.method startFade()V
    .locals 2

    .prologue
    .line 891
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Landroid/widget/FastScroller$ScrollFade;->mFadeDuration:J

    .line 892
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/widget/FastScroller$ScrollFade;->mStartTime:J

    .line 893
    iget-object v0, p0, Landroid/widget/FastScroller$ScrollFade;->this$0:Landroid/widget/FastScroller;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/FastScroller;->setState(I)V

    .line 894
    return-void
.end method
