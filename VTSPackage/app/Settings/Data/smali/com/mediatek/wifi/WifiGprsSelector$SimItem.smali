.class Lcom/mediatek/wifi/WifiGprsSelector$SimItem;
.super Ljava/lang/Object;
.source "WifiGprsSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/WifiGprsSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SimItem"
.end annotation


# instance fields
.field public mColor:I

.field public mDispalyNumberFormat:I

.field public mIsSim:Z

.field public mName:Ljava/lang/String;

.field public mNumber:Ljava/lang/String;

.field public mSimId:J

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

    .line 995
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 979
    iput-boolean v2, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    .line 980
    iput-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mName:Ljava/lang/String;

    .line 981
    iput-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mNumber:Ljava/lang/String;

    .line 982
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mDispalyNumberFormat:I

    .line 983
    iput v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mColor:I

    .line 984
    iput v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSlot:I

    .line 985
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mState:I

    .line 986
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSimId:J

    .line 996
    iput-boolean v2, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    .line 997
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mName:Ljava/lang/String;

    .line 998
    iget-object v0, p1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mNumber:Ljava/lang/String;

    .line 999
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mDispalyNumberFormat:I

    .line 1000
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mColor:I

    .line 1001
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSlot:I

    .line 1002
    iget-wide v0, p1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    iput-wide v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSimId:J

    .line 1003
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

    .line 989
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 979
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    .line 980
    iput-object v3, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mName:Ljava/lang/String;

    .line 981
    iput-object v3, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mNumber:Ljava/lang/String;

    .line 982
    iput v2, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mDispalyNumberFormat:I

    .line 983
    iput v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mColor:I

    .line 984
    iput v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSlot:I

    .line 985
    const/4 v0, 0x5

    iput v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mState:I

    .line 986
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSimId:J

    .line 990
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mName:Ljava/lang/String;

    .line 991
    iput p2, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mColor:I

    .line 992
    iput-boolean v2, p0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    .line 993
    return-void
.end method
