.class Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;
.super Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;
.source "RequestHandlerSiteNavigation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->writeTemplatedIndex()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;


# direct methods
.method constructor <init>(Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;Landroid/database/Cursor;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 94
    iput-object p1, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;->this$0:Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;

    invoke-direct {p0, p2}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;-><init>(Landroid/database/Cursor;)V

    return-void
.end method


# virtual methods
.method public writeValue(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 5
    .parameter "stream"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 97
    invoke-virtual {p0}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 98
    .local v0, cursor:Landroid/database/Cursor;
    const-string v3, "url"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 99
    iget-object v3, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;->this$0:Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->htmlEncode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    const-string v3, "title"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 101
    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, title:Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    .line 103
    :cond_2
    iget-object v3, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;->this$0:Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;

    iget-object v3, v3, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->mContext:Landroid/content/Context;

    const v4, 0x7f0c0016

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 105
    :cond_3
    iget-object v3, p0, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation$1;->this$0:Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;

    invoke-virtual {v3, v2}, Lcom/android/browser/sitenavigation/RequestHandlerSiteNavigation;->htmlEncode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0

    .line 106
    .end local v2           #title:Ljava/lang/String;
    :cond_4
    const-string v3, "thumbnail"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    const-string v3, "data:image/png;base64,"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 108
    const/4 v3, 0x2

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 109
    .local v1, thumb:[B
    invoke-static {v1, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0
.end method
