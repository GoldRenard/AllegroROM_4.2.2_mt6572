.class public Lcom/mediatek/phone/VoicemailDialog;
.super Landroid/app/Activity;
.source "VoicemailDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final SLEEPTIME:I = 0x5dc

.field private static final TAG:Ljava/lang/String; = "VoicemailDialog"


# instance fields
.field private mIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private getSimId(I)J
    .locals 3
    .parameter "slot"

    .prologue
    .line 99
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 101
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    .line 102
    iget-wide v1, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    .line 104
    :goto_0
    return-wide v1

    :cond_0
    const-wide/16 v1, -0x1

    goto :goto_0
.end method


# virtual methods
.method public getSimInfo(Landroid/content/Context;J)Ljava/lang/CharSequence;
    .locals 15
    .parameter "context"
    .parameter "simId"

    .prologue
    .line 108
    const-string v11, "VoicemailDialog"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "getSimInfo simId = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-wide/from16 v0, p2

    invoke-virtual {v12, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-static/range {p1 .. p3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v10

    .line 112
    .local v10, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v10, :cond_1

    .line 113
    iget-object v8, v10, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    .line 115
    .local v8, displayName:Ljava/lang/String;
    const-string v11, "VoicemailDialog"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "== SIMInfo simId="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-wide v13, v10, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " mDisplayName="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->getBaseContext()Landroid/content/Context;

    move-result-object v11

    const v12, 0x7f0d00a8

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 118
    .local v5, dialogText:Ljava/lang/String;
    if-nez v8, :cond_0

    .line 150
    .end local v5           #dialogText:Ljava/lang/String;
    .end local v8           #displayName:Ljava/lang/String;
    :goto_0
    return-object v5

    .line 122
    .restart local v5       #dialogText:Ljava/lang/String;
    .restart local v8       #displayName:Ljava/lang/String;
    :cond_0
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 133
    .local v6, dialogTextBuf:Landroid/text/SpannableStringBuilder;
    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 134
    .local v2, bgBeginPos:I
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    add-int v3, v2, v11

    .line 136
    .local v3, bgEndPos:I
    iget v4, v10, Landroid/provider/Telephony$SIMInfo;->mSimBackgroundRes:I

    .line 137
    .local v4, colorRes:I
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    iget v12, v10, Landroid/provider/Telephony$SIMInfo;->mSimBackgroundRes:I

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 138
    .local v9, drawable:Landroid/graphics/drawable/Drawable;
    new-instance v11, Lcom/mediatek/text/style/BackgroundImageSpan;

    iget v12, v10, Landroid/provider/Telephony$SIMInfo;->mSimBackgroundRes:I

    invoke-direct {v11, v12, v9}, Lcom/mediatek/text/style/BackgroundImageSpan;-><init>(ILandroid/graphics/drawable/Drawable;)V

    const/16 v12, 0x21

    invoke-virtual {v6, v11, v2, v3, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 142
    new-instance v11, Landroid/text/style/ForegroundColorSpan;

    const-string v12, "#ffffffff"

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v12

    invoke-direct {v11, v12}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v12, 0x21

    invoke-virtual {v6, v11, v2, v3, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 144
    new-instance v11, Landroid/text/style/StyleSpan;

    const/4 v12, 0x1

    invoke-direct {v11, v12}, Landroid/text/style/StyleSpan;-><init>(I)V

    const/16 v12, 0x21

    invoke-virtual {v6, v11, v2, v3, v12}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    move-object v5, v6

    .line 146
    goto :goto_0

    .line 148
    .end local v2           #bgBeginPos:I
    .end local v3           #bgEndPos:I
    .end local v4           #colorRes:I
    .end local v5           #dialogText:Ljava/lang/String;
    .end local v6           #dialogTextBuf:Landroid/text/SpannableStringBuilder;
    .end local v8           #displayName:Ljava/lang/String;
    .end local v9           #drawable:Landroid/graphics/drawable/Drawable;
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->getBaseContext()Landroid/content/Context;

    move-result-object v11

    const v12, 0x7f0d00a8

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, ""

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .local v7, dialogTextNoSimInfo:Ljava/lang/String;
    move-object v5, v7

    .line 150
    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 155
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 182
    :goto_0
    return-void

    .line 157
    :pswitch_0
    const-string v5, "VoicemailDialog"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onClick() intent"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/phone/VoicemailDialog;->mIntent:Landroid/content/Intent;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    iget-object v5, p0, Lcom/mediatek/phone/VoicemailDialog;->mIntent:Landroid/content/Intent;

    const-string v6, "voicemail_number"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 159
    .local v2, number:Ljava/lang/String;
    const-string v5, "VoicemailDialog"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onClick() number"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    const-string v5, "voicemail"

    const/4 v6, 0x0

    invoke-static {v5, v2, v6}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 162
    .local v3, numberUri:Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.DIAL"

    invoke-direct {v1, v5, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 163
    .local v1, intentToDialer:Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/mediatek/phone/VoicemailDialog;->startActivity(Landroid/content/Intent;)V

    .line 165
    const-wide/16 v5, 0x5dc

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 170
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0d02ce

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 172
    .local v4, unkonwnVoicemail:Ljava/lang/String;
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    const/4 v6, 0x1

    invoke-static {v5, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 174
    .end local v4           #unkonwnVoicemail:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->finish()V

    goto :goto_0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v5, "VoicemailDialog"

    const-string v6, "onClick() InterruptedException"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 177
    .end local v0           #e:Ljava/lang/InterruptedException;
    .end local v1           #intentToDialer:Landroid/content/Intent;
    .end local v2           #number:Ljava/lang/String;
    .end local v3           #numberUri:Landroid/net/Uri;
    :pswitch_1
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->finish()V

    goto :goto_0

    .line 155
    :pswitch_data_0
    .packed-switch 0x7f080109
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .parameter "icicle"

    .prologue
    const/4 v13, -0x1

    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->requestWindowFeature(I)Z

    .line 40
    const v10, 0x7f04003e

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->setContentView(I)V

    .line 42
    const v10, 0x7f0800b2

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 43
    .local v1, imageIcon:Landroid/widget/ImageView;
    const v10, 0x7f0200b3

    invoke-virtual {v1, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 44
    const v10, 0x7f0800ae

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 45
    .local v8, title:Landroid/widget/TextView;
    const v10, 0x7f0d001a

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(I)V

    .line 46
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->getWindow()Landroid/view/Window;

    move-result-object v9

    .line 47
    .local v9, window:Landroid/view/Window;
    const v10, 0x7f080107

    invoke-virtual {v9, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 48
    .local v2, mMessageView:Landroid/widget/TextView;
    const v10, 0x7f080109

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 49
    .local v3, okButton:Landroid/widget/Button;
    const v10, 0x7f08010a

    invoke-virtual {p0, v10}, Lcom/mediatek/phone/VoicemailDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 51
    .local v0, cancelButton:Landroid/widget/Button;
    invoke-virtual {p0}, Lcom/mediatek/phone/VoicemailDialog;->getIntent()Landroid/content/Intent;

    move-result-object v10

    iput-object v10, p0, Lcom/mediatek/phone/VoicemailDialog;->mIntent:Landroid/content/Intent;

    .line 52
    iget-object v10, p0, Lcom/mediatek/phone/VoicemailDialog;->mIntent:Landroid/content/Intent;

    const-string v11, "simId"

    invoke-virtual {v10, v11, v13}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 53
    .local v7, slotId:I
    const-string v10, "VoicemailDialog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "==============================================get slotId = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const-wide/16 v4, -0x1

    .line 82
    .local v4, simId:J
    const/4 v6, 0x0

    .line 83
    .local v6, simName:Ljava/lang/CharSequence;
    if-le v7, v13, :cond_0

    .line 84
    invoke-direct {p0, v7}, Lcom/mediatek/phone/VoicemailDialog;->getSimId(I)J

    move-result-wide v4

    .line 85
    const-string v10, "VoicemailDialog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "==============================================get simId = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {p0, v10, v4, v5}, Lcom/mediatek/phone/VoicemailDialog;->getSimInfo(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object v6

    .line 87
    const-string v10, "VoicemailDialog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "==============================================get simName = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :cond_0
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    return-void
.end method
