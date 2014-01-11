.class public Lcom/mediatek/settings/ext/DefaultWifiApDialogExt;
.super Ljava/lang/Object;
.source "DefaultWifiApDialogExt.java"

# interfaces
.implements Lcom/mediatek/settings/ext/IWifiApDialogExt;


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultWifiApDialogExt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSecurityType(I)I
    .locals 0
    .parameter "position"

    .prologue
    .line 15
    return p1
.end method

.method public getSelection(I)I
    .locals 0
    .parameter "index"

    .prologue
    .line 12
    return p1
.end method

.method public setAdapter(Landroid/content/Context;Landroid/widget/Spinner;I)V
    .locals 0
    .parameter "context"
    .parameter "spinner"
    .parameter "arrayId"

    .prologue
    .line 10
    return-void
.end method
