.class public Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;
.super Ljava/lang/Object;
.source "InternationalDialogHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/InternationalDialogHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrefixInfo"
.end annotation


# instance fields
.field public mAreaCode:Ljava/lang/String;

.field public mAreaName:Ljava/lang/String;

.field public mCountryCode:Ljava/lang/String;

.field public mCountryName:Ljava/lang/String;

.field public mCurrentCountryISO:Ljava/lang/String;

.field public mIsAreaCodeNeeded:Z

.field public mNumberOrigin:Ljava/lang/String;

.field public mNumberReplaceInterPrefix:Ljava/lang/String;

.field public mNumberSubscriber:Ljava/lang/String;

.field public mPossibleAreaPrefix:Ljava/lang/String;

.field public mSuggestCountryISO:Ljava/lang/String;

.field public mValidCountryISOList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .parameter "countryCode"
    .parameter "countryName"
    .parameter "suggestCountryISO"
    .parameter "currentCountryISO"
    .parameter "areaCode"
    .parameter "areaName"
    .parameter "isAreaCodeNeeded"
    .parameter "numberOrigin"
    .parameter "numberReplaceInterPrefix"
    .parameter "numberSubscriber"
    .parameter "possibleAreaPrefix"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p12, validCountryISOList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    .line 62
    iput-object p4, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    .line 63
    iput-object p5, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    .line 64
    iput-object p6, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    .line 65
    iput-boolean p7, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mIsAreaCodeNeeded:Z

    .line 66
    iput-object p8, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    .line 67
    iput-object p9, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberReplaceInterPrefix:Ljava/lang/String;

    .line 68
    iput-object p10, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    .line 69
    iput-object p11, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mPossibleAreaPrefix:Ljava/lang/String;

    .line 70
    iput-object p12, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mValidCountryISOList:Ljava/util/ArrayList;

    .line 71
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mCountryCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mCountryName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mSuggestCountryISO = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mCurrentCountryISO = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mAreaCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mAreaName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mIsAreaCodeNeeded = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mIsAreaCodeNeeded:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mNumberOrigin = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mNumberReplaceInterPrefix = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberReplaceInterPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mNumberSubscriber = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mPossibleAreaPrefix = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mPossibleAreaPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
