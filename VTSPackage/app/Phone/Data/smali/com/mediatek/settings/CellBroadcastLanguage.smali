.class public Lcom/mediatek/settings/CellBroadcastLanguage;
.super Ljava/lang/Object;
.source "CellBroadcastLanguage.java"


# instance fields
.field private mLanguageId:I

.field private mLanguageName:Ljava/lang/String;

.field private mLanguageState:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Z)V
    .locals 0
    .parameter "id"
    .parameter "name"
    .parameter "state"

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageId:I

    .line 46
    iput-object p2, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageName:Ljava/lang/String;

    .line 47
    iput-boolean p3, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageState:Z

    .line 48
    return-void
.end method


# virtual methods
.method public getLanguageId()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageId:I

    return v0
.end method

.method public getLanguageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageName:Ljava/lang/String;

    return-object v0
.end method

.method public getLanguageState()Z
    .locals 1

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageState:Z

    return v0
.end method

.method public setLanguageState(Z)V
    .locals 0
    .parameter "state"

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/mediatek/settings/CellBroadcastLanguage;->mLanguageState:Z

    .line 64
    return-void
.end method
