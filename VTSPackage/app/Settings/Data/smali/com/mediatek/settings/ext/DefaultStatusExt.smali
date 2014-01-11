.class public Lcom/mediatek/settings/ext/DefaultStatusExt;
.super Ljava/lang/Object;
.source "DefaultStatusExt.java"

# interfaces
.implements Lcom/mediatek/settings/ext/IStatusExt;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAction(Landroid/content/IntentFilter;Ljava/lang/String;)V
    .locals 0
    .parameter "intent"
    .parameter "action"

    .prologue
    .line 32
    return-void
.end method

.method public updateOpNameFromRec(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 0
    .parameter "p"
    .parameter "name"

    .prologue
    .line 14
    return-void
.end method

.method public updateServiceState(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 0
    .parameter "p"
    .parameter "name"

    .prologue
    .line 22
    invoke-virtual {p1, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 23
    return-void
.end method
