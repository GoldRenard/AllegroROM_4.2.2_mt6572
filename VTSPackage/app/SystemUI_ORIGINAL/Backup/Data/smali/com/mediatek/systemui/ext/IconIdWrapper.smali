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
    .locals 2

    .prologue
    .line 15
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(Landroid/content/res/Resources;I)V

    .line 16
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "iconId"

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(Landroid/content/res/Resources;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;I)V
    .locals 1
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
    .locals 4

    .prologue
    .line 54
    const/4 v1, 0x0

    .line 56
    .local v1, clone:Lcom/mediatek/systemui/ext/IconIdWrapper;
    :try_start_0
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
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_0
    return-object v1

    .line 59
    :catch_0
    move-exception v2

    .line 60
    .local v2, e:Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
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
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    iget v1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 50
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getIconId()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    return v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method public setIconId(I)V
    .locals 0
    .parameter "iconId"

    .prologue
    .line 40
    iput p1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mIconId:I

    .line 41
    return-void
.end method

.method public setResources(Landroid/content/res/Resources;)V
    .locals 0
    .parameter "resources"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/mediatek/systemui/ext/IconIdWrapper;->mResources:Landroid/content/res/Resources;

    .line 33
    return-void
.end method
