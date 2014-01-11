.class Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;
.super Ljava/lang/Object;
.source "SimUnlockScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchInput"
.end annotation


# instance fields
.field private mCancelButton:Landroid/widget/TextView;

.field private mEight:Landroid/widget/TextView;

.field private mFive:Landroid/widget/TextView;

.field private mFour:Landroid/widget/TextView;

.field private mNine:Landroid/widget/TextView;

.field private mOne:Landroid/widget/TextView;

.field private mSeven:Landroid/widget/TextView;

.field private mSix:Landroid/widget/TextView;

.field private mThree:Landroid/widget/TextView;

.field private mTwo:Landroid/widget/TextView;

.field private mZero:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;


# direct methods
.method private constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)V
    .locals 2
    .parameter

    .prologue
    .line 318
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 319
    const v0, 0x10203a9

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mZero:Landroid/widget/TextView;

    .line 320
    const v0, 0x10203a0

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mOne:Landroid/widget/TextView;

    .line 321
    const v0, 0x10203a1

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mTwo:Landroid/widget/TextView;

    .line 322
    const v0, 0x10203a2

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mThree:Landroid/widget/TextView;

    .line 323
    const v0, 0x10203a3

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFour:Landroid/widget/TextView;

    .line 324
    const v0, 0x10203a4

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFive:Landroid/widget/TextView;

    .line 325
    const v0, 0x10203a5

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSix:Landroid/widget/TextView;

    .line 326
    const v0, 0x10203a6

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSeven:Landroid/widget/TextView;

    .line 327
    const v0, 0x10203a7

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mEight:Landroid/widget/TextView;

    .line 328
    const v0, 0x10203a8

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mNine:Landroid/widget/TextView;

    .line 329
    const v0, 0x1020277

    invoke-virtual {p1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mCancelButton:Landroid/widget/TextView;

    .line 331
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mZero:Landroid/widget/TextView;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mOne:Landroid/widget/TextView;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 333
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mTwo:Landroid/widget/TextView;

    const-string v1, "2"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mThree:Landroid/widget/TextView;

    const-string v1, "3"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFour:Landroid/widget/TextView;

    const-string v1, "4"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFive:Landroid/widget/TextView;

    const-string v1, "5"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 337
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSix:Landroid/widget/TextView;

    const-string v1, "6"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSeven:Landroid/widget/TextView;

    const-string v1, "7"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mEight:Landroid/widget/TextView;

    const-string v1, "8"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 340
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mNine:Landroid/widget/TextView;

    const-string v1, "9"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mZero:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 343
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mOne:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 344
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mTwo:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mThree:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 346
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFour:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 347
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFive:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 348
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSix:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 349
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSeven:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 350
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mEight:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 351
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mNine:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 352
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mCancelButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 305
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;-><init>(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)V

    return-void
.end method

.method private checkDigit(Landroid/view/View;)I
    .locals 2
    .parameter "v"

    .prologue
    .line 371
    const/4 v0, -0x1

    .line 372
    .local v0, digit:I
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mZero:Landroid/widget/TextView;

    if-ne p1, v1, :cond_1

    .line 373
    const/4 v0, 0x0

    .line 393
    :cond_0
    :goto_0
    return v0

    .line 374
    :cond_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mOne:Landroid/widget/TextView;

    if-ne p1, v1, :cond_2

    .line 375
    const/4 v0, 0x1

    goto :goto_0

    .line 376
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mTwo:Landroid/widget/TextView;

    if-ne p1, v1, :cond_3

    .line 377
    const/4 v0, 0x2

    goto :goto_0

    .line 378
    :cond_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mThree:Landroid/widget/TextView;

    if-ne p1, v1, :cond_4

    .line 379
    const/4 v0, 0x3

    goto :goto_0

    .line 380
    :cond_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFour:Landroid/widget/TextView;

    if-ne p1, v1, :cond_5

    .line 381
    const/4 v0, 0x4

    goto :goto_0

    .line 382
    :cond_5
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mFive:Landroid/widget/TextView;

    if-ne p1, v1, :cond_6

    .line 383
    const/4 v0, 0x5

    goto :goto_0

    .line 384
    :cond_6
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSix:Landroid/widget/TextView;

    if-ne p1, v1, :cond_7

    .line 385
    const/4 v0, 0x6

    goto :goto_0

    .line 386
    :cond_7
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mSeven:Landroid/widget/TextView;

    if-ne p1, v1, :cond_8

    .line 387
    const/4 v0, 0x7

    goto :goto_0

    .line 388
    :cond_8
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mEight:Landroid/widget/TextView;

    if-ne p1, v1, :cond_9

    .line 389
    const/16 v0, 0x8

    goto :goto_0

    .line 390
    :cond_9
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mNine:Landroid/widget/TextView;

    if-ne p1, v1, :cond_0

    .line 391
    const/16 v0, 0x9

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 357
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->mCancelButton:Landroid/widget/TextView;

    if-ne p1, v1, :cond_1

    .line 358
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mPinText:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$500(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 359
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->goToLockScreen()V

    .line 368
    :cond_0
    :goto_0
    return-void

    .line 363
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->checkDigit(Landroid/view/View;)I

    move-result v0

    .line 364
    .local v0, digit:I
    if-ltz v0, :cond_0

    .line 365
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v1

    const/16 v2, 0x1388

    invoke-interface {v1, v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock(I)V

    .line 366
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen$TouchInput;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->reportDigit(I)V
    invoke-static {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;->access$700(Lcom/android/internal/policy/impl/keyguard_obsolete/SimUnlockScreen;I)V

    goto :goto_0
.end method
