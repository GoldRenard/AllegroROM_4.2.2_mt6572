.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$FastColorDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PhoneStatusBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FastColorDrawable"
.end annotation


# instance fields
.field private final mColor:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .parameter "color"

    .prologue
    .line 2977
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2978
    const/high16 v0, -0x100

    or-int/2addr v0, p1

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$FastColorDrawable;->mColor:I

    .line 2979
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 4
    .parameter "canvas"

    .prologue
    .line 2983
    iget v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$FastColorDrawable;->mColor:I

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 2984
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 2996
    const/4 v0, -0x1

    return v0
.end method

.method public setAlpha(I)V
    .registers 2
    .parameter "alpha"

    .prologue
    .line 2988
    return-void
.end method

.method public setBounds(IIII)V
    .registers 5
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 3001
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .registers 2
    .parameter "bounds"

    .prologue
    .line 3005
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .parameter "cf"

    .prologue
    .line 2992
    return-void
.end method
