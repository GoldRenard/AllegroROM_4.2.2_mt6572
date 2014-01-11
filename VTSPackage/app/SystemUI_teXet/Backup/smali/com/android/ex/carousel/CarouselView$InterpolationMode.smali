.class public Lcom/android/ex/carousel/CarouselView$InterpolationMode;
.super Ljava/lang/Object;
.source "CarouselView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/ex/carousel/CarouselView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InterpolationMode"
.end annotation


# static fields
.field public static final ACCELERATE_DECELERATE_CUBIC:I = 0x2

.field public static final DECELERATE_QUADRATIC:I = 0x1

.field public static final LINEAR:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
