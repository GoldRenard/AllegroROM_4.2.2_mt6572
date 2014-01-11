.class public Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;
.super Landroid/content/ContextWrapper;
.source "DefaultStatusBarPlugin.java"

# interfaces
.implements Lcom/mediatek/systemui/ext/IStatusBarPlugin;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 14
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 15
    return-void
.end method


# virtual methods
.method public get3GPlusResources(ZI)Z
    .registers 4
    .parameter "roaming"
    .parameter "dataType"

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public get3gDisabledWarningString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataActivityIconList(IZ)[I
    .registers 4
    .parameter "simColor"
    .parameter "showSimIndicator"

    .prologue
    .line 62
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I
    .registers 4
    .parameter "networkType"
    .parameter "simColorId"

    .prologue
    .line 58
    const/4 v0, -0x1

    return v0
.end method

.method public getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I
    .registers 4
    .parameter "roaming"
    .parameter "dataType"

    .prologue
    .line 50
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMobileGroupVisible()Z
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public getPluginResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 18
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignalIndicatorIconGemini(I)I
    .registers 3
    .parameter "slotId"

    .prologue
    .line 46
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthDescription(I)Ljava/lang/String;
    .registers 3
    .parameter "level"

    .prologue
    .line 26
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignalStrengthIcon(ZIIZ)I
    .registers 6
    .parameter "roaming"
    .parameter "inetCondition"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 22
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthIconGemini(IIIZ)I
    .registers 6
    .parameter "simColorId"
    .parameter "type"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 34
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthIconGemini(IIZ)I
    .registers 5
    .parameter "simColorId"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 30
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthNullIconGemini(I)I
    .registers 3
    .parameter "slotId"

    .prologue
    .line 38
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthSearchingIconGemini(I)I
    .registers 3
    .parameter "slotId"

    .prologue
    .line 42
    const/4 v0, -0x1

    return v0
.end method

.method public isHspaDataDistinguishable()Z
    .registers 2

    .prologue
    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method public supportDataTypeAlwaysDisplayWhileOn()Z
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method

.method public supportDisableWifiAtAirplaneMode()Z
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method
