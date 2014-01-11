.class public interface abstract Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper$Tables;
.super Ljava/lang/Object;
.source "CallHistoryDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Tables"
.end annotation


# static fields
.field public static final CALLS:Ljava/lang/String; = "calls"

.field public static final SEQUENCE_TABLES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "calls"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/phone/provider/CallHistoryDatabaseHelper$Tables;->SEQUENCE_TABLES:[Ljava/lang/String;

    return-void
.end method
