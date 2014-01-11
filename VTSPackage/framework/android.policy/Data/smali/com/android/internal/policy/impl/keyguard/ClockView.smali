.class public Lcom/android/internal/policy/impl/keyguard/ClockView;
.super Landroid/widget/RelativeLayout;
.source "ClockView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/keyguard/ClockView$FormatChangeObserver;,
        Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;,
        Lcom/android/internal/policy/impl/keyguard/ClockView$TimeChangedReceiver;
    }
.end annotation


# static fields
.field private static final ANDROID_CLOCK_FONT_FILE:Ljava/lang/String; = "/system/fonts/AndroidClock.ttf"

.field private static final M12:Ljava/lang/String; = "h:mm"

.field private static final M24:Ljava/lang/String; = "kk:mm"


# instance fields
.field private mAmPm:Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;

.field private mAttached:I

.field private mCalendar:Ljava/util/Calendar;

.field private mFormat:Ljava/lang/String;

.field private mFormatChangeObserver:Landroid/database/ContentObserver;

.field private final mHandler:Landroid/os/Handler;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mTimeView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 146
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/ClockView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 147
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 150
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAttached:I

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mHandler:Landroid/os/Handler;

    .line 151
    return-void
.end method

.method static synthetic access$002(Lcom/android/internal/policy/impl/keyguard/ClockView;Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 42
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/ClockView;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/ClockView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->setDateFormat()V

    return-void
.end method

.method private setDateFormat()V
    .locals 3

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "kk:mm"

    :goto_0
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormat:Ljava/lang/String;

    .line 224
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAmPm:Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormat:Ljava/lang/String;

    const-string v2, "h:mm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;->setShowAmPm(Z)V

    .line 225
    return-void

    .line 223
    :cond_0
    const-string v0, "h:mm"

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 167
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 169
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAttached:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAttached:I

    .line 172
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    .line 173
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/ClockView$TimeChangedReceiver;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/ClockView$TimeChangedReceiver;-><init>(Lcom/android/internal/policy/impl/keyguard/ClockView;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 174
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 175
    .local v3, filter:Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.TIME_TICK"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 176
    const-string v0, "android.intent.action.TIME_SET"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 177
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    sget-object v2, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 182
    .end local v3           #filter:Landroid/content/IntentFilter;
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_1

    .line 183
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/ClockView$FormatChangeObserver;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/ClockView$FormatChangeObserver;-><init>(Lcom/android/internal/policy/impl/keyguard/ClockView;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    .line 184
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 188
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->updateTime()V

    .line 189
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 193
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 195
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAttached:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAttached:I

    .line 197
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_1

    .line 201
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 205
    :cond_1
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormatChangeObserver:Landroid/database/ContentObserver;

    .line 206
    iput-object v2, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 207
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    .line 155
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 156
    const v0, 0x1020308

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mTimeView:Landroid/widget/TextView;

    .line 158
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mTimeView:Landroid/widget/TextView;

    const-string v1, "/system/fonts/AndroidClock.ttf"

    invoke-static {v1}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 160
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;-><init>(Landroid/view/View;Landroid/graphics/Typeface;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAmPm:Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;

    .line 161
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    .line 162
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->setDateFormat()V

    .line 163
    return-void
.end method

.method public updateTime()V
    .locals 4

    .prologue
    .line 215
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 217
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mFormat:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    invoke-static {v1, v2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 218
    .local v0, newTime:Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mTimeView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mAmPm:Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    const/16 v3, 0x9

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Lcom/android/internal/policy/impl/keyguard/ClockView$AmPm;->setIsMorning(Z)V

    .line 220
    return-void

    .line 219
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method updateTime(Ljava/util/Calendar;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 210
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/ClockView;->mCalendar:Ljava/util/Calendar;

    .line 211
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/ClockView;->updateTime()V

    .line 212
    return-void
.end method
