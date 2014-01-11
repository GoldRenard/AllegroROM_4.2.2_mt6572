.class public Lcom/mediatek/phone/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field static final TYPE_GPRS:I = 0x4

.field static final TYPE_SMS:I = 0x3

.field static final TYPE_VIDEOCALL:I = 0x2

.field static final TYPE_VOICECALL:I = 0x1

.field static sSupport3G:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/phone/Utils;->sSupport3G:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSimColorResource(I)I
    .locals 1
    .parameter "color"

    .prologue
    .line 38
    if-ltz p0, :cond_0

    const/4 v0, 0x7

    if-gt p0, v0, :cond_0

    .line 39
    sget-object v0, Landroid/provider/Telephony;->SIMBackgroundDarkRes:[I

    aget v0, v0, p0

    .line 41
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getStatusResource(I)I
    .locals 3
    .parameter "state"

    .prologue
    .line 15
    const-string v0, "Utils gemini"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "!!!!!!!!!!!!!state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    packed-switch p0, :pswitch_data_0

    .line 32
    :pswitch_0
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 18
    :pswitch_1
    const v0, 0x2020112

    goto :goto_0

    .line 20
    :pswitch_2
    const v0, 0x20200ff

    goto :goto_0

    .line 22
    :pswitch_3
    const v0, 0x20200f8

    goto :goto_0

    .line 24
    :pswitch_4
    const v0, 0x2020119

    goto :goto_0

    .line 26
    :pswitch_5
    const v0, 0x2020117

    goto :goto_0

    .line 28
    :pswitch_6
    const v0, 0x20200ef

    goto :goto_0

    .line 30
    :pswitch_7
    const v0, 0x2020118

    goto :goto_0

    .line 16
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
