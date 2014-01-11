.class public Lcom/mediatek/phone/StkListEntrance;
.super Landroid/preference/PreferenceActivity;
.source "StkListEntrance.java"


# static fields
.field private static final REQUEST_TYPE:I = 0x12e

.field private static final TAG:Ljava/lang/String; = "StkListEntrance"

.field private static final baseband:Ljava/lang/String;

.field private static mDefaultTitle:Ljava/lang/String;

.field public static mSlot:I

.field private static strTargetClass:Ljava/lang/String;

.field private static strTargetLoc:Ljava/lang/String;


# instance fields
.field private mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mContext:Landroid/content/Context;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mSimReceiver:Landroid/content/BroadcastReceiver;

.field private mTargetClassIndex:I

.field private mTelephonyManager:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private serviceComplete:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 65
    sput-object v0, Lcom/mediatek/phone/StkListEntrance;->strTargetLoc:Ljava/lang/String;

    .line 66
    sput-object v0, Lcom/mediatek/phone/StkListEntrance;->strTargetClass:Ljava/lang/String;

    .line 78
    const-string v0, "gsm.baseband.capability"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mediatek/phone/StkListEntrance;->baseband:Ljava/lang/String;

    .line 80
    const/4 v0, -0x1

    sput v0, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 73
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/phone/StkListEntrance;->mTargetClassIndex:I

    .line 85
    new-instance v0, Lcom/mediatek/phone/StkListEntrance$1;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/StkListEntrance$1;-><init>(Lcom/mediatek/phone/StkListEntrance;)V

    iput-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mSimReceiver:Landroid/content/BroadcastReceiver;

    .line 269
    new-instance v0, Lcom/mediatek/phone/StkListEntrance$2;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/StkListEntrance$2;-><init>(Lcom/mediatek/phone/StkListEntrance;)V

    iput-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->serviceComplete:Ljava/lang/Runnable;

    .line 283
    new-instance v0, Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v1, p0, Lcom/mediatek/phone/StkListEntrance;->serviceComplete:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/phone/StkListEntrance;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lcom/mediatek/phone/StkListEntrance;->updateSimState(II)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/phone/StkListEntrance;)Lcom/mediatek/CellConnService/CellConnMgr;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-object v0
.end method

.method private addSimInfoPreference()V
    .locals 19

    .prologue
    .line 245
    const-string v3, "StkListEntrance"

    const-string v4, "[addSimInfoPreference]+"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/phone/StkListEntrance;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v15

    .line 248
    .local v15, root:Landroid/preference/PreferenceScreen;
    if-eqz v15, :cond_1

    .line 249
    invoke-static/range {p0 .. p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMCount(Landroid/content/Context;)I

    move-result v13

    .line 250
    .local v13, countInsertedCard:I
    const/16 v17, 0x0

    .line 251
    .local v17, slot:I
    const/4 v14, 0x0

    .local v14, i:I
    move/from16 v18, v17

    .end local v17           #slot:I
    .local v18, slot:I
    :goto_0
    if-ge v14, v13, :cond_1

    .line 252
    add-int/lit8 v17, v18, 0x1

    .end local v18           #slot:I
    .restart local v17       #slot:I
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v16

    .line 253
    .local v16, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v16, :cond_0

    .line 254
    add-int/lit8 v14, v14, 0x1

    .line 255
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/phone/StkListEntrance;->mTelephonyManager:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v0, v16

    iget v4, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v3, v4}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimIndicatorStateGemini(I)I

    move-result v7

    .line 256
    .local v7, status:I
    const-string v3, "StkListEntrance"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sim status of slot "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    iget v5, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    new-instance v2, Lcom/mediatek/phone/SimInfoPreference;

    move-object/from16 v0, v16

    iget-object v4, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v0, v16

    iget-object v5, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    move-object/from16 v0, v16

    iget v6, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move-object/from16 v0, v16

    iget v8, v0, Landroid/provider/Telephony$SIMInfo;->mColor:I

    move-object/from16 v0, v16

    iget v9, v0, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    move-object/from16 v0, v16

    iget-wide v10, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    const/4 v12, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v12}, Lcom/mediatek/phone/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V

    .line 261
    .local v2, simInfoPref:Lcom/mediatek/phone/SimInfoPreference;
    const-string v3, "StkListEntrance"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[addSimInfoPreference][addPreference] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    iget v5, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-virtual {v15, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .end local v2           #simInfoPref:Lcom/mediatek/phone/SimInfoPreference;
    .end local v7           #status:I
    :cond_0
    move/from16 v18, v17

    .line 264
    .end local v17           #slot:I
    .restart local v18       #slot:I
    goto/16 :goto_0

    .line 266
    .end local v13           #countInsertedCard:I
    .end local v14           #i:I
    .end local v16           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v18           #slot:I
    :cond_1
    return-void
.end method

.method private isOnFlightMode()Z
    .locals 5

    .prologue
    .line 341
    const/4 v1, 0x0

    .line 343
    .local v1, mode:I
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/phone/StkListEntrance;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 349
    :goto_0
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "airlane mode is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_1
    return v2

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, e:Landroid/provider/Settings$SettingNotFoundException;
    const-string v2, "StkListEntrance"

    const-string v3, "fail to get airlane mode"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    const/4 v1, 0x0

    goto :goto_0

    .line 350
    .end local v0           #e:Landroid/provider/Settings$SettingNotFoundException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private launchStk(I)Z
    .locals 13
    .parameter "sim_id"

    .prologue
    const v12, 0x7f0d0010

    const/4 v11, 0x0

    .line 145
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 146
    .local v7, pm:Landroid/content/pm/PackageManager;
    const-string v6, "com.android.stk"

    .line 147
    .local v6, pName:Ljava/lang/String;
    const/4 v0, 0x0

    .line 149
    .local v0, aName:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 165
    :goto_0
    if-eqz v0, :cond_0

    .line 167
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v6, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .local v1, cName:Landroid/content/ComponentName;
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 169
    .local v5, mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-virtual {v5, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/internal/telephony/IccCard;->getState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v3

    .line 170
    .local v3, iccCardState:Lcom/android/internal/telephony/IccCardConstants$State;
    sget-object v8, Lcom/android/internal/telephony/IccCardConstants$State;->ABSENT:Lcom/android/internal/telephony/IccCardConstants$State;

    if-ne v3, v8, :cond_1

    .line 171
    const v8, 0x7f0d0011

    invoke-virtual {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->showTextToast(Ljava/lang/String;)V

    .line 172
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    .line 201
    .end local v1           #cName:Landroid/content/ComponentName;
    .end local v3           #iccCardState:Lcom/android/internal/telephony/IccCardConstants$State;
    .end local v5           #mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    :goto_1
    return v11

    .line 152
    :pswitch_0
    const-string v0, "com.android.stk.StkLauncherActivity"

    .line 153
    goto :goto_0

    .line 155
    :pswitch_1
    const-string v0, "com.android.stk.StkLauncherActivityII"

    .line 156
    goto :goto_0

    .line 158
    :pswitch_2
    const-string v0, "com.android.stk.StkLauncherActivityIII"

    .line 159
    goto :goto_0

    .line 161
    :pswitch_3
    const-string v0, "com.android.stk.StkLauncherActivityIV"

    goto :goto_0

    .line 174
    .restart local v1       #cName:Landroid/content/ComponentName;
    .restart local v3       #iccCardState:Lcom/android/internal/telephony/IccCardConstants$State;
    .restart local v5       #mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/phone/StkListEntrance;->isOnFlightMode()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 175
    const v8, 0x7f0d0012

    invoke-virtual {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->showTextToast(Ljava/lang/String;)V

    .line 176
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    goto :goto_1

    .line 178
    :cond_2
    sget-object v8, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    if-eq v3, v8, :cond_3

    .line 179
    const v8, 0x7f0d0013

    invoke-virtual {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->showTextToast(Ljava/lang/String;)V

    .line 180
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    goto :goto_1

    .line 182
    :cond_3
    invoke-virtual {v7, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_4

    .line 183
    invoke-virtual {p0, v12}, Lcom/mediatek/phone/StkListEntrance;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->showTextToast(Ljava/lang/String;)V

    .line 184
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    goto :goto_1

    .line 188
    :cond_4
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 189
    .local v4, intent:Landroid/content/Intent;
    const-string v8, "StkListEntrance"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[aaa][onPreferenceTreeClick][mSlot][aName] : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    invoke-virtual {v4, v6, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    :try_start_0
    invoke-virtual {p0, v4}, Lcom/mediatek/phone/StkListEntrance;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 193
    :catch_0
    move-exception v2

    .line 194
    .local v2, e:Landroid/content/ActivityNotFoundException;
    const-string v8, "StkListEntrance"

    const-string v9, "[onPreferenceTreeClick] ActivityNotFoundException happened"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    invoke-virtual {p0, v12}, Lcom/mediatek/phone/StkListEntrance;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->showTextToast(Ljava/lang/String;)V

    .line 196
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->finish()V

    goto :goto_1

    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private setDefaultSIMIndicate(I)V
    .locals 4
    .parameter "slotID"

    .prologue
    .line 334
    const-string v1, "StkListEntrance"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[getSIMState][slotID] : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    iget-object v1, p0, Lcom/mediatek/phone/StkListEntrance;->mTelephonyManager:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v1, p1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimIndicatorStateGemini(I)I

    move-result v0

    .line 336
    .local v0, state:I
    const-string v1, "StkListEntrance"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[getSIMState][state] : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    invoke-direct {p0, p1, v0}, Lcom/mediatek/phone/StkListEntrance;->updateSimState(II)V

    .line 338
    return-void
.end method

.method private showTextToast(Ljava/lang/String;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x0

    .line 327
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 329
    .local v0, toast:Landroid/widget/Toast;
    const/16 v1, 0x50

    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 330
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 331
    return-void
.end method

.method private updateSimState(II)V
    .locals 6
    .parameter "slotID"
    .parameter "state"

    .prologue
    .line 310
    const-string v2, "StkListEntrance"

    const-string v3, "[updateSimState]+"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    invoke-static {p0, p1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 313
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_1

    .line 314
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[updateSimState][siminfo.mSimId] : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iget-wide v2, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/phone/StkListEntrance;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/SimInfoPreference;

    .line 316
    .local v0, pref:Lcom/mediatek/phone/SimInfoPreference;
    const-string v2, "StkListEntrance"

    const-string v3, "[updateSimState][setStatus] "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    if-eqz v0, :cond_0

    .line 318
    invoke-virtual {v0, p2}, Lcom/mediatek/phone/SimInfoPreference;->setStatus(I)V

    .line 319
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[updateSimState][Color] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v0, v2}, Lcom/mediatek/phone/SimInfoPreference;->setColor(I)V

    .line 322
    :cond_0
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSimState sim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " status = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .end local v0           #pref:Lcom/mediatek/phone/SimInfoPreference;
    :cond_1
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 110
    const-string v0, "StkListEntrance"

    const-string v1, "[onCreate] +"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0, p0}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 112
    iput-object p0, p0, Lcom/mediatek/phone/StkListEntrance;->mContext:Landroid/content/Context;

    .line 116
    const v0, 0x7f060020

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/StkListEntrance;->addPreferencesFromResource(I)V

    .line 117
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mTelephonyManager:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 119
    const-string v0, "StkListEntrance"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "baseband is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/phone/StkListEntrance;->baseband:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mIntentFilter:Landroid/content/IntentFilter;

    .line 127
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.RADIO_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mSimReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/mediatek/phone/StkListEntrance;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/phone/StkListEntrance;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 130
    invoke-virtual {p0}, Lcom/mediatek/phone/StkListEntrance;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d000f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/StkListEntrance;->setTitle(Ljava/lang/CharSequence;)V

    .line 132
    const-string v0, "StkListEntrance"

    const-string v1, "[onCreate][addSimInfoPreference] "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    invoke-direct {p0}, Lcom/mediatek/phone/StkListEntrance;->addSimInfoPreference()V

    .line 134
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 139
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 140
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mSimReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/StkListEntrance;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 141
    iget-object v0, p0, Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->unregister()V

    .line 142
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 288
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 290
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 9
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 205
    const-string v2, "StkListEntrance"

    const-string v3, "Enter onPreferenceClick function."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    sput-object v4, Lcom/mediatek/phone/StkListEntrance;->strTargetLoc:Ljava/lang/String;

    .line 208
    sput-object v4, Lcom/mediatek/phone/StkListEntrance;->strTargetClass:Ljava/lang/String;

    .line 209
    const-string v2, "StkListEntrance"

    const-string v3, "[onPreferenceTreeClick] +"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 212
    .local v0, mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[onPreferenceTreeClick][Click SIM1][SimState] : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/IccCard;->getState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[onPreferenceTreeClick][Click SIM2][SimState] : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/IccCard;->getState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-static {p0, v2, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 222
    .local v1, siminfo1:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 223
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    sput v2, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    .line 225
    :cond_0
    const-string v2, "StkListEntrance"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[aaa][onPreferenceTreeClick][mSlot] : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    sget v2, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    if-nez v2, :cond_2

    .line 228
    invoke-direct {p0, v5}, Lcom/mediatek/phone/StkListEntrance;->launchStk(I)Z

    .line 238
    :cond_1
    :goto_0
    const-string v2, "StkListEntrance"

    const-string v3, "[onPreferenceTreeClick] -"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    return v5

    .line 229
    :cond_2
    sget v2, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    if-ne v2, v6, :cond_3

    .line 230
    invoke-direct {p0, v6}, Lcom/mediatek/phone/StkListEntrance;->launchStk(I)Z

    goto :goto_0

    .line 231
    :cond_3
    sget v2, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    if-ne v2, v7, :cond_4

    .line 232
    invoke-direct {p0, v7}, Lcom/mediatek/phone/StkListEntrance;->launchStk(I)Z

    goto :goto_0

    .line 233
    :cond_4
    sget v2, Lcom/mediatek/phone/StkListEntrance;->mSlot:I

    if-ne v2, v8, :cond_1

    .line 234
    invoke-direct {p0, v8}, Lcom/mediatek/phone/StkListEntrance;->launchStk(I)Z

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 299
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 300
    sput-object v0, Lcom/mediatek/phone/StkListEntrance;->strTargetLoc:Ljava/lang/String;

    .line 301
    sput-object v0, Lcom/mediatek/phone/StkListEntrance;->strTargetClass:Ljava/lang/String;

    .line 302
    const-string v0, "StkListEntrance"

    const-string v1, "[onResume]"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/StkListEntrance;->setDefaultSIMIndicate(I)V

    .line 305
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/phone/StkListEntrance;->setDefaultSIMIndicate(I)V

    .line 306
    return-void
.end method
