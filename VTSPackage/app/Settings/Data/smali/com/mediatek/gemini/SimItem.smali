.class Lcom/mediatek/gemini/SimItem;
.super Ljava/lang/Object;
.source "SimManagement.java"


# instance fields
.field public mColor:I

.field public mDispalyNumberFormat:I

.field public mIsSim:Z

.field public mName:Ljava/lang/String;

.field public mNumber:Ljava/lang/String;

.field public mSimID:J

.field public mSlot:I

.field public mState:I


# direct methods
.method public constructor <init>(Landroid/provider/Telephony$SIMInfo;)V
    .locals 3
    .parameter "siminfo"

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 87
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean v2, p0, Lcom/mediatek/gemini/SimItem;->mIsSim:Z

    .line 57
    iput-object v0, p0, Lcom/mediatek/gemini/SimItem;->mName:Ljava/lang/String;

    .line 58
    iput-object v0, p0, Lcom/mediatek/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mDispalyNumberFormat:I

    .line 60
    iput v1, p0, Lcom/mediatek/gemini/SimItem;->mColor:I

    .line 61
    iput v1, p0, Lcom/mediatek/gemini/SimItem;->mSlot:I

    .line 62
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/gemini/SimItem;->mSimID:J

    .line 63
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mState:I

    .line 88
    iput-boolean v2, p0, Lcom/mediatek/gemini/SimItem;->mIsSim:Z

    .line 89
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/gemini/SimItem;->mName:Ljava/lang/String;

    .line 90
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 91
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mDispalyNumberFormat:I

    .line 92
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mColor:I

    .line 93
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mSlot:I

    .line 94
    iget-wide v0, p1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    iput-wide v0, p0, Lcom/mediatek/gemini/SimItem;->mSimID:J

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IJ)V
    .locals 4
    .parameter "name"
    .parameter "color"
    .parameter "simID"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 75
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/gemini/SimItem;->mIsSim:Z

    .line 57
    iput-object v3, p0, Lcom/mediatek/gemini/SimItem;->mName:Ljava/lang/String;

    .line 58
    iput-object v3, p0, Lcom/mediatek/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 59
    iput v2, p0, Lcom/mediatek/gemini/SimItem;->mDispalyNumberFormat:I

    .line 60
    iput v1, p0, Lcom/mediatek/gemini/SimItem;->mColor:I

    .line 61
    iput v1, p0, Lcom/mediatek/gemini/SimItem;->mSlot:I

    .line 62
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/gemini/SimItem;->mSimID:J

    .line 63
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/gemini/SimItem;->mState:I

    .line 76
    iput-object p1, p0, Lcom/mediatek/gemini/SimItem;->mName:Ljava/lang/String;

    .line 77
    iput p2, p0, Lcom/mediatek/gemini/SimItem;->mColor:I

    .line 78
    iput-boolean v2, p0, Lcom/mediatek/gemini/SimItem;->mIsSim:Z

    .line 79
    iput-wide p3, p0, Lcom/mediatek/gemini/SimItem;->mSimID:J

    .line 80
    return-void
.end method
