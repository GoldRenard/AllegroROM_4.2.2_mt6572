.class Lcom/android/browser/NavScreen$TabAdapter;
.super Landroid/widget/BaseAdapter;
.source "NavScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/NavScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TabAdapter"
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field tabControl:Lcom/android/browser/TabControl;

.field final synthetic this$0:Lcom/android/browser/NavScreen;


# direct methods
.method public constructor <init>(Lcom/android/browser/NavScreen;Landroid/content/Context;Lcom/android/browser/TabControl;)V
    .locals 0
    .parameter
    .parameter "ctx"
    .parameter "tc"

    .prologue
    .line 241
    iput-object p1, p0, Lcom/android/browser/NavScreen$TabAdapter;->this$0:Lcom/android/browser/NavScreen;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 242
    iput-object p2, p0, Lcom/android/browser/NavScreen$TabAdapter;->context:Landroid/content/Context;

    .line 243
    iput-object p3, p0, Lcom/android/browser/NavScreen$TabAdapter;->tabControl:Lcom/android/browser/TabControl;

    .line 244
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/android/browser/NavScreen$TabAdapter;->tabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/android/browser/Tab;
    .locals 1
    .parameter "position"

    .prologue
    .line 253
    iget-object v0, p0, Lcom/android/browser/NavScreen$TabAdapter;->tabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v0, p1}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 236
    invoke-virtual {p0, p1}, Lcom/android/browser/NavScreen$TabAdapter;->getItem(I)Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 257
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 262
    new-instance v1, Lcom/android/browser/NavTabView;

    iget-object v2, p0, Lcom/android/browser/NavScreen$TabAdapter;->this$0:Lcom/android/browser/NavScreen;

    iget-object v2, v2, Lcom/android/browser/NavScreen;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/android/browser/NavTabView;-><init>(Landroid/content/Context;)V

    .line 263
    .local v1, tabview:Lcom/android/browser/NavTabView;
    invoke-virtual {p0, p1}, Lcom/android/browser/NavScreen$TabAdapter;->getItem(I)Lcom/android/browser/Tab;

    move-result-object v0

    .line 264
    .local v0, tab:Lcom/android/browser/Tab;
    invoke-virtual {v1, v0}, Lcom/android/browser/NavTabView;->setWebView(Lcom/android/browser/Tab;)V

    .line 265
    iget-object v2, p0, Lcom/android/browser/NavScreen$TabAdapter;->this$0:Lcom/android/browser/NavScreen;

    iget-object v2, v2, Lcom/android/browser/NavScreen;->mTabViews:Ljava/util/HashMap;

    iget-object v3, v1, Lcom/android/browser/NavTabView;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    new-instance v2, Lcom/android/browser/NavScreen$TabAdapter$1;

    invoke-direct {v2, p0, v1, v0, p1}, Lcom/android/browser/NavScreen$TabAdapter$1;-><init>(Lcom/android/browser/NavScreen$TabAdapter;Lcom/android/browser/NavTabView;Lcom/android/browser/Tab;I)V

    invoke-virtual {v1, v2}, Lcom/android/browser/NavTabView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    return-object v1
.end method
