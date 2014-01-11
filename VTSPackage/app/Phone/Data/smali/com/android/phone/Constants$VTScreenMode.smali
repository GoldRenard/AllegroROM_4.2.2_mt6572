.class public final enum Lcom/android/phone/Constants$VTScreenMode;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VTScreenMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/phone/Constants$VTScreenMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/phone/Constants$VTScreenMode;

.field public static final enum VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

.field public static final enum VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

.field public static final enum VT_SCREEN_WAITING:Lcom/android/phone/Constants$VTScreenMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 210
    new-instance v0, Lcom/android/phone/Constants$VTScreenMode;

    const-string v1, "VT_SCREEN_CLOSE"

    invoke-direct {v0, v1, v2}, Lcom/android/phone/Constants$VTScreenMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    .line 211
    new-instance v0, Lcom/android/phone/Constants$VTScreenMode;

    const-string v1, "VT_SCREEN_OPEN"

    invoke-direct {v0, v1, v3}, Lcom/android/phone/Constants$VTScreenMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    .line 212
    new-instance v0, Lcom/android/phone/Constants$VTScreenMode;

    const-string v1, "VT_SCREEN_WAITING"

    invoke-direct {v0, v1, v4}, Lcom/android/phone/Constants$VTScreenMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_WAITING:Lcom/android/phone/Constants$VTScreenMode;

    .line 209
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/phone/Constants$VTScreenMode;

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_WAITING:Lcom/android/phone/Constants$VTScreenMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/phone/Constants$VTScreenMode;->$VALUES:[Lcom/android/phone/Constants$VTScreenMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 209
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/phone/Constants$VTScreenMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 209
    const-class v0, Lcom/android/phone/Constants$VTScreenMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/phone/Constants$VTScreenMode;

    return-object v0
.end method

.method public static values()[Lcom/android/phone/Constants$VTScreenMode;
    .locals 1

    .prologue
    .line 209
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->$VALUES:[Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {v0}, [Lcom/android/phone/Constants$VTScreenMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/phone/Constants$VTScreenMode;

    return-object v0
.end method
