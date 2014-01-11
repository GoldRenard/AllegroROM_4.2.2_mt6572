.class public Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;
.super Ljava/lang/Object;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeleteCallArgs"
.end annotation


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .parameter "context"
    .parameter "number"

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;->mContext:Landroid/content/Context;

    .line 69
    iput-object p2, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;->mNumber:Ljava/lang/String;

    .line 70
    return-void
.end method
