.class Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;
.super Lcom/mediatek/lockscreensettings/ReflectionDecorAdapter;
.source "LockScreenStyleSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeyguardLayerAdapter"
.end annotation


# instance fields
.field private mLayerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/common/policy/KeyguardLayerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/common/policy/KeyguardLayerInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 399
    .local p3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/common/policy/KeyguardLayerInfo;>;"
    iput-object p1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->this$0:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;

    .line 400
    invoke-direct {p0, p2}, Lcom/mediatek/lockscreensettings/ReflectionDecorAdapter;-><init>(Landroid/content/Context;)V

    .line 401
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 402
    iput-object p3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayerList:Ljava/util/ArrayList;

    .line 403
    return-void
.end method


# virtual methods
.method public getContainerId()I
    .locals 1

    .prologue
    .line 438
    const v0, 0x7f0800bb

    return v0
.end method

.method public getContentAt(I)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "position"

    .prologue
    .line 443
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->this$0:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;

    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget-object v2, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget v0, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->previewResId:I

    #calls: Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getBitmapFromPackage(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    invoke-static {v1, v2, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->access$300(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 407
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 412
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 417
    int-to-long v0, p1

    return-wide v0
.end method

.method public getViewInner(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 424
    if-nez p2, :cond_0

    .line 425
    new-instance v0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;-><init>(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$1;)V

    .line 426
    .local v0, holder:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f040042

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 427
    const v1, 0x7f0800bb

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;->mPreviewView:Landroid/widget/ImageView;

    .line 428
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 433
    :goto_0
    return-object p2

    .line 430
    .end local v0           #holder:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;

    .restart local v0       #holder:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;
    goto :goto_0
.end method
