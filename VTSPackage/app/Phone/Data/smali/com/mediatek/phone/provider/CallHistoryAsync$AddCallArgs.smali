.class public Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;
.super Ljava/lang/Object;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AddCallArgs"
.end annotation


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mCountryISO:Ljava/lang/String;

.field public final mIsMultiSim:Z

.field public final mNumber:Ljava/lang/String;

.field public final mSlotId:I

.field public final mStart:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JIZ)V
    .locals 0
    .parameter "context"
    .parameter "number"
    .parameter "countryISO"
    .parameter "start"
    .parameter "slotId"
    .parameter "isMultiSim"

    .prologue
    .line 106
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mContext:Landroid/content/Context;

    .line 108
    iput-object p2, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mNumber:Ljava/lang/String;

    .line 109
    iput-object p3, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mCountryISO:Ljava/lang/String;

    .line 110
    iput-wide p4, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mStart:J

    .line 111
    iput p6, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mSlotId:I

    .line 112
    iput-boolean p7, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mIsMultiSim:Z

    .line 113
    return-void
.end method
