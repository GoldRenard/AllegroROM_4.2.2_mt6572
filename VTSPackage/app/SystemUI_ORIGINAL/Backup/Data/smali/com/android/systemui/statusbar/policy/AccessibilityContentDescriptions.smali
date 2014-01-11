.class public Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;
.super Ljava/lang/Object;
.source "AccessibilityContentDescriptions.java"


# static fields
.field static final DATA_CONNECTION_STRENGTH:[I

.field static final PHONE_SIGNAL_STRENGTH:[I

.field static final WIFI_CONNECTION_STRENGTH:[I

.field static final WIMAX_CONNECTION_STRENGTH:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x6

    .line 13
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    .line 24
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->DATA_CONNECTION_STRENGTH:[I

    .line 35
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIFI_CONNECTION_STRENGTH:[I

    .line 45
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIMAX_CONNECTION_STRENGTH:[I

    return-void

    .line 13
    :array_0
    .array-data 0x4
        0x7et 0x0t 0xbt 0x7ft
        0x7ft 0x0t 0xbt 0x7ft
        0x80t 0x0t 0xbt 0x7ft
        0x81t 0x0t 0xbt 0x7ft
        0x82t 0x0t 0xbt 0x7ft
        0x82t 0x0t 0xbt 0x7ft
    .end array-data

    .line 24
    :array_1
    .array-data 0x4
        0x83t 0x0t 0xbt 0x7ft
        0x84t 0x0t 0xbt 0x7ft
        0x85t 0x0t 0xbt 0x7ft
        0x86t 0x0t 0xbt 0x7ft
        0x87t 0x0t 0xbt 0x7ft
        0x87t 0x0t 0xbt 0x7ft
    .end array-data

    .line 35
    :array_2
    .array-data 0x4
        0x88t 0x0t 0xbt 0x7ft
        0x89t 0x0t 0xbt 0x7ft
        0x8at 0x0t 0xbt 0x7ft
        0x8bt 0x0t 0xbt 0x7ft
        0x8ct 0x0t 0xbt 0x7ft
        0x8ct 0x0t 0xbt 0x7ft
    .end array-data

    .line 45
    :array_3
    .array-data 0x4
        0x8dt 0x0t 0xbt 0x7ft
        0x8et 0x0t 0xbt 0x7ft
        0x8ft 0x0t 0xbt 0x7ft
        0x90t 0x0t 0xbt 0x7ft
        0x91t 0x0t 0xbt 0x7ft
        0x91t 0x0t 0xbt 0x7ft
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
