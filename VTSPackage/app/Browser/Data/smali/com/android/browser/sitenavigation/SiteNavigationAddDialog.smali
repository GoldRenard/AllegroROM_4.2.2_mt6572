.class public Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;
.super Landroid/app/Activity;
.source "SiteNavigationAddDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;
    }
.end annotation


# static fields
.field private static final ACCEPTABLE_WEBSITE_SCHEMES:[Ljava/lang/String; = null

.field private static final SAVE_SITE_NAVIGATION:I = 0x64

.field private static final XLOGTAG:Ljava/lang/String; = "browser/AddSiteNavigationPage"


# instance fields
.field private mAddress:Landroid/widget/EditText;

.field private mButtonCancel:Landroid/widget/Button;

.field private mButtonOK:Landroid/widget/Button;

.field private mCancelListener:Landroid/view/View$OnClickListener;

.field private mDialogText:Landroid/widget/TextView;

.field private mHandler:Landroid/os/Handler;

.field private mIsAdding:Z

.field private mItemUrl:Ljava/lang/String;

.field private mMap:Landroid/os/Bundle;

.field private mName:Landroid/widget/EditText;

.field private mOKListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 345
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http:"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "https:"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "about:"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "data:"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "javascript:"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "file:"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "content:"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->ACCEPTABLE_WEBSITE_SCHEMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 108
    new-instance v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;

    invoke-direct {v0, p0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;-><init>(Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;)V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mOKListener:Landroid/view/View$OnClickListener;

    .line 117
    new-instance v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$2;

    invoke-direct {v0, p0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$2;-><init>(Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;)V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mCancelListener:Landroid/view/View$OnClickListener;

    .line 174
    return-void
.end method

.method public static isSiteNavigationUrl(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 10
    .parameter "context"
    .parameter "itemUrl"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 325
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 326
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 328
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const-string v3, "url = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 330
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 331
    const-string v1, "browser/AddSiteNavigationPage"

    const-string v2, "isSiteNavigationUrl will return true."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    if-eqz v6, :cond_0

    .line 338
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v1, v8

    .line 342
    :goto_0
    return v1

    .line 337
    :cond_1
    if-eqz v6, :cond_2

    .line 338
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    move v1, v9

    .line 342
    goto :goto_0

    .line 334
    :catch_0
    move-exception v7

    .line 335
    .local v7, e:Ljava/lang/IllegalStateException;
    :try_start_1
    const-string v1, "browser/AddSiteNavigationPage"

    const-string v2, "isSiteNavigationUrl"

    invoke-static {v1, v2, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 337
    if-eqz v6, :cond_2

    .line 338
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 337
    .end local v7           #e:Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_3

    .line 338
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method private static urlHasAcceptableScheme(Ljava/lang/String;)Z
    .locals 3
    .parameter "url"

    .prologue
    const/4 v1, 0x0

    .line 355
    if-nez p0, :cond_1

    .line 364
    :cond_0
    :goto_0
    return v1

    .line 359
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget-object v2, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->ACCEPTABLE_WEBSITE_SCHEMES:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 360
    sget-object v2, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->ACCEPTABLE_WEBSITE_SCHEMES:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 361
    const/4 v1, 0x1

    goto :goto_0

    .line 359
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "icicle"

    .prologue
    .line 124
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 125
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->requestWindowFeature(I)Z

    .line 126
    const v3, 0x7f04002d

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->setContentView(I)V

    .line 128
    const/4 v1, 0x0

    .line 129
    .local v1, name:Ljava/lang/String;
    const/4 v2, 0x0

    .line 131
    .local v2, url:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    .line 132
    const-string v3, "browser/AddSiteNavigationPage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCreate mMap is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    if-eqz v3, :cond_1

    .line 134
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    const-string v4, "websites"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 135
    .local v0, b:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 136
    iput-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    .line 138
    :cond_0
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    const-string v4, "name"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 139
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    const-string v4, "url"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 140
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mMap:Landroid/os/Bundle;

    const-string v4, "isAdding"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mIsAdding:Z

    .line 144
    .end local v0           #b:Landroid/os/Bundle;
    :cond_1
    iput-object v2, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mItemUrl:Ljava/lang/String;

    .line 146
    const v3, 0x7f0d0007

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mName:Landroid/widget/EditText;

    .line 147
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mName:Landroid/widget/EditText;

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 148
    const v3, 0x7f0d0038

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    .line 150
    const-string v3, "about:blank"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 151
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    const-string v4, "about:blank"

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 155
    :goto_0
    const v3, 0x7f0d0071

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mDialogText:Landroid/widget/TextView;

    .line 156
    iget-boolean v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mIsAdding:Z

    if-eqz v3, :cond_2

    .line 157
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mDialogText:Landroid/widget/TextView;

    const v4, 0x7f0c002c

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 160
    :cond_2
    const v3, 0x7f0d003f

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mButtonOK:Landroid/widget/Button;

    .line 161
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mButtonOK:Landroid/widget/Button;

    iget-object v4, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mOKListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    const v3, 0x7f0d003e

    invoke-virtual {p0, v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mButtonCancel:Landroid/widget/Button;

    .line 164
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mButtonCancel:Landroid/widget/Button;

    iget-object v4, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mCancelListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->isInTouchMode()Z

    move-result v3

    if-nez v3, :cond_3

    .line 167
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mButtonOK:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->requestFocus()Z

    .line 169
    :cond_3
    return-void

    .line 153
    :cond_4
    iget-object v3, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method save()Z
    .locals 22

    .prologue
    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mName:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 226
    .local v12, name:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 227
    .local v16, unfilteredUrl:Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_3

    const/4 v6, 0x1

    .line 228
    .local v6, emptyTitle:Z
    :goto_0
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_4

    const/4 v7, 0x1

    .line 229
    .local v7, emptyUrl:Z
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    .line 230
    .local v13, r:Landroid/content/res/Resources;
    if-nez v6, :cond_0

    if-eqz v7, :cond_5

    .line 231
    :cond_0
    if-eqz v6, :cond_1

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mName:Landroid/widget/EditText;

    move-object/from16 v19, v0

    const v20, 0x7f0c0030

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 234
    :cond_1
    if-eqz v7, :cond_2

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    move-object/from16 v19, v0

    const v20, 0x7f0c0031

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 237
    :cond_2
    const/16 v19, 0x0

    .line 321
    :goto_2
    return v19

    .line 227
    .end local v6           #emptyTitle:Z
    .end local v7           #emptyUrl:Z
    .end local v13           #r:Landroid/content/res/Resources;
    :cond_3
    const/4 v6, 0x0

    goto :goto_0

    .line 228
    .restart local v6       #emptyTitle:Z
    :cond_4
    const/4 v7, 0x0

    goto :goto_1

    .line 239
    .restart local v7       #emptyUrl:Z
    .restart local v13       #r:Landroid/content/res/Resources;
    :cond_5
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    .line 244
    .local v18, url:Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v19

    const-string v20, "javascript:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_b

    .line 245
    new-instance v17, Ljava/net/URI;

    invoke-direct/range {v17 .. v18}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 246
    .local v17, uriObj:Ljava/net/URI;
    invoke-virtual/range {v17 .. v17}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v14

    .line 247
    .local v14, scheme:Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->urlHasAcceptableScheme(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_9

    .line 251
    if-eqz v14, :cond_6

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    move-object/from16 v19, v0

    const v20, 0x7f0c0032

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    const/16 v19, 0x0

    goto :goto_2

    .line 257
    :cond_6
    :try_start_1
    new-instance v2, Landroid/net/WebAddress;

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Landroid/net/WebAddress;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/net/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 261
    .local v2, address:Landroid/net/WebAddress;
    :try_start_2
    invoke-virtual {v2}, Landroid/net/WebAddress;->getHost()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_7

    .line 262
    new-instance v19, Ljava/net/URISyntaxException;

    const-string v20, ""

    const-string v21, ""

    invoke-direct/range {v19 .. v21}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v19
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0

    .line 286
    .end local v2           #address:Landroid/net/WebAddress;
    .end local v14           #scheme:Ljava/lang/String;
    .end local v17           #uriObj:Ljava/net/URI;
    :catch_0
    move-exception v5

    .line 287
    .local v5, e:Ljava/net/URISyntaxException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    move-object/from16 v19, v0

    const v20, 0x7f0c008b

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 288
    const/16 v19, 0x0

    goto :goto_2

    .line 258
    .end local v5           #e:Ljava/net/URISyntaxException;
    .restart local v14       #scheme:Ljava/lang/String;
    .restart local v17       #uriObj:Ljava/net/URI;
    :catch_1
    move-exception v5

    .line 259
    .local v5, e:Landroid/net/ParseException;
    :try_start_3
    new-instance v19, Ljava/net/URISyntaxException;

    const-string v20, ""

    const-string v21, ""

    invoke-direct/range {v19 .. v21}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v19

    .line 264
    .end local v5           #e:Landroid/net/ParseException;
    .restart local v2       #address:Landroid/net/WebAddress;
    :cond_7
    invoke-virtual {v2}, Landroid/net/WebAddress;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v18

    .line 278
    .end local v2           #address:Landroid/net/WebAddress;
    :cond_8
    :goto_3
    :try_start_4
    const-string v19, "UTF-8"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 279
    .local v4, bytes:[B
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v19

    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_b

    .line 280
    new-instance v19, Ljava/net/URISyntaxException;

    const-string v20, ""

    const-string v21, ""

    invoke-direct/range {v19 .. v21}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v19
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0

    .line 282
    .end local v4           #bytes:[B
    :catch_2
    move-exception v5

    .line 283
    .local v5, e:Ljava/io/UnsupportedEncodingException;
    :try_start_5
    new-instance v19, Ljava/net/URISyntaxException;

    const-string v20, ""

    const-string v21, ""

    invoke-direct/range {v19 .. v21}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v19

    .line 266
    .end local v5           #e:Ljava/io/UnsupportedEncodingException;
    :cond_9
    const-string v10, "://"

    .line 267
    .local v10, mark:Ljava/lang/String;
    const/4 v9, -0x1

    .line 268
    .local v9, iRet:I
    if-eqz v18, :cond_a

    .line 269
    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    .line 271
    :cond_a
    if-lez v9, :cond_8

    const-string v19, "/"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v20

    add-int v20, v20, v9

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v19

    if-gez v19, :cond_8

    .line 272
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "/"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 273
    const-string v19, "browser/AddSiteNavigationPage"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "URL="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3

    .line 292
    .end local v9           #iRet:I
    .end local v10           #mark:Ljava/lang/String;
    .end local v14           #scheme:Ljava/lang/String;
    .end local v17           #uriObj:Ljava/net/URI;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mItemUrl:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c

    .line 293
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->isSiteNavigationUrl(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v8

    .line 294
    .local v8, exist:Z
    if-eqz v8, :cond_c

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mAddress:Landroid/widget/EditText;

    move-object/from16 v19, v0

    const v20, 0x7f0c0037

    move/from16 v0, v20

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 296
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 301
    .end local v8           #exist:Z
    :cond_c
    const-string v19, "about:blank"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_d

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mItemUrl:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 306
    :cond_d
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 307
    .local v3, bundle:Landroid/os/Bundle;
    const-string v19, "title"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    const-string v19, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    const-string v19, "itemUrl"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mItemUrl:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mItemUrl:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_e

    .line 311
    const-string v19, "toDefaultThumbnail"

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 315
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->mHandler:Landroid/os/Handler;

    move-object/from16 v19, v0

    const/16 v20, 0x64

    invoke-static/range {v19 .. v20}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v11

    .line 316
    .local v11, msg:Landroid/os/Message;
    invoke-virtual {v11, v3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 318
    new-instance v15, Ljava/lang/Thread;

    new-instance v19, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;-><init>(Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;Landroid/os/Message;)V

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 319
    .local v15, t:Ljava/lang/Thread;
    invoke-virtual {v15}, Ljava/lang/Thread;->start()V

    .line 321
    const/16 v19, 0x1

    goto/16 :goto_2

    .line 313
    .end local v11           #msg:Landroid/os/Message;
    .end local v15           #t:Ljava/lang/Thread;
    :cond_e
    const-string v19, "toDefaultThumbnail"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_4
.end method
