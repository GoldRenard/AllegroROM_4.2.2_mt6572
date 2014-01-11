.class Lcom/android/browser/homepages/RequestHandler$1;
.super Landroid/database/MergeCursor;
.source "RequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/homepages/RequestHandler;->writeTemplatedIndex()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/homepages/RequestHandler;


# direct methods
.method constructor <init>(Lcom/android/browser/homepages/RequestHandler;[Landroid/database/Cursor;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 122
    iput-object p1, p0, Lcom/android/browser/homepages/RequestHandler$1;->this$0:Lcom/android/browser/homepages/RequestHandler;

    invoke-direct {p0, p2}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .prologue
    .line 125
    const/16 v0, 0xc

    invoke-super {p0}, Landroid/database/MergeCursor;->getCount()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method
