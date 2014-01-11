.class public final Lcom/mediatek/oobe/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final BatteryHistoryChart:[I = null

.field public static final BatteryHistoryChart_android_shadowColor:I = 0x5

.field public static final BatteryHistoryChart_android_shadowDx:I = 0x6

.field public static final BatteryHistoryChart_android_shadowDy:I = 0x7

.field public static final BatteryHistoryChart_android_shadowRadius:I = 0x8

.field public static final BatteryHistoryChart_android_textAppearance:I = 0x0

.field public static final BatteryHistoryChart_android_textColor:I = 0x4

.field public static final BatteryHistoryChart_android_textSize:I = 0x1

.field public static final BatteryHistoryChart_android_textStyle:I = 0x3

.field public static final BatteryHistoryChart_android_typeface:I = 0x2

.field public static final IconPreferenceScreen:[I

.field public static final IconPreferenceScreen_icon:I

.field public static final WifiEncryptionState:[I

.field public static final WifiEncryptionState_state_encrypted:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1236
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/oobe/R$styleable;->BatteryHistoryChart:[I

    .line 1323
    new-array v0, v3, [I

    const v1, 0x7f010001

    aput v1, v0, v2

    sput-object v0, Lcom/mediatek/oobe/R$styleable;->IconPreferenceScreen:[I

    .line 1346
    new-array v0, v3, [I

    const/high16 v1, 0x7f01

    aput v1, v0, v2

    sput-object v0, Lcom/mediatek/oobe/R$styleable;->WifiEncryptionState:[I

    return-void

    .line 1236
    nop

    :array_0
    .array-data 0x4
        0x34t 0x0t 0x1t 0x1t
        0x95t 0x0t 0x1t 0x1t
        0x96t 0x0t 0x1t 0x1t
        0x97t 0x0t 0x1t 0x1t
        0x98t 0x0t 0x1t 0x1t
        0x61t 0x1t 0x1t 0x1t
        0x62t 0x1t 0x1t 0x1t
        0x63t 0x1t 0x1t 0x1t
        0x64t 0x1t 0x1t 0x1t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1209
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
