.class public Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;
.super Landroid/app/Activity;
.source "AdvanceSettingsEntrance.java"


# static fields
.field public static final ADVANCE_SETTING_END_ACTIVITY:Ljava/lang/String; = "com.mediatek.android.oobe.advanced.AdvanceSettingsEnd"

.field public static final OOBE_STEP_INDEX:Ljava/lang/String; = "oobe_step_index"

.field public static final OOBE_STEP_NEXT:Ljava/lang/String; = "oobe_step_next"

.field public static final OOBE_STEP_TOTAL:Ljava/lang/String; = "oobe_step_total"

.field public static final REQUEST_CODE:I = 0xa

.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mActivityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAdvanceSettingsIcon:Landroid/widget/ImageView;

.field private mBackBtn:Landroid/widget/Button;

.field private mCurrentIndex:I

.field private mIsGoToNextStep:Z

.field private mNextBtn:Landroid/widget/Button;

.field private mTotalStep:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 58
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 74
    iput v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    .line 75
    iput v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mIsGoToNextStep:Z

    return-void
.end method

.method static synthetic access$002(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    iput p1, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->goToNextSettings(Z)V

    return-void
.end method

.method private goToNextSettings(Z)V
    .locals 11
    .parameter "isNextStep"

    .prologue
    const v10, 0x7f040003

    const v9, 0x7f040002

    const v8, 0x7f040001

    const/high16 v7, 0x7f04

    const/16 v6, 0xa

    .line 199
    iput-boolean p1, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mIsGoToNextStep:Z

    .line 200
    if-eqz p1, :cond_0

    .line 201
    iget v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    .line 205
    :goto_0
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AdvanceSettingsEntrance.goToNextSettings("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "), current index="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    iget v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    if-gez v3, :cond_1

    .line 207
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AdvanceSettingsEntrance, mCurrentIndex="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", finish OOBE now"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const/16 v3, 0x16

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setResult(I)V

    .line 209
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    .line 244
    :goto_1
    return-void

    .line 203
    :cond_0
    iget v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    goto :goto_0

    .line 211
    :cond_1
    iget v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    if-nez v3, :cond_2

    .line 212
    const-string v3, "OOBE"

    const-string v4, "Stay on advance settings entrance page"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-virtual {p0, v7, v10}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->overridePendingTransition(II)V

    goto :goto_1

    .line 218
    :cond_2
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 219
    .local v1, intent:Landroid/content/Intent;
    iget v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    if-le v3, v4, :cond_3

    .line 220
    const-string v3, "oobe_step_total"

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 221
    const-string v3, "oobe_step_index"

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 222
    const-class v3, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 223
    invoke-virtual {p0, v1, v6}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->startActivityForResult(Landroid/content/Intent;I)V

    .line 224
    invoke-virtual {p0, v9, v8}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->overridePendingTransition(II)V

    goto :goto_1

    .line 227
    :cond_3
    iget-object v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 228
    .local v0, activityStr:Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 229
    .local v2, seperatorIndex:I
    if-lez v2, :cond_4

    .line 230
    new-instance v3, Landroid/content/ComponentName;

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 235
    :goto_2
    const-string v3, "oobe_step_total"

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 236
    const-string v3, "oobe_step_index"

    iget v4, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 237
    invoke-virtual {p0, v1, v6}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->startActivityForResult(Landroid/content/Intent;I)V

    .line 239
    iget-boolean v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mIsGoToNextStep:Z

    if-eqz v3, :cond_5

    .line 240
    invoke-virtual {p0, v9, v8}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->overridePendingTransition(II)V

    goto :goto_1

    .line 233
    :cond_4
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 242
    :cond_5
    invoke-virtual {p0, v7, v10}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->overridePendingTransition(II)V

    goto/16 :goto_1
.end method

.method private isHasSNS()Z
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 147
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/accounts/AccountManager;->getAuthenticatorTypes()[Landroid/accounts/AuthenticatorDescription;

    move-result-object v2

    .line 148
    .local v2, mAuthDescs:[Landroid/accounts/AuthenticatorDescription;
    if-eqz v2, :cond_0

    array-length v4, v2

    if-nez v4, :cond_1

    .line 158
    :cond_0
    :goto_0
    return v3

    .line 151
    :cond_1
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v4, v2

    if-ge v1, v4, :cond_0

    .line 152
    aget-object v4, v2, v1

    iget-object v0, v4, Landroid/accounts/AuthenticatorDescription;->type:Ljava/lang/String;

    .line 153
    .local v0, accountType:Ljava/lang/String;
    const-string v4, "OOBE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SNS account: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    const-string v4, "com.android.exchange"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "com.android.email"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 155
    const/4 v3, 0x1

    goto :goto_0

    .line 151
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 163
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 164
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AdvanceSettingsEntrance.onActivityResult, code="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  current index="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    packed-switch p2, :pswitch_data_0

    .line 177
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Enter default branch, where am I? result code = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrent Index="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    .line 183
    :cond_0
    :goto_0
    return-void

    .line 167
    :pswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->goToNextSettings(Z)V

    goto :goto_0

    .line 170
    :pswitch_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->goToNextSettings(Z)V

    goto :goto_0

    .line 173
    :pswitch_2
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setResult(I)V

    .line 174
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    goto :goto_0

    .line 165
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x0

    .line 86
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 87
    const v3, 0x7f030002

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setContentView(I)V

    .line 88
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    .line 90
    const/4 v3, 0x3

    new-array v0, v3, [Ljava/lang/String;

    const-string v3, "com.mediatek.oobe.advanced.SyncSettings"

    aput-object v3, v0, v2

    const/4 v3, 0x1

    const-string v4, "com.mediatek.oobe.advanced.AccountSettings"

    aput-object v4, v0, v3

    const/4 v3, 0x2

    const-string v4, "com.mediatek.oobe.advanced.SNSSettings"

    aput-object v4, v0, v3

    .line 93
    .local v0, allAdvancedSettingStep:[Ljava/lang/String;
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->isHasSNS()Z

    move-result v3

    if-nez v3, :cond_1

    .line 94
    const-string v3, "OOBE"

    const-string v4, "== No SNS type detected, remove SNS settings"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 96
    const-string v3, "com.mediatek.oobe.advanced.SNSSettings"

    aget-object v4, v0, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 99
    :cond_0
    iget-object v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    aget-object v4, v0, v1

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 102
    .end local v1           #i:I
    :cond_1
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_2
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 103
    iget-object v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    aget-object v4, v0, v1

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 107
    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    if-eqz v3, :cond_3

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mActivityList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :cond_3
    iput v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mTotalStep:I

    .line 109
    const v2, 0x7f0b0003

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mAdvanceSettingsIcon:Landroid/widget/ImageView;

    .line 110
    const v2, 0x7f0b0006

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mBackBtn:Landroid/widget/Button;

    .line 111
    const v2, 0x7f0b0007

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mNextBtn:Landroid/widget/Button;

    .line 113
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mNextBtn:Landroid/widget/Button;

    const v3, 0x7f09004a

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 115
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mAdvanceSettingsIcon:Landroid/widget/ImageView;

    new-instance v3, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;

    invoke-direct {v3, p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;-><init>(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mNextBtn:Landroid/widget/Button;

    new-instance v3, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$2;

    invoke-direct {v3, p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$2;-><init>(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mBackBtn:Landroid/widget/Button;

    new-instance v3, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;

    invoke-direct {v3, p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;-><init>(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 187
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 188
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setResult(I)V

    .line 189
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    .line 190
    const/4 v0, 0x1

    .line 192
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public quitAdvanceSettings()V
    .locals 2

    .prologue
    .line 141
    const-string v0, "OOBE"

    const-string v1, "Do not enter advance settings, just quit"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setResult(I)V

    .line 143
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    .line 144
    return-void
.end method
