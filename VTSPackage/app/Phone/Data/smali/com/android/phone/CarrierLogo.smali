.class public Lcom/android/phone/CarrierLogo;
.super Ljava/lang/Object;
.source "CarrierLogo.java"


# static fields
.field private static sLogoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/android/phone/CarrierLogo;->sLogoMap:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static getLogo(Ljava/lang/String;)I
    .locals 2
    .parameter "name"

    .prologue
    .line 48
    invoke-static {}, Lcom/android/phone/CarrierLogo;->getLogoMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 49
    .local v0, res:Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 53
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private static getLogoMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    sget-object v0, Lcom/android/phone/CarrierLogo;->sLogoMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/phone/CarrierLogo;->sLogoMap:Ljava/util/Map;

    .line 44
    :cond_0
    sget-object v0, Lcom/android/phone/CarrierLogo;->sLogoMap:Ljava/util/Map;

    return-object v0
.end method
