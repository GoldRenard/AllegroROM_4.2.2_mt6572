.class public Lcom/mediatek/settings/CdmaCallForwardOptions;
.super Landroid/preference/PreferenceActivity;
.source "CdmaCallForwardOptions.java"


# static fields
.field private static final BUTTON_CFB_KEY:Ljava/lang/String; = "button_cfb_key"

.field private static final BUTTON_CFC_KEY:Ljava/lang/String; = "button_cfc_key"

.field private static final BUTTON_CFNRC_KEY:Ljava/lang/String; = "button_cfnrc_key"

.field private static final BUTTON_CFNRY_KEY:Ljava/lang/String; = "button_cfnry_key"

.field private static final BUTTON_CFU_KEY:Ljava/lang/String; = "button_cfu_key"

.field private static final CF_HEADERS:[Ljava/lang/String; = null

.field private static final DIALOG_CFB:I = 0x1

.field private static final DIALOG_CFC:I = 0x4

.field private static final DIALOG_CFNRC:I = 0x3

.field private static final DIALOG_CFNRY:I = 0x2

.field private static final DIALOG_CFU:I = 0x0

.field private static final GET_CONTACTS:I = 0x64

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CdmaCallForwardOptions"

.field private static final NUM_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mButtonCFB:Landroid/preference/Preference;

.field private mButtonCFC:Landroid/preference/Preference;

.field private mButtonCFNRc:Landroid/preference/Preference;

.field private mButtonCFNRy:Landroid/preference/Preference;

.field private mButtonCFU:Landroid/preference/Preference;

.field private mEditNumber:Landroid/widget/EditText;

.field private mPreferences:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mSlot:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 77
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "data1"

    aput-object v1, v0, v2

    sput-object v0, Lcom/mediatek/settings/CdmaCallForwardOptions;->NUM_PROJECTION:[Ljava/lang/String;

    .line 80
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "ro.cdma.cfu.enable"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "ro.cdma.cfu.disable"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "ro.cdma.cfb.enable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "ro.cdma.cfb.disable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "ro.cdma.cfnr.enable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "ro.cdma.cfnr.disable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "ro.cdma.cfdf.enable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "ro.cdma.cfdf.disable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "ro.cdma.cfall.disable"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/settings/CdmaCallForwardOptions;->CF_HEADERS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 79
    iput-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    .line 94
    iput-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CdmaCallForwardOptions;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->startContacts()V

    return-void
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/mediatek/settings/CdmaCallForwardOptions;->CF_HEADERS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CdmaCallForwardOptions;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CdmaCallForwardOptions;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CdmaCallForwardOptions;->setCallForward(Ljava/lang/String;)V

    return-void
.end method

.method private setCallForward(Ljava/lang/String;)V
    .locals 3
    .parameter "cf"

    .prologue
    .line 206
    iget v1, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mSlot:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 209
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 210
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

    .line 211
    const-string v1, "com.android.phone.extra.slot"

    iget v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mSlot:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 212
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private startContacts()V
    .locals 2

    .prologue
    .line 216
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 217
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/settings/CdmaCallForwardOptions;->startActivityForResult(Landroid/content/Intent;I)V

    .line 219
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 224
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    if-nez p3, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-void

    .line 228
    :cond_1
    const/4 v6, 0x0

    .line 230
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/mediatek/settings/CdmaCallForwardOptions;->NUM_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 232
    if-eqz v6, :cond_2

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;

    if-eqz v0, :cond_2

    .line 233
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 236
    :cond_2
    if-eqz v6, :cond_0

    .line 237
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 236
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 237
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "icicle"

    .prologue
    .line 98
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 99
    const v2, 0x7f060007

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CdmaCallForwardOptions;->addPreferencesFromResource(I)V

    .line 101
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 102
    .local v1, prefSet:Landroid/preference/PreferenceScreen;
    const-string v2, "button_cfu_key"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFU:Landroid/preference/Preference;

    .line 103
    const-string v2, "button_cfb_key"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFB:Landroid/preference/Preference;

    .line 104
    const-string v2, "button_cfnry_key"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRy:Landroid/preference/Preference;

    .line 105
    const-string v2, "button_cfnrc_key"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRc:Landroid/preference/Preference;

    .line 106
    const-string v2, "button_cfc_key"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFC:Landroid/preference/Preference;

    .line 108
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    .line 109
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFU:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFB:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRy:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRc:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFC:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "simId"

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mSlot:I

    .line 116
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 117
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 119
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 121
    :cond_0
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .parameter "id"

    .prologue
    .line 154
    new-instance v1, Landroid/app/Dialog;

    invoke-direct {v1, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 155
    .local v1, dialog:Landroid/app/Dialog;
    const v5, 0x7f04000c

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setContentView(I)V

    .line 156
    iget-object v5, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mPreferences:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/preference/Preference;

    invoke-virtual {v5}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 158
    const v5, 0x1010001

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioGroup;

    .line 160
    .local v4, radioGroup:Landroid/widget/RadioGroup;
    const v5, 0x7f080011

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;

    .line 161
    const v5, 0x7f080012

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 162
    .local v0, addContactBtn:Landroid/widget/ImageButton;
    if-eqz v0, :cond_0

    .line 163
    new-instance v5, Lcom/mediatek/settings/CdmaCallForwardOptions$1;

    invoke-direct {v5, p0}, Lcom/mediatek/settings/CdmaCallForwardOptions$1;-><init>(Lcom/mediatek/settings/CdmaCallForwardOptions;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    :cond_0
    const v5, 0x7f080027

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 172
    .local v3, dialogSaveBtn:Landroid/widget/Button;
    if-eqz v3, :cond_1

    .line 173
    new-instance v5, Lcom/mediatek/settings/CdmaCallForwardOptions$2;

    invoke-direct {v5, p0, v4, p1, v1}, Lcom/mediatek/settings/CdmaCallForwardOptions$2;-><init>(Lcom/mediatek/settings/CdmaCallForwardOptions;Landroid/widget/RadioGroup;ILandroid/app/Dialog;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    :cond_1
    const v5, 0x7f080026

    invoke-virtual {v1, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 194
    .local v2, dialogCancelBtn:Landroid/widget/Button;
    if-eqz v2, :cond_2

    .line 195
    new-instance v5, Lcom/mediatek/settings/CdmaCallForwardOptions$3;

    invoke-direct {v5, p0, v1}, Lcom/mediatek/settings/CdmaCallForwardOptions$3;-><init>(Lcom/mediatek/settings/CdmaCallForwardOptions;Landroid/app/Dialog;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    :cond_2
    return-object v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 141
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 142
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 149
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 144
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->finish()V

    .line 145
    const/4 v1, 0x1

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v2, 0x1

    .line 125
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFU:Landroid/preference/Preference;

    if-ne p2, v0, :cond_1

    .line 126
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->showDialog(I)V

    .line 136
    :cond_0
    :goto_0
    return v2

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFB:Landroid/preference/Preference;

    if-ne p2, v0, :cond_2

    .line 128
    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CdmaCallForwardOptions;->showDialog(I)V

    goto :goto_0

    .line 129
    :cond_2
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRy:Landroid/preference/Preference;

    if-ne p2, v0, :cond_3

    .line 130
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->showDialog(I)V

    goto :goto_0

    .line 131
    :cond_3
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFNRc:Landroid/preference/Preference;

    if-ne p2, v0, :cond_4

    .line 132
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->showDialog(I)V

    goto :goto_0

    .line 133
    :cond_4
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions;->mButtonCFC:Landroid/preference/Preference;

    if-ne p2, v0, :cond_0

    .line 134
    sget-object v0, Lcom/mediatek/settings/CdmaCallForwardOptions;->CF_HEADERS:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->setCallForward(Ljava/lang/String;)V

    goto :goto_0
.end method
