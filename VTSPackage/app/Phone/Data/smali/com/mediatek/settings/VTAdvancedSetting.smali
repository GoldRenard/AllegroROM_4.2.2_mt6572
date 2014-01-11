.class public Lcom/mediatek/settings/VTAdvancedSetting;
.super Landroid/preference/PreferenceActivity;
.source "VTAdvancedSetting.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final BUTTON_VT_AUTO_DROPBACK_KEY:Ljava/lang/String; = "button_vt_auto_dropback_key"

.field private static final BUTTON_VT_CB_KEY:Ljava/lang/String; = "button_cb_expand_key"

.field private static final BUTTON_VT_CF_KEY:Ljava/lang/String; = "button_cf_expand_key"

.field private static final BUTTON_VT_ENABLE_BACK_CAMERA_KEY:Ljava/lang/String; = "button_vt_enable_back_camera_key"

.field private static final BUTTON_VT_ENABLE_PEER_REPLACE_KEY:Ljava/lang/String; = "button_vt_enable_peer_replace_key"

.field private static final BUTTON_VT_MORE_KEY:Ljava/lang/String; = "button_more_expand_key"

.field private static final BUTTON_VT_MO_LOCAL_VIDEO_DISPLAY_KEY:Ljava/lang/String; = "button_vt_mo_local_video_display_key"

.field private static final BUTTON_VT_MT_LOCAL_VIDEO_DISPLAY_KEY:Ljava/lang/String; = "button_vt_mt_local_video_display_key"

.field private static final BUTTON_VT_PEER_BIGGER_KEY:Ljava/lang/String; = "button_vt_peer_bigger_key"

.field private static final BUTTON_VT_PEER_REPLACE_KEY:Ljava/lang/String; = "button_vt_replace_peer_expand_key"

.field private static final BUTTON_VT_REPLACE_KEY:Ljava/lang/String; = "button_vt_replace_expand_key"

.field private static final CHECKBOX_RING_ONLY_ONCE:Ljava/lang/String; = "ring_only_once"

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/VTAdvancedSetting"

.field public static final NAME_PIC_TO_REPLACE_LOCAL_VIDEO_DEFAULT:Ljava/lang/String; = "pic_to_replace_local_video_default"

.field public static final NAME_PIC_TO_REPLACE_LOCAL_VIDEO_USERSELECT:Ljava/lang/String; = "pic_to_replace_local_video_userselect"

.field public static final NAME_PIC_TO_REPLACE_PEER_VIDEO_DEFAULT:Ljava/lang/String; = "pic_to_replace_peer_video_default"

.field public static final NAME_PIC_TO_REPLACE_PEER_VIDEO_USERSELECT:Ljava/lang/String; = "pic_to_replace_peer_video_userselect"

.field public static final REQUESTCODE_PICTRUE_PICKED_WITH_DATA:I = 0xbcd

.field private static final SELECT_DEFAULT_PICTURE:Ljava/lang/String; = "0"

.field public static final SELECT_DEFAULT_PICTURE2:Ljava/lang/String; = "0"

.field private static final SELECT_MY_PICTURE:Ljava/lang/String; = "2"

.field public static final SELECT_MY_PICTURE2:Ljava/lang/String; = "1"


# instance fields
.field private mButtonCb:Landroid/preference/Preference;

.field private mButtonCf:Landroid/preference/Preference;

.field private mButtonMore:Landroid/preference/Preference;

.field private mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

.field private mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

.field private mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

.field private mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

.field private mButtonVTMtVideo:Landroid/preference/ListPreference;

.field private mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

.field private mButtonVTPeerReplace:Landroid/preference/ListPreference;

.field private mButtonVTReplace:Landroid/preference/ListPreference;

.field private mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

.field private mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimId:I

.field private mWhichToSave:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mWhichToSave:I

    .line 103
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    .line 116
    iput-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCf:Landroid/preference/Preference;

    .line 117
    iput-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCb:Landroid/preference/Preference;

    .line 118
    iput-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonMore:Landroid/preference/Preference;

    .line 127
    iput-object v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 133
    new-instance v0, Lcom/mediatek/settings/VTAdvancedSetting$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VTAdvancedSetting$1;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;)V

    iput-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/VTAdvancedSetting;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->setScreenEnabled()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/VTAdvancedSetting;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->findSimId()V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-static {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    return-void
.end method

.method private findSimId()V
    .locals 3

    .prologue
    .line 522
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->get3GSimCardSlots(Landroid/app/Activity;)[I

    move-result-object v0

    .line 523
    .local v0, simIds:[I
    array-length v1, v0

    if-nez v1, :cond_0

    .line 524
    const/4 v1, -0x1

    iput v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    .line 530
    :goto_0
    return-void

    .line 525
    :cond_0
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 526
    const/4 v1, 0x0

    aget v1, v0, v1

    iput v1, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    goto :goto_0

    .line 528
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->finish()V

    goto :goto_0
.end method

.method public static getPicPathDefault()Ljava/lang/String;
    .locals 1

    .prologue
    .line 402
    const-string v0, "/data/data/com.android.phone/pic_to_replace_local_video_default.vt"

    return-object v0
.end method

.method public static getPicPathDefault2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 410
    const-string v0, "/data/data/com.android.phone/pic_to_replace_peer_video_default.vt"

    return-object v0
.end method

.method public static getPicPathUserselect(I)Ljava/lang/String;
    .locals 2
    .parameter "slodId"

    .prologue
    .line 406
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/data/data/com.android.phone/pic_to_replace_local_video_userselect_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".vt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPicPathUserselect2(I)Ljava/lang/String;
    .locals 2
    .parameter "slodId"

    .prologue
    .line 414
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/data/data/com.android.phone/pic_to_replace_peer_video_userselect_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".vt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initVTSettings()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 477
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 479
    .local v1, sp:Landroid/content/SharedPreferences;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_0

    .line 480
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 481
    .local v0, key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 482
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    invoke-interface {v1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 484
    .end local v0           #key:Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 485
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 486
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 487
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    invoke-interface {v1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 489
    .end local v0           #key:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    if-eqz v2, :cond_2

    .line 490
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 491
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 492
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    const-string v3, "0"

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 494
    .end local v0           #key:Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_3

    .line 495
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 496
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 497
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    invoke-interface {v1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 499
    .end local v0           #key:Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_4

    .line 500
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 501
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 502
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    invoke-interface {v1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 504
    .end local v0           #key:Ljava/lang/String;
    :cond_4
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_5

    .line 505
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 506
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 507
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    const/4 v3, 0x0

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 509
    .end local v0           #key:Ljava/lang/String;
    :cond_5
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    if-eqz v2, :cond_6

    .line 510
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 511
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 512
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    const-string v3, "0"

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 514
    .end local v0           #key:Ljava/lang/String;
    :cond_6
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    if-eqz v2, :cond_7

    .line 515
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 516
    .restart local v0       #key:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 517
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    const-string v3, "0"

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 519
    .end local v0           #key:Ljava/lang/String;
    :cond_7
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 130
    const-string v0, "Settings/VTAdvancedSetting"

    invoke-static {v0, p0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    return-void
.end method

.method private setScreenEnabled()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 450
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "airplane_mode_on"

    const/4 v8, -0x1

    invoke-static {v6, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v4, :cond_0

    move v0, v4

    .line 453
    .local v0, airplaneModeOn:Z
    :goto_0
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 454
    .local v1, insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_1

    .line 455
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->goUpToTopLevelSetting(Landroid/app/Activity;)V

    .line 474
    :goto_1
    return-void

    .end local v0           #airplaneModeOn:Z
    .end local v1           #insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    move v0, v5

    .line 450
    goto :goto_0

    .line 456
    .restart local v0       #airplaneModeOn:Z
    .restart local v1       #insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v4, :cond_7

    .line 457
    if-nez v0, :cond_2

    iget v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v6}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v6

    if-eqz v6, :cond_2

    move v3, v4

    .line 458
    .local v3, isRadioOn:Z
    :goto_2
    iget v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    if-ltz v6, :cond_3

    move v2, v4

    .line 459
    .local v2, is3GEnable:Z
    :goto_3
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    invoke-virtual {v6, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 460
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    invoke-virtual {v6, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 461
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 462
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 463
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    invoke-virtual {v6, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 464
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 465
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 466
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 468
    iget-object v7, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCf:Landroid/preference/Preference;

    if-eqz v3, :cond_4

    if-eqz v2, :cond_4

    move v6, v4

    :goto_4
    invoke-virtual {v7, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 469
    iget-object v7, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCb:Landroid/preference/Preference;

    if-eqz v3, :cond_5

    if-eqz v2, :cond_5

    move v6, v4

    :goto_5
    invoke-virtual {v7, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 470
    iget-object v6, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonMore:Landroid/preference/Preference;

    if-eqz v3, :cond_6

    if-eqz v2, :cond_6

    :goto_6
    invoke-virtual {v6, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_1

    .end local v2           #is3GEnable:Z
    .end local v3           #isRadioOn:Z
    :cond_2
    move v3, v5

    .line 457
    goto :goto_2

    .restart local v3       #isRadioOn:Z
    :cond_3
    move v2, v5

    .line 458
    goto :goto_3

    .restart local v2       #is3GEnable:Z
    :cond_4
    move v6, v5

    .line 468
    goto :goto_4

    :cond_5
    move v6, v5

    .line 469
    goto :goto_5

    :cond_6
    move v4, v5

    .line 470
    goto :goto_6

    .line 472
    .end local v2           #is3GEnable:Z
    .end local v3           #isRadioOn:Z
    :cond_7
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->goUpToTopLevelSetting(Landroid/app/Activity;)V

    goto :goto_1
.end method

.method private showDialogDefaultPic(Ljava/lang/String;)V
    .locals 7
    .parameter "filename"

    .prologue
    const/4 v6, -0x2

    .line 299
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 300
    .local v2, mImg:Landroid/widget/ImageView;
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 301
    .local v1, mBitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 302
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 303
    .local v0, linear:Landroid/widget/LinearLayout;
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 304
    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 306
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 307
    .local v4, myBuilder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 308
    const v5, 0x7f0d002f

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 309
    const v5, 0x104000a

    new-instance v6, Lcom/mediatek/settings/VTAdvancedSetting$2;

    invoke-direct {v6, p0}, Lcom/mediatek/settings/VTAdvancedSetting$2;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 317
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 318
    .local v3, myAlertDialog:Landroid/app/AlertDialog;
    new-instance v5, Lcom/mediatek/settings/VTAdvancedSetting$3;

    invoke-direct {v5, p0, v2, v1}, Lcom/mediatek/settings/VTAdvancedSetting$3;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 327
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 328
    return-void
.end method

.method private showDialogMyPic(Ljava/lang/String;)V
    .locals 7
    .parameter "filename"

    .prologue
    const/4 v6, -0x2

    .line 331
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 332
    .local v2, mImg2:Landroid/widget/ImageView;
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 333
    .local v1, mBitmap2:Landroid/graphics/Bitmap;
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 334
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 335
    .local v0, linear:Landroid/widget/LinearLayout;
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 336
    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 338
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 339
    .local v4, myBuilder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 340
    const v5, 0x7f0d0031

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 341
    const v5, 0x7f0d003a

    new-instance v6, Lcom/mediatek/settings/VTAdvancedSetting$4;

    invoke-direct {v6, p0}, Lcom/mediatek/settings/VTAdvancedSetting$4;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 379
    const v5, 0x104000a

    new-instance v6, Lcom/mediatek/settings/VTAdvancedSetting$5;

    invoke-direct {v6, p0}, Lcom/mediatek/settings/VTAdvancedSetting$5;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 387
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 388
    .local v3, myAlertDialog:Landroid/app/AlertDialog;
    new-instance v5, Lcom/mediatek/settings/VTAdvancedSetting$6;

    invoke-direct {v5, p0, v2, v1}, Lcom/mediatek/settings/VTAdvancedSetting$6;-><init>(Lcom/mediatek/settings/VTAdvancedSetting;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 397
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 398
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 261
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityResult: requestCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", resultCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    .line 264
    const/4 v2, -0x1

    if-eq p2, v2, :cond_0

    .line 296
    :goto_0
    return-void

    .line 268
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 272
    :pswitch_0
    :try_start_0
    const-string v2, "data"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 273
    .local v0, bitmap:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 274
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mWhichToSave:I

    if-nez v2, :cond_2

    .line 275
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 279
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 281
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " - Bitmap.isRecycled() : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 287
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :cond_1
    :goto_2
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mWhichToSave:I

    if-nez v2, :cond_3

    .line 288
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V

    goto :goto_0

    .line 277
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    :cond_2
    :try_start_1
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 284
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :catch_0
    move-exception v1

    .line 285
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 290
    .end local v1           #e:Ljava/io/IOException;
    :cond_3
    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V

    goto :goto_0

    .line 268
    nop

    :pswitch_data_0
    .packed-switch 0xbcd
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 151
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 152
    const v2, 0x7f060023

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->addPreferencesFromResource(I)V

    .line 154
    new-instance v2, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 156
    const-string v2, "button_vt_replace_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    .line 157
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 158
    const-string v2, "button_vt_replace_peer_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    .line 159
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 160
    const-string v2, "button_cf_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCf:Landroid/preference/Preference;

    .line 161
    const-string v2, "button_cb_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCb:Landroid/preference/Preference;

    .line 162
    const-string v2, "button_more_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonMore:Landroid/preference/Preference;

    .line 163
    const-string v2, "button_vt_enable_peer_replace_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    .line 164
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablePeerReplace:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 165
    const-string v2, "button_vt_mo_local_video_display_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    .line 166
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMoVideo:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 167
    const-string v2, "button_vt_mt_local_video_display_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    .line 168
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTMtVideo:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 169
    const-string v2, "button_vt_enable_back_camera_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    .line 170
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTEnablebackCamer:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 171
    const-string v2, "button_vt_peer_bigger_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    .line 172
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerBigger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 173
    const-string v2, "button_vt_auto_dropback_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    .line 174
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTAutoDropBack:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 175
    const-string v2, "ring_only_once"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

    .line 177
    const-string v2, "Settings/VTAdvancedSetting"

    const-string v3, "FeatureOption.MTK_VT3G324M_SUPPORT=falseFeatureOption.MTK_PHONE_VT_VOICE_ANSWER=false"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 185
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->findSimId()V

    .line 186
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->initVTSettings()V

    .line 188
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 189
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 191
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 193
    :cond_0
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 194
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 195
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 196
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/mediatek/settings/VTAdvancedSetting;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 197
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 442
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 443
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 444
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 446
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSetting;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 447
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 206
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 207
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 214
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 209
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->finish()V

    .line 210
    const/4 v1, 0x1

    goto :goto_0

    .line 207
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .parameter "preference"
    .parameter "objValue"

    .prologue
    const/4 v3, 0x1

    .line 218
    const-string v0, "Settings/VTAdvancedSetting"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[mSimId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    const-string v0, "Settings/VTAdvancedSetting"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[objValue = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    const-string v0, "Settings/VTAdvancedSetting"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[key = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTReplace:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_2

    .line 223
    iget v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 224
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mWhichToSave:I

    .line 226
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 228
    const-string v0, " Picture for replacing local video -- selected DEFAULT PICTURE"

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    .line 230
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogDefaultPic(Ljava/lang/String;)V

    .line 256
    :cond_0
    :goto_0
    return v3

    .line 231
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    const-string v0, " Picture for replacing local video -- selected MY PICTURE"

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    .line 235
    iget v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V

    goto :goto_0

    .line 237
    :cond_2
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonVTPeerReplace:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_0

    .line 239
    iget v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 240
    iput v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mWhichToSave:I

    .line 242
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 244
    const-string v0, " Picture for replacing peer video -- selected DEFAULT PICTURE"

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    .line 246
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogDefaultPic(Ljava/lang/String;)V

    goto :goto_0

    .line 247
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    const-string v0, " Picture for replacing peer video -- selected MY PICTURE"

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V

    .line 251
    iget v0, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-static {v0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/16 v4, 0x12e

    const/4 v1, 0x1

    .line 418
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCf:Landroid/preference/Preference;

    if-ne p2, v2, :cond_0

    .line 419
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/phone/GsmUmtsCallForwardOptions;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 420
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "simId"

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 421
    const-string v2, "ISVT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 422
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    .line 438
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return v1

    .line 424
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonCb:Landroid/preference/Preference;

    if-ne p2, v2, :cond_1

    .line 425
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/CallBarring;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 426
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "simId"

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 427
    const-string v2, "ISVT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 428
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 430
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mButtonMore:Landroid/preference/Preference;

    if-ne p2, v2, :cond_2

    .line 431
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/phone/GsmUmtsAdditionalCallOptions;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 432
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "simId"

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 433
    const-string v2, "ISVT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 434
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/mediatek/settings/VTAdvancedSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 438
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 200
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 201
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->setScreenEnabled()V

    .line 202
    return-void
.end method
