.class public final Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
.super Ljava/lang/Object;
.source "CallHistory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistory$Calls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CallInfo"
.end annotation


# instance fields
.field public final mAreaCode:Ljava/lang/String;

.field public final mConfirm:J

.field public final mCountryISO:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .parameter "countryISO"
    .parameter "areaCode"
    .parameter "confirm"

    .prologue
    .line 121
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    .line 123
    iput-object p2, p0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mAreaCode:Ljava/lang/String;

    .line 124
    iput-wide p3, p0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mConfirm:J

    .line 125
    return-void
.end method
