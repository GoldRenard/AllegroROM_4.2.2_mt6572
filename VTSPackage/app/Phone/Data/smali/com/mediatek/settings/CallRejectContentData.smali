.class public Lcom/mediatek/settings/CallRejectContentData;
.super Ljava/lang/Object;
.source "CallRejectContentData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallRejectContentData$UserTableData;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "reject"

.field public static final DATABASE_NAME:Ljava/lang/String; = "reject.db"

.field public static final DATABASE_VERSION:I = 0x4

.field public static final USERS_TABLE_NAME:Ljava/lang/String; = "list"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method
