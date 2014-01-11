.class public Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;
.super Ljava/lang/Thread;
.source "RequestHandlerSiteNavigation.java"


# static fields
.field private static final RESOURCE:I = 0x2

.field private static final SITE_NAVIGATION:I = 0x1

.field private static final S_URI_MATCHER:Landroid/content/UriMatcher; = null

.field private static final TAG:Ljava/lang/String; = "RequestHandlerSiteNavigation"


# instance fields
.field mContext:Landroid/content/Context;

.field mOutput:Ljava/io/OutputStream;

.field mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 44
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->S_URI_MATCHER:Landroid/content/UriMatcher;

    .line 51
    sget-object v0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->S_URI_MATCHER:Landroid/content/UriMatcher;

    const-string v1, "com.android.browser.site_navigation"

    const-string v2, "websites/res/*/*"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    sget-object v0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->S_URI_MATCHER:Landroid/content/UriMatcher;

    const-string v1, "com.android.browser.site_navigation"

    const-string v2, "websites"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;)V
    .locals 1
    .parameter "context"
    .parameter "uri"
    .parameter "out"

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 56
    iput-object p2, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mUri:Landroid/net/Uri;

    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mContext:Landroid/content/Context;

    .line 58
    iput-object p3, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    .line 59
    return-void
.end method

.method private writeTemplatedIndex()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 88
    iget-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mContext:Landroid/content/Context;

    const v1, 0x7f070028

    invoke-static {v0, v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->getCachedTemplate(Landroid/content/Context;I)Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    move-result-object v7

    .line 89
    .local v7, t:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
    iget-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://com.android.browser.site_navigation/websites"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "url"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "title"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "thumbnail"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 94
    .local v6, cursor:Landroid/database/Cursor;
    const-string v0, "site_navigation"

    new-instance v1, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;

    invoke-direct {v1, p0, v6}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;-><init>(Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;Landroid/database/Cursor;)V

    invoke-virtual {v7, v0, v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->assignLoop(Ljava/lang/String;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;)V

    .line 113
    iget-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {v7, v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->write(Ljava/io/OutputStream;)V

    .line 114
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 115
    return-void
.end method


# virtual methods
.method cleanup()V
    .locals 3

    .prologue
    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_0
    return-void

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, e:Ljava/io/IOException;
    const-string v1, "RequestHandlerSiteNavigation"

    const-string v2, "Failed to close pipe!"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method doHandleRequest()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    sget-object v1, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->S_URI_MATCHER:Landroid/content/UriMatcher;

    iget-object v2, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    .line 75
    .local v0, match:I
    packed-switch v0, :pswitch_data_0

    .line 85
    :goto_0
    return-void

    .line 77
    :pswitch_0
    invoke-direct {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->writeTemplatedIndex()V

    goto :goto_0

    .line 80
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->getUriResourcePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->writeResource(Ljava/lang/String;)V

    goto :goto_0

    .line 75
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method getUriResourcePath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 123
    const-string v2, "/?res/([\\w/]+)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 124
    .local v1, pattern:Ljava/util/regex/Pattern;
    iget-object v2, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 125
    .local v0, m:Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 128
    :goto_0
    return-object v2

    :cond_0
    iget-object v2, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method htmlEncode(Ljava/lang/String;)[B
    .locals 1
    .parameter "s"

    .prologue
    .line 118
    invoke-static {p1}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 63
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 65
    :try_start_0
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->doHandleRequest()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->cleanup()V

    .line 71
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    const-string v1, "RequestHandlerSiteNavigation"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to handle request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->cleanup()V

    goto :goto_0

    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->cleanup()V

    throw v1
.end method

.method writeResource(Ljava/lang/String;)V
    .locals 8
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v6, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 134
    .local v5, res:Landroid/content/res/Resources;
    const-class v6, Lcom/android/browser/R;

    invoke-virtual {v6}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    .line 135
    .local v3, packageName:Ljava/lang/String;
    const/4 v6, 0x0

    invoke-virtual {v5, p1, v6, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 136
    .local v1, id:I
    if-eqz v1, :cond_0

    .line 137
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 138
    .local v2, in:Ljava/io/InputStream;
    const/16 v6, 0x1000

    new-array v0, v6, [B

    .line 140
    .local v0, buf:[B
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, read:I
    if-lez v4, :cond_0

    .line 141
    iget-object v6, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    const/4 v7, 0x0

    invoke-virtual {v6, v0, v7, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 144
    .end local v0           #buf:[B
    .end local v2           #in:Ljava/io/InputStream;
    .end local v4           #read:I
    :cond_0
    return-void
.end method

.method writeString(Ljava/lang/String;)V
    .locals 2
    .parameter "str"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 148
    return-void
.end method

.method writeString(Ljava/lang/String;II)V
    .locals 2
    .parameter "str"
    .parameter "offset"
    .parameter "count"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 152
    return-void
.end method
