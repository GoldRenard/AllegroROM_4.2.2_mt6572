.class Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;
.super Ljava/lang/Object;
.source "ThemeProvider.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/content/pm/PackageInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;


# direct methods
.method constructor <init>(Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;->this$0:Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/content/pm/PackageInfo;Landroid/content/pm/PackageInfo;)I
    .locals 5
    .parameter "a"
    .parameter "b"

    .prologue
    .line 44
    iget-object v2, p0, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;->this$0:Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;

    #getter for: Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->access$000(Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iget v4, p1, Landroid/content/pm/PackageInfo;->themeNameId:I

    invoke-static {v2, v3, v4}, Lcom/mediatek/thememanager/ThemeManager;->getThemeName(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, aThemeName:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;->this$0:Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;

    #getter for: Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->access$000(Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iget v4, p2, Landroid/content/pm/PackageInfo;->themeNameId:I

    invoke-static {v2, v3, v4}, Lcom/mediatek/thememanager/ThemeManager;->getThemeName(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, bThemeName:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;->this$0:Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;

    #getter for: Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->mCollator:Ljava/text/Collator;
    invoke-static {v2}, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;->access$100(Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper;)Ljava/text/Collator;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    check-cast p1, Landroid/content/pm/PackageInfo;

    .end local p1
    check-cast p2, Landroid/content/pm/PackageInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/thememanager/ThemeProvider$DatabaseHelper$1;->compare(Landroid/content/pm/PackageInfo;Landroid/content/pm/PackageInfo;)I

    move-result v0

    return v0
.end method
