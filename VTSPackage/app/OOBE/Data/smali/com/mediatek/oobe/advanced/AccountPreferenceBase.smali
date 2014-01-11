.class Lcom/mediatek/oobe/advanced/AccountPreferenceBase;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "AccountPreferenceBase.java"

# interfaces
.implements Landroid/accounts/OnAccountsUpdateListener;


# static fields
.field public static final AUTHORITIES_FILTER_KEY:Ljava/lang/String; = "authorities"

.field protected static final TAG:Ljava/lang/String; = "AccountPreferenceBase"


# instance fields
.field protected mAccountListCategory:Landroid/preference/PreferenceCategory;

.field private mAccountTypeToAuthorities:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAccounts:[Landroid/accounts/Account;

.field protected mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

.field protected mAuthorities:[Ljava/lang/String;

.field private mCallback:Landroid/accounts/AccountManagerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/accounts/AccountManagerCallback",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field protected mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mStatusChangeListenerHandle:Ljava/lang/Object;

.field protected mSupportedType:[Ljava/lang/String;

.field private mSyncStatusObserver:Landroid/content/SyncStatusObserver;

.field private mTypeToAuthDescription:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/accounts/AuthenticatorDescription;",
            ">;"
        }
    .end annotation
.end field

.field private mUnSNSType:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mUnSupportedType:[Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    .line 92
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mHandler:Landroid/os/Handler;

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSNSType:Ljava/util/ArrayList;

    .line 370
    new-instance v0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase$1;-><init>(Lcom/mediatek/oobe/advanced/AccountPreferenceBase;)V

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mSyncStatusObserver:Landroid/content/SyncStatusObserver;

    .line 508
    new-instance v0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase$2;-><init>(Lcom/mediatek/oobe/advanced/AccountPreferenceBase;)V

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mCallback:Landroid/accounts/AccountManagerCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/advanced/AccountPreferenceBase;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private addAccountPreference()V
    .locals 15

    .prologue
    .line 268
    const-string v12, "AccountPreferenceBase"

    const-string v13, "addAccountPreference()"

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    if-nez v12, :cond_0

    .line 271
    const-string v12, "AccountPreferenceBase"

    const-string v13, "No account till now, return"

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    :goto_0
    return-void

    .line 275
    :cond_0
    const-string v12, "AccountPreferenceBase"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mAccounts="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    array-length v14, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    if-nez v12, :cond_1

    .line 277
    new-instance v12, Landroid/preference/PreferenceCategory;

    invoke-direct {v12, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    iput-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    .line 278
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    const-string v13, "account_list_category"

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    .line 279
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    const v13, 0x7f09007a

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 282
    :cond_1
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    array-length v12, v12

    if-nez v12, :cond_6

    .line 283
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    .line 284
    .local v8, prefScreen:Landroid/preference/PreferenceScreen;
    if-eqz v8, :cond_2

    .line 285
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v8, v12}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 294
    :cond_2
    :goto_1
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v12}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 296
    const/4 v3, 0x0

    .local v3, i:I
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    array-length v7, v12

    .local v7, n:I
    :goto_2
    if-ge v3, v7, :cond_8

    .line 297
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    aget-object v0, v12, v3

    .line 298
    .local v0, account:Landroid/accounts/Account;
    iget-object v12, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v12}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 300
    .local v2, auths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v11, 0x1

    .line 301
    .local v11, showAccount:Z
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    if-eqz v12, :cond_3

    if-eqz v2, :cond_3

    .line 302
    const/4 v11, 0x0

    .line 303
    iget-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    .local v1, arr$:[Ljava/lang/String;
    array-length v6, v1

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_3
    if-ge v4, v6, :cond_3

    aget-object v10, v1, v4

    .line 304
    .local v10, requestedAuthority:Ljava/lang/String;
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 305
    const/4 v11, 0x1

    .line 310
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v6           #len$:I
    .end local v10           #requestedAuthority:Ljava/lang/String;
    :cond_3
    if-eqz v11, :cond_4

    iget-object v12, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-direct {p0, v12}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->shouldShowType(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    .line 311
    const/4 v11, 0x0

    .line 314
    :cond_4
    if-eqz v11, :cond_5

    .line 315
    iget-object v12, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v12}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getDrawableForType(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 316
    .local v5, icon:Landroid/graphics/drawable/Drawable;
    new-instance v9, Lcom/mediatek/oobe/advanced/AccountPreference;

    invoke-direct {v9, p0, v0, v5, v2}, Lcom/mediatek/oobe/advanced/AccountPreference;-><init>(Landroid/content/Context;Landroid/accounts/Account;Landroid/graphics/drawable/Drawable;Ljava/util/ArrayList;)V

    .line 317
    .local v9, preference:Lcom/mediatek/oobe/advanced/AccountPreference;
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v12, v9}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 296
    .end local v5           #icon:Landroid/graphics/drawable/Drawable;
    .end local v9           #preference:Lcom/mediatek/oobe/advanced/AccountPreference;
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 288
    .end local v0           #account:Landroid/accounts/Account;
    .end local v2           #auths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v3           #i:I
    .end local v7           #n:I
    .end local v8           #prefScreen:Landroid/preference/PreferenceScreen;
    .end local v11           #showAccount:Z
    :cond_6
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    .line 289
    .restart local v8       #prefScreen:Landroid/preference/PreferenceScreen;
    if-eqz v8, :cond_2

    .line 290
    iget-object v12, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v8, v12}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 303
    .restart local v0       #account:Landroid/accounts/Account;
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v2       #auths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3       #i:I
    .restart local v4       #i$:I
    .restart local v6       #len$:I
    .restart local v7       #n:I
    .restart local v10       #requestedAuthority:Ljava/lang/String;
    .restart local v11       #showAccount:Z
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 320
    .end local v0           #account:Landroid/accounts/Account;
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #auths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4           #i$:I
    .end local v6           #len$:I
    .end local v10           #requestedAuthority:Ljava/lang/String;
    .end local v11           #showAccount:Z
    :cond_8
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onSyncStateUpdated()V

    goto/16 :goto_0
.end method

.method private addProvider()V
    .locals 14

    .prologue
    .line 222
    const-string v11, "AccountPreferenceBase"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " --> addProvider()"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    array-length v11, v11

    if-ge v5, v11, :cond_7

    .line 225
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    aget-object v11, v11, v5

    iget-object v2, v11, Landroid/accounts/AuthenticatorDescription;->type:Ljava/lang/String;

    .line 226
    .local v2, accountType:Ljava/lang/String;
    const/4 v3, 0x1

    .line 228
    .local v3, addAccountPref:Z
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSNSType:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    if-eqz v11, :cond_0

    .line 229
    const/4 v6, 0x0

    .local v6, j:I
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    array-length v8, v11

    .local v8, n:I
    :goto_1
    if-ge v6, v8, :cond_0

    .line 230
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    aget-object v0, v11, v6

    .line 231
    .local v0, account:Landroid/accounts/Account;
    if-eqz v0, :cond_2

    iget-object v11, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 232
    const-string v11, "AccountPreferenceBase"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Provider type["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "] already have an account added, just hide this provider"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    const/4 v3, 0x0

    .line 239
    .end local v0           #account:Landroid/accounts/Account;
    .end local v6           #j:I
    .end local v8           #n:I
    :cond_0
    if-nez v3, :cond_3

    .line 224
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 229
    .restart local v0       #account:Landroid/accounts/Account;
    .restart local v6       #j:I
    .restart local v8       #n:I
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 242
    .end local v0           #account:Landroid/accounts/Account;
    .end local v6           #j:I
    .end local v8           #n:I
    :cond_3
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getLabelForType(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v10

    .line 245
    .local v10, providerName:Ljava/lang/CharSequence;
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 246
    .local v1, accountAuths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v11, "AccountPreferenceBase"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ###  type="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    if-eqz v11, :cond_4

    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    array-length v11, v11

    if-lez v11, :cond_4

    if-eqz v1, :cond_4

    .line 248
    const/4 v3, 0x0

    .line 249
    const/4 v7, 0x0

    .local v7, k:I
    :goto_3
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    array-length v11, v11

    if-ge v7, v11, :cond_4

    .line 250
    iget-object v11, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    aget-object v11, v11, v7

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 251
    const/4 v3, 0x1

    .line 256
    .end local v7           #k:I
    :cond_4
    if-eqz v3, :cond_5

    invoke-direct {p0, v2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->shouldShowType(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 257
    const/4 v3, 0x0

    .line 259
    :cond_5
    if-eqz v3, :cond_1

    .line 260
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getDrawableForType(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 261
    .local v4, drawable:Landroid/graphics/drawable/Drawable;
    new-instance v9, Lcom/mediatek/oobe/advanced/ProviderPreference;

    invoke-direct {v9, p0, v2, v4, v10}, Lcom/mediatek/oobe/advanced/ProviderPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)V

    .line 262
    .local v9, pref:Lcom/mediatek/oobe/advanced/ProviderPreference;
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v11

    invoke-virtual {v11, v9}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_2

    .line 249
    .end local v4           #drawable:Landroid/graphics/drawable/Drawable;
    .end local v9           #pref:Lcom/mediatek/oobe/advanced/ProviderPreference;
    .restart local v7       #k:I
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 265
    .end local v1           #accountAuths:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2           #accountType:Ljava/lang/String;
    .end local v3           #addAccountPref:Z
    .end local v7           #k:I
    .end local v10           #providerName:Ljava/lang/CharSequence;
    :cond_7
    return-void
.end method

.method private shouldShowType(Ljava/lang/String;)Z
    .locals 6
    .parameter "currType"

    .prologue
    .line 331
    if-eqz p1, :cond_0

    const-string v5, ""

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 332
    :cond_0
    const/4 v3, 0x0

    .line 352
    :cond_1
    :goto_0
    return v3

    .line 334
    :cond_2
    const/4 v3, 0x1

    .line 335
    .local v3, result:Z
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mSupportedType:[Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 336
    const/4 v3, 0x0

    .line 338
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mSupportedType:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 339
    .local v4, type:Ljava/lang/String;
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 340
    const/4 v3, 0x1

    .line 341
    goto :goto_0

    .line 338
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 344
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v4           #type:Ljava/lang/String;
    :cond_4
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSupportedType:[Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 345
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSupportedType:[Ljava/lang/String;

    .restart local v0       #arr$:[Ljava/lang/String;
    array-length v2, v0

    .restart local v2       #len$:I
    const/4 v1, 0x0

    .restart local v1       #i$:I
    :goto_2
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 346
    .restart local v4       #type:Ljava/lang/String;
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 347
    const/4 v3, 0x0

    .line 348
    goto :goto_0

    .line 345
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private updatePage()V
    .locals 2

    .prologue
    .line 214
    const-string v0, "AccountPreferenceBase"

    const-string v1, "updatePage()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    .line 216
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 217
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->addProvider()V

    .line 218
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->addAccountPreference()V

    .line 219
    return-void
.end method


# virtual methods
.method protected addAccount(Ljava/lang/String;)V
    .locals 8
    .parameter "accountType"

    .prologue
    const/4 v2, 0x0

    .line 498
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 499
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mCallback:Landroid/accounts/AccountManagerCallback;

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/accounts/AccountManager;->addAccount(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 506
    :goto_0
    return-void

    .line 504
    :cond_0
    const-string v0, "AccountPreferenceBase"

    const-string v1, "Click provider, try to add an account, but context is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 383
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    if-nez v5, :cond_1

    .line 385
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    .line 386
    invoke-static {}, Landroid/content/ContentResolver;->getSyncAdapterTypes()[Landroid/content/SyncAdapterType;

    move-result-object v4

    .line 387
    .local v4, syncAdapters:[Landroid/content/SyncAdapterType;
    const/4 v1, 0x0

    .local v1, i:I
    array-length v2, v4

    .local v2, n:I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 388
    aget-object v3, v4, v1

    .line 389
    .local v3, sa:Landroid/content/SyncAdapterType;
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    iget-object v6, v3, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 390
    .local v0, authorities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 391
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #authorities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .restart local v0       #authorities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    iget-object v6, v3, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v5, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    :cond_0
    const-string v5, "AccountPreferenceBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "added authority "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Landroid/content/SyncAdapterType;->authority:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " to accountType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    iget-object v5, v3, Landroid/content/SyncAdapterType;->authority:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 399
    .end local v0           #authorities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1           #i:I
    .end local v2           #n:I
    .end local v3           #sa:Landroid/content/SyncAdapterType;
    .end local v4           #syncAdapters:[Landroid/content/SyncAdapterType;
    :cond_1
    iget-object v5, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountTypeToAuthorities:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    return-object v5
.end method

.method protected getDrawableForType(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 7
    .parameter "accountType"

    .prologue
    .line 410
    const/4 v3, 0x0

    .line 411
    .local v3, icon:Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 413
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/accounts/AuthenticatorDescription;

    .line 414
    .local v1, desc:Landroid/accounts/AuthenticatorDescription;
    iget-object v4, v1, Landroid/accounts/AuthenticatorDescription;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 415
    .local v0, authContext:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, v1, Landroid/accounts/AuthenticatorDescription;->iconId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 420
    .end local v0           #authContext:Landroid/content/Context;
    .end local v1           #desc:Landroid/accounts/AuthenticatorDescription;
    :cond_0
    :goto_0
    return-object v3

    .line 416
    :catch_0
    move-exception v2

    .line 417
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "AccountPreferenceBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No icon for account type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected getLabelForType(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 7
    .parameter "accountType"

    .prologue
    .line 431
    const/4 v3, 0x0

    .line 432
    .local v3, label:Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 434
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/accounts/AuthenticatorDescription;

    .line 435
    .local v1, desc:Landroid/accounts/AuthenticatorDescription;
    iget-object v4, v1, Landroid/accounts/AuthenticatorDescription;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 436
    .local v0, authContext:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, v1, Landroid/accounts/AuthenticatorDescription;->labelId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 441
    .end local v0           #authContext:Landroid/content/Context;
    .end local v1           #desc:Landroid/accounts/AuthenticatorDescription;
    :cond_0
    :goto_0
    return-object v3

    .line 437
    :catch_0
    move-exception v2

    .line 438
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "AccountPreferenceBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No label for account type , type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onAccountsUpdated([Landroid/accounts/Account;)V
    .locals 2
    .parameter "accounts"

    .prologue
    .line 115
    const-string v0, "AccountPreferenceBase"

    const-string v1, "onAccountsUpdated()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iput-object p1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccounts:[Landroid/accounts/Account;

    .line 117
    if-nez p1, :cond_0

    .line 118
    const-string v0, "AccountPreferenceBase"

    const-string v1, "No account to show"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :goto_0
    return-void

    .line 122
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->updatePage()V

    goto :goto_0
.end method

.method protected onAuthDescriptionsUpdated()V
    .locals 0

    .prologue
    .line 129
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->updatePage()V

    .line 130
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "icicle"

    .prologue
    .line 106
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 107
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSNSType:Ljava/util/ArrayList;

    const-string v1, "com.android.exchange"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 366
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onPause()V

    .line 367
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mStatusChangeListenerHandle:Ljava/lang/Object;

    invoke-static {v0}, Landroid/content/ContentResolver;->removeStatusChangeListener(Ljava/lang/Object;)V

    .line 368
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 483
    const-string v1, "AccountPreferenceBase"

    const-string v2, "$$$ preference is clicked"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    instance-of v1, p2, Lcom/mediatek/oobe/advanced/ProviderPreference;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 485
    check-cast v0, Lcom/mediatek/oobe/advanced/ProviderPreference;

    .line 486
    .local v0, pref:Lcom/mediatek/oobe/advanced/ProviderPreference;
    const-string v1, "AccountPreferenceBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Attempting to add account of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/mediatek/oobe/advanced/ProviderPreference;->getAccountType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    invoke-virtual {v0}, Lcom/mediatek/oobe/advanced/ProviderPreference;->getAccountType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->addAccount(Ljava/lang/String;)V

    .line 489
    .end local v0           #pref:Lcom/mediatek/oobe/advanced/ProviderPreference;
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 357
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 358
    const/4 v0, 0x5

    iget-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mSyncStatusObserver:Landroid/content/SyncStatusObserver;

    invoke-static {v0, v1}, Landroid/content/ContentResolver;->addStatusChangeListener(ILandroid/content/SyncStatusObserver;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mStatusChangeListenerHandle:Ljava/lang/Object;

    .line 361
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onSyncStateUpdated()V

    .line 362
    return-void
.end method

.method protected onSyncStateUpdated()V
    .locals 25

    .prologue
    .line 136
    const-string v22, "AccountPreferenceBase"

    const-string v23, "onSyncStateUpdated()"

    invoke-static/range {v22 .. v23}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    const-string v22, "connectivity"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/ConnectivityManager;

    .line 139
    .local v7, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v7}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v6

    .line 140
    .local v6, backgroundDataSetting:Z
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v12

    .line 148
    .local v12, masterSyncAutomatically:Z
    invoke-static {}, Landroid/content/ContentResolver;->getSyncAdapterTypes()[Landroid/content/SyncAdapterType;

    move-result-object v16

    .line 149
    .local v16, syncAdapters:[Landroid/content/SyncAdapterType;
    new-instance v21, Ljava/util/HashSet;

    invoke-direct/range {v21 .. v21}, Ljava/util/HashSet;-><init>()V

    .line 150
    .local v21, userFacing:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v11, 0x0

    .local v11, k:I
    move-object/from16 v0, v16

    array-length v13, v0

    .local v13, n:I
    :goto_0
    if-ge v11, v13, :cond_1

    .line 151
    aget-object v15, v16, v11

    .line 152
    .local v15, sa:Landroid/content/SyncAdapterType;
    invoke-virtual {v15}, Landroid/content/SyncAdapterType;->isUserVisible()Z

    move-result v22

    if-eqz v22, :cond_0

    .line 153
    iget-object v0, v15, Landroid/content/SyncAdapterType;->authority:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 150
    :cond_0
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 156
    .end local v15           #sa:Landroid/content/SyncAdapterType;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    move-object/from16 v22, v0

    if-nez v22, :cond_3

    .line 157
    const-string v22, "AccountPreferenceBase"

    const-string v23, "No account till now, no need to update, return"

    invoke-static/range {v22 .. v23}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    :cond_2
    return-void

    .line 160
    :cond_3
    const/4 v9, 0x0

    .local v9, i:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v8

    .local v8, count:I
    :goto_1
    if-ge v9, v8, :cond_2

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAccountListCategory:Landroid/preference/PreferenceCategory;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Landroid/preference/PreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v14

    .line 162
    .local v14, pref:Landroid/preference/Preference;
    instance-of v0, v14, Lcom/mediatek/oobe/advanced/AccountPreference;

    move/from16 v22, v0

    if-nez v22, :cond_4

    .line 160
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_4
    move-object v3, v14

    .line 166
    check-cast v3, Lcom/mediatek/oobe/advanced/AccountPreference;

    .line 167
    .local v3, accountPref:Lcom/mediatek/oobe/advanced/AccountPreference;
    invoke-virtual {v3}, Lcom/mediatek/oobe/advanced/AccountPreference;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    .line 168
    .local v2, account:Landroid/accounts/Account;
    const/16 v17, 0x0

    .line 169
    .local v17, syncCount:I
    const/16 v19, 0x0

    .line 170
    .local v19, syncIsFailing:Z
    invoke-virtual {v3}, Lcom/mediatek/oobe/advanced/AccountPreference;->getAuthorities()Ljava/util/ArrayList;

    move-result-object v4

    .line 171
    .local v4, authorities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v4, :cond_7

    .line 172
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 174
    .local v5, authority:Ljava/lang/String;
    invoke-static {v2, v5}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_5

    if-eqz v12, :cond_5

    if-eqz v6, :cond_5

    invoke-static {v2, v5}, Landroid/content/ContentResolver;->getIsSyncable(Landroid/accounts/Account;Ljava/lang/String;)I

    move-result v22

    if-lez v22, :cond_5

    const/16 v18, 0x1

    .line 190
    .local v18, syncEnabled:Z
    :goto_4
    if-eqz v18, :cond_6

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    const/16 v22, 0x1

    :goto_5
    add-int v17, v17, v22

    .line 191
    goto :goto_3

    .line 174
    .end local v18           #syncEnabled:Z
    :cond_5
    const/16 v18, 0x0

    goto :goto_4

    .line 190
    .restart local v18       #syncEnabled:Z
    :cond_6
    const/16 v22, 0x0

    goto :goto_5

    .line 193
    .end local v5           #authority:Ljava/lang/String;
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v18           #syncEnabled:Z
    :cond_7
    const-string v22, "AccountPreferenceBase"

    const/16 v23, 0x2

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 194
    const-string v22, "AccountPreferenceBase"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "no syncadapters found for "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    :cond_8
    const/16 v20, 0x1

    .line 198
    .local v20, syncStatus:I
    if-eqz v19, :cond_a

    .line 199
    const/16 v20, 0x2

    .line 205
    :cond_9
    :goto_6
    move/from16 v0, v20

    invoke-virtual {v3, v0}, Lcom/mediatek/oobe/advanced/AccountPreference;->setSyncStatus(I)V

    goto :goto_2

    .line 200
    :cond_a
    if-nez v17, :cond_b

    .line 201
    const/16 v20, 0x1

    goto :goto_6

    .line 202
    :cond_b
    if-lez v17, :cond_9

    .line 203
    const/16 v20, 0x0

    goto :goto_6
.end method

.method protected updateAuthDescriptions()V
    .locals 4

    .prologue
    .line 474
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/accounts/AccountManager;->getAuthenticatorTypes()[Landroid/accounts/AuthenticatorDescription;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    .line 475
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 476
    iget-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mTypeToAuthDescription:Ljava/util/Map;

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    aget-object v2, v2, v0

    iget-object v2, v2, Landroid/accounts/AuthenticatorDescription;->type:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthDescs:[Landroid/accounts/AuthenticatorDescription;

    aget-object v3, v3, v0

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 478
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onAuthDescriptionsUpdated()V

    .line 479
    return-void
.end method
