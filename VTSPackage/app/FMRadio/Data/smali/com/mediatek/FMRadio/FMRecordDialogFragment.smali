.class public Lcom/mediatek/FMRadio/FMRecordDialogFragment;
.super Landroid/app/DialogFragment;
.source "FMRecordDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    }
.end annotation


# static fields
.field private static final RECORDING_CHECKFILENAME:Ljava/lang/String; = "recordingcheckfileName"

.field private static final RECORDING_DEFAULTNAME:Ljava/lang/String; = "recordingName"

.field private static final RECORDING_TOSAVANAME:Ljava/lang/String; = "recordingToSavaName"

.field private static final TAG:Ljava/lang/String; = "FmRx/RecordDlg"


# instance fields
.field private mButtonDiscard:Landroid/widget/Button;

.field private mButtonOnClickListener:Landroid/view/View$OnClickListener;

.field private mButtonSave:Landroid/widget/Button;

.field private mDefaultRecordingName:Ljava/lang/String;

.field private mDivider:Landroid/view/View;

.field private mIsNeedCheckFilenameExist:Z

.field private mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

.field private mRecordingNameEditText:Landroid/widget/EditText;

.field private mRecordingNameToSave:Ljava/lang/String;

.field private mStorageWarningTextView:Landroid/widget/TextView;

.field private mTitleTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 86
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 69
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    .line 70
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonDiscard:Landroid/widget/Button;

    .line 71
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    .line 72
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    .line 73
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    .line 74
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDivider:Landroid/view/View;

    .line 75
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mTitleTextView:Landroid/widget/TextView;

    .line 76
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mStorageWarningTextView:Landroid/widget/TextView;

    .line 77
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    .line 265
    new-instance v0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;-><init>(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonOnClickListener:Landroid/view/View$OnClickListener;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "name"

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 69
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    .line 70
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonDiscard:Landroid/widget/Button;

    .line 71
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    .line 72
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    .line 73
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    .line 74
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDivider:Landroid/view/View;

    .line 75
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mTitleTextView:Landroid/widget/TextView;

    .line 76
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mStorageWarningTextView:Landroid/widget/TextView;

    .line 77
    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    .line 265
    new-instance v0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment$2;-><init>(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonOnClickListener:Landroid/view/View$OnClickListener;

    .line 95
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    .line 96
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/FMRadio/FMRecordDialogFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mediatek/FMRadio/FMRecordDialogFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    return-object v0
.end method

.method private checkRemainingStorage()Z
    .locals 11

    .prologue
    .line 331
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 332
    .local v5, sdPath:Ljava/lang/String;
    new-instance v4, Landroid/os/StatFs;

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 333
    .local v4, fs:Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v2, v8

    .line 334
    .local v2, blocks:J
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v8

    int-to-long v0, v8

    .line 335
    .local v0, blockSize:J
    mul-long v6, v2, v0

    .line 336
    .local v6, spaceLeft:J
    const-string v8, "FmRx/RecordDlg"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "checkRemainingStorage: available space="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    const-wide/32 v8, 0x80000

    cmp-long v8, v6, v8

    if-lez v8, :cond_0

    const/4 v8, 0x1

    :goto_0
    return v8

    :cond_0
    const/4 v8, 0x0

    goto :goto_0
.end method

.method private setTextChangedCallback()V
    .locals 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    new-instance v1, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;-><init>(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 263
    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 102
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 114
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 115
    const-string v0, "FmRx/RecordDlg"

    const-string v1, ">>onCreate()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->setStyle(II)V

    .line 118
    if-eqz p1, :cond_0

    .line 119
    const-string v0, "recordingName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    .line 120
    const-string v0, "recordingToSavaName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    .line 121
    const-string v0, "recordingcheckfileName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    .line 123
    :cond_0
    const-string v0, "FmRx/RecordDlg"

    const-string v1, "<<onCreate()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 136
    const v3, 0x7f030005

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 137
    .local v2, view:Landroid/view/View;
    const v3, 0x7f06001f

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    .line 138
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    const v3, 0x7f06001e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonDiscard:Landroid/widget/Button;

    .line 141
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonDiscard:Landroid/widget/Button;

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    const v3, 0x7f06001c

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mStorageWarningTextView:Landroid/widget/TextView;

    .line 147
    const v3, 0x7f06001d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    .line 148
    const v3, 0x7f06001a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDivider:Landroid/view/View;

    .line 149
    const v3, 0x7f060019

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mTitleTextView:Landroid/widget/TextView;

    .line 152
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 153
    .local v1, res:Landroid/content/res/Resources;
    invoke-virtual {v1}, Landroid/content/res/Resources;->getThemeMainColor()I

    move-result v0

    .line 154
    .local v0, color:I
    if-eqz v0, :cond_0

    .line 155
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mTitleTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDivider:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 159
    :cond_0
    return-object v2
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 223
    const-string v0, "FmRx/RecordDlg"

    const-string v1, ">>onDestroy()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    .line 225
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    .line 226
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mListener:Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;

    .line 227
    const-string v0, "FmRx/RecordDlg"

    const-string v1, "<<onDestroy()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroy()V

    .line 229
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 166
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 167
    const-string v0, "FmRx/RecordDlg"

    const-string v1, ">>onResume()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->checkRemainingStorage()Z

    move-result v0

    if-nez v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mStorageWarningTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 177
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 178
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 180
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 181
    const-string v0, ""

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 182
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 188
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 190
    :cond_2
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040039

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 192
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 193
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->setTextChangedCallback()V

    .line 194
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 195
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x24

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 198
    const-string v0, "FmRx/RecordDlg"

    const-string v1, "<<onResume()"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    return-void

    .line 185
    :cond_3
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4
    .parameter "outState"

    .prologue
    .line 203
    const-string v1, "FmRx/RecordDlg"

    const-string v2, ">>onSaveInstanceState()"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 206
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 207
    const-string v1, "recordingName"

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-string v1, "recordingcheckfileName"

    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 209
    const-string v1, "FmRx/RecordDlg"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDefaultRecordingName is:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mDefaultRecordingName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    .line 212
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    .line 213
    const-string v1, "recordingToSavaName"

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const-string v1, "FmRx/RecordDlg"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mRecordingNameToSave is:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mRecordingNameToSave:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    :cond_0
    const-string v1, "FmRx/RecordDlg"

    const-string v2, "<<onSaveInstanceState()"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 219
    return-void
.end method
