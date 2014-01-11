.class public Lcom/mediatek/apn/ApnUtils;
.super Ljava/lang/Object;
.source "ApnUtils.java"


# static fields
.field public static final APN_ID_INDEX:I = 0x11

.field public static final APN_INDEX:I = 0x2

.field public static final AUTH_TYPE_INDEX:I = 0xe

.field public static final ID_INDEX:I = 0x0

.field public static final MCC_INDEX:I = 0x9

.field public static final MMSC_INDEX:I = 0x8

.field public static final MMSPORT_INDEX:I = 0xd

.field public static final MMSPROXY_INDEX:I = 0xc

.field public static final MNC_INDEX:I = 0xa

.field public static final NAME_INDEX:I = 0x1

.field public static final NAP_ID_INDEX:I = 0x12

.field public static final NUMERIC_INDEX:I = 0xb

.field public static final NUMERIC_LIST:[Ljava/lang/String; = null

.field public static final PASSWORD_INDEX:I = 0x7

.field public static final PORT_INDEX:I = 0x4

.field public static final PREFERRED_APN_URI:Ljava/lang/String; = "content://telephony/carriers/preferapn"

.field public static final PREFERRED_APN_URI_GEMINI_SIM1:Ljava/lang/String; = "content://telephony/carriers_sim1/preferapn"

.field public static final PREFERRED_APN_URI_GEMINI_SIM2:Ljava/lang/String; = "content://telephony/carriers_sim2/preferapn"

.field public static final PREFERRED_APN_URI_GEMINI_SIM3:Ljava/lang/String; = "content://telephony/carriers_sim3/preferapn"

.field public static final PREFERRED_APN_URI_GEMINI_SIM4:Ljava/lang/String; = "content://telephony/carriers_sim4/preferapn"

.field public static final PREFERRED_URI_LIST:[Landroid/net/Uri; = null

.field public static final PROJECTION:[Ljava/lang/String; = null

.field public static final PROXY_ID_INDEX:I = 0x13

.field public static final PROXY_INDEX:I = 0x3

.field public static final SERVER_INDEX:I = 0x6

.field public static final SIM_CARD_SINGLE:I = -0x1

.field public static final SIM_CARD_UNDEFINED:I = -0x2

.field public static final SOURCE_TYPE_INDEX:I = 0x10

.field public static final TYPE_INDEX:I = 0xf

.field public static final URI_LIST:[Landroid/net/Uri; = null

.field public static final USER_INDEX:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "name"

    aput-object v1, v0, v4

    const-string v1, "apn"

    aput-object v1, v0, v5

    const-string v1, "proxy"

    aput-object v1, v0, v6

    const-string v1, "port"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "user"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "server"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "password"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "mmsc"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "mcc"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "mnc"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "numeric"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "mmsproxy"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "mmsport"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "authtype"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "type"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "sourcetype"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "omacpid"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "napid"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "proxyid"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    .line 71
    new-array v0, v7, [Landroid/net/Uri;

    sget-object v1, Landroid/provider/Telephony$Carriers$SIM1Carriers;->CONTENT_URI:Landroid/net/Uri;

    aput-object v1, v0, v3

    sget-object v1, Landroid/provider/Telephony$Carriers$SIM2Carriers;->CONTENT_URI:Landroid/net/Uri;

    aput-object v1, v0, v4

    sget-object v1, Landroid/provider/Telephony$Carriers$SIM3Carriers;->CONTENT_URI:Landroid/net/Uri;

    aput-object v1, v0, v5

    sget-object v1, Landroid/provider/Telephony$Carriers$SIM4Carriers;->CONTENT_URI:Landroid/net/Uri;

    aput-object v1, v0, v6

    sput-object v0, Lcom/mediatek/apn/ApnUtils;->URI_LIST:[Landroid/net/Uri;

    .line 78
    new-array v0, v7, [Ljava/lang/String;

    const-string v1, "gsm.sim.operator.numeric"

    const-string v2, "-1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "gsm.sim.operator.numeric.2"

    const-string v2, "-1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    const-string v1, "gsm.sim.operator.numeric.3"

    const-string v2, "-1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    const-string v1, "gsm.sim.operator.numeric.4"

    const-string v2, "-1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v6

    sput-object v0, Lcom/mediatek/apn/ApnUtils;->NUMERIC_LIST:[Ljava/lang/String;

    .line 89
    new-array v0, v7, [Landroid/net/Uri;

    const-string v1, "content://telephony/carriers_sim1/preferapn"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "content://telephony/carriers_sim2/preferapn"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v0, v4

    const-string v1, "content://telephony/carriers_sim3/preferapn"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v0, v5

    const-string v1, "content://telephony/carriers_sim4/preferapn"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v0, v6

    sput-object v0, Lcom/mediatek/apn/ApnUtils;->PREFERRED_URI_LIST:[Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkNotSet(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "value"

    .prologue
    .line 98
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 99
    :cond_0
    const-string p0, ""

    .line 101
    .end local p0
    :cond_1
    return-object p0
.end method
