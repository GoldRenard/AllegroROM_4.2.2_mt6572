.class Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;
.super Ljava/lang/Object;
.source "LanguageSettingsWizard.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/LanguageSettingsWizard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Loc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;",
        ">;"
    }
.end annotation


# static fields
.field static sCollator:Ljava/text/Collator;


# instance fields
.field mLabel:Ljava/lang/String;

.field mLocale:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 99
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->sCollator:Ljava/text/Collator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .locals 0
    .parameter "label"
    .parameter "locale"

    .prologue
    .line 104
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-object p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLabel:Ljava/lang/String;

    .line 106
    iput-object p2, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLocale:Ljava/util/Locale;

    .line 107
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;)I
    .locals 3
    .parameter "arg0"

    .prologue
    .line 117
    sget-object v0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->sCollator:Ljava/text/Collator;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLabel:Ljava/lang/String;

    iget-object v2, p1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLabel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    check-cast p1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->compareTo(Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLabel:Ljava/lang/String;

    return-object v0
.end method
