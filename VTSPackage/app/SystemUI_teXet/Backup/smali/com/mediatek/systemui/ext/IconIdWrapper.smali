.class public Lcom/mediatek/systemui/ext/IconIdWrapper;
.super Ljava/lang/Object;
.source "IconIdWrapper.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private mIconId:I

.field private mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 15
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(Landroid/content/res/Resources;I)V

    .line 16
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .parameter "iconId"

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(Landroid/content/res/Resources;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;I)V
    .registers 4
    .parameter "resources"
    .parameter "iconId"

    .prologue
    .line 22
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    .line 12
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    .line 23
    iput-object p1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    .line 24
    iput p2, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    .line 25
    return-void
.end method


# virtual methods
.method public clone()Lcom/mediatek/systemui/ext/IconIdWrapper;
    .registers 5

    .prologue
    .line 54
    const/4 v1, 0x0

    .line 56
    .local v1, clone:Lcom/mediatek/systemui/ext/IconIdWrapper;
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object v1, v0

    .line 57
    iget-object v3, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    iput-object v3, v1, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    .line 58
    iget v3, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    iput v3, v1, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I
    :try_end_11
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_11} :catch_12

    .line 62
    :goto_11
    return-object v1

    .line 59
    :catch_12
    move-exception v2

    .line 60
    .local v2, e:Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 9
    invoke-virtual {p0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v0

    return-object v0
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 47
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    if-eqz v0, :cond_11

    iget v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    if-eqz v0, :cond_11

    .line 48
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    iget v1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 50
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getIconId()I
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    return v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method public setIconId(I)V
    .registers 2
    .parameter "iconId"

    .prologue
    .line 40
    iput p1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    .line 41
    return-void
.end method

.method public setResources(Landroid/content/res/Resources;)V
    .registers 2
    .parameter "resources"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    .line 33
    return-void
.end method
