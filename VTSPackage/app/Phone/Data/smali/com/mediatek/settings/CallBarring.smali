.class public Lcom/mediatek/settings/CallBarring;
.super Lcom/android/phone/TimeConsumingPreferenceActivity;
.source "CallBarring.java"

# interfaces
.implements Lcom/mediatek/settings/CallBarringInterface;


# static fields
.field private static final BUTTON_ALL_INCOMING_EXCEPT:Ljava/lang/String; = "all_incoming_except_key"

.field private static final BUTTON_ALL_INCOMING_KEY:Ljava/lang/String; = "all_incoming_key"

.field private static final BUTTON_ALL_OUTING_KEY:Ljava/lang/String; = "all_outing_international_key"

.field private static final BUTTON_CALL_BARRING_KEY:Ljava/lang/String; = "all_outing_key"

.field private static final BUTTON_CHANGE_PASSWORD_KEY:Ljava/lang/String; = "change_password_key"

.field private static final BUTTON_DEACTIVATE_KEY:Ljava/lang/String; = "deactivate_all_key"

.field private static final BUTTON_OUT_INTERNATIONAL_EXCEPT:Ljava/lang/String; = "all_outing_except_key"

.field private static final DBG:Z = true

.field public static final DEFAULT_SIM:I = 0x2

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallBarring"


# instance fields
.field private mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

.field private mCallCancel:Lcom/mediatek/settings/CallBarringResetPreference;

.field private mCallChangePassword:Lcom/mediatek/settings/CallBarringChangePassword;

.field private mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

.field private mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

.field private mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

.field private mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

.field private mCheckedPreferences:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mErrorState:I

.field private mFirstResume:Z

.field private mInitIndex:I

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mPassword:Ljava/lang/String;

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

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mResetIndex:I

.field private mSimId:I

.field private mVtSetting:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;-><init>()V

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCheckedPreferences:Ljava/util/ArrayList;

    .line 87
    iput v1, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    .line 88
    iput v1, p0, Lcom/mediatek/settings/CallBarring;->mResetIndex:I

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/CallBarring;->mPassword:Ljava/lang/String;

    .line 90
    iput v1, p0, Lcom/mediatek/settings/CallBarring;->mErrorState:I

    .line 91
    iput-boolean v1, p0, Lcom/mediatek/settings/CallBarring;->mFirstResume:Z

    .line 94
    const/4 v0, 0x2

    iput v0, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    .line 96
    iput-boolean v1, p0, Lcom/mediatek/settings/CallBarring;->mVtSetting:Z

    .line 99
    new-instance v0, Lcom/mediatek/settings/CallBarring$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/CallBarring$1;-><init>(Lcom/mediatek/settings/CallBarring;)V

    iput-object v0, p0, Lcom/mediatek/settings/CallBarring;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CallBarring;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 64
    iget v0, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    return v0
.end method

.method private doGetCallState(Landroid/preference/Preference;)V
    .locals 2
    .parameter "p"

    .prologue
    .line 252
    instance-of v0, p1, Lcom/mediatek/settings/CallBarringBasePreference;

    if-eqz v0, :cond_0

    .line 253
    check-cast p1, Lcom/mediatek/settings/CallBarringBasePreference;

    .end local p1
    const/4 v0, 0x0

    iget v1, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    invoke-virtual {p1, p0, v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V

    .line 255
    :cond_0
    return-void
.end method

.method private initial()V
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const-string v1, "AO"

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmFacility(Ljava/lang/String;)V

    .line 232
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const v1, 0x7f0d00ba

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmTitle(I)V

    .line 234
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const-string v1, "OI"

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmFacility(Ljava/lang/String;)V

    .line 236
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const v1, 0x7f0d00bb

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmTitle(I)V

    .line 238
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    const-string v1, "OX"

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmFacility(Ljava/lang/String;)V

    .line 240
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    const v1, 0x7f0d00bc

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmTitle(I)V

    .line 243
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const-string v1, "AI"

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmFacility(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    const v1, 0x7f0d00bd

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmTitle(I)V

    .line 246
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    const-string v1, "IR"

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmFacility(Ljava/lang/String;)V

    .line 247
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    const v1, 0x7f0d00be

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallBarringBasePreference;->setmTitle(I)V

    .line 248
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mCallCancel:Lcom/mediatek/settings/CallBarringResetPreference;

    invoke-virtual {v0, p0}, Lcom/mediatek/settings/CallBarringResetPreference;->setListener(Lcom/mediatek/phone/TimeConsumingPreferenceListener;)V

    .line 249
    return-void
.end method

.method private startUpdate()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 215
    iput v3, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    .line 216
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget v2, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .line 217
    .local v0, p:Landroid/preference/Preference;
    if-eqz v0, :cond_0

    .line 218
    invoke-direct {p0, v0}, Lcom/mediatek/settings/CallBarring;->doGetCallState(Landroid/preference/Preference;)V

    .line 219
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->setMmiFinished(Z)V

    .line 221
    :cond_0
    return-void
.end method


# virtual methods
.method public doCallBarringRefresh(Ljava/lang/String;)V
    .locals 4
    .parameter "state"

    .prologue
    const/4 v3, 0x0

    .line 296
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1}, Lcom/mediatek/settings/CallBarringBasePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d00c2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, summary:Ljava/lang/String;
    const-string v1, "AO"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 298
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 299
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 300
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 301
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 304
    :cond_0
    const-string v1, "OI"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 305
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 306
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 307
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 311
    :cond_1
    const-string v1, "OX"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 312
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 313
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 314
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 315
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 318
    :cond_2
    const-string v1, "AI"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 319
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 320
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 323
    :cond_3
    const-string v1, "IR"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 324
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 325
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 327
    :cond_4
    return-void
.end method

.method public doCancelAllState()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 281
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1}, Lcom/mediatek/settings/CallBarringBasePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d00c2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, summary:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 283
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 284
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 285
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 286
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 287
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 288
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 290
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 291
    iget-object v1, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/CallBarringBasePreference;->setChecked(Z)V

    .line 292
    return-void
.end method

.method public getErrorState()I
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lcom/mediatek/settings/CallBarring;->mErrorState:I

    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 224
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 225
    const/16 v0, 0x12c

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getErrorState()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 226
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->finish()V

    .line 228
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "icicle"

    .prologue
    const/4 v7, 0x1

    const/16 v6, 0x200

    .line 123
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 125
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 126
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    .line 127
    .local v1, app:Lcom/android/phone/PhoneGlobals;
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "simId"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    .line 130
    .end local v1           #app:Lcom/android/phone/PhoneGlobals;
    :cond_0
    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mIntentFilter:Landroid/content/IntentFilter;

    .line 131
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v3, v4}, Lcom/mediatek/settings/CallBarring;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 133
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "ISVT"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/mediatek/settings/CallBarring;->mVtSetting:Z

    .line 134
    const-string v3, "CallBarring"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Sim Id : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ISVT = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/mediatek/settings/CallBarring;->mVtSetting:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const/high16 v3, 0x7f06

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/CallBarring;->addPreferencesFromResource(I)V

    .line 138
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 139
    .local v2, prefSet:Landroid/preference/PreferenceScreen;
    const-string v3, "all_outing_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringBasePreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    .line 141
    const-string v3, "all_outing_international_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringBasePreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    .line 143
    const-string v3, "all_outing_except_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringBasePreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    .line 145
    const-string v3, "all_incoming_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringBasePreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    .line 147
    const-string v3, "all_incoming_except_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringBasePreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    .line 150
    const-string v3, "deactivate_all_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringResetPreference;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallCancel:Lcom/mediatek/settings/CallBarringResetPreference;

    .line 152
    const-string v3, "change_password_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CallBarringChangePassword;

    iput-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallChangePassword:Lcom/mediatek/settings/CallBarringChangePassword;

    .line 155
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarring;->initial()V

    .line 156
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V

    .line 163
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V

    .line 164
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V

    .line 165
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V

    .line 166
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V

    .line 167
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallCancel:Lcom/mediatek/settings/CallBarringResetPreference;

    iget v4, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    invoke-virtual {v3, p0, v4}, Lcom/mediatek/settings/CallBarringResetPreference;->setCallBarringInterface(Lcom/mediatek/settings/CallBarringInterface;I)V

    .line 168
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallChangePassword:Lcom/mediatek/settings/CallBarringChangePassword;

    iget v4, p0, Lcom/mediatek/settings/CallBarring;->mSimId:I

    invoke-virtual {v3, p0, v4}, Lcom/mediatek/settings/CallBarringChangePassword;->setTimeConsumingListener(Lcom/mediatek/phone/TimeConsumingPreferenceListener;I)V

    .line 170
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "sub_title_name"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 171
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "sub_title_name"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/CallBarring;->setTitle(Ljava/lang/CharSequence;)V

    .line 174
    :cond_1
    iget-boolean v3, p0, Lcom/mediatek/settings/CallBarring;->mVtSetting:Z

    if-eqz v3, :cond_2

    .line 175
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->setServiceClass(I)V

    .line 176
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->setServiceClass(I)V

    .line 177
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInternationalOutButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->setServiceClass(I)V

    .line 178
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->setServiceClass(I)V

    .line 179
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallInButton2:Lcom/mediatek/settings/CallBarringBasePreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->setServiceClass(I)V

    .line 180
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mCallCancel:Lcom/mediatek/settings/CallBarringResetPreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CallBarringResetPreference;->setServiceClass(I)V

    .line 183
    :cond_2
    iput-boolean v7, p0, Lcom/mediatek/settings/CallBarring;->mFirstResume:Z

    .line 184
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 185
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_3

    .line 187
    invoke-virtual {v0, v7}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 189
    :cond_3
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 342
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onDestroy()V

    .line 344
    iget-object v0, p0, Lcom/mediatek/settings/CallBarring;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarring;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 346
    return-void
.end method

.method public onFinished(Landroid/preference/Preference;Z)V
    .locals 6
    .parameter "preference"
    .parameter "reading"

    .prologue
    .line 259
    iget v3, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    iget-object v4, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_0

    .line 260
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget v4, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallBarringBasePreference;

    .line 261
    .local v0, cb:Lcom/mediatek/settings/CallBarringBasePreference;
    invoke-virtual {v0}, Lcom/mediatek/settings/CallBarringBasePreference;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 262
    iget v3, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    .line 264
    const-string v3, "Settings/CallBarring"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onFinished() is called (init part) mInitIndex is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "is reading?  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    iget v4, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/preference/Preference;

    .line 268
    .local v2, p:Landroid/preference/Preference;
    invoke-direct {p0, v2}, Lcom/mediatek/settings/CallBarring;->doGetCallState(Landroid/preference/Preference;)V

    .line 276
    .end local v0           #cb:Lcom/mediatek/settings/CallBarringBasePreference;
    .end local v2           #p:Landroid/preference/Preference;
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onFinished(Landroid/preference/Preference;Z)V

    .line 277
    return-void

    .line 270
    .restart local v0       #cb:Lcom/mediatek/settings/CallBarringBasePreference;
    :cond_1
    iget v1, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    .local v1, i:I
    :goto_1
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 271
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/preference/Preference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 270
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 273
    :cond_2
    iget-object v3, p0, Lcom/mediatek/settings/CallBarring;->mPreferences:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    iput v3, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 203
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 204
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 211
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 206
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarring;->finish()V

    .line 207
    const/4 v1, 0x1

    goto :goto_0

    .line 204
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 192
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onResume()V

    .line 193
    iget-boolean v0, p0, Lcom/mediatek/settings/CallBarring;->mFirstResume:Z

    if-eqz v0, :cond_1

    .line 194
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/CallBarring;->mFirstResume:Z

    .line 195
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarring;->startUpdate()V

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMmiFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 197
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarring;->startUpdate()V

    goto :goto_0
.end method

.method public resetIndex(I)V
    .locals 0
    .parameter "i"

    .prologue
    .line 338
    iput p1, p0, Lcom/mediatek/settings/CallBarring;->mInitIndex:I

    .line 339
    return-void
.end method

.method public setErrorState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 334
    iput p1, p0, Lcom/mediatek/settings/CallBarring;->mErrorState:I

    .line 335
    return-void
.end method
