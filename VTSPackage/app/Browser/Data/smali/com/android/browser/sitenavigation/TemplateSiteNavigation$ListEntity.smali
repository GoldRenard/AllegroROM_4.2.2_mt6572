.class Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;
.super Ljava/lang/Object;
.source "TemplateSiteNavigation.java"

# interfaces
.implements Lcom/android/browser/sitenavigation/TemplateSiteNavigation$Entity;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ListEntity"
.end annotation


# instance fields
.field mKey:Ljava/lang/String;

.field mSubTemplate:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "key"
    .parameter "subTemplate"

    .prologue
    .line 123
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p2, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;->mKey:Ljava/lang/String;

    .line 125
    new-instance v0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p3, v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$1;)V

    iput-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;->mSubTemplate:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    .line 126
    return-void
.end method


# virtual methods
.method public write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V
    .locals 2
    .parameter "stream"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v1, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;->mKey:Ljava/lang/String;

    invoke-interface {p2, v1}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;->getListIterator(Ljava/lang/String;)Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;

    move-result-object v0

    .line 131
    .local v0, iter:Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;
    invoke-interface {v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;->reset()V

    .line 132
    :goto_0
    invoke-interface {v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 133
    iget-object v1, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntity;->mSubTemplate:Lcom/android/browser/sitenavigation/TemplateSiteNavigation;

    invoke-virtual {v1, p1, v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation;->write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V

    goto :goto_0

    .line 135
    :cond_0
    return-void
.end method
