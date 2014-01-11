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
    .registers 2

    .prologue
    const/4 v1, 0x5

    .line 13
    new-array v0, v1, [I

    fill-array-data v0, :array_1e

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    .line 21
    new-array v0, v1, [I

    fill-array-data v0, :array_2c

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->DATA_CONNECTION_STRENGTH:[I

    .line 29
    new-array v0, v1, [I

    fill-array-data v0, :array_3a

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIFI_CONNECTION_STRENGTH:[I

    .line 36
    new-array v0, v1, [I

    fill-array-data v0, :array_48

    sput-object v0, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIMAX_CONNECTION_STRENGTH:[I

    return-void

    .line 13
    :array_1e
    .array-data 0x4
        0x7ft 0x0t 0xbt 0x7ft
        0x80t 0x0t 0xbt 0x7ft
        0x81t 0x0t 0xbt 0x7ft
        0x82t 0x0t 0xbt 0x7ft
        0x83t 0x0t 0xbt 0x7ft
    .end array-data

    .line 21
    :array_2c
    .array-data 0x4
        0x84t 0x0t 0xbt 0x7ft
        0x85t 0x0t 0xbt 0x7ft
        0x86t 0x0t 0xbt 0x7ft
        0x87t 0x0t 0xbt 0x7ft
        0x88t 0x0t 0xbt 0x7ft
    .end array-data

    .line 29
    :array_3a
    .array-data 0x4
        0x89t 0x0t 0xbt 0x7ft
        0x8at 0x0t 0xbt 0x7ft
        0x8bt 0x0t 0xbt 0x7ft
        0x8ct 0x0t 0xbt 0x7ft
        0x8dt 0x0t 0xbt 0x7ft
    .end array-data

    .line 36
    :array_48
    .array-data 0x4
        0x8et 0x0t 0xbt 0x7ft
        0x8ft 0x0t 0xbt 0x7ft
        0x90t 0x0t 0xbt 0x7ft
        0x91t 0x0t 0xbt 0x7ft
        0x92t 0x0t 0xbt 0x7ft
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
