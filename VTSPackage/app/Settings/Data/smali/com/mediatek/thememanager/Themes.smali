.class public Lcom/mediatek/thememanager/Themes;
.super Ljava/lang/Object;
.source "Themes.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.mediatek.thememanager.ThemeProvider"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final PACKAGE_NAME:Ljava/lang/String; = "package_name"

.field public static final THEME_NAME_ID:Ljava/lang/String; = "theme_name_id"

.field public static final THEME_PATH:Ljava/lang/String; = "theme_path"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "content://com.mediatek.thememanager.ThemeProvider/theme"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/thememanager/Themes;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
