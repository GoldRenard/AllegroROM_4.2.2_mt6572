.class public Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;
.super Ljava/lang/Object;
.source "CheckLongPressHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;
    }
.end annotation


# instance fields
.field private mHasPerformedLongPress:Z

.field private mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z

    return v0
.end method

.method static synthetic access$102(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z

    return p1
.end method


# virtual methods
.method public cancelLongPress()V
    .locals 2

    .prologue
    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z

    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    .line 57
    :cond_0
    return-void
.end method

.method public hasPerformedLongPress()Z
    .locals 1

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z

    return v0
.end method

.method public postCheckForLongPress()V
    .locals 4

    .prologue
    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mHasPerformedLongPress:Z

    .line 45
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;-><init>(Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mView:Landroid/view/View;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->mPendingCheckForLongPress:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper$CheckForLongPress;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getLongPressTimeout()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    return-void
.end method
