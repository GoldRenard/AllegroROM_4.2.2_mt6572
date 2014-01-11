.class public Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;
.super Landroid/preference/DialogPreference;
.source "NumberPickerPreference.java"


# instance fields
.field private mDefault:I

.field private mMax:I

.field private mMaxExternalKey:Ljava/lang/String;

.field private mMin:I

.field private mMinExternalKey:Ljava/lang/String;

.field private mNumberPicker:Landroid/widget/NumberPicker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v3, 0x0

    .line 45
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    sget-object v2, Lcom/android/internal/R$styleable;->DialogPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 48
    .local v0, dialogType:Landroid/content/res/TypedArray;
    sget-object v2, Lcom/cyanogenmod/trebuchet/R$styleable;->NumberPickerPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 51
    .local v1, numberPickerType:Landroid/content/res/TypedArray;
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMaxExternalKey:Ljava/lang/String;

    .line 52
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMinExternalKey:Ljava/lang/String;

    .line 54
    const/4 v2, 0x5

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMax:I

    .line 55
    const/4 v2, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMin:I

    .line 57
    const/16 v2, 0xb

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMin:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mDefault:I

    .line 59
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 61
    return-void
.end method


# virtual methods
.method protected onCreateDialogView()Landroid/view/View;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 65
    iget v1, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMax:I

    .line 66
    .local v1, max:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMin:I

    .line 69
    .local v2, min:I
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMaxExternalKey:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMaxExternalKey:Ljava/lang/String;

    iget v7, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMax:I

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 72
    :cond_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMinExternalKey:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 73
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMinExternalKey:Ljava/lang/String;

    iget v7, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mMin:I

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 76
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "layout_inflater"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 78
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v5, 0x7f040016

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 80
    .local v4, view:Landroid/view/View;
    const v5, 0x7f070037

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/NumberPicker;

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    .line 83
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v5, v1}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 84
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v5, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 85
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    iget v6, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mDefault:I

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->getPersistedInt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 86
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v5, v8}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 89
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    const v6, 0x1020341

    invoke-virtual {v5, v6}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 90
    .local v3, textInput:Landroid/widget/EditText;
    invoke-virtual {v3, v8}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 91
    invoke-virtual {v3, v8}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 92
    invoke-virtual {v3, v8}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 94
    return-object v4
.end method

.method protected onDialogClosed(Z)V
    .locals 1
    .parameter "positiveResult"

    .prologue
    .line 99
    if-eqz p1, :cond_0

    .line 100
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->mNumberPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v0}, Landroid/widget/NumberPicker;->getValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/preference/NumberPickerPreference;->persistInt(I)Z

    .line 102
    :cond_0
    return-void
.end method
