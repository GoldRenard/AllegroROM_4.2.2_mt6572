.class public final Lcom/android/phone/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final CallForwardEditPreference:[I = null

.field public static final CallForwardEditPreference_reason:I = 0x1

.field public static final CallForwardEditPreference_serviceClass:I = 0x0

.field public static final EditPhoneNumberPreference:[I = null

.field public static final EditPhoneNumberPreference_changeNumButtonText:I = 0x2

.field public static final EditPhoneNumberPreference_confirmMode:I = 0x3

.field public static final EditPhoneNumberPreference_disableButtonText:I = 0x1

.field public static final EditPhoneNumberPreference_enableButtonText:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 3774
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/phone/R$styleable;->CallForwardEditPreference:[I

    .line 3829
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/phone/R$styleable;->EditPhoneNumberPreference:[I

    return-void

    .line 3774
    nop

    :array_0
    .array-data 0x4
        0x4t 0x0t 0x1t 0x7ft
        0x5t 0x0t 0x1t 0x7ft
    .end array-data

    .line 3829
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x1t 0x7ft
        0x1t 0x0t 0x1t 0x7ft
        0x2t 0x0t 0x1t 0x7ft
        0x3t 0x0t 0x1t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3761
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
