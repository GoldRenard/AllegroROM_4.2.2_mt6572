.class Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;
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
    name = "SimpleEntity"
.end annotation


# instance fields
.field mKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 107
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;->mKey:Ljava/lang/String;

    .line 109
    return-void
.end method


# virtual methods
.method public write(Ljava/io/OutputStream;Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;)V
    .locals 1
    .parameter "stream"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$SimpleEntity;->mKey:Ljava/lang/String;

    invoke-interface {p2, p1, v0}, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$EntityData;->writeValue(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 114
    return-void
.end method
