.class Lcom/android/browser/BrowserSettings$1;
.super Ljava/lang/Object;
.source "BrowserSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BrowserSettings;


# direct methods
.method constructor <init>(Lcom/android/browser/BrowserSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 228
    iput-object p1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 232
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$000(Lcom/android/browser/BrowserSettings;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 233
    .local v0, metrics:Landroid/util/DisplayMetrics;
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    iget v2, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, v3

    #setter for: Lcom/android/browser/BrowserSettings;->mFontSizeMult:F
    invoke-static {v1, v2}, Lcom/android/browser/BrowserSettings;->access$102(Lcom/android/browser/BrowserSettings;F)F

    .line 237
    invoke-static {}, Landroid/app/ActivityManager;->staticGetMemoryClass()I

    move-result v1

    const/16 v2, 0x10

    if-le v1, v2, :cond_0

    .line 238
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/4 v2, 0x5

    #setter for: Lcom/android/browser/BrowserSettings;->mPageCacheCapacity:I
    invoke-static {v1, v2}, Lcom/android/browser/BrowserSettings;->access$202(Lcom/android/browser/BrowserSettings;I)I

    .line 240
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    new-instance v2, Lcom/android/browser/WebStorageSizeManager;

    iget-object v3, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/browser/BrowserSettings;->access$000(Lcom/android/browser/BrowserSettings;)Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lcom/android/browser/WebStorageSizeManager$StatFsDiskInfo;

    iget-object v5, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #calls: Lcom/android/browser/BrowserSettings;->getAppCachePath()Ljava/lang/String;
    invoke-static {v5}, Lcom/android/browser/BrowserSettings;->access$400(Lcom/android/browser/BrowserSettings;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/browser/WebStorageSizeManager$StatFsDiskInfo;-><init>(Ljava/lang/String;)V

    new-instance v5, Lcom/android/browser/WebStorageSizeManager$WebKitAppCacheInfo;

    iget-object v6, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #calls: Lcom/android/browser/BrowserSettings;->getAppCachePath()Ljava/lang/String;
    invoke-static {v6}, Lcom/android/browser/BrowserSettings;->access$400(Lcom/android/browser/BrowserSettings;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/browser/WebStorageSizeManager$WebKitAppCacheInfo;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3, v4, v5}, Lcom/android/browser/WebStorageSizeManager;-><init>(Landroid/content/Context;Lcom/android/browser/WebStorageSizeManager$DiskInfo;Lcom/android/browser/WebStorageSizeManager$AppCacheInfo;)V

    #setter for: Lcom/android/browser/BrowserSettings;->mWebStorageSizeManager:Lcom/android/browser/WebStorageSizeManager;
    invoke-static {v1, v2}, Lcom/android/browser/BrowserSettings;->access$302(Lcom/android/browser/BrowserSettings;Lcom/android/browser/WebStorageSizeManager;)Lcom/android/browser/WebStorageSizeManager;

    .line 244
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$500(Lcom/android/browser/BrowserSettings;)Landroid/content/SharedPreferences;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 245
    sget-object v1, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    const-string v2, "REL"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 247
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setDebugEnabled(Z)V

    .line 249
    :cond_1
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$500(Lcom/android/browser/BrowserSettings;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "text_size"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 258
    sget-object v1, Lcom/android/browser/BrowserSettings$2;->$SwitchMap$android$webkit$WebSettings$TextSize:[I

    iget-object v2, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #calls: Lcom/android/browser/BrowserSettings;->getTextSize()Landroid/webkit/WebSettings$TextSize;
    invoke-static {v2}, Lcom/android/browser/BrowserSettings;->access$600(Lcom/android/browser/BrowserSettings;)Landroid/webkit/WebSettings$TextSize;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebSettings$TextSize;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 272
    :goto_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$500(Lcom/android/browser/BrowserSettings;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "text_size"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 282
    :cond_2
    invoke-static {}, Lcom/android/browser/BrowserSettings;->access$700()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 285
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    #getter for: Lcom/android/browser/BrowserSettings;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$000(Lcom/android/browser/BrowserSettings;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0015

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$702(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    :cond_3
    const-class v2, Lcom/android/browser/BrowserSettings;

    monitor-enter v2

    .line 307
    const/4 v1, 0x1

    :try_start_0
    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->access$802(Z)Z

    .line 308
    const-class v1, Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 309
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    return-void

    .line 260
    :pswitch_0
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/16 v2, 0x32

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setTextZoom(I)V

    goto :goto_0

    .line 263
    :pswitch_1
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/16 v2, 0x4b

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setTextZoom(I)V

    goto :goto_0

    .line 266
    :pswitch_2
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/16 v2, 0x96

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setTextZoom(I)V

    goto :goto_0

    .line 269
    :pswitch_3
    iget-object v1, p0, Lcom/android/browser/BrowserSettings$1;->this$0:Lcom/android/browser/BrowserSettings;

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Lcom/android/browser/BrowserSettings;->setTextZoom(I)V

    goto :goto_0

    .line 309
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 258
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
