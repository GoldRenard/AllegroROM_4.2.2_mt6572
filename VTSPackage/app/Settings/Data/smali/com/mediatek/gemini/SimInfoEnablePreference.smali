.class public Lcom/mediatek/gemini/SimInfoEnablePreference;
.super Lcom/mediatek/gemini/SimInfoPreference;
.source "SimInfoEnablePreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SimInfoEnablePreference"


# instance fields
.field private mClickCallback:Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

.field private mContext:Landroid/content/Context;

.field private mDisableSwitch:Z

.field private mRadioOn:Z

.field private mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V
    .locals 12
    .parameter "context"
    .parameter "name"
    .parameter "number"
    .parameter "simSlot"
    .parameter "status"
    .parameter "color"
    .parameter "displayNumberFormat"
    .parameter "key"
    .parameter "isAirModeOn"

    .prologue
    .line 52
    const/4 v11, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-wide/from16 v9, p8

    invoke-direct/range {v1 .. v11}, Lcom/mediatek/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V

    .line 54
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mContext:Landroid/content/Context;

    .line 55
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mRadioOn:Z

    .line 56
    move/from16 v0, p10

    iput-boolean v0, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mDisableSwitch:Z

    .line 57
    const v1, 0x7f040074

    invoke-virtual {p0, v1}, Lcom/mediatek/gemini/SimInfoEnablePreference;->setLayoutResource(I)V

    .line 58
    return-void
.end method


# virtual methods
.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v3, 0x1

    .line 63
    invoke-super {p0, p1, p2}, Lcom/mediatek/gemini/SimInfoPreference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 65
    .local v2, view:Landroid/view/View;
    const v4, 0x7f08011c

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 67
    .local v0, ckRadioOn:Landroid/widget/Switch;
    if-eqz v0, :cond_0

    .line 68
    iget-object v4, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz v4, :cond_0

    .line 69
    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setClickable(Z)V

    .line 70
    iget-boolean v4, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mDisableSwitch:Z

    if-nez v4, :cond_2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 71
    iget-object v3, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 74
    :cond_0
    const v3, 0x7f08011d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 75
    .local v1, siminfoLayout:Landroid/view/View;
    if-eqz v1, :cond_1

    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1

    .line 76
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    :cond_1
    return-object v2

    .line 70
    .end local v1           #siminfoLayout:Landroid/view/View;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method isRadioOn()Z
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mRadioOn:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 87
    if-nez p1, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f08011c

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoEnablePreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;->onPreferenceClick(J)V

    goto :goto_0
.end method

.method setCheckBoxClickListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 0
    .parameter "listerner"

    .prologue
    .line 98
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mSwitchChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 100
    return-void
.end method

.method setClickCallback(Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;)V
    .locals 0
    .parameter "callBack"

    .prologue
    .line 103
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mClickCallback:Lcom/mediatek/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;

    .line 104
    return-void
.end method

.method setRadioOn(Z)V
    .locals 0
    .parameter "radioOn"

    .prologue
    .line 111
    iput-boolean p1, p0, Lcom/mediatek/gemini/SimInfoEnablePreference;->mRadioOn:Z

    .line 113
    return-void
.end method
