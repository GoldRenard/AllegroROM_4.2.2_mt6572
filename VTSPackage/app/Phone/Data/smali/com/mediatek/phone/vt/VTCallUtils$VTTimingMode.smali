.class public final enum Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;
.super Ljava/lang/Enum;
.source "VTCallUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/vt/VTCallUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VTTimingMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

.field public static final enum VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

.field public static final enum VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 311
    new-instance v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    const-string v1, "VT_TIMING_NONE"

    invoke-direct {v0, v1, v2}, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    new-instance v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    const-string v1, "VT_TIMING_DEFAULT"

    invoke-direct {v0, v1, v3}, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    .line 310
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    sget-object v1, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->$VALUES:[Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

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
    .line 310
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 310
    const-class v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;
    .locals 1

    .prologue
    .line 310
    sget-object v0, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->$VALUES:[Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    invoke-virtual {v0}, [Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    return-object v0
.end method
