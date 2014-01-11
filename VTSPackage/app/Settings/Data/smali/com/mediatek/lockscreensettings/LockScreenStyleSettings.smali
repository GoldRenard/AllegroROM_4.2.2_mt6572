.class public Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;
.super Landroid/app/Activity;
.source "LockScreenStyleSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$ViewHolder;,
        Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;
    }
.end annotation


# static fields
.field private static final CONTACT_STRING:Ljava/lang/String; = "&"

.field public static final CURRENT_KEYGURAD_LAYER_KEY:Ljava/lang/String; = "mtk_current_keyguard_layer"

.field private static final DBG:Z = true

.field private static final MAX_ZOOM_OUT:I = 0x78

.field private static final REQUEST_CONFIG_KEYGUARD_LAYER:I = 0x1

.field private static final TAG:Ljava/lang/String; = "LockScreenStyleSettings"


# instance fields
.field private mBtnApply:Landroid/widget/Button;

.field private mCoverFlow:Landroid/widget/BounceCoverFlow;

.field private mCurrentLayerDesc:Landroid/widget/TextView;

.field private mCurrentLayerIndex:I

.field private mCurrentLayerName:Landroid/widget/TextView;

.field private mCurrentSuffix:Ljava/lang/String;

.field private mDefaultKeyguardLayer:Lcom/mediatek/common/policy/KeyguardLayerInfo;

.field private mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

.field private mKeyguardLayers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/common/policy/KeyguardLayerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mPackageActionReceiver:Landroid/content/BroadcastReceiver;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mResolver:Landroid/content/ContentResolver;

.field private mSelectedPosition:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    .line 75
    new-instance v0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$1;-><init>(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;)V

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageActionReceiver:Landroid/content/BroadcastReceiver;

    .line 447
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->isKeyguardLayerProvider(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->loadKeyguardLayers()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getBitmapFromPackage(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method private addPluginKeyguardLayers()V
    .locals 10

    .prologue
    .line 370
    :try_start_0
    const-class v7, Lcom/mediatek/common/policy/IKeyguardLayer;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    new-array v8, v8, [Landroid/content/pm/Signature;

    invoke-static {p0, v7, v8}, Lcom/mediatek/pluginmanager/PluginManager;->create(Landroid/content/Context;Ljava/lang/String;[Landroid/content/pm/Signature;)Lcom/mediatek/pluginmanager/PluginManager;

    move-result-object v4

    .line 371
    .local v4, plugManager:Lcom/mediatek/pluginmanager/PluginManager;
    invoke-virtual {v4}, Lcom/mediatek/pluginmanager/PluginManager;->getPluginCount()I

    move-result v6

    .line 373
    .local v6, pluginCount:I
    const-string v7, "LockScreenStyleSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getKeyguardLayers: pluginCount = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    if-eqz v6, :cond_1

    .line 378
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v6, :cond_1

    .line 379
    invoke-virtual {v4, v1}, Lcom/mediatek/pluginmanager/PluginManager;->getPlugin(I)Lcom/mediatek/pluginmanager/Plugin;

    move-result-object v5

    .line 380
    .local v5, plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/common/policy/IKeyguardLayer;>;"
    invoke-virtual {v5}, Lcom/mediatek/pluginmanager/Plugin;->createObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/common/policy/IKeyguardLayer;

    .line 381
    .local v3, keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    invoke-interface {v3}, Lcom/mediatek/common/policy/IKeyguardLayer;->getKeyguardLayerInfo()Lcom/mediatek/common/policy/KeyguardLayerInfo;

    move-result-object v2

    .line 383
    .local v2, info:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    const-string v7, "LockScreenStyleSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getKeyguardLayers: i = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",keyguardLayer = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",info = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    if-eqz v2, :cond_0

    .line 386
    iget-object v7, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 378
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 390
    .end local v1           #i:I
    .end local v2           #info:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    .end local v3           #keyguardLayer:Lcom/mediatek/common/policy/IKeyguardLayer;
    .end local v4           #plugManager:Lcom/mediatek/pluginmanager/PluginManager;
    .end local v5           #plugin:Lcom/mediatek/pluginmanager/Plugin;,"Lcom/mediatek/pluginmanager/Plugin<Lcom/mediatek/common/policy/IKeyguardLayer;>;"
    .end local v6           #pluginCount:I
    :catch_0
    move-exception v0

    .line 391
    .local v0, e:Ljava/lang/Exception;
    const-string v7, "LockScreenStyleSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getPluginKeyguardLayers exception happens: e = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    return-void
.end method

.method private generateCombinedIdentString(I)Ljava/lang/String;
    .locals 2
    .parameter "pos"

    .prologue
    .line 288
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget-object v0, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget v0, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->nameResId:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private generateDefaultLayer()Lcom/mediatek/common/policy/KeyguardLayerInfo;
    .locals 2

    .prologue
    .line 356
    new-instance v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    invoke-direct {v0}, Lcom/mediatek/common/policy/KeyguardLayerInfo;-><init>()V

    .line 357
    .local v0, layerInfo:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    .line 358
    const v1, 0x7f0b00c3

    iput v1, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->nameResId:I

    .line 359
    const v1, 0x7f0b01c0

    iput v1, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->descResId:I

    .line 360
    const v1, 0x7f0200ca

    iput v1, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->previewResId:I

    .line 361
    return-object v0
.end method

.method private getBitmapFromPackage(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "pkgName"
    .parameter "resId"

    .prologue
    .line 299
    const/4 v1, 0x0

    .line 301
    .local v1, res:Landroid/content/res/Resources;
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 306
    :goto_0
    const/4 v2, 0x0

    .line 307
    .local v2, ret:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 308
    invoke-static {v1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 310
    :cond_0
    return-object v2

    .line 302
    .end local v2           #ret:Landroid/graphics/Bitmap;
    :catch_0
    move-exception v0

    .line 303
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "LockScreenStyleSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getBitmapFromPackage can not find pakcage: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getCurrentLayerIndex()I
    .locals 9

    .prologue
    .line 255
    iget-object v6, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mResolver:Landroid/content/ContentResolver;

    const-string v7, "mtk_current_keyguard_layer"

    invoke-static {v6, v7}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, combinedLayerStr:Ljava/lang/String;
    const-string v6, "LockScreenStyleSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getCurrentLayer: combinedLayerStr = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ",mCurrentLayerPosition = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const/4 v3, -0x1

    .line 262
    .local v3, ret:I
    if-eqz v0, :cond_0

    .line 263
    new-instance v5, Ljava/util/StringTokenizer;

    const-string v6, "&"

    invoke-direct {v5, v0, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .local v5, tokenizer:Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 265
    .local v2, packageName:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 266
    const/4 v1, 0x0

    .local v1, i:I
    iget-object v6, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, sz:I
    :goto_0
    if-ge v1, v4, :cond_0

    .line 268
    const-string v7, "LockScreenStyleSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getCurrentLayer: i = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ", packageName = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ",layerPackage = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v6, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget-object v6, v6, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget-object v6, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget-object v6, v6, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 272
    move v3, v1

    .line 278
    .end local v1           #i:I
    .end local v2           #packageName:Ljava/lang/String;
    .end local v4           #sz:I
    .end local v5           #tokenizer:Ljava/util/StringTokenizer;
    :cond_0
    return v3

    .line 266
    .restart local v1       #i:I
    .restart local v2       #packageName:Ljava/lang/String;
    .restart local v4       #sz:I
    .restart local v5       #tokenizer:Ljava/util/StringTokenizer;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private getStringFromPackage(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .parameter "pkgName"
    .parameter "resId"

    .prologue
    .line 321
    const/4 v1, 0x0

    .line 323
    .local v1, res:Landroid/content/res/Resources;
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 328
    :goto_0
    const/4 v2, 0x0

    .line 329
    .local v2, ret:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 330
    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 332
    :cond_0
    return-object v2

    .line 324
    .end local v2           #ret:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 325
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "LockScreenStyleSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getStringFromPackage can not find pakcage: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private initViews()V
    .locals 2

    .prologue
    .line 140
    const v0, 0x7f0800bc

    invoke-virtual {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerName:Landroid/widget/TextView;

    .line 141
    const v0, 0x7f0800be

    invoke-virtual {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerDesc:Landroid/widget/TextView;

    .line 142
    const v0, 0x7f0800bf

    invoke-virtual {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mBtnApply:Landroid/widget/Button;

    .line 143
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mBtnApply:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    const v0, 0x7f0800bd

    invoke-virtual {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/BounceCoverFlow;

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    .line 146
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/BounceCoverFlow;->setCallbackDuringFling(Z)V

    .line 147
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    const/high16 v1, 0x42f0

    invoke-virtual {v0, v1}, Landroid/widget/BounceCoverFlow;->setMaxZoomOut(F)V

    .line 148
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    iget v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    invoke-virtual {v0, v1}, Landroid/widget/BounceCoverFlow;->setSelection(I)V

    .line 149
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    invoke-virtual {v0, p0}, Landroid/widget/BounceCoverFlow;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 150
    return-void
.end method

.method private isKeyguardLayerProvider(Ljava/lang/String;)Z
    .locals 3
    .parameter "pkgName"

    .prologue
    .line 342
    iget-object v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    .line 343
    .local v1, layerInfo:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    iget-object v2, v1, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 344
    const/4 v2, 0x1

    .line 347
    .end local v1           #layerInfo:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private loadKeyguardLayers()V
    .locals 4

    .prologue
    .line 156
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 157
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->generateDefaultLayer()Lcom/mediatek/common/policy/KeyguardLayerInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mDefaultKeyguardLayer:Lcom/mediatek/common/policy/KeyguardLayerInfo;

    .line 158
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mDefaultKeyguardLayer:Lcom/mediatek/common/policy/KeyguardLayerInfo;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->addPluginKeyguardLayers()V

    .line 161
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getCurrentLayerIndex()I

    move-result v0

    .line 163
    .local v0, curLayer:I
    if-gez v0, :cond_1

    .line 164
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->saveCurrentLayer(I)V

    .line 169
    :goto_0
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    if-eqz v1, :cond_0

    .line 170
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    invoke-virtual {v1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->clearBitmapCache()V

    .line 173
    :cond_0
    new-instance v1, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    iget-object v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-direct {v1, p0, p0, v2}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;-><init>(Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    .line 174
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    iget v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewWidth:I

    iget v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->setImageDispSize(II)V

    .line 175
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    const v2, 0x7f02005e

    invoke-virtual {v1, v2}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->setIndicatorBitmapResource(I)V

    .line 176
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    iget v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    invoke-virtual {v1, v2}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->setChosenItem(I)V

    .line 177
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    iget-object v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/BounceCoverFlow;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 178
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCoverFlow:Landroid/widget/BounceCoverFlow;

    iget v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    invoke-virtual {v1, v2}, Landroid/widget/BounceCoverFlow;->setSelection(I)V

    .line 179
    return-void

    .line 166
    :cond_1
    iput v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    goto :goto_0
.end method

.method private saveCurrentLayer(I)V
    .locals 4
    .parameter "index"

    .prologue
    .line 239
    const-string v1, "LockScreenStyleSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveCurrentLayer: mCurrentLayerIndex = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",index = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    iget v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    if-eq v1, p1, :cond_0

    .line 242
    iput p1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    .line 243
    invoke-direct {p0, p1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->generateCombinedIdentString(I)Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, combinedStr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mResolver:Landroid/content/ContentResolver;

    const-string v2, "mtk_current_keyguard_layer"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 246
    .end local v0           #combinedStr:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private setLockScreen(I)V
    .locals 2
    .parameter "index"

    .prologue
    .line 223
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    iget-object v0, v1, Lcom/mediatek/common/policy/KeyguardLayerInfo;->configIntent:Landroid/content/Intent;

    .line 224
    .local v0, configIntent:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 225
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 230
    :goto_0
    return-void

    .line 227
    :cond_0
    invoke-direct {p0, p1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->saveCurrentLayer(I)V

    .line 228
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->finish()V

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 211
    const-string v0, "LockScreenStyleSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult: requestCode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",resultCode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",data = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",mSelectedPosition = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 214
    iget v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    invoke-direct {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->saveCurrentLayer(I)V

    .line 215
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->finish()V

    .line 217
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 183
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mBtnApply:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 184
    iget v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    invoke-direct {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->setLockScreen(I)V

    .line 186
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 99
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 100
    const v1, 0x7f040043

    invoke-virtual {p0, v1}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->setContentView(I)V

    .line 102
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 103
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mResolver:Landroid/content/ContentResolver;

    .line 105
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0022

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewWidth:I

    .line 106
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0023

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewHeight:I

    .line 107
    invoke-virtual {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b01be

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentSuffix:Ljava/lang/String;

    .line 109
    const-string v1, "LockScreenStyleSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onCreate: mPreviewWidth = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",mPreviewHeight = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPreviewHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",mCurrentSuffix = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->initViews()V

    .line 114
    invoke-direct {p0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->loadKeyguardLayers()V

    .line 118
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 119
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 125
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageActionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 126
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    invoke-virtual {v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;->clearBitmapCache()V

    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayerAdapter:Lcom/mediatek/lockscreensettings/LockScreenStyleSettings$KeyguardLayerAdapter;

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mPackageActionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 136
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 137
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const-string v1, "LockScreenStyleSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onItemSelected: position = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",mSelectedPosition = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",mCurrentSuffix = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    iput p3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    .line 195
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mKeyguardLayers:Ljava/util/ArrayList;

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;

    .line 196
    .local v0, layer:Lcom/mediatek/common/policy/KeyguardLayerInfo;
    iget v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mSelectedPosition:I

    iget v2, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerIndex:I

    if-ne v1, v2, :cond_0

    .line 197
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerName:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    iget v4, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->nameResId:I

    invoke-direct {p0, v3, v4}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getStringFromPackage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    :goto_0
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerDesc:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    iget v3, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->descResId:I

    invoke-direct {p0, v2, v3}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getStringFromPackage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    return-void

    .line 199
    :cond_0
    iget-object v1, p0, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->mCurrentLayerName:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->layerPackage:Ljava/lang/String;

    iget v3, v0, Lcom/mediatek/common/policy/KeyguardLayerInfo;->nameResId:I

    invoke-direct {p0, v2, v3}, Lcom/mediatek/lockscreensettings/LockScreenStyleSettings;->getStringFromPackage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
