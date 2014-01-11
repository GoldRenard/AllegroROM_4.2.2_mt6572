.class public Lcom/mediatek/FMRadio/ext/DefaultProjectStringExt;
.super Ljava/lang/Object;
.source "DefaultProjectStringExt.java"

# interfaces
.implements Lcom/mediatek/FMRadio/ext/IProjectStringExt;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getProjectString(Landroid/content/Context;II)Ljava/lang/String;
    .locals 1
    .parameter "context"
    .parameter "normalResId"
    .parameter "cmccResId"

    .prologue
    .line 44
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
