.class public Lcom/android/systemui/recent/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field static final ALPHA_FADE_END:F = 0.5f

.field public static ALPHA_FADE_START:F = 0.0f

.field static final ESCAPE_VELOCITY:I = 0x64

.field static final MAX_ESCAPE_ANIMATION_DURATION:I = 0x1f4

.field static final SNAP_BACK_DURATION:I = 0xfa


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const v0, 0x3f4ccccd

    sput v0, Lcom/android/systemui/recent/Constants;->ALPHA_FADE_START:F

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
