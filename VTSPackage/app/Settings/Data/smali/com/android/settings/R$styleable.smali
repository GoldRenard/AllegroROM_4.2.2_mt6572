.class public final Lcom/android/settings/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/R;
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

.field public static final ChartGridView:[I = null

.field public static final ChartGridView_borderDrawable:I = 0x3

.field public static final ChartGridView_labelColor:I = 0x0

.field public static final ChartGridView_primaryDrawable:I = 0x1

.field public static final ChartGridView_secondaryDrawable:I = 0x2

.field public static final ChartNetworkSeriesView:[I = null

.field public static final ChartNetworkSeriesView_fillColor:I = 0x1

.field public static final ChartNetworkSeriesView_fillColorSecondary:I = 0x2

.field public static final ChartNetworkSeriesView_strokeColor:I = 0x0

.field public static final ChartSweepView:[I = null

.field public static final ChartSweepView_followAxis:I = 0x1

.field public static final ChartSweepView_labelColor:I = 0x5

.field public static final ChartSweepView_labelSize:I = 0x3

.field public static final ChartSweepView_labelTemplate:I = 0x4

.field public static final ChartSweepView_neighborMargin:I = 0x2

.field public static final ChartSweepView_sweepDrawable:I = 0x0

.field public static final ChartView:[I = null

.field public static final ChartView_optimalWidth:I = 0x0

.field public static final ChartView_optimalWidthWeight:I = 0x1

.field public static final IconPreferenceScreen:[I = null

.field public static final IconPreferenceScreen_icon:I = 0x0

.field public static final PercentageBarChart:[I = null

.field public static final PercentageBarChart_emptyColor:I = 0x0

.field public static final PercentageBarChart_minTickWidth:I = 0x1

.field public static final WifiEncryptionState:[I

.field public static final WifiEncryptionState_state_encrypted:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16994
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/settings/R$styleable;->BatteryHistoryChart:[I

    .line 17087
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/settings/R$styleable;->ChartGridView:[I

    .line 17149
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/android/settings/R$styleable;->ChartNetworkSeriesView:[I

    .line 17217
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/android/settings/R$styleable;->ChartSweepView:[I

    .line 17317
    new-array v0, v4, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/android/settings/R$styleable;->ChartView:[I

    .line 17364
    new-array v0, v3, [I

    const v1, 0x7f010001

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->IconPreferenceScreen:[I

    .line 17389
    new-array v0, v4, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/android/settings/R$styleable;->PercentageBarChart:[I

    .line 17437
    new-array v0, v3, [I

    const/high16 v1, 0x7f01

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->WifiEncryptionState:[I

    return-void

    .line 16994
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

    .line 17087
    :array_1
    .array-data 0x4
        0xbt 0x0t 0x1t 0x7ft
        0xct 0x0t 0x1t 0x7ft
        0xdt 0x0t 0x1t 0x7ft
        0xet 0x0t 0x1t 0x7ft
    .end array-data

    .line 17149
    :array_2
    .array-data 0x4
        0xft 0x0t 0x1t 0x7ft
        0x10t 0x0t 0x1t 0x7ft
        0x11t 0x0t 0x1t 0x7ft
    .end array-data

    .line 17217
    :array_3
    .array-data 0x4
        0x6t 0x0t 0x1t 0x7ft
        0x7t 0x0t 0x1t 0x7ft
        0x8t 0x0t 0x1t 0x7ft
        0x9t 0x0t 0x1t 0x7ft
        0xat 0x0t 0x1t 0x7ft
        0xbt 0x0t 0x1t 0x7ft
    .end array-data

    .line 17317
    :array_4
    .array-data 0x4
        0x4t 0x0t 0x1t 0x7ft
        0x5t 0x0t 0x1t 0x7ft
    .end array-data

    .line 17389
    :array_5
    .array-data 0x4
        0x2t 0x0t 0x1t 0x7ft
        0x3t 0x0t 0x1t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16967
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
