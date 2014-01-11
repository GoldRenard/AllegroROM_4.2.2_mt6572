.class Lcom/mediatek/oobe/basic/gemini/SimItem;
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

    .line 113
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    .line 96
    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    .line 97
    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 98
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mDispalyNumberFormat:I

    .line 99
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    .line 100
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSlot:I

    .line 101
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    .line 102
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 114
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    .line 115
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    .line 116
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 117
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mDispalyNumberFormat:I

    .line 118
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    .line 119
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSlot:I

    .line 120
    iget-wide v0, p1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    iput-wide v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    .line 121
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

    .line 105
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    .line 96
    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    .line 97
    iput-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    .line 98
    iput v2, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mDispalyNumberFormat:I

    .line 99
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    .line 100
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSlot:I

    .line 101
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    .line 102
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 106
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    .line 107
    iput p2, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    .line 108
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    .line 109
    iput-wide p3, p0, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    .line 110
    return-void
.end method
