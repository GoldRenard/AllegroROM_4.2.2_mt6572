.class public Lcom/mediatek/oobe/basic/DateTimeSettings;
.super Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;
.source "DateTimeSettings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;
.implements Landroid/app/DatePickerDialog$OnDateSetListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static final AUTO_TIME_GPS_INDEX:I = 0x1

.field private static final AUTO_TIME_NETWORK_INDEX:I = 0x0

.field private static final AUTO_TIME_OFF_INDEX:I = 0x2

.field private static final DIALOG_DATEPICKER:I = 0xa

.field private static final DIALOG_GPS_CONFIRM:I = 0xc

.field private static final DIALOG_TIMEPICKER:I = 0xb

.field private static final DUMMY_DATE:I = 0x1f

.field private static final DUMMY_DAYOFHOURS:I = 0xd

.field private static final DUMMY_MOUTH:I = 0xb

.field private static final DUMMY_ZERO:I = 0x0

.field protected static final EXTRA_IS_FIRST_RUN:Ljava/lang/String; = "firstRun"

.field private static final HOURS_12:Ljava/lang/String; = "12"

.field private static final HOURS_24:Ljava/lang/String; = "24"

.field private static final KEY_AUTO_TIME:Ljava/lang/String; = "auto_time"

.field private static final KEY_AUTO_TIME_ZONE:Ljava/lang/String; = "auto_zone"

.field private static final KEY_DATE_FORMAT:Ljava/lang/String; = "date_format"

.field private static final KEY_DATE_PREFERENCE:Ljava/lang/String; = "date"

.field private static final KEY_HOUR_PREFERENCE:Ljava/lang/String; = "24 hour"

.field private static final KEY_TIMEZONE_PREFERENCE:Ljava/lang/String; = "timezone"

.field private static final KEY_TIME_PREFERENCE:Ljava/lang/String; = "time"

.field private static final MAX_DAYS:I = 0x3e7

.field private static final MAX_TIME_OF_DAY:I = 0x1f

.field private static final MAX_TIME_OF_HOUR:I = 0x17

.field private static final MAX_TIME_OF_MINUTE:I = 0x3b

.field private static final MAX_TIME_OF_MONTH:I = 0xb

.field private static final MAX_TIME_OF_SECOND:I = 0x3b

.field private static final MAX_TIME_OF_YEAR:I = 0x7f5

.field private static final MILLIS_TIME:I = 0x3e8

.field private static final MIN_TIME_OF_YEAR:I = 0x7b2

.field private static final SECONDS_IN_MINUTES:I = 0x3c

.field private static final TAG:Ljava/lang/String; = "DateTimeSettings"


# instance fields
.field private mAutoTimePref:Landroid/preference/ListPreference;

.field private mAutoTimeZonePref:Landroid/preference/CheckBoxPreference;

.field private mCurrentStep:I

.field private mDateFormat:Landroid/preference/ListPreference;

.field private mDatePref:Landroid/preference/Preference;

.field private mDummyDate:Ljava/util/Calendar;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mProgressbarMaxSize:I

.field private mTime24Pref:Landroid/preference/Preference;

.field private mTimePref:Landroid/preference/Preference;

.field private mTimeZone:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;-><init>()V

    .line 526
    new-instance v0, Lcom/mediatek/oobe/basic/DateTimeSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/DateTimeSettings$1;-><init>(Lcom/mediatek/oobe/basic/DateTimeSettings;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private static formatOffset(Ljava/lang/StringBuilder;Ljava/util/TimeZone;Ljava/util/Date;)Ljava/lang/StringBuilder;
    .locals 5
    .parameter "sb"
    .parameter "tz"
    .parameter "d"

    .prologue
    .line 502
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    div-int/lit8 v2, v3, 0x3c

    .line 504
    .local v2, off:I
    const-string v3, "GMT"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    if-gez v2, :cond_0

    .line 506
    const/16 v3, 0x2d

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 507
    neg-int v2, v2

    .line 512
    :goto_0
    div-int/lit8 v0, v2, 0x3c

    .line 513
    .local v0, hours:I
    rem-int/lit8 v1, v2, 0x3c

    .line 515
    .local v1, minutes:I
    div-int/lit8 v3, v0, 0xa

    add-int/lit8 v3, v3, 0x30

    int-to-char v3, v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 516
    rem-int/lit8 v3, v0, 0xa

    add-int/lit8 v3, v3, 0x30

    int-to-char v3, v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 518
    const/16 v3, 0x3a

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 520
    div-int/lit8 v3, v1, 0xa

    add-int/lit8 v3, v3, 0x30

    int-to-char v3, v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 521
    rem-int/lit8 v3, v1, 0xa

    add-int/lit8 v3, v3, 0x30

    int-to-char v3, v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 523
    return-object p0

    .line 509
    .end local v0           #hours:I
    .end local v1           #minutes:I
    :cond_0
    const/16 v3, 0x2b

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private getAutoState(Ljava/lang/String;)Z
    .locals 3
    .parameter "name"

    .prologue
    const/4 v1, 0x0

    .line 457
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    .line 459
    :cond_0
    :goto_0
    return v1

    .line 458
    :catch_0
    move-exception v0

    .line 459
    .local v0, snfe:Landroid/provider/Settings$SettingNotFoundException;
    goto :goto_0
.end method

.method private getDateFormat()Ljava/lang/String;
    .locals 2

    .prologue
    .line 452
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "date_format"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getTimeZoneText(Ljava/util/TimeZone;)Ljava/lang/String;
    .locals 4
    .parameter "tz"

    .prologue
    .line 495
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 496
    .local v0, now:Ljava/util/Date;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1, p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->formatOffset(Ljava/lang/StringBuilder;Ljava/util/TimeZone;Ljava/util/Date;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, v0}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/util/TimeZone;->getDisplayName(ZI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initUI()V
    .locals 19

    .prologue
    .line 158
    const-string v1, "auto_time"

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getAutoState(Ljava/lang/String;)Z

    move-result v9

    .line 159
    .local v9, autoTimeEnabled:Z
    const-string v1, "auto_time_zone"

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getAutoState(Ljava/lang/String;)Z

    move-result v11

    .line 160
    .local v11, autoTimeZoneEnabled:Z
    const-string v1, "auto_time_gps"

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getAutoState(Ljava/lang/String;)Z

    move-result v10

    .line 161
    .local v10, autoTimeGpsEnabled:Z
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v17

    .line 162
    .local v17, intent:Landroid/content/Intent;
    const-string v1, "firstRun"

    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v18

    .line 164
    .local v18, isFirstRun:Z
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    .line 165
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/16 v3, 0xb

    const/16 v4, 0x1f

    const/16 v5, 0xd

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Ljava/util/Calendar;->set(IIIIII)V

    .line 167
    const-string v1, "auto_time"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    .line 168
    if-eqz v9, :cond_4

    .line 169
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 175
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 176
    const-string v1, "auto_zone"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimeZonePref:Landroid/preference/CheckBoxPreference;

    .line 179
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/oobe/utils/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v18, :cond_1

    .line 180
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimeZonePref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 181
    const/4 v11, 0x0

    .line 183
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimeZonePref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v11}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 185
    const-string v1, "time"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimePref:Landroid/preference/Preference;

    .line 186
    const-string v1, "24 hour"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    .line 187
    const-string v1, "timezone"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimeZone:Landroid/preference/Preference;

    .line 188
    const-string v1, "date"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDatePref:Landroid/preference/Preference;

    .line 189
    const-string v1, "date_format"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    .line 190
    if-eqz v18, :cond_2

    .line 191
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 192
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 195
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v13

    .line 196
    .local v13, dateFormats:[Ljava/lang/String;
    array-length v1, v13

    new-array v15, v1, [Ljava/lang/String;

    .line 197
    .local v15, formattedDates:[Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getDateFormat()Ljava/lang/String;

    move-result-object v12

    .line 200
    .local v12, currentFormat:Ljava/lang/String;
    if-nez v12, :cond_3

    .line 201
    const-string v12, ""

    .line 203
    :cond_3
    const/16 v16, 0x0

    .local v16, i:I
    :goto_1
    array-length v1, v15

    move/from16 v0, v16

    if-ge v0, v1, :cond_7

    .line 204
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    aget-object v2, v13, v16

    invoke-static {v1, v2}, Landroid/text/format/DateFormat;->getDateFormatForSetting(Landroid/content/Context;Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v14

    .line 207
    .local v14, formatted:Ljava/lang/String;
    aget-object v1, v13, v16

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_6

    .line 208
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090026

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v14, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v15, v16

    .line 203
    :goto_2
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 170
    .end local v12           #currentFormat:Ljava/lang/String;
    .end local v13           #dateFormats:[Ljava/lang/String;
    .end local v14           #formatted:Ljava/lang/String;
    .end local v15           #formattedDates:[Ljava/lang/String;
    .end local v16           #i:I
    :cond_4
    if-eqz v10, :cond_5

    .line 171
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto/16 :goto_0

    .line 173
    :cond_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto/16 :goto_0

    .line 210
    .restart local v12       #currentFormat:Ljava/lang/String;
    .restart local v13       #dateFormats:[Ljava/lang/String;
    .restart local v14       #formatted:Ljava/lang/String;
    .restart local v15       #formattedDates:[Ljava/lang/String;
    .restart local v16       #i:I
    :cond_6
    aput-object v14, v15, v16

    goto :goto_2

    .line 214
    .end local v14           #formatted:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    invoke-virtual {v1, v15}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    const v2, 0x7f060002

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues(I)V

    .line 216
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    invoke-virtual {v1, v12}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 218
    if-nez v9, :cond_8

    if-eqz v10, :cond_9

    :cond_8
    const/4 v8, 0x1

    .line 220
    .local v8, autoEnabled:Z
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimePref:Landroid/preference/Preference;

    if-nez v8, :cond_a

    const/4 v1, 0x1

    :goto_4
    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 221
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDatePref:Landroid/preference/Preference;

    if-nez v8, :cond_b

    const/4 v1, 0x1

    :goto_5
    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 222
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimeZone:Landroid/preference/Preference;

    if-nez v11, :cond_c

    const/4 v1, 0x1

    :goto_6
    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 223
    return-void

    .line 218
    .end local v8           #autoEnabled:Z
    :cond_9
    const/4 v8, 0x0

    goto :goto_3

    .line 220
    .restart local v8       #autoEnabled:Z
    :cond_a
    const/4 v1, 0x0

    goto :goto_4

    .line 221
    :cond_b
    const/4 v1, 0x0

    goto :goto_5

    .line 222
    :cond_c
    const/4 v1, 0x0

    goto :goto_6
.end method

.method private is24Hour()Z
    .locals 1

    .prologue
    .line 444
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private reSetAutoTimePref()V
    .locals 4

    .prologue
    .line 554
    const-string v2, "DateTimeSettings"

    const-string v3, "reset AutoTimePref as cancel the selection"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    const-string v2, "auto_time"

    invoke-direct {p0, v2}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getAutoState(Ljava/lang/String;)Z

    move-result v0

    .line 556
    .local v0, autoTimeEnabled:Z
    const-string v2, "auto_time_gps"

    invoke-direct {p0, v2}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getAutoState(Ljava/lang/String;)Z

    move-result v1

    .line 557
    .local v1, autoTimeGpsEnabled:Z
    if-eqz v0, :cond_0

    .line 558
    iget-object v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 564
    :goto_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 565
    return-void

    .line 559
    :cond_0
    if-eqz v1, :cond_1

    .line 560
    iget-object v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0

    .line 562
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0
.end method

.method private set24Hour(Z)V
    .locals 3
    .parameter "is24Hour"

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "time_12_24"

    if-eqz p1, :cond_0

    const-string v0, "24"

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 449
    return-void

    .line 448
    :cond_0
    const-string v0, "12"

    goto :goto_0
.end method

.method static setDate(III)V
    .locals 7
    .parameter "year"
    .parameter "month"
    .parameter "day"

    .prologue
    .line 466
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 468
    .local v0, c:Ljava/util/Calendar;
    const/4 v3, 0x1

    invoke-virtual {v0, v3, p0}, Ljava/util/Calendar;->set(II)V

    .line 469
    const/4 v3, 0x2

    invoke-virtual {v0, v3, p1}, Ljava/util/Calendar;->set(II)V

    .line 470
    const/4 v3, 0x5

    invoke-virtual {v0, v3, p2}, Ljava/util/Calendar;->set(II)V

    .line 471
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 473
    .local v1, when:J
    const-wide/16 v3, 0x3e8

    div-long v3, v1, v3

    const-wide/32 v5, 0x7fffffff

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    .line 474
    invoke-static {v1, v2}, Landroid/os/SystemClock;->setCurrentTimeMillis(J)Z

    .line 476
    :cond_0
    return-void
.end method

.method private setDateRange(Landroid/app/DatePickerDialog;)V
    .locals 13
    .parameter "dialog"

    .prologue
    .line 377
    if-eqz p1, :cond_0

    .line 378
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 379
    .local v0, minTime:Landroid/text/format/Time;
    new-instance v10, Landroid/text/format/Time;

    invoke-direct {v10}, Landroid/text/format/Time;-><init>()V

    .line 381
    .local v10, maxTime:Landroid/text/format/Time;
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v6, 0x7b2

    invoke-virtual/range {v0 .. v6}, Landroid/text/format/Time;->set(IIIIII)V

    .line 383
    const/16 v2, 0x3b

    const/16 v3, 0x3b

    const/16 v4, 0x17

    const/16 v5, 0x1f

    const/16 v6, 0xb

    const/16 v7, 0x7f5

    move-object v1, v10

    invoke-virtual/range {v1 .. v7}, Landroid/text/format/Time;->set(IIIIII)V

    .line 385
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v8

    .line 387
    .local v8, maxDate:J
    const-wide/16 v1, 0x3e7

    add-long/2addr v8, v1

    .line 388
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v11

    .line 389
    .local v11, minDate:J
    invoke-virtual {p1}, Landroid/app/DatePickerDialog;->getDatePicker()Landroid/widget/DatePicker;

    move-result-object v1

    invoke-virtual {v1, v11, v12}, Landroid/widget/DatePicker;->setMinDate(J)V

    .line 390
    invoke-virtual {p1}, Landroid/app/DatePickerDialog;->getDatePicker()Landroid/widget/DatePicker;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Landroid/widget/DatePicker;->setMaxDate(J)V

    .line 392
    .end local v0           #minTime:Landroid/text/format/Time;
    .end local v8           #maxDate:J
    .end local v10           #maxTime:Landroid/text/format/Time;
    .end local v11           #minDate:J
    :cond_0
    return-void
.end method

.method static setTime(II)V
    .locals 7
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    const/4 v4, 0x0

    .line 479
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 481
    .local v0, c:Ljava/util/Calendar;
    const/16 v3, 0xb

    invoke-virtual {v0, v3, p0}, Ljava/util/Calendar;->set(II)V

    .line 482
    const/16 v3, 0xc

    invoke-virtual {v0, v3, p1}, Ljava/util/Calendar;->set(II)V

    .line 483
    const/16 v3, 0xd

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 484
    const/16 v3, 0xe

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 485
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 487
    .local v1, when:J
    const-wide/16 v3, 0x3e8

    div-long v3, v1, v3

    const-wide/32 v5, 0x7fffffff

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    .line 488
    invoke-static {v1, v2}, Landroid/os/SystemClock;->setCurrentTimeMillis(J)Z

    .line 490
    :cond_0
    return-void
.end method

.method private timeUpdated()V
    .locals 2

    .prologue
    .line 437
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.TIME_SET"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 438
    .local v0, timeChanged:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 439
    return-void
.end method

.method private updateDateFormatEntries()V
    .locals 8

    .prologue
    .line 272
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060002

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, dateFormats:[Ljava/lang/String;
    array-length v4, v0

    new-array v2, v4, [Ljava/lang/String;

    .line 274
    .local v2, formattedDates:[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 275
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    aget-object v5, v0, v3

    invoke-static {v4, v5}, Landroid/text/format/DateFormat;->getDateFormatForSetting(Landroid/content/Context;Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 277
    .local v1, formatted:Ljava/lang/String;
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    .line 278
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f090026

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 274
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 280
    :cond_0
    aput-object v1, v2, v3

    goto :goto_1

    .line 283
    .end local v1           #formatted:Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    invoke-virtual {v4, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 284
    return-void
.end method


# virtual methods
.method public initProgressBar(II)V
    .locals 0
    .parameter "totalStep"
    .parameter "step"

    .prologue
    .line 583
    iput p1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mProgressbarMaxSize:I

    .line 584
    iput p2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mCurrentStep:I

    .line 585
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 433
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 434
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 569
    const-string v0, "DateTimeSettings"

    const-string v1, "onCancel Dialog"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->reSetAutoTimePref()V

    .line 572
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v4, 0x1

    .line 538
    const/4 v1, -0x1

    if-ne p2, v1, :cond_2

    .line 539
    const-string v1, "DateTimeSettings"

    const-string v2, "Enable GPS time sync"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 540
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "gps"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    .line 542
    .local v0, gpsEnabled:Z
    if-nez v0, :cond_0

    .line 543
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "gps"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 545
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "auto_time"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 546
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "auto_time_gps"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 551
    .end local v0           #gpsEnabled:Z
    :cond_1
    :goto_0
    return-void

    .line 547
    :cond_2
    const/4 v1, -0x2

    if-ne p2, v1, :cond_1

    .line 548
    const-string v1, "DateTimeSettings"

    const-string v2, "DialogInterface.BUTTON_NEGATIVE"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->reSetAutoTimePref()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "icicle"

    .prologue
    .line 150
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 152
    const/high16 v0, 0x7f05

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->addPreferencesFromResource(I)V

    .line 154
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->initUI()V

    .line 155
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 8
    .parameter "id"

    .prologue
    .line 345
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    .line 347
    .local v6, calendar:Ljava/util/Calendar;
    packed-switch p1, :pswitch_data_0

    .line 369
    const/4 v0, 0x0

    .line 373
    .local v0, d:Landroid/app/Dialog;
    :goto_0
    return-object v0

    .line 349
    .end local v0           #d:Landroid/app/Dialog;
    :pswitch_0
    new-instance v0, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v2, 0x2

    invoke-virtual {v6, v2}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v2, 0x5

    invoke-virtual {v6, v2}, Ljava/util/Calendar;->get(I)I

    move-result v5

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .restart local v0       #d:Landroid/app/Dialog;
    move-object v1, v0

    .line 351
    check-cast v1, Landroid/app/DatePickerDialog;

    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->setDateRange(Landroid/app/DatePickerDialog;)V

    goto :goto_0

    .line 354
    .end local v0           #d:Landroid/app/Dialog;
    :pswitch_1
    new-instance v0, Landroid/app/TimePickerDialog;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/16 v2, 0xb

    invoke-virtual {v6, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v2, 0xc

    invoke-virtual {v6, v2}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v5

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 356
    .restart local v0       #d:Landroid/app/Dialog;
    goto :goto_0

    .line 359
    .end local v0           #d:Landroid/app/Dialog;
    :pswitch_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "gps"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 360
    const v7, 0x7f090088

    .line 364
    .local v7, msg:I
    :goto_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09010a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040013

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 367
    .restart local v0       #d:Landroid/app/Dialog;
    goto/16 :goto_0

    .line 362
    .end local v0           #d:Landroid/app/Dialog;
    .end local v7           #msg:I
    :cond_0
    const v7, 0x7f090089

    .restart local v7       #msg:I
    goto :goto_1

    .line 347
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 1
    .parameter "view"
    .parameter "year"
    .parameter "month"
    .parameter "day"

    .prologue
    .line 288
    invoke-static {p2, p3, p4}, Lcom/mediatek/oobe/basic/DateTimeSettings;->setDate(III)V

    .line 289
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 290
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 291
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 292
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateDateFormatEntries()V

    .line 294
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 245
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPause()V

    .line 246
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 247
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 248
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/16 v3, 0xb

    .line 404
    const-string v1, "DateTimeSettings"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDatePref:Landroid/preference/Preference;

    if-ne p2, v1, :cond_1

    .line 406
    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->showDialog(I)V

    .line 428
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    return v1

    .line 407
    :cond_1
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimePref:Landroid/preference/Preference;

    if-ne p2, v1, :cond_2

    .line 409
    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/DateTimeSettings;->removeDialog(I)V

    .line 410
    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/DateTimeSettings;->showDialog(I)V

    goto :goto_0

    .line 411
    :cond_2
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    if-ne p2, v1, :cond_3

    .line 412
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    check-cast v1, Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->set24Hour(Z)V

    .line 413
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 414
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->timeUpdated()V

    goto :goto_0

    .line 415
    :cond_3
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimeZone:Landroid/preference/Preference;

    if-ne p2, v1, :cond_0

    .line 416
    const-string v1, "DateTimeSettings"

    const-string v2, "time zone preference clicked "

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.oobe.basic.TIMEZONE_PICKER_WIZARD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 422
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "oobe_step_total"

    iget v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mProgressbarMaxSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 423
    const-string v1, "oobe_step_index"

    iget v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mCurrentStep:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 424
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->startActivity(Landroid/content/Intent;)V

    .line 425
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f040002

    const v3, 0x7f040001

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 227
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onResume()V

    .line 229
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 231
    iget-object v1, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    check-cast v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->is24Hour()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 234
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 235
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 236
    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 237
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 238
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 240
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 241
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 10
    .parameter "preferences"
    .parameter "key"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 311
    const-string v5, "date_format"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 312
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090032

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, p2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 313
    .local v2, format:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "date_format"

    invoke-static {v5, v6, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 314
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 339
    .end local v2           #format:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 315
    :cond_1
    const-string v5, "auto_time"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 316
    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 317
    .local v4, value:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    invoke-virtual {v5, v4}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v3

    .line 318
    .local v3, index:I
    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mAutoTimePref:Landroid/preference/ListPreference;

    invoke-virtual {v5, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 319
    const/4 v0, 0x1

    .line 321
    .local v0, autoEnabled:Z
    if-nez v3, :cond_2

    .line 322
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v8, "auto_time"

    invoke-static {v5, v8, v6}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 323
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v8, "auto_time_gps"

    invoke-static {v5, v8, v7}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 332
    :goto_1
    iget-object v8, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimePref:Landroid/preference/Preference;

    if-nez v0, :cond_4

    move v5, v6

    :goto_2
    invoke-virtual {v8, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 333
    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDatePref:Landroid/preference/Preference;

    if-nez v0, :cond_5

    :goto_3
    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    .line 324
    :cond_2
    if-ne v3, v6, :cond_3

    .line 325
    const/16 v5, 0xc

    invoke-virtual {p0, v5}, Lcom/mediatek/oobe/basic/DateTimeSettings;->showDialog(I)V

    .line 326
    invoke-virtual {p0, p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    goto :goto_1

    .line 328
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v8, "auto_time"

    invoke-static {v5, v8, v7}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 329
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v8, "auto_time_gps"

    invoke-static {v5, v8, v7}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 330
    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    move v5, v7

    .line 332
    goto :goto_2

    :cond_5
    move v6, v7

    .line 333
    goto :goto_3

    .line 334
    .end local v0           #autoEnabled:Z
    .end local v3           #index:I
    .end local v4           #value:Ljava/lang/String;
    :cond_6
    const-string v5, "auto_zone"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 335
    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 336
    .local v1, autoZoneEnabled:Z
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "auto_time_zone"

    if-eqz v1, :cond_7

    move v5, v6

    :goto_4
    invoke-static {v8, v9, v5}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 337
    iget-object v5, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimeZone:Landroid/preference/Preference;

    if-nez v1, :cond_8

    :goto_5
    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_7
    move v5, v7

    .line 336
    goto :goto_4

    :cond_8
    move v6, v7

    .line 337
    goto :goto_5
.end method

.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 1
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 298
    invoke-static {p2, p3}, Lcom/mediatek/oobe/basic/DateTimeSettings;->setTime(II)V

    .line 299
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 300
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 307
    :cond_0
    return-void
.end method

.method public updateTimeAndDateDisplay(Landroid/content/Context;)V
    .locals 10
    .parameter "context"

    .prologue
    const/4 v5, 0x0

    .line 257
    invoke-static {p1}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v9

    .line 258
    .local v9, shortDateFormat:Ljava/text/DateFormat;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    .line 259
    .local v8, now:Ljava/util/Calendar;
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 262
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v8, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/16 v2, 0xb

    const/16 v3, 0x1f

    const/16 v4, 0xd

    move v6, v5

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 263
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDummyDate:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    .line 264
    .local v7, dummyDate:Ljava/util/Date;
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimePref:Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v1

    invoke-virtual {v8}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 265
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTimeZone:Landroid/preference/Preference;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getTimeZoneText(Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 266
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDatePref:Landroid/preference/Preference;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 267
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mDateFormat:Landroid/preference/ListPreference;

    invoke-virtual {v9, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 268
    iget-object v0, p0, Lcom/mediatek/oobe/basic/DateTimeSettings;->mTime24Pref:Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 269
    return-void
.end method
