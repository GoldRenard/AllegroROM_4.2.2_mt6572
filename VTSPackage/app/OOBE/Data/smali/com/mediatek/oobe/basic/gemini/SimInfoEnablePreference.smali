.class public Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
.super Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
.source "SimInfoEnablePreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SimInfoEnablePreference"


# instance fields
.field private mCheckBoxClickListener:Landroid/view/View$OnClickListener;

.field private mClickCallback:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

.field private mRadioOn:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJ)V
    .locals 11
    .parameter "context"
    .parameter "name"
    .parameter "number"
    .parameter "simSlot"
    .parameter "status"
    .parameter "color"
    .parameter "displayNumberFormat"
    .parameter "key"

    .prologue
    .line 74
    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-wide/from16 v8, p8

    invoke-direct/range {v0 .. v10}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mRadioOn:Z

    .line 76
    const v0, 0x7f030012

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setLayoutResource(I)V

    .line 77
    return-void
.end method


# virtual methods
.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v4, 0x1

    .line 82
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 84
    .local v2, view:Landroid/view/View;
    const v3, 0x7f0b0023

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 86
    .local v0, ckRadioOn:Landroid/widget/CheckBox;
    if-eqz v0, :cond_0

    .line 87
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mCheckBoxClickListener:Landroid/view/View$OnClickListener;

    if-eqz v3, :cond_0

    .line 88
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 89
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 90
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mCheckBoxClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    :cond_0
    const v3, 0x7f0b002d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 95
    .local v1, siminfoLayout:Landroid/view/View;
    if-eqz v1, :cond_1

    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    .line 96
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    invoke-virtual {v1, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 101
    :cond_1
    return-object v2
.end method

.method isRadioOn()Z
    .locals 1

    .prologue
    .line 132
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mRadioOn:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 108
    if-nez p1, :cond_1

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0b0023

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;->onPreferenceClick(J)V

    goto :goto_0
.end method

.method setCheckBoxClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .parameter "listerner"

    .prologue
    .line 123
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mCheckBoxClickListener:Landroid/view/View$OnClickListener;

    .line 125
    return-void
.end method

.method setClickCallback(Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;)V
    .locals 0
    .parameter "callBack"

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    .line 129
    return-void
.end method

.method setRadioOn(Z)V
    .locals 0
    .parameter "radioOn"

    .prologue
    .line 136
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->mRadioOn:Z

    .line 138
    return-void
.end method
