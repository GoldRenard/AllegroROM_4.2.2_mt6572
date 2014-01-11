.class public Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;
.super Ljava/lang/Object;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UpdateConfirmFlagArgs"
.end annotation


# instance fields
.field public final mConfirm:J

.field public final mContext:Landroid/content/Context;

.field public final mNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 0
    .parameter "context"
    .parameter "number"
    .parameter "confirm"

    .prologue
    .line 153
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mContext:Landroid/content/Context;

    .line 156
    iput-object p2, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mNumber:Ljava/lang/String;

    .line 157
    iput-wide p3, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mConfirm:J

    .line 158
    return-void
.end method
