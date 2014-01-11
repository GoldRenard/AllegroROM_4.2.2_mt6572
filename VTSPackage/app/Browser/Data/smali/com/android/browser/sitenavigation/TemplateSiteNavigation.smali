.class public Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
.super Ljava/lang/Object;
.source "TemplateSiteNavigation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$1;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$HashMapEntityData;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$StringEntity;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;,
        Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;
    }
.end annotation


# static fields
.field public static final XLOGTAG:Ljava/lang/String; = "browser/TemplateSiteNavigation"

.field private static sCachedTemplates:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/android/browser/sitenavigation/TemplateSiteNavigation;",
            ">;"
        }
    .end annotation
.end field

.field private static sCountryChanged:Z

.field private static sCurrentCountry:Ljava/lang/String;


# instance fields
.field private mData:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mTemplate:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCachedTemplates:Ljava/util/HashMap;

    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCountryChanged:Z

    .line 49
    const-string v0, "US"

    sput-object v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCurrentCountry:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "tid"

    .prologue
    .line 191
    invoke-static {p1, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->readRaw(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "template"

    .prologue
    .line 194
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 189
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mData:Ljava/util/HashMap;

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    .line 196
    invoke-static {p1, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->replaceConsts(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 197
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->parseTemplate(Landroid/content/Context;Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Lcom/android/browser/sitenavigation/TemplateSiteNavigation;)V
    .locals 1
    .parameter "copy"

    .prologue
    .line 200
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 189
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mData:Ljava/util/HashMap;

    .line 201
    iget-object v0, p1, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    iput-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    .line 202
    return-void
.end method

.method public static getCachedTemplate(Landroid/content/Context;I)Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    .locals 5
    .parameter "context"
    .parameter "id"

    .prologue
    .line 53
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getDisplayCountry()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, changeToCountry:Ljava/lang/String;
    const-string v2, "browser/TemplateSiteNavigation"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TemplateSiteNavigation.getCachedTemplate() display country :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", before country :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCurrentCountry:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    if-eqz v0, :cond_0

    sget-object v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCurrentCountry:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 57
    const/4 v2, 0x1

    sput-boolean v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCountryChanged:Z

    .line 58
    sput-object v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCurrentCountry:Ljava/lang/String;

    .line 60
    :cond_0
    sget-object v3, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCachedTemplates:Ljava/util/HashMap;

    monitor-enter v3

    .line 61
    :try_start_0
    sget-object v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCachedTemplates:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    .line 62
    .local v1, template:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    if-eqz v1, :cond_1

    sget-boolean v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCountryChanged:Z

    if-eqz v2, :cond_2

    .line 65
    :cond_1
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCountryChanged:Z

    .line 66
    new-instance v1, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    .end local v1           #template:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    invoke-direct {v1, p0, p1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;-><init>(Landroid/content/Context;I)V

    .line 67
    .restart local v1       #template:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    sget-object v2, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->sCachedTemplates:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    :cond_2
    invoke-virtual {v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->copy()Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    move-result-object v2

    monitor-exit v3

    return-object v2

    .line 71
    .end local v1           #template:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private static readRaw(Landroid/content/Context;I)Ljava/lang/String;
    .locals 5
    .parameter "context"
    .parameter "id"

    .prologue
    .line 295
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 297
    .local v2, ins:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v3

    new-array v0, v3, [B

    .line 298
    .local v0, buf:[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 299
    new-instance v3, Ljava/lang/String;

    const-string v4, "utf-8"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    .end local v0           #buf:[B
    :goto_0
    return-object v3

    .line 300
    :catch_0
    move-exception v1

    .line 301
    .local v1, ex:Ljava/io/IOException;
    const-string v3, "<html><body>Error</body></html>"

    goto :goto_0
.end method

.method private static replaceConsts(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .parameter "context"
    .parameter "template"

    .prologue
    const/4 v13, 0x1

    .line 260
    const-string v11, "<%@\\s*(\\w+/\\w+)\\s*%>"

    invoke-static {v11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    .line 261
    .local v6, pattern:Ljava/util/regex/Pattern;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 262
    .local v8, res:Landroid/content/res/Resources;
    const-class v11, Lcom/android/browser/R;

    invoke-virtual {v11}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v5

    .line 263
    .local v5, packageName:Ljava/lang/String;
    invoke-virtual {v6, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 264
    .local v3, m:Ljava/util/regex/Matcher;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    .line 265
    .local v9, sb:Ljava/lang/StringBuffer;
    :cond_0
    :goto_0
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 266
    invoke-virtual {v3, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 267
    .local v4, name:Ljava/lang/String;
    const-string v11, "drawable/"

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 268
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "res/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v9, v11}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0

    .line 270
    :cond_1
    const/4 v11, 0x0

    invoke-virtual {v8, v4, v11, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 271
    .local v2, id:I
    if-eqz v2, :cond_0

    .line 272
    new-instance v10, Landroid/util/TypedValue;

    invoke-direct {v10}, Landroid/util/TypedValue;-><init>()V

    .line 273
    .local v10, value:Landroid/util/TypedValue;
    invoke-virtual {v8, v2, v10, v13}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 275
    iget v11, v10, Landroid/util/TypedValue;->type:I

    const/4 v12, 0x5

    if-ne v11, v12, :cond_3

    .line 276
    invoke-virtual {v8, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .line 277
    .local v0, dimen:F
    float-to-int v1, v0

    .line 278
    .local v1, dimeni:I
    int-to-float v11, v1

    cmpl-float v11, v11, v0

    if-nez v11, :cond_2

    .line 279
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    .line 286
    .end local v0           #dimen:F
    .end local v1           #dimeni:I
    .local v7, replacement:Ljava/lang/String;
    :goto_1
    invoke-virtual {v3, v9, v7}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_0

    .line 281
    .end local v7           #replacement:Ljava/lang/String;
    .restart local v0       #dimen:F
    .restart local v1       #dimeni:I
    :cond_2
    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v7

    .restart local v7       #replacement:Ljava/lang/String;
    goto :goto_1

    .line 284
    .end local v0           #dimen:F
    .end local v1           #dimeni:I
    .end local v7           #replacement:Ljava/lang/String;
    :cond_3
    invoke-virtual {v10}, Landroid/util/TypedValue;->coerceToString()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .restart local v7       #replacement:Ljava/lang/String;
    goto :goto_1

    .line 290
    .end local v2           #id:I
    .end local v4           #name:Ljava/lang/String;
    .end local v7           #replacement:Ljava/lang/String;
    .end local v10           #value:Landroid/util/TypedValue;
    :cond_4
    invoke-virtual {v3, v9}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 291
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11
.end method


# virtual methods
.method public assign(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "name"
    .parameter "value"

    .prologue
    .line 242
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mData:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    return-void
.end method

.method public assignLoop(Ljava/lang/String;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;)V
    .locals 1
    .parameter "name"
    .parameter "iter"

    .prologue
    .line 246
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mData:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    return-void
.end method

.method copy()Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    .locals 1

    .prologue
    .line 205
    new-instance v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    invoke-direct {v0, p0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;-><init>(Lcom/android/browser/sitenavigation/TemplateSiteNavigation;)V

    return-object v0
.end method

.method parseTemplate(Landroid/content/Context;Ljava/lang/String;)V
    .locals 11
    .parameter "context"
    .parameter "template"

    .prologue
    .line 209
    const-string v9, "<%([=\\{])\\s*(\\w+)\\s*%>"

    invoke-static {v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 210
    .local v4, pattern:Ljava/util/regex/Pattern;
    invoke-virtual {v4, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 211
    .local v1, m:Ljava/util/regex/Matcher;
    const/4 v5, 0x0

    .line 212
    .local v5, start:I
    :goto_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 213
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v9

    invoke-virtual {p2, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 214
    .local v6, staticPart:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_0

    .line 215
    iget-object v9, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    new-instance v10, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$StringEntity;

    invoke-direct {v10, v6}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$StringEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    :cond_0
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 218
    .local v8, type:Ljava/lang/String;
    const/4 v9, 0x2

    invoke-virtual {v1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 219
    .local v2, name:Ljava/lang/String;
    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 220
    iget-object v9, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    new-instance v10, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;

    invoke-direct {v10, v2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    :cond_1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    .line 234
    goto :goto_0

    .line 221
    :cond_2
    const-string v9, "{"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 222
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "<%\\}\\s*"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v2}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\\s*%>"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 223
    .local v3, p:Ljava/util/regex/Pattern;
    invoke-virtual {v3, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 224
    .local v0, end:Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v9

    invoke-virtual {v0, v9}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 225
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    .line 226
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v9

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v1, v9, v10}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 227
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v9

    invoke-virtual {p2, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 228
    .local v7, subTemplate:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    new-instance v10, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;

    invoke-direct {v10, p1, v2, v7}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    .line 230
    goto/16 :goto_0

    .line 235
    .end local v0           #end:Ljava/util/regex/Matcher;
    .end local v2           #name:Ljava/lang/String;
    .end local v3           #p:Ljava/util/regex/Pattern;
    .end local v6           #staticPart:Ljava/lang/String;
    .end local v7           #subTemplate:Ljava/lang/String;
    .end local v8           #type:Ljava/lang/String;
    :cond_3
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p2, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 236
    .restart local v6       #staticPart:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_4

    .line 237
    iget-object v9, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    new-instance v10, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$StringEntity;

    invoke-direct {v10, v6}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$StringEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    :cond_4
    return-void
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "stream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    new-instance v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$HashMapEntityData;

    iget-object v1, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mData:Ljava/util/HashMap;

    invoke-direct {v0, v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$HashMapEntityData;-><init>(Ljava/util/HashMap;)V

    invoke-virtual {p0, p1, v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V

    .line 251
    return-void
.end method

.method public write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V
    .locals 3
    .parameter "stream"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 254
    iget-object v2, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->mTemplate:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;

    .line 255
    .local v0, ent:Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;
    invoke-interface {v0, p1, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;->write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V

    goto :goto_0

    .line 257
    .end local v0           #ent:Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;
    :cond_0
    return-void
.end method
