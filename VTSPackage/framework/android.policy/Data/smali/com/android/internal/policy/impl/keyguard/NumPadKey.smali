.class public Lcom/android/internal/policy/impl/keyguard/NumPadKey;
.super Landroid/widget/Button;
.source "NumPadKey.java"


# static fields
.field static sKlondike:[Ljava/lang/String;


# instance fields
.field mDigit:I

.field mEnableHaptics:Z

.field private mListener:Landroid/view/View$OnClickListener;

.field mTextView:Landroid/widget/TextView;

.field mTextViewResId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v7, 0x0

    .line 69
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    .line 38
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mTextView:Landroid/widget/TextView;

    .line 41
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/keyguard/NumPadKey$1;-><init>(Lcom/android/internal/policy/impl/keyguard/NumPadKey;)V

    iput-object v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mListener:Landroid/view/View$OnClickListener;

    .line 71
    sget-object v4, Lcom/android/internal/R$styleable;->NumPadKey:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 72
    .local v0, a:Landroid/content/res/TypedArray;
    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    invoke-virtual {v0, v7, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    .line 73
    const/4 v4, 0x1

    invoke-virtual {v0, v4, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->setTextViewResId(I)V

    .line 75
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/LiftToActivateListener;

    invoke-direct {v4, p1}, Lcom/android/internal/policy/impl/keyguard/LiftToActivateListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    .line 77
    new-instance v4, Lcom/android/internal/policy/impl/keyguard/ObscureSpeechDelegate;

    invoke-direct {v4, p1}, Lcom/android/internal/policy/impl/keyguard/ObscureSpeechDelegate;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 79
    new-instance v4, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v4, p1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Lcom/android/internal/widget/LockPatternUtils;->isTactileFeedbackEnabled()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mEnableHaptics:Z

    .line 81
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 82
    .local v1, builder:Landroid/text/SpannableStringBuilder;
    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 83
    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    if-ltz v4, :cond_1

    .line 84
    sget-object v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->sKlondike:[Ljava/lang/String;

    if-nez v4, :cond_0

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1070012

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->sKlondike:[Ljava/lang/String;

    .line 88
    :cond_0
    sget-object v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->sKlondike:[Ljava/lang/String;

    if-eqz v4, :cond_1

    sget-object v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->sKlondike:[Ljava/lang/String;

    array-length v4, v4

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    if-le v4, v5, :cond_1

    .line 89
    sget-object v4, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->sKlondike:[Ljava/lang/String;

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mDigit:I

    aget-object v2, v4, v5

    .line 90
    .local v2, extra:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 91
    .local v3, extraLen:I
    if-lez v3, :cond_1

    .line 92
    const-string v4, " "

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 93
    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 94
    new-instance v4, Landroid/text/style/TextAppearanceSpan;

    const v5, 0x10302a5

    invoke-direct {v4, p1, v5}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v3

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 100
    .end local v2           #extra:Ljava/lang/String;
    .end local v3           #extraLen:I
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->setText(Ljava/lang/CharSequence;)V

    .line 101
    return-void
.end method


# virtual methods
.method public doHapticKeyClick()V
    .locals 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mEnableHaptics:Z

    if-eqz v0, :cond_0

    .line 123
    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->performHapticFeedback(II)Z

    .line 127
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 105
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    .line 108
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/internal/policy/impl/keyguard/ObscureSpeechDelegate;->sAnnouncedHeadset:Z

    .line 109
    return-void
.end method

.method public setTextView(Landroid/widget/TextView;)V
    .locals 0
    .parameter "tv"

    .prologue
    .line 112
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mTextView:Landroid/widget/TextView;

    .line 113
    return-void
.end method

.method public setTextViewResId(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mTextView:Landroid/widget/TextView;

    .line 117
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/NumPadKey;->mTextViewResId:I

    .line 118
    return-void
.end method
