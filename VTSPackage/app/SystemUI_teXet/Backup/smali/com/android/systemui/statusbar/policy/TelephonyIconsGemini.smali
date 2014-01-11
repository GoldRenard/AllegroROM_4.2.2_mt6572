.class public Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;
.super Ljava/lang/Object;
.source "TelephonyIconsGemini.java"


# static fields
.field static final DATA:[[I

.field static final DATA_1X:[I

.field static final DATA_1X_ROAM:[I

.field static final DATA_3G:[I

.field static final DATA_3G_PLUS:[I

.field static final DATA_3G_PLUS_ROAM:[I

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

.field static final NETWORK_TYPE_3G:[I

.field static final NETWORK_TYPE_4G:[I

.field static final NETWORK_TYPE_E:[I

.field static final NETWORK_TYPE_G:[I

.field static final ROAMING:[I

.field private static final TELEPHONY_SIGNAL_STRENGTH:[[I

.field private static final TELEPHONY_SIGNAL_STRENGTH_WHITE:[I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x5

    .line 36
    new-array v0, v3, [I

    fill-array-data v0, :array_114

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH_WHITE:[I

    .line 44
    const/4 v0, 0x4

    new-array v0, v0, [[I

    new-array v1, v3, [I

    fill-array-data v1, :array_122

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_130

    aput-object v1, v0, v5

    new-array v1, v3, [I

    fill-array-data v1, :array_13e

    aput-object v1, v0, v6

    new-array v1, v3, [I

    fill-array-data v1, :array_14c

    aput-object v1, v0, v7

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH:[[I

    .line 71
    new-array v0, v3, [I

    fill-array-data v0, :array_15a

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X:[I

    .line 79
    new-array v0, v3, [I

    fill-array-data v0, :array_168

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G:[I

    .line 87
    new-array v0, v3, [I

    fill-array-data v0, :array_176

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G:[I

    .line 95
    new-array v0, v3, [I

    fill-array-data v0, :array_184

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E:[I

    .line 103
    new-array v0, v3, [I

    fill-array-data v0, :array_192

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    .line 111
    new-array v0, v3, [I

    fill-array-data v0, :array_1a0

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H:[I

    .line 119
    new-array v0, v3, [I

    fill-array-data v0, :array_1ae

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS:[I

    .line 127
    new-array v0, v3, [I

    fill-array-data v0, :array_1bc

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_PLUS:[I

    .line 135
    const/16 v0, 0x8

    new-array v0, v0, [[I

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X:[I

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G:[I

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G:[I

    aput-object v1, v0, v6

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

    const/4 v1, 0x7

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_PLUS:[I

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA:[[I

    .line 150
    new-array v0, v3, [I

    fill-array-data v0, :array_1ca

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X_ROAM:[I

    .line 158
    new-array v0, v3, [I

    fill-array-data v0, :array_1d8

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_ROAM:[I

    .line 166
    new-array v0, v3, [I

    fill-array-data v0, :array_1e6

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G_ROAM:[I

    .line 174
    new-array v0, v3, [I

    fill-array-data v0, :array_1f4

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_E_ROAM:[I

    .line 182
    new-array v0, v3, [I

    fill-array-data v0, :array_202

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G_ROAM:[I

    .line 190
    new-array v0, v3, [I

    fill-array-data v0, :array_210

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_ROAM:[I

    .line 198
    new-array v0, v3, [I

    fill-array-data v0, :array_21e

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_H_PLUS_ROAM:[I

    .line 206
    new-array v0, v3, [I

    fill-array-data v0, :array_22c

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_PLUS_ROAM:[I

    .line 214
    const/16 v0, 0x8

    new-array v0, v0, [[I

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_1X_ROAM:[I

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_ROAM:[I

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_4G_ROAM:[I

    aput-object v1, v0, v6

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

    const/4 v1, 0x7

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_3G_PLUS_ROAM:[I

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_ROAM:[[I

    .line 229
    new-array v0, v3, [I

    fill-array-data v0, :array_23a

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    .line 251
    new-array v0, v3, [I

    fill-array-data v0, :array_248

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_G:[I

    .line 259
    new-array v0, v3, [I

    fill-array-data v0, :array_256

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_3G:[I

    .line 267
    new-array v0, v3, [I

    fill-array-data v0, :array_264

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_4G:[I

    .line 275
    new-array v0, v3, [I

    fill-array-data v0, :array_272

    sput-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_E:[I

    return-void

    .line 36
    nop

    :array_114
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xc3t 0x1t 0x2t 0x7ft
        0xc8t 0x1t 0x2t 0x7ft
        0xcdt 0x1t 0x2t 0x7ft
        0xd7t 0x1t 0x2t 0x7ft
    .end array-data

    .line 44
    :array_122
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xbft 0x1t 0x2t 0x7ft
        0xc4t 0x1t 0x2t 0x7ft
        0xc9t 0x1t 0x2t 0x7ft
        0xd3t 0x1t 0x2t 0x7ft
    .end array-data

    :array_130
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xc1t 0x1t 0x2t 0x7ft
        0xc6t 0x1t 0x2t 0x7ft
        0xcbt 0x1t 0x2t 0x7ft
        0xd5t 0x1t 0x2t 0x7ft
    .end array-data

    :array_13e
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xc0t 0x1t 0x2t 0x7ft
        0xc5t 0x1t 0x2t 0x7ft
        0xcat 0x1t 0x2t 0x7ft
        0xd4t 0x1t 0x2t 0x7ft
    .end array-data

    :array_14c
    .array-data 0x4
        0xbet 0x1t 0x2t 0x7ft
        0xc2t 0x1t 0x2t 0x7ft
        0xc7t 0x1t 0x2t 0x7ft
        0xcct 0x1t 0x2t 0x7ft
        0xd6t 0x1t 0x2t 0x7ft
    .end array-data

    .line 71
    :array_15a
    .array-data 0x4
        0x68t 0x1t 0x2t 0x7ft
        0x6ct 0x1t 0x2t 0x7ft
        0x6at 0x1t 0x2t 0x7ft
        0x6et 0x1t 0x2t 0x7ft
        0x70t 0x1t 0x2t 0x7ft
    .end array-data

    .line 79
    :array_168
    .array-data 0x4
        0x72t 0x1t 0x2t 0x7ft
        0x76t 0x1t 0x2t 0x7ft
        0x74t 0x1t 0x2t 0x7ft
        0x82t 0x1t 0x2t 0x7ft
        0x84t 0x1t 0x2t 0x7ft
    .end array-data

    .line 87
    :array_176
    .array-data 0x4
        0x86t 0x1t 0x2t 0x7ft
        0x8at 0x1t 0x2t 0x7ft
        0x88t 0x1t 0x2t 0x7ft
        0x8ct 0x1t 0x2t 0x7ft
        0x8et 0x1t 0x2t 0x7ft
    .end array-data

    .line 95
    :array_184
    .array-data 0x4
        0x90t 0x1t 0x2t 0x7ft
        0x94t 0x1t 0x2t 0x7ft
        0x92t 0x1t 0x2t 0x7ft
        0x96t 0x1t 0x2t 0x7ft
        0x98t 0x1t 0x2t 0x7ft
    .end array-data

    .line 103
    :array_192
    .array-data 0x4
        0x9at 0x1t 0x2t 0x7ft
        0x9et 0x1t 0x2t 0x7ft
        0x9ct 0x1t 0x2t 0x7ft
        0xa0t 0x1t 0x2t 0x7ft
        0xa2t 0x1t 0x2t 0x7ft
    .end array-data

    .line 111
    :array_1a0
    .array-data 0x4
        0xa4t 0x1t 0x2t 0x7ft
        0xa8t 0x1t 0x2t 0x7ft
        0xa6t 0x1t 0x2t 0x7ft
        0xb4t 0x1t 0x2t 0x7ft
        0xb6t 0x1t 0x2t 0x7ft
    .end array-data

    .line 119
    :array_1ae
    .array-data 0x4
        0xaat 0x1t 0x2t 0x7ft
        0xaet 0x1t 0x2t 0x7ft
        0xact 0x1t 0x2t 0x7ft
        0xb0t 0x1t 0x2t 0x7ft
        0xb2t 0x1t 0x2t 0x7ft
    .end array-data

    .line 127
    :array_1bc
    .array-data 0x4
        0x78t 0x1t 0x2t 0x7ft
        0x7ct 0x1t 0x2t 0x7ft
        0x7at 0x1t 0x2t 0x7ft
        0x7et 0x1t 0x2t 0x7ft
        0x80t 0x1t 0x2t 0x7ft
    .end array-data

    .line 150
    :array_1ca
    .array-data 0x4
        0x69t 0x1t 0x2t 0x7ft
        0x6dt 0x1t 0x2t 0x7ft
        0x6bt 0x1t 0x2t 0x7ft
        0x6ft 0x1t 0x2t 0x7ft
        0x71t 0x1t 0x2t 0x7ft
    .end array-data

    .line 158
    :array_1d8
    .array-data 0x4
        0x73t 0x1t 0x2t 0x7ft
        0x77t 0x1t 0x2t 0x7ft
        0x75t 0x1t 0x2t 0x7ft
        0x83t 0x1t 0x2t 0x7ft
        0x85t 0x1t 0x2t 0x7ft
    .end array-data

    .line 166
    :array_1e6
    .array-data 0x4
        0x87t 0x1t 0x2t 0x7ft
        0x8bt 0x1t 0x2t 0x7ft
        0x89t 0x1t 0x2t 0x7ft
        0x8dt 0x1t 0x2t 0x7ft
        0x8ft 0x1t 0x2t 0x7ft
    .end array-data

    .line 174
    :array_1f4
    .array-data 0x4
        0x91t 0x1t 0x2t 0x7ft
        0x95t 0x1t 0x2t 0x7ft
        0x93t 0x1t 0x2t 0x7ft
        0x97t 0x1t 0x2t 0x7ft
        0x99t 0x1t 0x2t 0x7ft
    .end array-data

    .line 182
    :array_202
    .array-data 0x4
        0x9bt 0x1t 0x2t 0x7ft
        0x9ft 0x1t 0x2t 0x7ft
        0x9dt 0x1t 0x2t 0x7ft
        0xa1t 0x1t 0x2t 0x7ft
        0xa3t 0x1t 0x2t 0x7ft
    .end array-data

    .line 190
    :array_210
    .array-data 0x4
        0xa5t 0x1t 0x2t 0x7ft
        0xa9t 0x1t 0x2t 0x7ft
        0xa7t 0x1t 0x2t 0x7ft
        0xb5t 0x1t 0x2t 0x7ft
        0xb7t 0x1t 0x2t 0x7ft
    .end array-data

    .line 198
    :array_21e
    .array-data 0x4
        0xabt 0x1t 0x2t 0x7ft
        0xaft 0x1t 0x2t 0x7ft
        0xadt 0x1t 0x2t 0x7ft
        0xb1t 0x1t 0x2t 0x7ft
        0xb3t 0x1t 0x2t 0x7ft
    .end array-data

    .line 206
    :array_22c
    .array-data 0x4
        0x79t 0x1t 0x2t 0x7ft
        0x7dt 0x1t 0x2t 0x7ft
        0x7bt 0x1t 0x2t 0x7ft
        0x7ft 0x1t 0x2t 0x7ft
        0x81t 0x1t 0x2t 0x7ft
    .end array-data

    .line 229
    :array_23a
    .array-data 0x4
        0xb8t 0x1t 0x2t 0x7ft
        0xbat 0x1t 0x2t 0x7ft
        0xb9t 0x1t 0x2t 0x7ft
        0xbbt 0x1t 0x2t 0x7ft
        0xbct 0x1t 0x2t 0x7ft
    .end array-data

    .line 251
    :array_248
    .array-data 0x4
        0xe2t 0x1t 0x2t 0x7ft
        0xe4t 0x1t 0x2t 0x7ft
        0xe3t 0x1t 0x2t 0x7ft
        0xe5t 0x1t 0x2t 0x7ft
        0xe6t 0x1t 0x2t 0x7ft
    .end array-data

    .line 259
    :array_256
    .array-data 0x4
        0xcet 0x1t 0x2t 0x7ft
        0xd0t 0x1t 0x2t 0x7ft
        0xcft 0x1t 0x2t 0x7ft
        0xd1t 0x1t 0x2t 0x7ft
        0xd2t 0x1t 0x2t 0x7ft
    .end array-data

    .line 267
    :array_264
    .array-data 0x4
        0xd8t 0x1t 0x2t 0x7ft
        0xdat 0x1t 0x2t 0x7ft
        0xd9t 0x1t 0x2t 0x7ft
        0xdbt 0x1t 0x2t 0x7ft
        0xdct 0x1t 0x2t 0x7ft
    .end array-data

    .line 275
    :array_272
    .array-data 0x4
        0xddt 0x1t 0x2t 0x7ft
        0xdft 0x1t 0x2t 0x7ft
        0xdet 0x1t 0x2t 0x7ft
        0xe0t 0x1t 0x2t 0x7ft
        0xe1t 0x1t 0x2t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I
    .registers 5
    .parameter "roaming"
    .parameter "dataType"

    .prologue
    .line 240
    const/4 v0, 0x0

    .line 241
    .local v0, iconList:[I
    if-eqz p0, :cond_c

    .line 242
    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_ROAM:[[I

    invoke-virtual {p1}, Lcom/mediatek/systemui/ext/DataType;->getTypeId()I

    move-result v2

    aget-object v0, v1, v2

    .line 246
    :goto_b
    return-object v0

    .line 244
    :cond_c
    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA:[[I

    invoke-virtual {p1}, Lcom/mediatek/systemui/ext/DataType;->getTypeId()I

    move-result v2

    aget-object v0, v1, v2

    goto :goto_b
.end method

.method public static getNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I
    .registers 3
    .parameter "networkType"
    .parameter "simColorId"

    .prologue
    .line 284
    sget-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    if-ne p0, v0, :cond_9

    .line 285
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_G:[I

    aget v0, v0, p1

    .line 293
    :goto_8
    return v0

    .line 286
    :cond_9
    sget-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_E:Lcom/mediatek/systemui/ext/NetworkType;

    if-ne p0, v0, :cond_12

    .line 287
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_E:[I

    aget v0, v0, p1

    goto :goto_8

    .line 288
    :cond_12
    sget-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    if-ne p0, v0, :cond_1b

    .line 289
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_3G:[I

    aget v0, v0, p1

    goto :goto_8

    .line 290
    :cond_1b
    sget-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_4G:Lcom/mediatek/systemui/ext/NetworkType;

    if-ne p0, v0, :cond_24

    .line 291
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->NETWORK_TYPE_4G:[I

    aget v0, v0, p1

    goto :goto_8

    .line 293
    :cond_24
    const/4 v0, -0x1

    goto :goto_8
.end method

.method public static getTelephonySignalStrengthIconList(IZ)[I
    .registers 3
    .parameter "simColorId"
    .parameter "showSimIndicator"

    .prologue
    .line 29
    if-eqz p1, :cond_5

    .line 30
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH_WHITE:[I

    .line 32
    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->TELEPHONY_SIGNAL_STRENGTH:[[I

    aget-object v0, v0, p0

    goto :goto_4
.end method
