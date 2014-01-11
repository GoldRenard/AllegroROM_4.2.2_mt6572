.class public Lcom/mediatek/oobe/basic/gemini/GeminiUtils;
.super Ljava/lang/Object;
.source "GeminiUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;
    }
.end annotation


# static fields
.field private static final COLORNUM:I = 0x7

.field static final EXTRA_SIMID:Ljava/lang/String; = "simid"

.field static final INTERNET_CALL_COLOR:I = 0x8

.field static final NEED_3G_TEXT:Z = true

.field static final NO_COLOR:I = -0x1

.field static final TYPE_GPRS:I = 0x4

.field static final TYPE_SMS:I = 0x3

.field static final TYPE_VIDEOCALL:I = 0x2

.field static final TYPE_VOICECALL:I = 0x1

.field static sG3SloteID:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    sput v0, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->sG3SloteID:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 118
    return-void
.end method

.method static getNetworkMode(I)I
    .locals 1
    .parameter "mode"

    .prologue
    .line 100
    const/4 v0, 0x0

    .line 101
    .local v0, networkMode:I
    packed-switch p0, :pswitch_data_0

    .line 113
    const/4 v0, 0x0

    .line 116
    :goto_0
    return v0

    .line 104
    :pswitch_0
    const/4 v0, 0x2

    .line 105
    goto :goto_0

    .line 107
    :pswitch_1
    const/4 v0, 0x1

    .line 108
    goto :goto_0

    .line 110
    :pswitch_2
    const/4 v0, 0x0

    .line 111
    goto :goto_0

    .line 101
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getSimColorResource(I)I
    .locals 1
    .parameter "color"

    .prologue
    .line 90
    if-ltz p0, :cond_0

    const/4 v0, 0x7

    if-gt p0, v0, :cond_0

    .line 91
    sget-object v0, Landroid/provider/Telephony;->SIMBackgroundDarkRes:[I

    aget v0, v0, p0

    .line 93
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getStatusResource(I)I
    .locals 1
    .parameter "state"

    .prologue
    .line 68
    packed-switch p0, :pswitch_data_0

    .line 84
    :pswitch_0
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 70
    :pswitch_1
    const v0, 0x2020112

    goto :goto_0

    .line 72
    :pswitch_2
    const v0, 0x20200ff

    goto :goto_0

    .line 74
    :pswitch_3
    const v0, 0x20200f8

    goto :goto_0

    .line 76
    :pswitch_4
    const v0, 0x2020119

    goto :goto_0

    .line 78
    :pswitch_5
    const v0, 0x2020117

    goto :goto_0

    .line 80
    :pswitch_6
    const v0, 0x20200ef

    goto :goto_0

    .line 82
    :pswitch_7
    const v0, 0x2020118

    goto :goto_0

    .line 68
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method
