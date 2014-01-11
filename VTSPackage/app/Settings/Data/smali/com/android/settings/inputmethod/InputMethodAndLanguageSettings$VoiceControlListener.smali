.class Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;
.super Ljava/lang/Object;
.source "InputMethodAndLanguageSettings.java"

# interfaces
.implements Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceControlListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;


# direct methods
.method private constructor <init>(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;-><init>(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)V

    return-void
.end method


# virtual methods
.method public onBeforeCheckedChanged(Z)Z
    .locals 6
    .parameter "isChecked"

    .prologue
    const/4 v2, 0x1

    .line 182
    const-string v3, "InputMethodAndLanguageSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onBeforeCheckedChanged isChecked = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    iget-object v3, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    iget-object v4, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v4

    #calls: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->isAllDisabled(Ljava/util/HashMap;)Z
    invoke-static {v3, v4}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$300(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;Ljava/util/HashMap;)Z

    move-result v1

    .line 185
    .local v1, isRemoteDataOff:Z
    iget-object v3, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    iget-object v4, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$400(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v4

    #calls: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->isAllDisabled(Ljava/util/HashMap;)Z
    invoke-static {v3, v4}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$300(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;Ljava/util/HashMap;)Z

    move-result v0

    .line 186
    .local v0, isLocaleDataOff:Z
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 187
    const-string v3, "InputMethodAndLanguageSettings"

    const-string v4, "can\'t open switch, because all is off"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    if-nez p1, :cond_1

    .line 194
    :cond_0
    :goto_0
    return v2

    .line 192
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onCheckedChanged(Z)V
    .locals 11
    .parameter "isChecked"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 141
    const-string v6, "InputMethodAndLanguageSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onCheckedChanged isChecked = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    const-string v6, "InputMethodAndLanguageSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onCheckedChanged mVoiceUiEnaber = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mVoiceUiEnaber:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;
    invoke-static {v10}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$100(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->isChecked()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    invoke-virtual {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "voice_control_enabled"

    if-eqz p1, :cond_0

    move v6, v7

    :goto_0
    invoke-static {v9, v10, v6}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 146
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    iget-object v9, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v9}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v9

    #calls: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->isAllDisabled(Ljava/util/HashMap;)Z
    invoke-static {v6, v9}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$300(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;Ljava/util/HashMap;)Z

    move-result v2

    .line 147
    .local v2, isAllOff:Z
    const-string v6, "InputMethodAndLanguageSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "isAllOff="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    if-nez p1, :cond_1

    move v6, v7

    :goto_1
    if-ne v2, v6, :cond_2

    .line 178
    :goto_2
    return-void

    .end local v2           #isAllOff:Z
    :cond_0
    move v6, v8

    .line 144
    goto :goto_0

    .restart local v2       #isAllOff:Z
    :cond_1
    move v6, v8

    .line 148
    goto :goto_1

    .line 152
    :cond_2
    if-nez p1, :cond_4

    .line 154
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 155
    .local v3, key:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_3

    .line 156
    const-string v6, "InputMethodAndLanguageSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "status is unchecked, disable process name: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 162
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #key:Ljava/lang/String;
    :cond_4
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$400(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_5
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 163
    .restart local v3       #key:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$400(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_5

    .line 164
    const-string v6, "InputMethodAndLanguageSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "status is checked, enable process name: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 170
    .end local v3           #key:Ljava/lang/String;
    :cond_6
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 171
    .local v4, procs:[Ljava/lang/String;
    array-length v6, v4

    new-array v5, v6, [I

    .line 172
    .local v5, values:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_5
    array-length v6, v4

    if-ge v0, v6, :cond_7

    .line 173
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #getter for: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->mRawData:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$200(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;)Ljava/util/HashMap;

    move-result-object v6

    aget-object v7, v4, v0

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v5, v0

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 175
    :cond_7
    iget-object v6, p0, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings$VoiceControlListener;->this$0:Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;

    #calls: Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->setApps([Ljava/lang/String;[I)V
    invoke-static {v6, v4, v5}, Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;->access$500(Lcom/android/settings/inputmethod/InputMethodAndLanguageSettings;[Ljava/lang/String;[I)V

    .line 176
    const-string v7, "InputMethodAndLanguageSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "update values "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz p1, :cond_8

    const-string v6, "on "

    :goto_6
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_8
    const-string v6, "off "

    goto :goto_6
.end method
