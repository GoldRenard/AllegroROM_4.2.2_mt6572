.class public final Lcom/mediatek/phone/HyphonManager;
.super Ljava/lang/Object;
.source "HyphonManager.java"

# interfaces
.implements Landroid/location/CountryListener;


# static fields
.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "HyphonManager"

.field private static sMe:Lcom/mediatek/phone/HyphonManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCurrentCountryIso:Ljava/lang/String;

.field private mHyphonMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, "HyphonManager()"

    invoke-static {v0}, Lcom/mediatek/phone/HyphonManager;->log(Ljava/lang/String;)V

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mHyphonMaps:Ljava/util/HashMap;

    .line 28
    return-void
.end method

.method private detectCountry(Z)Ljava/lang/String;
    .locals 5
    .parameter "isNeedToAddListener"

    .prologue
    const/4 v2, 0x0

    .line 85
    iget-object v3, p0, Lcom/mediatek/phone/HyphonManager;->mContext:Landroid/content/Context;

    const-string v4, "country_detector"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/CountryDetector;

    .line 87
    .local v1, detector:Landroid/location/CountryDetector;
    if-eqz p1, :cond_0

    .line 88
    invoke-virtual {v1, p0, v2}, Landroid/location/CountryDetector;->addCountryListener(Landroid/location/CountryListener;Landroid/os/Looper;)V

    .line 90
    :cond_0
    invoke-virtual {v1}, Landroid/location/CountryDetector;->detectCountry()Landroid/location/Country;

    move-result-object v0

    .line 91
    .local v0, country:Landroid/location/Country;
    if-eqz v0, :cond_1

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "detect country, iso = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " source = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Country;->getSource()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/HyphonManager;->log(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v0}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v2

    .line 97
    :cond_1
    return-object v2
.end method

.method public static getInstance()Lcom/mediatek/phone/HyphonManager;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/mediatek/phone/HyphonManager;->sMe:Lcom/mediatek/phone/HyphonManager;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/mediatek/phone/HyphonManager;

    invoke-direct {v0}, Lcom/mediatek/phone/HyphonManager;-><init>()V

    sput-object v0, Lcom/mediatek/phone/HyphonManager;->sMe:Lcom/mediatek/phone/HyphonManager;

    .line 34
    :cond_0
    sget-object v0, Lcom/mediatek/phone/HyphonManager;->sMe:Lcom/mediatek/phone/HyphonManager;

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 113
    const-string v0, "HyphonManager"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    return-void
.end method


# virtual methods
.method public formatNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "number"

    .prologue
    const/4 v0, 0x0

    .line 43
    if-nez p1, :cond_1

    .line 73
    :cond_0
    :goto_0
    return-object v0

    .line 47
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mContext:Landroid/content/Context;

    if-nez v1, :cond_2

    .line 49
    const-string v1, "formatNumber(), mContext is null, just return null"

    invoke-static {v1}, Lcom/mediatek/phone/HyphonManager;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :cond_2
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 56
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/mediatek/phone/HyphonManager;->detectCountry(Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    .line 59
    :cond_3
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mHyphonMaps:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 61
    .local v0, match:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 64
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    invoke-static {p1, v1}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mHyphonMaps:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 70
    :cond_4
    move-object v0, p1

    goto :goto_0
.end method

.method public init(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 38
    iput-object p1, p0, Lcom/mediatek/phone/HyphonManager;->mContext:Landroid/content/Context;

    .line 39
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/phone/HyphonManager;->detectCountry(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public onCountryDetected(Landroid/location/Country;)V
    .locals 2
    .parameter "country"

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCountryDetected, country = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/HyphonManager;->log(Ljava/lang/String;)V

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mCurrentCountryIso = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", countryIso = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/HyphonManager;->log(Ljava/lang/String;)V

    .line 105
    iget-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 106
    :cond_0
    invoke-virtual {p1}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mCurrentCountryIso:Ljava/lang/String;

    .line 107
    iget-object v0, p0, Lcom/mediatek/phone/HyphonManager;->mHyphonMaps:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 109
    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 77
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 78
    iget-object v1, p0, Lcom/mediatek/phone/HyphonManager;->mContext:Landroid/content/Context;

    const-string v2, "country_detector"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/CountryDetector;

    .line 80
    .local v0, detector:Landroid/location/CountryDetector;
    invoke-virtual {v0, p0}, Landroid/location/CountryDetector;->removeCountryListener(Landroid/location/CountryListener;)V

    .line 82
    .end local v0           #detector:Landroid/location/CountryDetector;
    :cond_0
    return-void
.end method
