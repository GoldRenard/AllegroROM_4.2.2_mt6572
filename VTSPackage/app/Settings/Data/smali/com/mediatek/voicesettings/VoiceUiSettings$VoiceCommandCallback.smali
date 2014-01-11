.class Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;
.super Lcom/mediatek/common/voicecommand/VoiceCommandListener;
.source "VoiceUiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/voicesettings/VoiceUiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceCommandCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;


# direct methods
.method public constructor <init>(Lcom/mediatek/voicesettings/VoiceUiSettings;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "context"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    .line 106
    invoke-direct {p0, p2}, Lcom/mediatek/common/voicecommand/VoiceCommandListener;-><init>(Landroid/content/Context;)V

    .line 107
    return-void
.end method


# virtual methods
.method public onVoiceCommandNotified(IILandroid/os/Bundle;)V
    .locals 9
    .parameter "mainAction"
    .parameter "subAction"
    .parameter "extraData"

    .prologue
    const/4 v8, 0x1

    .line 110
    const-string v5, "Result"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 111
    .local v4, result:I
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " VoiceCommandListener subAction="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " result="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    packed-switch p2, :pswitch_data_0

    .line 144
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "never should here, maybe error subAction="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 114
    :pswitch_0
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #calls: Lcom/mediatek/voicesettings/VoiceUiSettings;->handleVoiceUiApps(ILandroid/os/Bundle;)V
    invoke-static {v5, v4, p3}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$000(Lcom/mediatek/voicesettings/VoiceUiSettings;ILandroid/os/Bundle;)V

    goto :goto_0

    .line 118
    :pswitch_1
    const-string v6, "VoiceUiSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Voice settings for apps is "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-ne v4, v8, :cond_1

    const-string v5, "ok"

    :goto_1
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v5, "error"

    goto :goto_1

    .line 121
    :pswitch_2
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #calls: Lcom/mediatek/voicesettings/VoiceUiSettings;->handleSupportLanguageList(ILandroid/os/Bundle;)V
    invoke-static {v5, v4, p3}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$100(Lcom/mediatek/voicesettings/VoiceUiSettings;ILandroid/os/Bundle;)V

    goto :goto_0

    .line 125
    :pswitch_3
    const-string v6, "VoiceUiSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Voice language changed is "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-ne v4, v8, :cond_2

    const-string v5, "ok"

    :goto_2
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Current Language: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;
    invoke-static {v7}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$200(Lcom/mediatek/voicesettings/VoiceUiSettings;)[Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I
    invoke-static {v8}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$300(Lcom/mediatek/voicesettings/VoiceUiSettings;)I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;
    invoke-static {v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$400(Lcom/mediatek/voicesettings/VoiceUiSettings;)Landroid/preference/Preference;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;
    invoke-static {v6}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$200(Lcom/mediatek/voicesettings/VoiceUiSettings;)[Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I
    invoke-static {v7}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$300(Lcom/mediatek/voicesettings/VoiceUiSettings;)I

    move-result v7

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 125
    :cond_2
    const-string v5, "error"

    goto :goto_2

    .line 130
    :pswitch_4
    const-string v5, "VoiceUiSettings"

    const-string v6, "keyword path get ok"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    if-ne v4, v8, :cond_0

    .line 132
    const-string v5, "Result_Info"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, fileName:Ljava/lang/String;
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "get keywords file name :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    new-instance v0, Lcom/mediatek/voicesettings/VoiceUiUtils;

    invoke-direct {v0}, Lcom/mediatek/voicesettings/VoiceUiUtils;-><init>()V

    .line 135
    .local v0, cfgReader:Lcom/mediatek/voicesettings/VoiceUiUtils;
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v0, v5, v1}, Lcom/mediatek/voicesettings/VoiceUiUtils;->readKeyWordFromXml(Ljava/util/HashMap;Ljava/lang/String;)V

    .line 136
    const-string v5, "VoiceUiSettings"

    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 138
    .local v3, key:Ljava/lang/String;
    const-string v6, "VoiceUiSettings"

    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 140
    .end local v3           #key:Ljava/lang/String;
    :cond_3
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;->this$0:Lcom/mediatek/voicesettings/VoiceUiSettings;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;
    invoke-static {v6}, Lcom/mediatek/voicesettings/VoiceUiSettings;->access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/mediatek/voicesettings/VoiceUiSettings;->updateKeywordsSummary(Ljava/util/HashMap;)V

    goto/16 :goto_0

    .line 112
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
