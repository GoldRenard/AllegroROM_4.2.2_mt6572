.class public final Lcom/mediatek/settings/CallRejectContentData$UserTableData;
.super Ljava/lang/Object;
.source "CallRejectContentData.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/CallRejectContentData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserTableData"
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/com.android.rejects"

.field public static final CONTENT_TYPE_ITME:Ljava/lang/String; = "vnd.android.cursor.item/com.android.reject"

.field public static final NAME:Ljava/lang/String; = "Name"

.field public static final NUMBER:Ljava/lang/String; = "Number"

.field public static final REJECT:I = 0x2

.field public static final REJECTS:I = 0x1

.field public static final TABLE_NAME:Ljava/lang/String; = "list"

.field public static final TYPE:Ljava/lang/String; = "Type"

.field public static final URIMATCHER:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 25
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/mediatek/settings/CallRejectContentData$UserTableData;->URIMATCHER:Landroid/content/UriMatcher;

    .line 26
    sget-object v0, Lcom/mediatek/settings/CallRejectContentData$UserTableData;->URIMATCHER:Landroid/content/UriMatcher;

    const-string v1, "reject"

    const-string v2, "list"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 27
    sget-object v0, Lcom/mediatek/settings/CallRejectContentData$UserTableData;->URIMATCHER:Landroid/content/UriMatcher;

    const-string v1, "reject"

    const-string v2, "list/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
