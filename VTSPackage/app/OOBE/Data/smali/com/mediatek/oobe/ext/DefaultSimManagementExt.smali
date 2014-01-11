.class public Lcom/mediatek/oobe/ext/DefaultSimManagementExt;
.super Ljava/lang/Object;
.source "DefaultSimManagementExt.java"

# interfaces
.implements Lcom/mediatek/oobe/ext/ISimManagementExt;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAutoString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    return-object v0
.end method

.method public isNeedsetAutoItem()Z
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    return v0
.end method

.method public setPrefProperty(Landroid/preference/DialogPreference;J)V
    .locals 0
    .parameter "pref"
    .parameter "simID"

    .prologue
    .line 13
    return-void
.end method

.method public updateDefaultSIMSummary(Landroid/preference/DialogPreference;Ljava/lang/Long;)V
    .locals 0
    .parameter "pref"
    .parameter "simId"

    .prologue
    .line 9
    return-void
.end method
