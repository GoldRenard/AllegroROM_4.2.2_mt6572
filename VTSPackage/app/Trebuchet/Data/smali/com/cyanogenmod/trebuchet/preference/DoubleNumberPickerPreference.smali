.class public Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;
.super Landroid/preference/DialogPreference;
.source "DoubleNumberPickerPreference.java"


# instance fields
.field private mDefault1:I

.field private mDefault2:I

.field private mMax1:I

.field private mMax2:I

.field private mMaxExternalKey1:Ljava/lang/String;

.field private mMaxExternalKey2:Ljava/lang/String;

.field private mMin1:I

.field private mMin2:I

.field private mMinExternalKey1:Ljava/lang/String;

.field private mMinExternalKey2:Ljava/lang/String;

.field private mNumberPicker1:Landroid/widget/NumberPicker;

.field private mNumberPicker2:Landroid/widget/NumberPicker;

.field private mPickerTitle1:Ljava/lang/String;

.field private mPickerTitle2:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x0

    .line 51
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    sget-object v2, Lcom/android/internal/R$styleable;->DialogPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 54
    .local v0, dialogType:Landroid/content/res/TypedArray;
    sget-object v2, Lcom/cyanogenmod/trebuchet/R$styleable;->DoubleNumberPickerPreference:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 57
    .local v1, doubleNumberPickerType:Landroid/content/res/TypedArray;
    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey1:Ljava/lang/String;

    .line 58
    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey1:Ljava/lang/String;

    .line 59
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey2:Ljava/lang/String;

    .line 60
    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey2:Ljava/lang/String;

    .line 62
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mPickerTitle1:Ljava/lang/String;

    .line 63
    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mPickerTitle2:Ljava/lang/String;

    .line 65
    const/4 v2, 0x2

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax1:I

    .line 66
    const/4 v2, 0x3

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin1:I

    .line 67
    const/4 v2, 0x4

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax2:I

    .line 68
    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin2:I

    .line 70
    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin1:I

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault1:I

    .line 71
    const/4 v2, 0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin2:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault2:I

    .line 73
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 74
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    return-void
.end method

.method private getPersistedValue(I)I
    .locals 5
    .parameter "value"

    .prologue
    const/4 v4, 0x1

    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault1:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault2:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, values:[Ljava/lang/String;
    if-ne p1, v4, :cond_0

    .line 147
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 155
    :goto_0
    return v2

    .line 148
    :catch_0
    move-exception v0

    .line 149
    .local v0, e:Ljava/lang/NumberFormatException;
    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault1:I

    goto :goto_0

    .line 153
    .end local v0           #e:Ljava/lang/NumberFormatException;
    :cond_0
    const/4 v2, 0x1

    :try_start_1
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    goto :goto_0

    .line 154
    :catch_1
    move-exception v0

    .line 155
    .restart local v0       #e:Ljava/lang/NumberFormatException;
    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault2:I

    goto :goto_0
.end method


# virtual methods
.method protected onCreateDialogView()Landroid/view/View;
    .locals 15

    .prologue
    const v14, 0x1020341

    const/4 v13, 0x0

    .line 79
    iget v1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax1:I

    .line 80
    .local v1, max1:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin1:I

    .line 81
    .local v3, min1:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax2:I

    .line 82
    .local v2, max2:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin2:I

    .line 85
    .local v4, min2:I
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey1:Ljava/lang/String;

    if-eqz v10, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v10

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey1:Ljava/lang/String;

    iget v12, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax1:I

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 88
    :cond_0
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey1:Ljava/lang/String;

    if-eqz v10, :cond_1

    .line 89
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v10

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey1:Ljava/lang/String;

    iget v12, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin1:I

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 91
    :cond_1
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey2:Ljava/lang/String;

    if-eqz v10, :cond_2

    .line 92
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v10

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMaxExternalKey2:Ljava/lang/String;

    iget v12, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax2:I

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 94
    :cond_2
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey2:Ljava/lang/String;

    if-eqz v10, :cond_3

    .line 95
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v10

    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMinExternalKey2:Ljava/lang/String;

    iget v12, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin2:I

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 98
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v10

    const-string v11, "layout_inflater"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 100
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v10, 0x7f04000b

    const/4 v11, 0x0

    invoke-virtual {v0, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 102
    .local v9, view:Landroid/view/View;
    const v10, 0x7f07001b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/NumberPicker;

    iput-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    .line 103
    const v10, 0x7f07001d

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/NumberPicker;

    iput-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    .line 105
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    if-nez v10, :cond_5

    .line 106
    :cond_4
    new-instance v10, Ljava/lang/RuntimeException;

    const-string v11, "mNumberPicker1 or mNumberPicker2 is null!"

    invoke-direct {v10, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 110
    :cond_5
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v13}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 111
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v1}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 112
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v3}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 113
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    const/4 v11, 0x1

    invoke-direct {p0, v11}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getPersistedValue(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 114
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v13}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 115
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 116
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v4}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 117
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    const/4 v11, 0x2

    invoke-direct {p0, v11}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->getPersistedValue(I)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 120
    const v10, 0x7f07001a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 121
    .local v5, pickerTitle1:Landroid/widget/TextView;
    const v10, 0x7f07001c

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 123
    .local v6, pickerTitle2:Landroid/widget/TextView;
    if-eqz v5, :cond_6

    if-eqz v6, :cond_6

    .line 124
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mPickerTitle1:Ljava/lang/String;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mPickerTitle2:Ljava/lang/String;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    :cond_6
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v14}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 130
    .local v7, textInput1:Landroid/widget/EditText;
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    invoke-virtual {v10, v14}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 131
    .local v8, textInput2:Landroid/widget/EditText;
    if-eqz v7, :cond_7

    if-eqz v8, :cond_7

    .line 132
    invoke-virtual {v7, v13}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 133
    invoke-virtual {v7, v13}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 134
    invoke-virtual {v7, v13}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 135
    invoke-virtual {v8, v13}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 136
    invoke-virtual {v8, v13}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 137
    invoke-virtual {v8, v13}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 140
    :cond_7
    return-object v9
.end method

.method protected onDialogClosed(Z)V
    .locals 2
    .parameter "positiveResult"

    .prologue
    .line 162
    if-eqz p1, :cond_0

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker1:Landroid/widget/NumberPicker;

    invoke-virtual {v1}, Landroid/widget/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mNumberPicker2:Landroid/widget/NumberPicker;

    invoke-virtual {v1}, Landroid/widget/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->persistString(Ljava/lang/String;)Z

    .line 165
    :cond_0
    return-void
.end method

.method public setDefault1(I)V
    .locals 0
    .parameter "def"

    .prologue
    .line 180
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault1:I

    .line 181
    return-void
.end method

.method public setDefault2(I)V
    .locals 0
    .parameter "def"

    .prologue
    .line 183
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mDefault2:I

    .line 184
    return-void
.end method

.method public setMax1(I)V
    .locals 0
    .parameter "max"

    .prologue
    .line 171
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax1:I

    .line 172
    return-void
.end method

.method public setMax2(I)V
    .locals 0
    .parameter "max"

    .prologue
    .line 177
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMax2:I

    .line 178
    return-void
.end method

.method public setMin1(I)V
    .locals 0
    .parameter "min"

    .prologue
    .line 168
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin1:I

    .line 169
    return-void
.end method

.method public setMin2(I)V
    .locals 0
    .parameter "min"

    .prologue
    .line 174
    iput p1, p0, Lcom/cyanogenmod/trebuchet/preference/DoubleNumberPickerPreference;->mMin2:I

    .line 175
    return-void
.end method
