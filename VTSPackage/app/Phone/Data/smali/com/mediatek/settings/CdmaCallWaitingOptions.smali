.class public Lcom/mediatek/settings/CdmaCallWaitingOptions;
.super Landroid/preference/PreferenceActivity;
.source "CdmaCallWaitingOptions.java"


# static fields
.field private static final BUTTON_CW_KEY:Ljava/lang/String; = "button_cw_key"

.field private static final CW_HEADERS:[Ljava/lang/String; = null

.field private static final DIALOG_CW:I = 0x0

.field private static final GET_CONTACTS:I = 0x64

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CdmaCallForwardOptions"

.field private static final NUM_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mButtonCW:Landroid/preference/Preference;

.field private mSlot:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "data1"

    aput-object v1, v0, v2

    sput-object v0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->NUM_PROJECTION:[Ljava/lang/String;

    .line 68
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "ro.cdma.cw.enable"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "ro.cdma.cw.disable"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->CW_HEADERS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->CW_HEADERS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CdmaCallWaitingOptions;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->setCallForward(Ljava/lang/String;)V

    return-void
.end method

.method private setCallForward(Ljava/lang/String;)V
    .locals 3
    .parameter "cf"

    .prologue
    .line 149
    iget v1, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mSlot:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 155
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 156
    const-string v1, "com.android.phone.extra.slot"

    iget v2, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mSlot:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 157
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v1, 0x7f060008

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->addPreferencesFromResource(I)V

    .line 79
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 80
    .local v0, prefSet:Landroid/preference/PreferenceScreen;
    const-string v1, "button_cw_key"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mButtonCW:Landroid/preference/Preference;

    .line 82
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "simId"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mSlot:I

    .line 83
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 10
    .parameter "id"

    .prologue
    const/16 v9, 0x8

    .line 95
    new-instance v1, Landroid/app/Dialog;

    invoke-direct {v1, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 96
    .local v1, dialog:Landroid/app/Dialog;
    const v7, 0x7f04000c

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->setContentView(I)V

    .line 97
    iget-object v7, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mButtonCW:Landroid/preference/Preference;

    invoke-virtual {v7}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 99
    const v7, 0x1010001

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioGroup;

    .line 101
    .local v5, radioGroup:Landroid/widget/RadioGroup;
    const/high16 v7, 0x101

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 102
    .local v6, textView:Landroid/widget/TextView;
    if-eqz v6, :cond_4

    .line 103
    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 108
    :goto_0
    const v7, 0x7f080011

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 109
    .local v4, edittext:Landroid/widget/EditText;
    if-eqz v4, :cond_0

    .line 110
    invoke-virtual {v4, v9}, Landroid/widget/EditText;->setVisibility(I)V

    .line 113
    :cond_0
    const v7, 0x7f080012

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 114
    .local v0, addContactBtn:Landroid/widget/ImageButton;
    if-eqz v0, :cond_1

    .line 115
    invoke-virtual {v0, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 118
    :cond_1
    const v7, 0x7f080027

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 119
    .local v3, dialogSaveBtn:Landroid/widget/Button;
    if-eqz v3, :cond_2

    .line 120
    new-instance v7, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;

    invoke-direct {v7, p0, v5, v1, p1}, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;-><init>(Lcom/mediatek/settings/CdmaCallWaitingOptions;Landroid/widget/RadioGroup;Landroid/app/Dialog;I)V

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    :cond_2
    const v7, 0x7f080026

    invoke-virtual {v1, v7}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 137
    .local v2, dialogCancelBtn:Landroid/widget/Button;
    if-eqz v2, :cond_3

    .line 138
    new-instance v7, Lcom/mediatek/settings/CdmaCallWaitingOptions$2;

    invoke-direct {v7, p0, v1}, Lcom/mediatek/settings/CdmaCallWaitingOptions$2;-><init>(Lcom/mediatek/settings/CdmaCallWaitingOptions;Landroid/app/Dialog;)V

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    :cond_3
    return-object v1

    .line 105
    .end local v0           #addContactBtn:Landroid/widget/ImageButton;
    .end local v2           #dialogCancelBtn:Landroid/widget/Button;
    .end local v3           #dialogSaveBtn:Landroid/widget/Button;
    .end local v4           #edittext:Landroid/widget/EditText;
    :cond_4
    const-string v7, "Settings/CdmaCallForwardOptions"

    const-string v8, "--------------[text view is null]---------------"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions;->mButtonCW:Landroid/preference/Preference;

    if-ne p2, v0, :cond_0

    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->showDialog(I)V

    .line 90
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
