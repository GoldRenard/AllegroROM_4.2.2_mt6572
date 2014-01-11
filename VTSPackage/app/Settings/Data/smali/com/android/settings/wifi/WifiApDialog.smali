.class public Lcom/android/settings/wifi/WifiApDialog;
.super Landroid/app/AlertDialog;
.source "WifiApDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# static fields
.field private static final AP_SSID_MAX_LENGTH_BYTES:I = 0x20

.field static final BUTTON_SUBMIT:I = -0x1

.field private static final KEY_PROP_WPS2_SUPPORT:Ljava/lang/String; = "persist.radio.wifi.wps2support"

.field public static final OPEN_INDEX:I = 0x0

.field private static final TAG:Ljava/lang/String; = "WifiApDialog"

.field public static final WPA2_INDEX:I = 0x2

.field public static final WPA_INDEX:I = 0x1


# instance fields
.field private mChannel:I

.field private mChannelList:[Ljava/lang/String;

.field private mChannelWidth:I

.field private mContext:Landroid/content/Context;

.field mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

.field private mLinearLayout:Landroid/widget/LinearLayout;

.field private final mListener:Landroid/content/DialogInterface$OnClickListener;

.field private mMaxConnSpinner:Landroid/widget/Spinner;

.field private mPassword:Landroid/widget/EditText;

.field private mSecurity:Landroid/widget/Spinner;

.field private mSecurityTypeIndex:I

.field private mSsid:Landroid/widget/TextView;

.field private mView:Landroid/view/View;

.field mWifiConfig:Landroid/net/wifi/WifiConfiguration;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWpaNonsupport:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/net/wifi/WifiConfiguration;)V
    .locals 1
    .parameter "context"
    .parameter "listener"
    .parameter "wifiConfig"

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 76
    iput v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    .line 81
    iput v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    .line 82
    iput v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannelWidth:I

    .line 96
    iput-object p1, p0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    .line 97
    iput-object p2, p0, Lcom/android/settings/wifi/WifiApDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    .line 98
    iput-object p3, p0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    .line 99
    if-eqz p3, :cond_0

    .line 100
    invoke-static {p3}, Lcom/android/settings/wifi/WifiApDialog;->getSecurityTypeIndex(Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    iput v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    .line 102
    :cond_0
    return-void
.end method

.method static synthetic access$002(Lcom/android/settings/wifi/WifiApDialog;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/settings/wifi/WifiApDialog;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/settings/wifi/WifiApDialog;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    iput p1, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannelWidth:I

    return p1
.end method

.method public static getSecurityTypeIndex(Landroid/net/wifi/WifiConfiguration;)I
    .locals 2
    .parameter "wifiConfig"

    .prologue
    const/4 v0, 0x1

    .line 105
    iget-object v1, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 110
    :goto_0
    return v0

    .line 107
    :cond_0
    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 108
    const/4 v0, 0x2

    goto :goto_0

    .line 110
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWpa2Only()Z
    .locals 3

    .prologue
    .line 419
    const/4 v0, 0x0

    .line 420
    .local v0, wpa2Only:Z
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/mediatek/settings/ext/IWifiApDialogExt;->getSecurityType(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    if-eqz v1, :cond_0

    .line 421
    const/4 v0, 0x1

    .line 423
    :cond_0
    return v0
.end method

.method private showSecurityFields()V
    .locals 2

    .prologue
    const v1, 0x7f0801dd

    .line 403
    iget v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    if-nez v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 408
    :goto_0
    return-void

    .line 407
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private validate()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 327
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->length()I

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    if-eq v0, v3, :cond_1

    iget v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    const/16 v1, 0x8

    if-ge v0, v1, :cond_3

    .line 330
    :cond_2
    invoke-virtual {p0, v2}, Lcom/android/settings/wifi/WifiApDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 334
    :goto_0
    return-void

    .line 332
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/settings/wifi/WifiApDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "editable"

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApDialog;->validate()V

    .line 373
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 369
    return-void
.end method

.method public closeSpinnerDialog()V
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 414
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    .line 416
    :cond_0
    return-void
.end method

.method public getConfig()Landroid/net/wifi/WifiConfiguration;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 115
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 123
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 125
    iget v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    iput v2, v0, Landroid/net/wifi/WifiConfiguration;->channel:I

    .line 126
    iget v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mChannelWidth:I

    iput v2, v0, Landroid/net/wifi/WifiConfiguration;->channelWidth:I

    .line 129
    iget v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    packed-switch v2, :pswitch_data_0

    .line 152
    const/4 v0, 0x0

    .end local v0           #config:Landroid/net/wifi/WifiConfiguration;
    :cond_0
    :goto_0
    return-object v0

    .line 131
    .restart local v0       #config:Landroid/net/wifi/WifiConfiguration;
    :pswitch_0
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    .line 135
    :pswitch_1
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 136
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 137
    iget-object v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    iget-object v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, password:Ljava/lang/String;
    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_0

    .line 144
    .end local v1           #password:Ljava/lang/String;
    :pswitch_2
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 145
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 146
    iget-object v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 147
    iget-object v2, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    .restart local v1       #password:Ljava/lang/String;
    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_0

    .line 129
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "view"

    .prologue
    const/4 v7, 0x0

    .line 337
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x7f0801de

    if-ne v3, v4, :cond_2

    .line 338
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    check-cast p1, Landroid/widget/CheckBox;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x90

    :goto_0
    or-int/lit8 v3, v3, 0x1

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 363
    :cond_0
    :goto_1
    return-void

    .line 338
    :cond_1
    const/16 v3, 0x80

    goto :goto_0

    .line 342
    .restart local p1
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x7f0801df

    if-ne v3, v4, :cond_0

    .line 343
    const-string v3, "wlan"

    const-string v4, "SSID"

    iget-object v5, p0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    const v6, 0x104040c

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/mediatek/custom/CustomProperties;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 346
    .local v2, s:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    const/4 v3, 0x2

    iput v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    .line 348
    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    if-eqz v3, :cond_4

    .line 349
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApDialog;->isWpa2Only()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 350
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    invoke-virtual {v3, v7}, Landroid/widget/Spinner;->setSelection(I)V

    .line 358
    :goto_2
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    .line 360
    .local v1, randomUUID:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x8

    invoke-virtual {v1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x9

    const/16 v5, 0xd

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 361
    .local v0, randomPassword:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 352
    .end local v0           #randomPassword:Ljava/lang/String;
    .end local v1           #randomUUID:Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    iget v4, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_2

    .line 355
    :cond_4
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    iget-object v4, p0, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    iget v5, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    invoke-interface {v4, v5}, Lcom/mediatek/settings/ext/IWifiApDialogExt;->getSelection(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 22
    .parameter "savedInstanceState"

    .prologue
    .line 157
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 159
    .local v6, context:Landroid/content/Context;
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v17

    const v18, 0x7f0400a5

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v19}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801dc

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/Spinner;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    .line 162
    invoke-static {v6}, Lcom/android/settings/Utils;->getWifiApDialogPlugin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IWifiApDialogExt;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    .line 163
    const-string v17, "true"

    const-string v18, "persist.radio.wifi.wps2support"

    const-string v19, "false"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    .line 164
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6

    .line 165
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f070014

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v16

    .line 166
    .local v16, setUpArray:[Ljava/lang/String;
    new-instance v15, Landroid/widget/ArrayAdapter;

    const v17, 0x1090008

    move/from16 v0, v17

    invoke-direct {v15, v6, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 167
    .local v15, securityAdapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v17, 0x1090009

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 168
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->isWpa2Only()Z

    move-result v17

    if-nez v17, :cond_0

    .line 169
    const/16 v17, 0x0

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 171
    :cond_0
    const/16 v17, 0x2

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 177
    .end local v15           #securityAdapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v16           #setUpArray:[Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801e0

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/Spinner;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mMaxConnSpinner:Landroid/widget/Spinner;

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mMaxConnSpinner:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/settings/wifi/WifiApDialog;->setView(Landroid/view/View;)V

    .line 181
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/settings/wifi/WifiApDialog;->setInverseBackgroundForced(Z)V

    .line 183
    const v17, 0x7f0b04c0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/android/settings/wifi/WifiApDialog;->setTitle(I)V

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801a7

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->setVisibility(I)V

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801d7

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/TextView;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801bb

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/EditText;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    .line 188
    const/16 v17, -0x1

    const v18, 0x7f0b048e

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/settings/wifi/WifiApDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 189
    const/16 v17, -0x2

    const v18, 0x7f0b0490

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/settings/wifi/WifiApDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    move/from16 v17, v0

    if-eqz v17, :cond_8

    .line 197
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->isWpa2Only()Z

    move-result v17

    if-eqz v17, :cond_7

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/Spinner;->setSelection(I)V

    .line 206
    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    move/from16 v17, v0

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_2

    .line 208
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 211
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/net/wifi/WifiConfiguration;->channel:I

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/net/wifi/WifiConfiguration;->channelWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mChannelWidth:I

    .line 220
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v17

    const-string v18, "wifi"

    invoke-virtual/range {v17 .. v18}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/net/wifi/WifiManager;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801d9

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Spinner;

    .line 223
    .local v10, mChannelSpinner:Landroid/widget/Spinner;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801db

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/Spinner;

    .line 225
    .local v11, mChannelWidthSpinner:Landroid/widget/Spinner;
    const-string v17, "mediatek.wlan.channelselect"

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v17

    if-eqz v17, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v17

    const/16 v18, 0xd

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_9

    .line 227
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801a7

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/LinearLayout;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801d8

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801da

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801d9

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801db

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 306
    :cond_5
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Landroid/text/InputFilter;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    new-instance v20, Lcom/android/settings/wifi/Utf8ByteLengthFilter;

    const/16 v21, 0x20

    invoke-direct/range {v20 .. v21}, Lcom/android/settings/wifi/Utf8ByteLengthFilter;-><init>(I)V

    aput-object v20, v18, v19

    invoke-virtual/range {v17 .. v18}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801df

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/Button;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v17

    const-string v18, "wifi_hotspot_max_client_num"

    const/16 v19, 0x5

    invoke-static/range {v17 .. v19}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v13

    .line 313
    .local v13, maxConnValue:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mMaxConnSpinner:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    add-int/lit8 v18, v13, -0x1

    invoke-virtual/range {v17 .. v18}, Landroid/widget/Spinner;->setSelection(I)V

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSsid:Landroid/widget/TextView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mPassword:Landroid/widget/EditText;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801de

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/CheckBox;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 320
    invoke-super/range {p0 .. p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 322
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->showSecurityFields()V

    .line 323
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/wifi/WifiApDialog;->validate()V

    .line 324
    return-void

    .line 174
    .end local v10           #mChannelSpinner:Landroid/widget/Spinner;
    .end local v11           #mChannelWidthSpinner:Landroid/widget/Spinner;
    .end local v13           #maxConnValue:I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v18, v0

    const v19, 0x7f070014

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v0, v6, v1, v2}, Lcom/mediatek/settings/ext/IWifiApDialogExt;->setAdapter(Landroid/content/Context;Landroid/widget/Spinner;I)V

    goto/16 :goto_0

    .line 200
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    invoke-virtual/range {v17 .. v18}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_1

    .line 203
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    move/from16 v19, v0

    invoke-interface/range {v18 .. v19}, Lcom/mediatek/settings/ext/IWifiApDialogExt;->getSelection(I)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_1

    .line 235
    .restart local v10       #mChannelSpinner:Landroid/widget/Spinner;
    .restart local v11       #mChannelWidthSpinner:Landroid/widget/Spinner;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v17, v0

    const v18, 0x7f0801a7

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/LinearLayout;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801da

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mLinearLayout:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mView:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0801db

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 240
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 241
    .local v12, mTmpChannelList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const v17, 0x7f0b013a

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->getAccessPointPreferredChannels()[Ljava/lang/String;

    move-result-object v5

    .local v5, arr$:[Ljava/lang/String;
    array-length v9, v5

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_3
    if-ge v8, v9, :cond_a

    aget-object v14, v5, v8

    .line 243
    .local v14, s:Ljava/lang/String;
    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 246
    .end local v14           #s:Ljava/lang/String;
    :cond_a
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [Ljava/lang/String;

    check-cast v17, [Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_d

    .line 249
    const/4 v7, 0x0

    .line 250
    .local v7, i:I
    new-instance v4, Landroid/widget/ArrayAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    const v18, 0x1090008

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v4, v0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 252
    .local v4, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v17, 0x1090009

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 254
    invoke-virtual {v10, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 255
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    move/from16 v17, v0

    if-eqz v17, :cond_c

    .line 256
    const/4 v7, 0x1

    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v7, v0, :cond_b

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v7

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannel:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 261
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelList:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v7, v0, :cond_c

    .line 262
    const/4 v7, 0x0

    .line 266
    :cond_c
    invoke-virtual {v10, v7}, Landroid/widget/Spinner;->setSelection(I)V

    .line 267
    new-instance v17, Lcom/android/settings/wifi/WifiApDialog$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/settings/wifi/WifiApDialog$1;-><init>(Lcom/android/settings/wifi/WifiApDialog;)V

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 286
    .end local v4           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v7           #i:I
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings/wifi/WifiApDialog;->mChannelWidth:I

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 288
    if-eqz v11, :cond_5

    .line 289
    new-instance v17, Lcom/android/settings/wifi/WifiApDialog$2;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/settings/wifi/WifiApDialog$2;-><init>(Lcom/android/settings/wifi/WifiApDialog;)V

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto/16 :goto_2

    .line 256
    .restart local v4       #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .restart local v7       #i:I
    :cond_e
    add-int/lit8 v7, v7, 0x1

    goto :goto_4
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurity:Landroid/widget/Spinner;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 379
    iget-boolean v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mWpaNonsupport:Z

    if-eqz v1, :cond_3

    .line 380
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApDialog;->isWpa2Only()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 381
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    .line 388
    .end local p3
    :goto_0
    const-string v1, "WifiApDialog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mSecurityTypeIndex: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApDialog;->showSecurityFields()V

    .line 391
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApDialog;->validate()V

    .line 396
    :cond_0
    :goto_1
    return-void

    .line 383
    .restart local p3
    :cond_1
    if-lez p3, :cond_2

    add-int/lit8 p3, p3, 0x1

    .end local p3
    :cond_2
    iput p3, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    goto :goto_0

    .line 386
    .restart local p3
    :cond_3
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mExt:Lcom/mediatek/settings/ext/IWifiApDialogExt;

    invoke-interface {v1, p3}, Lcom/mediatek/settings/ext/IWifiApDialogExt;->getSecurityType(I)I

    move-result v1

    iput v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mSecurityTypeIndex:I

    goto :goto_0

    .line 392
    :cond_4
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mMaxConnSpinner:Landroid/widget/Spinner;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 393
    add-int/lit8 v0, p3, 0x1

    .line 394
    .local v0, maxConnValue:I
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_hotspot_max_client_num"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 400
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 366
    return-void
.end method
