.class public Lcom/mediatek/oobe/basic/KeyboardSetupActivity;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "KeyboardSetupActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final ACTION_INPUT_METHOD_SETTING:Ljava/lang/String; = "com.mediatek.ime.INPUT_METHOD_SELECTION_WIZARD"

.field private static final MTK_INPUT_METHOD:Ljava/lang/String; = "com.mediatek.ime/.MtkIME"

.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mInputMethodMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mInputMethodProperties:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/inputmethod/InputMethodInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastInputMethodId:Ljava/lang/String;

.field private mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

.field final mStringColonSplitter:Landroid/text/TextUtils$SimpleStringSplitter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodMaps:Ljava/util/HashMap;

    .line 69
    new-instance v0, Landroid/text/TextUtils$SimpleStringSplitter;

    const/16 v1, 0x3a

    invoke-direct {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mStringColonSplitter:Landroid/text/TextUtils$SimpleStringSplitter;

    return-void
.end method

.method private initInputMethods()V
    .locals 11

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "default_input_method"

    invoke-static {v8, v9}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastInputMethodId:Ljava/lang/String;

    .line 92
    const-string v8, "input_method"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 93
    .local v2, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v2}, Landroid/view/inputmethod/InputMethodManager;->getEnabledInputMethodList()Ljava/util/List;

    move-result-object v8

    iput-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodProperties:Ljava/util/List;

    .line 94
    iget-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodProperties:Ljava/util/List;

    if-nez v8, :cond_2

    const/4 v4, 0x0

    .line 96
    .local v4, nCount:I
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v4, :cond_3

    .line 97
    iget-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodProperties:Ljava/util/List;

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/inputmethod/InputMethodInfo;

    .line 98
    .local v6, property:Landroid/view/inputmethod/InputMethodInfo;
    invoke-virtual {v6}, Landroid/view/inputmethod/InputMethodInfo;->getId()Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, id:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/view/inputmethod/InputMethodInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 100
    .local v3, label:Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodMaps:Ljava/util/HashMap;

    invoke-virtual {v8, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const-string v7, ""

    .line 105
    .local v7, summary:Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->isMTKIme(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 106
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090061

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 109
    :cond_0
    new-instance v5, Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, p0, v8, v7}, Lcom/mediatek/oobe/utils/RadioButtonPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .local v5, pref:Lcom/mediatek/oobe/utils/RadioButtonPreference;
    invoke-virtual {v5, v1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setNote(Ljava/lang/String;)V

    .line 111
    iget-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastInputMethodId:Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 112
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 113
    iput-object v5, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    .line 115
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 94
    .end local v0           #i:I
    .end local v1           #id:Ljava/lang/String;
    .end local v3           #label:Ljava/lang/CharSequence;
    .end local v4           #nCount:I
    .end local v5           #pref:Lcom/mediatek/oobe/utils/RadioButtonPreference;
    .end local v6           #property:Landroid/view/inputmethod/InputMethodInfo;
    .end local v7           #summary:Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mInputMethodProperties:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v4

    goto :goto_0

    .line 118
    .restart local v0       #i:I
    .restart local v4       #nCount:I
    :cond_3
    const-string v8, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Default Input method: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastInputMethodId:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    return-void
.end method

.method private isMTKIme(Ljava/lang/String;)Z
    .locals 1
    .parameter "imeString"

    .prologue
    .line 122
    const-string v0, "com.mediatek.ime/.MtkIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private selectIME(Lcom/mediatek/oobe/utils/RadioButtonPreference;)V
    .locals 5
    .parameter "pref"

    .prologue
    .line 135
    iget-object v1, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    if-eqz v1, :cond_1

    .line 136
    iget-object v1, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    if-ne v1, p1, :cond_0

    .line 158
    :goto_0
    return-void

    .line 139
    :cond_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 142
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 143
    iput-object p1, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastSelectedPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    .line 146
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 147
    .local v0, imm2:Landroid/view/inputmethod/InputMethodManager;
    const-string v1, "android.permission.WRITE_SECURE_SETTINGS"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 149
    const-string v1, "OOBE"

    const-string v2, "myActivity requires permission android.permission.WRITE_SECURE_SETTINGS"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :goto_1
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "After selected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "default_input_method"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 151
    :cond_2
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Select IME is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->getNote()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->getNote()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->setInputMethod(Landroid/os/IBinder;Ljava/lang/String;)V

    .line 153
    invoke-virtual {p1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->getNote()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastInputMethodId:Ljava/lang/String;

    goto :goto_1
.end method

.method private startMTKIMESetting()V
    .locals 3

    .prologue
    .line 180
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 181
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.ime.INPUT_METHOD_SELECTION_WIZARD"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    const-string v1, "oobe_step_total"

    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mTotalStep:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 183
    const-string v1, "oobe_step_index"

    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 184
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 185
    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    const-string v0, "KeyboardSetupActivity"

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    const/16 v2, 0x14

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "KeyboardSetupActivity onActivityResult: resultCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/OOBEConstants;->logd(Ljava/lang/String;)V

    .line 191
    const/16 v0, 0x15

    if-ne v0, p2, :cond_1

    .line 192
    const-string v0, "OOBE"

    const-string v1, "back request"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    if-ne v2, p2, :cond_0

    .line 194
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->finishActivityByResultCode(I)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 74
    const-string v0, "OOBE"

    const-string v1, "OnCreate KeyboardSetupActivity"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v0, 0x7f050004

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->addPreferencesFromResource(I)V

    .line 80
    const v0, 0x7f09004f

    const v1, 0x7f090050

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->initSpecialLayout(II)V

    .line 81
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->initInputMethods()V

    .line 82
    return-void
.end method

.method public onNextStep(Z)V
    .locals 2
    .parameter "isNext"

    .prologue
    .line 162
    if-nez p1, :cond_0

    .line 163
    const-string v0, "OOBE"

    const-string v1, "Back to former settings"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->finishActivityByResultCode(I)V

    .line 177
    :goto_0
    return-void

    .line 166
    :cond_0
    const-string v0, "OOBE"

    const-string v1, "Forward to next settings"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    iget-boolean v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mLastStep:Z

    if-eqz v0, :cond_1

    .line 168
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->finishActivityByResultCode(I)V

    goto :goto_0

    .line 170
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->mLastInputMethodId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->isMTKIme(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 171
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->startMTKIMESetting()V

    goto :goto_0

    .line 173
    :cond_2
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->finishActivityByResultCode(I)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 127
    instance-of v0, p2, Lcom/mediatek/oobe/utils/RadioButtonPreference;

    if-eqz v0, :cond_0

    .line 128
    check-cast p2, Lcom/mediatek/oobe/utils/RadioButtonPreference;

    .end local p2
    invoke-direct {p0, p2}, Lcom/mediatek/oobe/basic/KeyboardSetupActivity;->selectIME(Lcom/mediatek/oobe/utils/RadioButtonPreference;)V

    .line 130
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
