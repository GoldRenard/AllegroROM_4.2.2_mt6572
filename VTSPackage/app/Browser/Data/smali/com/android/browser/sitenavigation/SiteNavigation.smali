.class public Lcom/android/browser/sitenavigation/SiteNavigation;
.super Ljava/lang/Object;
.source "SiteNavigation.java"


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.android.browser.site_navigation"

.field public static final DATE_CREATED:Ljava/lang/String; = "created"

.field public static final DEFAULT_THUMB:Ljava/lang/String; = "default_thumb"

.field public static final FAVICON:Ljava/lang/String; = "favicon"

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final SITE_NAVIGATION:Ljava/lang/String; = "content://com.android.browser.site_navigation/websites"

.field public static final SITE_NAVIGATION_URI:Landroid/net/Uri; = null

.field public static final THUMBNAIL:Ljava/lang/String; = "thumbnail"

.field public static final TITLE:Ljava/lang/String; = "title"

.field public static final URL:Ljava/lang/String; = "url"

.field public static final WEBSITE:Ljava/lang/String; = "website"

.field public static final WEBSITE_NUMBER:I = 0x9

.field public static final WEBSITE_NUMBER_FOR_TABLET:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "content://com.android.browser.site_navigation/websites"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
