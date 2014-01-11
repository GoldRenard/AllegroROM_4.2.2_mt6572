.class public Lcom/mediatek/audioprofile/AudioProfilePreference;
.super Landroid/preference/Preference;
.source "AudioProfilePreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioProfilePreference:"

.field private static final XLOGTAG:Ljava/lang/String; = "Settings/AudioP"

.field private static sActiveKey:Ljava/lang/String;

.field private static sCurrentChecked:Landroid/widget/CompoundButton;


# instance fields
.field private mCheckboxButton:Landroid/widget/RadioButton;

.field private mContext:Landroid/content/Context;

.field private mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mKey:Ljava/lang/String;

.field private mOnSettingsClickListener:Landroid/view/View$OnClickListener;

.field private mPreferenceSummary:Ljava/lang/String;

.field private mPreferenceTitle:Ljava/lang/String;

.field private mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

.field private mScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

.field private mSummary:Landroid/widget/TextView;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 66
    sput-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 67
    sput-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sActiveKey:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mediatek/audioprofile/AudioProfilePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 133
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mediatek/audioprofile/AudioProfilePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 134
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x0

    .line 98
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    .line 70
    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceSummary:Ljava/lang/String;

    .line 72
    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    .line 73
    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    .line 74
    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    .line 100
    iput-object p1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mContext:Landroid/content/Context;

    .line 102
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mContext:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mInflater:Landroid/view/LayoutInflater;

    .line 105
    invoke-super {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 106
    invoke-super {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    .line 110
    :cond_0
    invoke-super {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 111
    invoke-super {p0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceSummary:Ljava/lang/String;

    .line 114
    :cond_1
    const-string v0, "audioprofile"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/audioprofile/AudioProfileManager;

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    .line 117
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    .line 119
    invoke-static {p1}, Lcom/android/settings/Utils;->getAudioProfilePlgin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IAudioProfileExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    .line 120
    return-void
.end method

.method static synthetic access$000()Landroid/widget/CompoundButton;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    return-object v0
.end method

.method static synthetic access$002(Landroid/widget/CompoundButton;)Landroid/widget/CompoundButton;
    .locals 0
    .parameter "x0"

    .prologue
    .line 60
    sput-object p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    return-object p0
.end method

.method static synthetic access$100(Lcom/mediatek/audioprofile/AudioProfilePreference;)Landroid/widget/RadioButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/audioprofile/AudioProfilePreference;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/audioprofile/AudioProfilePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    return-object v0
.end method


# virtual methods
.method public dynamicShowSummary()V
    .locals 5

    .prologue
    .line 238
    const-string v2, "Settings/AudioP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioProfilePreference:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " dynamicShowSummary"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 241
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-static {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getScenario(Ljava/lang/String;)Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    move-result-object v0

    .line 242
    .local v0, scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    sget-object v2, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->GENERAL:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-virtual {v2, v0}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->CUSTOM:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-virtual {v2, v0}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 245
    :cond_0
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v3, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->getVibrationEnabled(Ljava/lang/String;)Z

    move-result v1

    .line 248
    .local v1, vibrationEnabled:Z
    const-string v2, "Settings/AudioP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioProfilePreference:vibrationEnabled"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    if-eqz v1, :cond_2

    .line 251
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mContext:Landroid/content/Context;

    const v4, 0x7f0b007b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .end local v0           #scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    .end local v1           #vibrationEnabled:Z
    :cond_1
    :goto_0
    return-void

    .line 254
    .restart local v0       #scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    .restart local v1       #vibrationEnabled:Z
    :cond_2
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mContext:Landroid/content/Context;

    const v4, 0x7f0b007a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 257
    .end local v1           #vibrationEnabled:Z
    :cond_3
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceSummary:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 258
    iget-object v2, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceSummary:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public bridge synthetic getTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    return-object v0
.end method

.method public isChecked()Z
    .locals 2

    .prologue
    .line 291
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sActiveKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/mediatek/audioprofile/AudioProfilePreference;->sActiveKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 294
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 273
    const-string v0, "Settings/AudioP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioProfilePreference:onCheckedChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    if-eqz p2, :cond_1

    .line 276
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    if-eqz v0, :cond_0

    .line 277
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 279
    :cond_0
    sput-object p1, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 281
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->setActiveProfile(Ljava/lang/String;)V

    .line 283
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 351
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 354
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .parameter "parent"

    .prologue
    const/16 v7, 0x8

    .line 167
    const-string v4, "Settings/AudioP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AudioProfilePreference:onCreateView "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f04000a

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->createView(I)Landroid/view/View;

    move-result-object v3

    .line 170
    .local v3, view:Landroid/view/View;
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f080008

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->getPrefRadioButton(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioButton;

    iput-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    .line 172
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f080009

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->getPreferenceTitle(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    .line 173
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f08000a

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->getPreferenceSummary(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mSummary:Landroid/widget/TextView;

    .line 175
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    if-eqz v4, :cond_0

    .line 177
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    new-instance v5, Lcom/mediatek/audioprofile/AudioProfilePreference$1;

    invoke-direct {v5, p0}, Lcom/mediatek/audioprofile/AudioProfilePreference$1;-><init>(Lcom/mediatek/audioprofile/AudioProfilePreference;)V

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->isChecked()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 199
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 200
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->setChecked()V

    .line 204
    :cond_0
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_3

    .line 205
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->dynamicShowSummary()V

    .line 212
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f08000c

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->getPrefImageView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 214
    .local v0, detailsView:Landroid/widget/ImageView;
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    const v5, 0x7f08000b

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IAudioProfileExt;->getPrefImageView(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 217
    .local v1, mDividerImage:Landroid/widget/ImageView;
    if-eqz v0, :cond_2

    .line 218
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 219
    iget-object v4, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getScenario(Ljava/lang/String;)Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    move-result-object v2

    .line 220
    .local v2, scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->CUSTOM:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-virtual {v4, v2}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->GENERAL:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-virtual {v4, v2}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 222
    :cond_1
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    .end local v2           #scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    :cond_2
    :goto_1
    return-object v3

    .line 207
    .end local v0           #detailsView:Landroid/widget/ImageView;
    .end local v1           #mDividerImage:Landroid/widget/ImageView;
    :cond_3
    const-string v4, "Settings/AudioP"

    const-string v5, "AudioProfilePreference:PreferenceTitle is null"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 224
    .restart local v0       #detailsView:Landroid/widget/ImageView;
    .restart local v1       #mDividerImage:Landroid/widget/ImageView;
    .restart local v2       #scenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;
    :cond_4
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 225
    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 226
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1
.end method

.method public setChecked()V
    .locals 3

    .prologue
    .line 302
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sActiveKey:Ljava/lang/String;

    .line 303
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    if-eqz v0, :cond_2

    .line 304
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    sget-object v1, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 305
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    if-eqz v0, :cond_0

    .line 306
    sget-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 308
    :cond_0
    const-string v0, "Settings/AudioP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioProfilePreference:setChecked"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/audioprofile/AudioProfilePreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 310
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mCheckboxButton:Landroid/widget/RadioButton;

    sput-object v0, Lcom/mediatek/audioprofile/AudioProfilePreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 316
    :cond_1
    :goto_0
    return-void

    .line 314
    :cond_2
    const-string v0, "Settings/AudioP"

    const-string v1, "AudioProfilePreference:mCheckboxButton is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setOnSettingsClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 346
    iput-object p1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    .line 347
    return-void
.end method

.method public setProfileKey(Ljava/lang/String;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 154
    invoke-virtual {p0, p1}, Lcom/mediatek/audioprofile/AudioProfilePreference;->setKey(Ljava/lang/String;)V

    .line 155
    iput-object p1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public setTitle(Ljava/lang/String;Z)V
    .locals 2
    .parameter "title"
    .parameter "setToProfile"

    .prologue
    .line 327
    iput-object p1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mPreferenceTitle:Ljava/lang/String;

    .line 328
    if-eqz p2, :cond_0

    .line 329
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v1, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/mediatek/audioprofile/AudioProfileManager;->setProfileName(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 332
    iget-object v0, p0, Lcom/mediatek/audioprofile/AudioProfilePreference;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    :cond_1
    return-void
.end method
