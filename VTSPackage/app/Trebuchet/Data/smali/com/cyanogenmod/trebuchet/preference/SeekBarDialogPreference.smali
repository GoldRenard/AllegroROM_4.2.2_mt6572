.class public Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;
.super Landroid/preference/DialogPreference;
.source "SeekBarDialogPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field private mDefault:I

.field private mMax:I

.field private mMin:I

.field private mPrefix:Ljava/lang/String;

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mSuffix:Ljava/lang/String;

.field private mValueText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v3, 0x0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    sget-object v2, Lcom/android/internal/R$styleable;->DialogPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 29
    .local v0, dialogType:Landroid/content/res/TypedArray;
    sget-object v2, Lcom/cyanogenmod/trebuchet/R$styleable;->SeekBarDialogPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 32
    .local v1, seekBarType:Landroid/content/res/TypedArray;
    const/16 v2, 0x64

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMax:I

    .line 33
    const/4 v2, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    .line 35
    const/16 v2, 0xb

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mDefault:I

    .line 37
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mPrefix:Ljava/lang/String;

    .line 38
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSuffix:Ljava/lang/String;

    .line 39
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mPrefix:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 40
    const-string v2, ""

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mPrefix:Ljava/lang/String;

    .line 42
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSuffix:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 43
    const-string v2, "%"

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSuffix:Ljava/lang/String;

    .line 46
    :cond_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 48
    return-void
.end method


# virtual methods
.method protected onCreateDialogView()Landroid/view/View;
    .locals 5

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 54
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f04001d

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 56
    .local v1, view:Landroid/view/View;
    const v2, 0x7f070040

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mValueText:Landroid/widget/TextView;

    .line 58
    const v2, 0x7f070041

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/SeekBar;

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSeekBar:Landroid/widget/SeekBar;

    .line 59
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v2, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 60
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSeekBar:Landroid/widget/SeekBar;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMax:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 61
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSeekBar:Landroid/widget/SeekBar;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mDefault:I

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->getPersistedInt(I)I

    move-result v3

    iget v4, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 63
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mValueText:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mDefault:I

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->getPersistedInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSuffix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    return-object v1
.end method

.method protected onDialogClosed(Z)V
    .locals 2
    .parameter "positiveResult"

    .prologue
    .line 77
    if-eqz p1, :cond_0

    .line 78
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->persistInt(I)Z

    .line 80
    :cond_0
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromUser"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mValueText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mMin:I

    add-int/2addr v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/SeekBarDialogPreference;->mSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 72
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 73
    return-void
.end method
