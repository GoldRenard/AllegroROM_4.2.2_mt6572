.class public Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;
.super Ljava/lang/Object;
.source "TelephonyIconsGemini.java"


# static fields
.field static final DATA:[[I

.field static final DATA_1X:[I

.field static final DATA_1X_ROAM:[I

.field static final DATA_3G:[I

.field static final DATA_3G_ROAM:[I

.field static final DATA_4G:[I

.field static final DATA_4G_ROAM:[I

.field static final DATA_E:[I

.field static final DATA_E_ROAM:[I

.field static final DATA_G:[I

.field static final DATA_G_ROAM:[I

.field static final DATA_H:[I

.field static final DATA_H_PLUS:[I

.field static final DATA_H_PLUS_ROAM:[I

.field static final DATA_H_ROAM:[I

.field static final DATA_ROAM:[[I

.field static final ROAMING:[I

.field private static final TELEPHONY_CUSTOMER_DATA:[[I

.field static final TELEPHONY_CUSTOMER_NETWORK_TYPE:[I

.field static final TELEPHONY_CUSTOMER_ROAMING:[I

.field static final TELEPHONY_CUSTOMER_SIGNAL_NULL:[I

.field private static final TELEPHONY_CUSTOMER_SIGNAL_STRENGTH:[[I

.field private static final TELEPHONY_SIGNAL_STRENGTH:[[I

.field private static final TELEPHONY_SIGNAL_STRENGTH_WHITE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x5

    .line 39
    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH_WHITE:[I

    .line 47
    const/4 v0, 0x4

    new-array v0, v0, [[I

    new-array v1, v3, [I

    fill-array-data v1, :array_1

    aput-object v1, v0, v5

    new-array v1, v3, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v6

    new-array v1, v3, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_4

    aput-object v1, v0, v7

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH:[[I

    .line 74
    new-array v0, v3, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X:[I

    .line 82
    new-array v0, v3, [I

    fill-array-data v0, :array_6

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G:[I

    .line 90
    new-array v0, v3, [I

    fill-array-data v0, :array_7

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G:[I

    .line 98
    new-array v0, v3, [I

    fill-array-data v0, :array_8

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E:[I

    .line 106
    new-array v0, v3, [I

    fill-array-data v0, :array_9

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    .line 114
    new-array v0, v3, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H:[I

    .line 122
    new-array v0, v3, [I

    fill-array-data v0, :array_b

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS:[I

    .line 130
    const/4 v0, 0x7

    new-array v0, v0, [[I

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X:[I

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G:[I

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G:[I

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E:[I

    aput-object v1, v0, v7

    const/4 v1, 0x4

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    aput-object v2, v0, v1

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H:[I

    aput-object v1, v0, v3

    const/4 v1, 0x6

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS:[I

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA:[[I

    .line 144
    new-array v0, v3, [I

    fill-array-data v0, :array_c

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X_ROAM:[I

    .line 152
    new-array v0, v3, [I

    fill-array-data v0, :array_d

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_ROAM:[I

    .line 160
    new-array v0, v3, [I

    fill-array-data v0, :array_e

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G_ROAM:[I

    .line 168
    new-array v0, v3, [I

    fill-array-data v0, :array_f

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E_ROAM:[I

    .line 176
    new-array v0, v3, [I

    fill-array-data v0, :array_10

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G_ROAM:[I

    .line 184
    new-array v0, v3, [I

    fill-array-data v0, :array_11

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_ROAM:[I

    .line 192
    new-array v0, v3, [I

    fill-array-data v0, :array_12

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS_ROAM:[I

    .line 200
    const/4 v0, 0x7

    new-array v0, v0, [[I

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X_ROAM:[I

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_ROAM:[I

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G_ROAM:[I

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E_ROAM:[I

    aput-object v1, v0, v7

    const/4 v1, 0x4

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G_ROAM:[I

    aput-object v2, v0, v1

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_ROAM:[I

    aput-object v1, v0, v3

    const/4 v1, 0x6

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS_ROAM:[I

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_ROAM:[[I

    .line 214
    new-array v0, v3, [I

    fill-array-data v0, :array_13

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    .line 237
    new-array v0, v3, [[I

    new-array v1, v3, [I

    fill-array-data v1, :array_14

    aput-object v1, v0, v5

    new-array v1, v3, [I

    fill-array-data v1, :array_15

    aput-object v1, v0, v6

    new-array v1, v3, [I

    fill-array-data v1, :array_16

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_17

    aput-object v1, v0, v7

    const/4 v1, 0x4

    new-array v2, v3, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_DATA:[[I

    .line 278
    new-array v0, v4, [I

    fill-array-data v0, :array_19

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_NETWORK_TYPE:[I

    .line 295
    new-array v0, v4, [I

    fill-array-data v0, :array_1a

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_ROAMING:[I

    .line 305
    new-array v0, v4, [I

    fill-array-data v0, :array_1b

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_SIGNAL_NULL:[I

    .line 319
    new-array v0, v4, [[I

    const/4 v1, 0x6

    new-array v1, v1, [I

    fill-array-data v1, :array_1c

    aput-object v1, v0, v5

    const/4 v1, 0x6

    new-array v1, v1, [I

    fill-array-data v1, :array_1d

    aput-object v1, v0, v6

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_SIGNAL_STRENGTH:[[I

    return-void

    .line 39
    :array_0
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xddt 0x1t 0x2t 0x7ft
        0xe2t 0x1t 0x2t 0x7ft
        0xe7t 0x1t 0x2t 0x7ft
        0xect 0x1t 0x2t 0x7ft
    .end array-data

    .line 47
    :array_1
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xd9t 0x1t 0x2t 0x7ft
        0xdet 0x1t 0x2t 0x7ft
        0xe3t 0x1t 0x2t 0x7ft
        0xe8t 0x1t 0x2t 0x7ft
    .end array-data

    :array_2
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xdbt 0x1t 0x2t 0x7ft
        0xe0t 0x1t 0x2t 0x7ft
        0xe5t 0x1t 0x2t 0x7ft
        0xeat 0x1t 0x2t 0x7ft
    .end array-data

    :array_3
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xdat 0x1t 0x2t 0x7ft
        0xdft 0x1t 0x2t 0x7ft
        0xe4t 0x1t 0x2t 0x7ft
        0xe9t 0x1t 0x2t 0x7ft
    .end array-data

    :array_4
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xdct 0x1t 0x2t 0x7ft
        0xe1t 0x1t 0x2t 0x7ft
        0xe6t 0x1t 0x2t 0x7ft
        0xebt 0x1t 0x2t 0x7ft
    .end array-data

    .line 74
    :array_5
    .array-data 0x4
        0x8ct 0x1t 0x2t 0x7ft
        0x90t 0x1t 0x2t 0x7ft
        0x8et 0x1t 0x2t 0x7ft
        0x92t 0x1t 0x2t 0x7ft
        0x94t 0x1t 0x2t 0x7ft
    .end array-data

    .line 82
    :array_6
    .array-data 0x4
        0x96t 0x1t 0x2t 0x7ft
        0x9at 0x1t 0x2t 0x7ft
        0x98t 0x1t 0x2t 0x7ft
        0x9ct 0x1t 0x2t 0x7ft
        0x9et 0x1t 0x2t 0x7ft
    .end array-data

    .line 90
    :array_7
    .array-data 0x4
        0xa0t 0x1t 0x2t 0x7ft
        0xa4t 0x1t 0x2t 0x7ft
        0xa2t 0x1t 0x2t 0x7ft
        0xa6t 0x1t 0x2t 0x7ft
        0xa8t 0x1t 0x2t 0x7ft
    .end array-data

    .line 98
    :array_8
    .array-data 0x4
        0xaat 0x1t 0x2t 0x7ft
        0xaet 0x1t 0x2t 0x7ft
        0xact 0x1t 0x2t 0x7ft
        0xb0t 0x1t 0x2t 0x7ft
        0xb2t 0x1t 0x2t 0x7ft
    .end array-data

    .line 106
    :array_9
    .array-data 0x4
        0xb4t 0x1t 0x2t 0x7ft
        0xb8t 0x1t 0x2t 0x7ft
        0xb6t 0x1t 0x2t 0x7ft
        0xbat 0x1t 0x2t 0x7ft
        0xbct 0x1t 0x2t 0x7ft
    .end array-data

    .line 114
    :array_a
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xc2t 0x1t 0x2t 0x7ft
        0xc0t 0x1t 0x2t 0x7ft
        0xcet 0x1t 0x2t 0x7ft
        0xd0t 0x1t 0x2t 0x7ft
    .end array-data

    .line 122
    :array_b
    .array-data 0x4
        0xc4t 0x1t 0x2t 0x7ft
        0xc8t 0x1t 0x2t 0x7ft
        0xc6t 0x1t 0x2t 0x7ft
        0xcat 0x1t 0x2t 0x7ft
        0xcct 0x1t 0x2t 0x7ft
    .end array-data

    .line 144
    :array_c
    .array-data 0x4
        0x8dt 0x1t 0x2t 0x7ft
        0x91t 0x1t 0x2t 0x7ft
        0x8ft 0x1t 0x2t 0x7ft
        0x93t 0x1t 0x2t 0x7ft
        0x95t 0x1t 0x2t 0x7ft
    .end array-data

    .line 152
    :array_d
    .array-data 0x4
        0x97t 0x1t 0x2t 0x7ft
        0x9bt 0x1t 0x2t 0x7ft
        0x99t 0x1t 0x2t 0x7ft
        0x9dt 0x1t 0x2t 0x7ft
        0x9ft 0x1t 0x2t 0x7ft
    .end array-data

    .line 160
    :array_e
    .array-data 0x4
        0xa1t 0x1t 0x2t 0x7ft
        0xa5t 0x1t 0x2t 0x7ft
        0xa3t 0x1t 0x2t 0x7ft
        0xa7t 0x1t 0x2t 0x7ft
        0xa9t 0x1t 0x2t 0x7ft
    .end array-data

    .line 168
    :array_f
    .array-data 0x4
        0xabt 0x1t 0x2t 0x7ft
        0xaft 0x1t 0x2t 0x7ft
        0xadt 0x1t 0x2t 0x7ft
        0xb1t 0x1t 0x2t 0x7ft
        0xb3t 0x1t 0x2t 0x7ft
    .end array-data

    .line 176
    :array_10
    .array-data 0x4
        0xb5t 0x1t 0x2t 0x7ft
        0xb9t 0x1t 0x2t 0x7ft
        0xb7t 0x1t 0x2t 0x7ft
        0xbbt 0x1t 0x2t 0x7ft
        0xbdt 0x1t 0x2t 0x7ft
    .end array-data

    .line 184
    :array_11
    .array-data 0x4
        0xbft 0x1t 0x2t 0x7ft
        0xc3t 0x1t 0x2t 0x7ft
        0xc1t 0x1t 0x2t 0x7ft
        0xcft 0x1t 0x2t 0x7ft
        0xd1t 0x1t 0x2t 0x7ft
    .end array-data

    .line 192
    :array_12
    .array-data 0x4
        0xc5t 0x1t 0x2t 0x7ft
        0xc9t 0x1t 0x2t 0x7ft
        0xc7t 0x1t 0x2t 0x7ft
        0xcbt 0x1t 0x2t 0x7ft
        0xcdt 0x1t 0x2t 0x7ft
    .end array-data

    .line 214
    :array_13
    .array-data 0x4
        0xd2t 0x1t 0x2t 0x7ft
        0xd4t 0x1t 0x2t 0x7ft
        0xd3t 0x1t 0x2t 0x7ft
        0xd5t 0x1t 0x2t 0x7ft
        0xd6t 0x1t 0x2t 0x7ft
    .end array-data

    .line 237
    :array_14
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    :array_15
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x3at 0x1t 0x2t 0x7ft
        0x39t 0x1t 0x2t 0x7ft
        0x38t 0x1t 0x2t 0x7ft
        0x3bt 0x1t 0x2t 0x7ft
    .end array-data

    :array_16
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x3et 0x1t 0x2t 0x7ft
        0x3dt 0x1t 0x2t 0x7ft
        0x3ct 0x1t 0x2t 0x7ft
        0x3ft 0x1t 0x2t 0x7ft
    .end array-data

    :array_17
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x46t 0x1t 0x2t 0x7ft
        0x45t 0x1t 0x2t 0x7ft
        0x44t 0x1t 0x2t 0x7ft
        0x47t 0x1t 0x2t 0x7ft
    .end array-data

    :array_18
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x42t 0x1t 0x2t 0x7ft
        0x41t 0x1t 0x2t 0x7ft
        0x40t 0x1t 0x2t 0x7ft
        0x43t 0x1t 0x2t 0x7ft
    .end array-data

    .line 278
    :array_19
    .array-data 0x4
        0x49t 0x1t 0x2t 0x7ft
        0x48t 0x1t 0x2t 0x7ft
    .end array-data

    .line 295
    :array_1a
    .array-data 0x4
        0x4at 0x1t 0x2t 0x7ft
        0x4bt 0x1t 0x2t 0x7ft
    .end array-data

    .line 305
    :array_1b
    .array-data 0x4
        0x5dt 0x1t 0x2t 0x7ft
        0x5et 0x1t 0x2t 0x7ft
    .end array-data

    .line 319
    :array_1c
    .array-data 0x4
        0x4ct 0x1t 0x2t 0x7ft
        0x4dt 0x1t 0x2t 0x7ft
        0x4et 0x1t 0x2t 0x7ft
        0x4ft 0x1t 0x2t 0x7ft
        0x50t 0x1t 0x2t 0x7ft
        0x51t 0x1t 0x2t 0x7ft
    .end array-data

    :array_1d
    .array-data 0x4
        0x53t 0x1t 0x2t 0x7ft
        0x54t 0x1t 0x2t 0x7ft
        0x55t 0x1t 0x2t 0x7ft
        0x56t 0x1t 0x2t 0x7ft
        0x57t 0x1t 0x2t 0x7ft
        0x58t 0x1t 0x2t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I
    .locals 3
    .parameter "roaming"
    .parameter "dataType"

    .prologue
    .line 225
    const/4 v0, 0x0

    .line 226
    .local v0, iconList:[I
    if-eqz p0, :cond_0

    .line 227
    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_ROAM:[[I

    invoke-virtual {p1}, Lcom/mediatek/systemui/ext/DataType;->getTypeId()I

    move-result v2

    aget-object v0, v1, v2

    .line 231
    :goto_0
    return-object v0

    .line 229
    :cond_0
    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA:[[I

    invoke-virtual {p1}, Lcom/mediatek/systemui/ext/DataType;->getTypeId()I

    move-result v2

    aget-object v0, v1, v2

    goto :goto_0
.end method

.method public static getTelephonySignalDataActivityIcon(II)I
    .locals 1
    .parameter "nState"
    .parameter "nType"

    .prologue
    .line 274
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_DATA:[[I

    aget-object v0, v0, p0

    aget v0, v0, p1

    return v0
.end method

.method public static getTelephonySignalNetworkTypeIcon(I)I
    .locals 1
    .parameter "nType"

    .prologue
    .line 284
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_NETWORK_TYPE:[I

    aget v0, v0, p0

    return v0
.end method

.method public static getTelephonySignalNetworkTypeIcon(Lcom/mediatek/systemui/ext/NetworkType;)I
    .locals 2
    .parameter "networkType"

    .prologue
    .line 288
    invoke-virtual {p0}, Lcom/mediatek/systemui/ext/NetworkType;->getTypeId()I

    move-result v0

    .line 289
    .local v0, typeId:I
    if-ltz v0, :cond_0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    .line 290
    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_NETWORK_TYPE:[I

    aget v1, v1, v0

    .line 292
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getTelephonySignalNullIcon(I)I
    .locals 1
    .parameter "nSlot"

    .prologue
    .line 315
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_SIGNAL_NULL:[I

    aget v0, v0, p0

    return v0
.end method

.method public static getTelephonySignalRoamingIcon(I)I
    .locals 1
    .parameter "nSlot"

    .prologue
    .line 301
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_ROAMING:[I

    aget v0, v0, p0

    return v0
.end method

.method public static getTelephonySignalStrengthIcon(II)I
    .locals 1
    .parameter "nSlot"
    .parameter "nLevel"

    .prologue
    .line 341
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_CUSTOMER_SIGNAL_STRENGTH:[[I

    aget-object v0, v0, p0

    aget v0, v0, p1

    return v0
.end method

.method public static getTelephonySignalStrengthIconList(IZ)[I
    .locals 1
    .parameter "simColorId"
    .parameter "showSimIndicator"

    .prologue
    .line 32
    if-eqz p1, :cond_0

    .line 33
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH_WHITE:[I

    .line 35
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH:[[I

    aget-object v0, v0, p0

    goto :goto_0
.end method
