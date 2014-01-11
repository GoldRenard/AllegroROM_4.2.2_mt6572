.class public Lcom/mediatek/systemui/ext/DefaultStatusBarPlugin;
.super Landroid/content/ContextWrapper;
.source "DefaultStatusBarPlugin.java"

# interfaces
.implements Lcom/mediatek/systemui/ext/IStatusBarPlugin;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method


# virtual methods
.method public get3gDisabledWarningString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataActivityIconList(IZ)[I
    .locals 1
    .parameter "simColor"
    .parameter "showSimIndicator"

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataNetworkTypeIconGemini(Lcom/mediatek/systemui/ext/NetworkType;I)I
    .locals 1
    .parameter "networkType"
    .parameter "simColorId"

    .prologue
    .line 57
    const/4 v0, -0x1

    return v0
.end method

.method public getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I
    .locals 1
    .parameter "roaming"
    .parameter "dataType"

    .prologue
    .line 49
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMobileGroupVisible()Z
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    return v0
.end method

.method public getPluginResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignalIndicatorIconGemini(I)I
    .locals 1
    .parameter "slotId"

    .prologue
    .line 45
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthDescription(I)Ljava/lang/String;
    .locals 1
    .parameter "level"

    .prologue
    .line 25
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignalStrengthIcon(ZIIZ)I
    .locals 1
    .parameter "roaming"
    .parameter "inetCondition"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 21
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthIconGemini(IIIZ)I
    .locals 1
    .parameter "simColorId"
    .parameter "type"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 33
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthIconGemini(IIZ)I
    .locals 1
    .parameter "simColorId"
    .parameter "level"
    .parameter "showSimIndicator"

    .prologue
    .line 29
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthNullIconGemini(I)I
    .locals 1
    .parameter "slotId"

    .prologue
    .line 37
    const/4 v0, -0x1

    return v0
.end method

.method public getSignalStrengthSearchingIconGemini(I)I
    .locals 1
    .parameter "slotId"

    .prologue
    .line 41
    const/4 v0, -0x1

    return v0
.end method

.method public isHspaDataDistinguishable()Z
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method public supportDataTypeAlwaysDisplayWhileOn()Z
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public supportDisableWifiAtAirplaneMode()Z
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method
