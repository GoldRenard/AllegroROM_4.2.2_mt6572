.class interface abstract Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;
.super Ljava/lang/Object;
.source "TemplateSiteNavigation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "EntityData"
.end annotation


# virtual methods
.method public abstract getListIterator(Ljava/lang/String;)Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;
.end method

.method public abstract writeValue(Ljava/io/OutputStream;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
