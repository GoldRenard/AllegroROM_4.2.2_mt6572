.class public Lcom/mediatek/settings/SimItem;
.super Ljava/lang/Object;
.source "SimItem.java"


# instance fields
.field public mIsSim:Z

.field public mSiminfo:Landroid/provider/Telephony$SIMInfo;

.field public mState:I


# direct methods
.method public constructor <init>(Landroid/provider/Telephony$SIMInfo;)V
    .locals 2
    .parameter "siminfo"

    .prologue
    const/4 v1, 0x1

    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-boolean v1, p0, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    .line 10
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/settings/SimItem;->mState:I

    .line 13
    iput-object p1, p0, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    .line 14
    if-nez p1, :cond_0

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    .line 19
    :goto_0
    return-void

    .line 17
    :cond_0
    iput-boolean v1, p0, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    goto :goto_0
.end method
