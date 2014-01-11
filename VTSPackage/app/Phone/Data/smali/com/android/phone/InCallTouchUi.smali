.class public Lcom/android/phone/InCallTouchUi;
.super Landroid/widget/FrameLayout;
.source "InCallTouchUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/internal/widget/multiwaveview/GlowPadView$OnTriggerListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Landroid/widget/PopupMenu$OnDismissListener;


# static fields
.field private static final ACTIVE_AND_HOLD_IN_SAME_PHONE:I = 0xd

.field private static final ACTIVE_AND_TWO_HOLD:I = 0xf

.field private static final ACTIVE_CALL_IS_NOT_EXIST:I = 0xb

.field private static final ACTIVE_OR_HOLD_NOT_IN_SAME_PHONE:I = 0xe

.field private static final ACTIVE_OUTGOING_CALL:I = 0x10

.field private static final ACTIVE_VOICE_CALL_ONLY_ONE:I = 0xc

.field private static final ACTIVE_VT_CALL:I = 0xa

.field private static final ANSWER_CALL_ID:I = 0x0

.field private static final DBG:Z = true

.field private static final DECLINE_CALL_ID:I = 0x2

.field private static final ENABLE_PING_AUTO_REPEAT:Z = true

.field private static final ENABLE_PING_ON_RING_EVENTS:Z = false

.field private static final INCOMING_CALL_ACTION_DURATION:I = 0x1f4

.field private static final INCOMING_CALL_WIDGET_PING:I = 0x65

.field private static final LOG_TAG:Ljava/lang/String; = "InCallTouchUi"

.field private static final PING_AUTO_REPEAT_DELAY_MSEC:J = 0x4b0L

.field private static final SEND_SMS_ID:I = 0x1


# instance fields
.field private mAddButton:Landroid/widget/Button;

.field private mApp:Lcom/android/phone/PhoneGlobals;

.field private mAudioButton:Landroid/widget/CompoundButton;

.field private mAudioModePopup:Landroid/widget/PopupMenu;

.field private mAudioModePopupVisible:Z

.field private mCdmaMergeButton:Landroid/view/ViewGroup;

.field private mDialpadButton:Landroid/widget/CompoundButton;

.field private mEndButton:Landroid/widget/Button;

.field private mExtraButtonRow:Landroid/view/ViewStub;

.field private mExtraButtonRowInflated:Landroid/view/ViewGroup;

.field private mHandler:Landroid/os/Handler;

.field protected mHasPermanentMenuKey:Z

.field private mHoldButton:Landroid/widget/CompoundButton;

.field private mHoldSwapSpacer:Landroid/view/View;

.field private mInCallControls:Landroid/view/View;

.field private mInCallScreen:Lcom/android/phone/InCallScreen;

.field private mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

.field private mIncomingCallWidgetIsFadingOut:Z

.field private mIncomingCallWidgetShouldBeReset:Z

.field private mIncomingMenuButton:Landroid/widget/ImageButton;

.field private mIncomingVTCallIconMap:[I

.field private mIncomingVoiceCallMap:[I

.field private mLastIncomingCallActionTime:J

.field private mLastIncomingPingTime:J

.field private mManageConferenceButton:Landroid/view/ViewGroup;

.field private mManageConferenceButtonImage:Landroid/widget/ImageButton;

.field private mMenuButton:Landroid/widget/ImageButton;

.field private mMergeButton:Landroid/widget/Button;

.field private mMuteButton:Landroid/widget/CompoundButton;

.field private mNotShowDualTalkConference:Z

.field private mRejectCallNoti:Landroid/widget/TextView;

.field private mShowInCallControlsDuringHidingAnimation:Z

.field private mSwapButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x5

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 174
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 99
    iput-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetShouldBeReset:Z

    .line 129
    iput-boolean v1, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopupVisible:Z

    .line 134
    iput-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mNotShowDualTalkConference:Z

    .line 154
    new-instance v0, Lcom/android/phone/InCallTouchUi$1;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallTouchUi$1;-><init>(Lcom/android/phone/InCallTouchUi;)V

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mHandler:Landroid/os/Handler;

    .line 1760
    iput-boolean v1, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    .line 1762
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingVoiceCallMap:[I

    .line 1770
    new-array v0, v2, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingVTCallIconMap:[I

    .line 176
    const-string v0, "InCallTouchUi constructor..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- context "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", attrs "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 179
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    .line 180
    return-void

    .line 1762
    nop

    :array_0
    .array-data 0x4
        0x59t 0x0t 0x2t 0x7ft
        0x5bt 0x0t 0x2t 0x7ft
        0x5at 0x0t 0x2t 0x7ft
        0x5ct 0x0t 0x2t 0x7ft
        0x57t 0x0t 0x2t 0x7ft
    .end array-data

    .line 1770
    :array_1
    .array-data 0x4
        0x5et 0x0t 0x2t 0x7ft
        0x60t 0x0t 0x2t 0x7ft
        0x5ft 0x0t 0x2t 0x7ft
        0x61t 0x0t 0x2t 0x7ft
        0x62t 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method static synthetic access$000(Lcom/android/phone/InCallTouchUi;)Lcom/android/phone/InCallScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/phone/InCallTouchUi;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/android/phone/InCallTouchUi;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput-boolean p1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetIsFadingOut:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/phone/InCallTouchUi;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    return v0
.end method

.method static synthetic access$302(Lcom/android/phone/InCallTouchUi;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput-boolean p1, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/phone/InCallTouchUi;)Lcom/android/phone/PhoneGlobals;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/phone/InCallTouchUi;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/phone/InCallTouchUi;)Lcom/android/internal/widget/multiwaveview/GlowPadView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/phone/InCallTouchUi;)Landroid/widget/ImageButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$802(Lcom/android/phone/InCallTouchUi;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput-boolean p1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetShouldBeReset:Z

    return p1
.end method

.method private dumpBottomButtonState()V
    .locals 2

    .prologue
    .line 922
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - dialpad: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 923
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - speaker: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 924
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - mute: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 925
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - hold: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 926
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - swap: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 927
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - add: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 928
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - merge: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 929
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - cdmaMerge: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 930
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - swap: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 931
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " - manageConferenceButton: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButton:Landroid/view/ViewGroup;

    invoke-static {v1}, Lcom/android/phone/InCallTouchUi;->getButtonState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 932
    return-void
.end method

.method private getAllCallsStateMsg()I
    .locals 7

    .prologue
    const/4 v4, -0x1

    .line 1907
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v2

    .line 1908
    .local v2, dt:Lcom/mediatek/phone/DualTalkUtils;
    if-nez v2, :cond_1

    .line 1964
    :cond_0
    :goto_0
    return v4

    .line 1913
    :cond_1
    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1914
    const-string v4, "ACTIVE_OUTGOING_CALL"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1915
    const/16 v4, 0x10

    goto :goto_0

    .line 1919
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1920
    const-string v4, "ACTIVE_VT_CALL"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1921
    const/16 v4, 0xa

    goto :goto_0

    .line 1925
    :cond_3
    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1926
    const-string v4, "ACTIVE_AND_TWO_HOLD"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1927
    const/16 v4, 0xf

    goto :goto_0

    .line 1931
    :cond_4
    iget-object v5, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 1932
    .local v3, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v5, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 1933
    .local v1, bgCall:Lcom/android/internal/telephony/Call;
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_5

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    if-ne v5, v6, :cond_5

    .line 1936
    const-string v4, "ACTIVE_AND_HOLD_IN_SAME_PHONE"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1937
    const/16 v4, 0xd

    goto :goto_0

    .line 1941
    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_6

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    if-ne v5, v6, :cond_7

    :cond_6
    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1945
    :cond_7
    const-string v4, "ACTIVE_OR_HOLD_NOT_IN_SAME_PHONE"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1946
    const/16 v4, 0xe

    goto/16 :goto_0

    .line 1950
    :cond_8
    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->getAllActiveCalls()Ljava/util/List;

    move-result-object v0

    .line 1951
    .local v0, activeCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-virtual {v2}, Lcom/mediatek/phone/DualTalkUtils;->getAllActiveCalls()Ljava/util/List;

    move-result-object v0

    .line 1952
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "activeCalls : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1953
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_9

    .line 1954
    const-string v4, "ACTIVE_CALL_IS_NOT_EXIST"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1955
    const/16 v4, 0xb

    goto/16 :goto_0

    .line 1959
    :cond_9
    const/4 v5, 0x1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-ne v5, v6, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1960
    const-string v4, "ACTIVE_CALL_ONLY_ONE"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1961
    const/16 v4, 0xc

    goto/16 :goto_0
.end method

.method private static getButtonState(Landroid/view/View;)Ljava/lang/String;
    .locals 4
    .parameter "view"

    .prologue
    .line 935
    if-nez p0, :cond_0

    .line 936
    const-string v1, "(null)"

    .line 947
    .end local p0
    :goto_0
    return-object v1

    .line 938
    .restart local p0
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 939
    .local v0, builder:Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "visibility: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "VISIBLE"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    instance-of v1, p0, Landroid/widget/ImageButton;

    if-eqz v1, :cond_4

    .line 942
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", enabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    check-cast p0, Landroid/widget/ImageButton;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/ImageButton;->isEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 947
    :cond_1
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 939
    .restart local p0
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v3, 0x4

    if-ne v1, v3, :cond_3

    const-string v1, "INVISIBLE"

    goto :goto_1

    :cond_3
    const-string v1, "GONE"

    goto :goto_1

    .line 943
    :cond_4
    instance-of v1, p0, Landroid/widget/CompoundButton;

    if-eqz v1, :cond_1

    .line 944
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", enabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object v1, p0

    check-cast v1, Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->isEnabled()Z

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", checked: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    check-cast p0, Landroid/widget/CompoundButton;

    .end local p0
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2
.end method

.method private getColorIndexByCall(Lcom/android/internal/telephony/Call;)I
    .locals 3
    .parameter "call"

    .prologue
    .line 1749
    const/4 v0, 0x5

    .line 1750
    .local v0, index:I
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 1751
    .local v1, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 1752
    iget v0, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    .line 1754
    :cond_0
    const/4 v2, 0x5

    if-ne v0, v2, :cond_1

    .line 1755
    const/4 v0, 0x4

    .line 1757
    :cond_1
    return v0
.end method

.method private getExtraButtonVisibility()I
    .locals 1

    .prologue
    .line 1792
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 1793
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    .line 1795
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRow:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->getVisibility()I

    move-result v0

    goto :goto_0
.end method

.method private getRejectCallNotifyMsg()I
    .locals 8

    .prologue
    .line 1807
    const/4 v3, -0x1

    .line 1808
    .local v3, resId:I
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    if-nez v7, :cond_0

    move v4, v3

    .line 1903
    .end local v3           #resId:I
    .local v4, resId:I
    :goto_0
    return v4

    .line 1812
    .end local v4           #resId:I
    .restart local v3       #resId:I
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_c

    .line 1813
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v7, v7, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v2

    .line 1814
    .local v2, hasMultiRingCall:Z
    const/4 v1, 0x0

    .line 1815
    .local v1, firstRingCallIsVT:Z
    const/4 v6, 0x0

    .line 1816
    .local v6, secondRingCallIsVT:Z
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v7, v7, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 1817
    .local v0, firstRingCall:Lcom/android/internal/telephony/Call;
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v7, v7, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    .line 1828
    .local v5, secondRingCall:Lcom/android/internal/telephony/Call;
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->getAllCallsStateMsg()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .end local v0           #firstRingCall:Lcom/android/internal/telephony/Call;
    .end local v1           #firstRingCallIsVT:Z
    .end local v2           #hasMultiRingCall:Z
    .end local v5           #secondRingCall:Lcom/android/internal/telephony/Call;
    .end local v6           #secondRingCallIsVT:Z
    :cond_1
    :goto_1
    move v4, v3

    .line 1903
    .end local v3           #resId:I
    .restart local v4       #resId:I
    goto :goto_0

    .line 1830
    .end local v4           #resId:I
    .restart local v0       #firstRingCall:Lcom/android/internal/telephony/Call;
    .restart local v1       #firstRingCallIsVT:Z
    .restart local v2       #hasMultiRingCall:Z
    .restart local v3       #resId:I
    .restart local v5       #secondRingCall:Lcom/android/internal/telephony/Call;
    .restart local v6       #secondRingCallIsVT:Z
    :pswitch_0
    if-eqz v2, :cond_2

    .line 1831
    const v3, 0x7f0d007e

    goto :goto_1

    .line 1833
    :cond_2
    const v3, 0x7f0d007b

    .line 1835
    goto :goto_1

    .line 1838
    :pswitch_1
    if-eqz v2, :cond_3

    .line 1839
    const v3, 0x7f0d007f

    goto :goto_1

    .line 1841
    :cond_3
    const v3, 0x7f0d007a

    .line 1843
    goto :goto_1

    .line 1846
    :pswitch_2
    const v3, 0x7f0d007a

    .line 1847
    goto :goto_1

    .line 1850
    :pswitch_3
    if-eqz v2, :cond_5

    .line 1851
    if-eqz v1, :cond_4

    .line 1852
    const v3, 0x7f0d007d

    goto :goto_1

    .line 1854
    :cond_4
    const v3, 0x7f0d007f

    goto :goto_1

    .line 1857
    :cond_5
    if-eqz v1, :cond_6

    .line 1858
    const v3, 0x7f0d007d

    goto :goto_1

    .line 1860
    :cond_6
    const v3, 0x7f0d007a

    .line 1863
    goto :goto_1

    .line 1866
    :pswitch_4
    if-eqz v2, :cond_1

    if-nez v1, :cond_7

    if-eqz v6, :cond_1

    .line 1867
    :cond_7
    const v3, 0x7f0d007c

    goto :goto_1

    .line 1872
    :pswitch_5
    if-eqz v2, :cond_9

    .line 1873
    if-eqz v1, :cond_8

    .line 1874
    const v3, 0x7f0d007d

    goto :goto_1

    .line 1876
    :cond_8
    const v3, 0x7f0d007f

    goto :goto_1

    .line 1878
    :cond_9
    if-eqz v1, :cond_1

    .line 1879
    const v3, 0x7f0d007d

    goto :goto_1

    .line 1884
    :pswitch_6
    if-eqz v2, :cond_b

    .line 1885
    if-eqz v1, :cond_a

    .line 1886
    const v3, 0x7f0d007f

    goto :goto_1

    .line 1888
    :cond_a
    const v3, 0x7f0d007c

    goto :goto_1

    .line 1890
    :cond_b
    if-eqz v1, :cond_1

    .line 1891
    const v3, 0x7f0d007a

    goto :goto_1

    .line 1898
    .end local v0           #firstRingCall:Lcom/android/internal/telephony/Call;
    .end local v1           #firstRingCallIsVT:Z
    .end local v2           #hasMultiRingCall:Z
    .end local v5           #secondRingCall:Lcom/android/internal/telephony/Call;
    .end local v6           #secondRingCallIsVT:Z
    :cond_c
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v7, v7, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v7, v7, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1900
    const v3, 0x7f0d007a

    goto :goto_1

    .line 1828
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private handleAudioButtonClick()V
    .locals 3

    .prologue
    .line 1089
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 1091
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v0

    .line 1092
    .local v0, inCallControlState:Lcom/android/phone/InCallControlState;
    iget-boolean v1, v0, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    if-eqz v1, :cond_0

    .line 1093
    const-string v1, "- handleAudioButtonClick: \'popup menu\' mode..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1094
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->showAudioModePopup()V

    .line 1097
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 1102
    :goto_0
    return-void

    .line 1099
    :cond_0
    const-string v1, "- handleAudioButtonClick: \'speaker toggle\' mode..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1100
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1}, Lcom/android/phone/InCallScreen;->toggleSpeaker()V

    goto :goto_0
.end method

.method private hideIncomingCallWidget()V
    .locals 3

    .prologue
    .line 1422
    const-string v1, "hideIncomingCallWidget()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1423
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetIsFadingOut:Z

    if-eqz v1, :cond_1

    .line 1426
    :cond_0
    const-string v1, "Skipping hideIncomingCallWidget action"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1481
    :goto_0
    return-void

    .line 1430
    :cond_1
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 1431
    .local v0, animator:Landroid/view/ViewPropertyAnimator;
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1432
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 1433
    new-instance v1, Lcom/android/phone/InCallTouchUi$2;

    invoke-direct {v1, p0}, Lcom/android/phone/InCallTouchUi$2;-><init>(Lcom/android/phone/InCallTouchUi;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 1480
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1736
    const-string v0, "InCallTouchUi"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1737
    return-void
.end method

.method private okToShowInCallControls()Z
    .locals 2

    .prologue
    .line 552
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->CALL_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setExtraButtonVisibility(I)V
    .locals 2
    .parameter "visibility"

    .prologue
    .line 1779
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRow:Landroid/view/ViewStub;

    if-eqz v0, :cond_1

    .line 1780
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRow:Landroid/view/ViewStub;

    invoke-virtual {v0, p1}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 1781
    if-nez p1, :cond_0

    .line 1782
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v1, 0x7f080077

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    .line 1783
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1784
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRow:Landroid/view/ViewStub;

    .line 1789
    :cond_0
    :goto_0
    return-void

    .line 1786
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 1787
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRowInflated:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_0
.end method

.method private setupExtraButtons()V
    .locals 2

    .prologue
    .line 907
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v1, 0x7f080065

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    .line 908
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 909
    const-string v0, "InCallTouchUi"

    const-string v1, "CDMA Merge button is null even after ViewStub being inflated."

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
    :goto_0
    return-void

    .line 912
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 914
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v1, 0x7f080062

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButton:Landroid/view/ViewGroup;

    .line 916
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButton:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 917
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v1, 0x7f080063

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButtonImage:Landroid/widget/ImageButton;

    goto :goto_0
.end method

.method private showAudioModePopup()V
    .locals 12

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1108
    const-string v7, "showAudioModePopup()..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1116
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v7, :cond_0

    .line 1118
    const-string v7, "AudioModePopup already show, return ..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1178
    :goto_0
    return-void

    .line 1125
    :cond_0
    new-instance v7, Landroid/widget/PopupMenu;

    iget-object v10, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v11, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-direct {v7, v10, v11}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 1127
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v7

    const v10, 0x7f100001

    iget-object v11, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v11}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1129
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 1130
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7, p0}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 1134
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v7}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v2

    .line 1136
    .local v2, inCallControlState:Lcom/android/phone/InCallControlState;
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    .line 1143
    .local v3, menu:Landroid/view/Menu;
    const v7, 0x7f080134

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 1144
    .local v4, speakerItem:Landroid/view/MenuItem;
    iget-boolean v7, v2, Lcom/android/phone/InCallControlState;->speakerEnabled:Z

    invoke-interface {v4, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1150
    const v7, 0x7f080135

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 1151
    .local v1, earpieceItem:Landroid/view/MenuItem;
    const v7, 0x7f080136

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 1152
    .local v6, wiredHeadsetItem:Landroid/view/MenuItem;
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v7}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v5

    .line 1158
    .local v5, usingHeadset:Z
    if-nez v5, :cond_2

    move v7, v8

    :goto_1
    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1159
    if-nez v5, :cond_1

    move v9, v8

    :cond_1
    invoke-interface {v1, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1161
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1162
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1167
    const v7, 0x7f080137

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1168
    .local v0, bluetoothItem:Landroid/view/MenuItem;
    iget-boolean v7, v2, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    invoke-interface {v0, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1172
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->show()V

    .line 1177
    iput-boolean v8, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopupVisible:Z

    goto :goto_0

    .end local v0           #bluetoothItem:Landroid/view/MenuItem;
    :cond_2
    move v7, v9

    .line 1158
    goto :goto_1
.end method

.method private showIncomingCallWidget(Lcom/android/internal/telephony/Call;)V
    .locals 14
    .parameter "ringingCall"

    .prologue
    const/16 v13, 0x65

    const/4 v12, 0x3

    const/4 v11, 0x0

    .line 1487
    const-string v8, "showIncomingCallWidget()..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1494
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 1495
    .local v1, animator:Landroid/view/ViewPropertyAnimator;
    if-eqz v1, :cond_0

    .line 1496
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1503
    :cond_0
    iput-boolean v11, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    .line 1505
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const/high16 v9, 0x3f80

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setAlpha(F)V

    .line 1508
    const/4 v3, 0x0

    .line 1509
    .local v3, isSpecialCase:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1510
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v8, :cond_1

    .line 1511
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v3

    .line 1512
    if-eqz v3, :cond_1

    .line 1513
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object p1

    .line 1522
    :cond_1
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v8, p1}, Lcom/android/phone/RespondViaSmsManager;->allowRespondViaSmsForCall(Landroid/content/Context;Lcom/android/internal/telephony/Call;)Z

    move-result v0

    .line 1524
    .local v0, allowRespondViaSms:Z
    if-eqz v0, :cond_7

    const v7, 0x7f070006

    .line 1530
    .local v7, targetResourceId:I
    :goto_0
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->getTargetResourceId()I

    move-result v8

    if-eq v7, v8, :cond_2

    .line 1531
    if-eqz v0, :cond_8

    .line 1534
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8, v7}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setTargetResources(I)V

    .line 1535
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f070007

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setTargetDescriptionsResourceId(I)V

    .line 1537
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f070008

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setDirectionDescriptionsResourceId(I)V

    .line 1549
    :goto_1
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetShouldBeReset:Z

    .line 1552
    :cond_2
    invoke-static {p1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 1553
    if-eqz v3, :cond_9

    .line 1554
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mIncomingVTCallIconMap:[I

    invoke-direct {p0, p1}, Lcom/android/phone/InCallTouchUi;->getColorIndexByCall(Lcom/android/internal/telephony/Call;)I

    move-result v10

    aget v9, v9, v10

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setHandleDrawableImage(I)V

    .line 1566
    :goto_2
    iget-boolean v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetShouldBeReset:Z

    if-eqz v8, :cond_3

    .line 1571
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8, v11}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->reset(Z)V

    .line 1572
    iput-boolean v11, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidgetShouldBeReset:Z

    .line 1579
    :cond_3
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1580
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->getRootView()Landroid/view/View;

    move-result-object v8

    const v9, 0x7f0800ee

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1582
    .local v2, callStateLabel:Landroid/widget/TextView;
    if-eqz v2, :cond_4

    invoke-virtual {v2, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 1585
    .end local v2           #callStateLabel:Landroid/widget/TextView;
    :cond_4
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8, v11}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setVisibility(I)V

    .line 1598
    const/4 v6, 0x1

    .line 1599
    .local v6, phoneType:I
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 1600
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v6

    .line 1604
    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 1605
    .local v4, now:J
    if-ne v12, v6, :cond_c

    const-wide/16 v8, 0x0

    iget-wide v10, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingPingTime:J

    cmp-long v8, v8, v10

    if-eqz v8, :cond_c

    iget-wide v8, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingPingTime:J

    const-wide/16 v10, 0x4b0

    add-long/2addr v8, v10

    cmp-long v8, v4, v8

    if-gez v8, :cond_c

    .line 1608
    const-string v8, "updateState: Too soon after last update widget; not resend!"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1622
    :cond_6
    :goto_3
    return-void

    .line 1524
    .end local v4           #now:J
    .end local v6           #phoneType:I
    .end local v7           #targetResourceId:I
    :cond_7
    const v7, 0x7f070009

    goto/16 :goto_0

    .line 1541
    .restart local v7       #targetResourceId:I
    :cond_8
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v8, v7}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setTargetResources(I)V

    .line 1542
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f07000a

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setTargetDescriptionsResourceId(I)V

    .line 1544
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f07000b

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setDirectionDescriptionsResourceId(I)V

    goto/16 :goto_1

    .line 1556
    :cond_9
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f020062

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setHandleDrawableImage(I)V

    goto :goto_2

    .line 1559
    :cond_a
    if-eqz v3, :cond_b

    .line 1560
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mIncomingVoiceCallMap:[I

    invoke-direct {p0, p1}, Lcom/android/phone/InCallTouchUi;->getColorIndexByCall(Lcom/android/internal/telephony/Call;)I

    move-result v10

    aget v9, v9, v10

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setHandleDrawableImage(I)V

    goto/16 :goto_2

    .line 1562
    :cond_b
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const v9, 0x7f020057

    invoke-virtual {v8, v9}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setHandleDrawableImage(I)V

    goto/16 :goto_2

    .line 1610
    .restart local v4       #now:J
    .restart local v6       #phoneType:I
    :cond_c
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mHandler:Landroid/os/Handler;

    invoke-virtual {v8, v13}, Landroid/os/Handler;->removeMessages(I)V

    .line 1611
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mHandler:Landroid/os/Handler;

    const-wide/16 v9, 0xfa

    invoke-virtual {v8, v13, v9, v10}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1618
    if-ne v12, v6, :cond_6

    .line 1619
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingPingTime:J

    goto :goto_3
.end method

.method private updateAudioButton(Lcom/android/phone/InCallControlState;)V
    .locals 14
    .parameter "inCallControlState"

    .prologue
    const/4 v9, 0x1

    const/16 v11, 0xff

    const/4 v10, 0x0

    .line 965
    const-string v12, "updateAudioButton()..."

    invoke-direct {p0, v12}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 973
    const/4 v8, 0x0

    .line 976
    .local v8, showToggleStateIndication:Z
    const/4 v5, 0x0

    .line 979
    .local v5, showMoreIndicator:Z
    const/4 v7, 0x0

    .line 980
    .local v7, showSpeakerOnIcon:Z
    const/4 v6, 0x0

    .line 981
    .local v6, showSpeakerOffIcon:Z
    const/4 v4, 0x0

    .line 982
    .local v4, showHandsetIcon:Z
    const/4 v3, 0x0

    .line 984
    .local v3, showBluetoothIcon:Z
    iget-boolean v12, p1, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    if-eqz v12, :cond_3

    .line 985
    const-string v12, "- updateAudioButton: \'popup menu action button\' mode..."

    invoke-direct {p0, v12}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 987
    iget-object v12, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v12, v9}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 992
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 995
    const/4 v5, 0x1

    .line 996
    iget-boolean v9, p1, Lcom/android/phone/InCallControlState;->bluetoothIndicatorOn:Z

    if-eqz v9, :cond_1

    .line 997
    const/4 v3, 0x1

    .line 1037
    :goto_0
    const/4 v0, 0x0

    .line 1038
    .local v0, HIDDEN:I
    const/16 v1, 0xff

    .line 1040
    .local v1, VISIBLE:I
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v9}, Landroid/widget/CompoundButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/LayerDrawable;

    .line 1041
    .local v2, layers:Landroid/graphics/drawable/LayerDrawable;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "- \'layers\' drawable: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1048
    const v9, 0x7f08012c

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    if-eqz v5, :cond_6

    move v9, v11

    :goto_1
    invoke-virtual {v12, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1051
    const v9, 0x7f08012d

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    if-eqz v3, :cond_7

    move v9, v11

    :goto_2
    invoke-virtual {v12, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1054
    const v9, 0x7f08012e

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    if-eqz v4, :cond_8

    move v9, v11

    :goto_3
    invoke-virtual {v12, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1057
    const v9, 0x7f08012f

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    if-eqz v7, :cond_9

    move v9, v11

    :goto_4
    invoke-virtual {v12, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1060
    const v9, 0x7f080130

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    if-eqz v6, :cond_a

    :goto_5
    invoke-virtual {v9, v11}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1063
    const-string v9, "ro.rgk.sm611.style"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "samsun"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1064
    if-eqz v3, :cond_b

    .line 1065
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    const v10, 0x7f0d019b

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setText(I)V

    .line 1075
    :cond_0
    :goto_6
    return-void

    .line 998
    .end local v0           #HIDDEN:I
    .end local v1           #VISIBLE:I
    .end local v2           #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_1
    iget-boolean v9, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-eqz v9, :cond_2

    .line 999
    const/4 v7, 0x1

    goto :goto_0

    .line 1001
    :cond_2
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 1007
    :cond_3
    iget-boolean v12, p1, Lcom/android/phone/InCallControlState;->speakerEnabled:Z

    if-eqz v12, :cond_5

    .line 1008
    const-string v12, "- updateAudioButton: \'speaker toggle\' mode..."

    invoke-direct {p0, v12}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1010
    iget-object v12, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v12, v9}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 1014
    iget-object v12, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    iget-boolean v13, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    invoke-virtual {v12, v13}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 1017
    const/4 v8, 0x1

    .line 1019
    iget-boolean v7, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    .line 1020
    iget-boolean v12, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-nez v12, :cond_4

    move v6, v9

    :goto_7
    goto/16 :goto_0

    :cond_4
    move v6, v10

    goto :goto_7

    .line 1022
    :cond_5
    const-string v9, "- updateAudioButton: disabled..."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1026
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 1027
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 1030
    const/4 v8, 0x1

    .line 1031
    const/4 v6, 0x1

    goto/16 :goto_0

    .restart local v0       #HIDDEN:I
    .restart local v1       #VISIBLE:I
    .restart local v2       #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_6
    move v9, v10

    .line 1048
    goto/16 :goto_1

    :cond_7
    move v9, v10

    .line 1051
    goto/16 :goto_2

    :cond_8
    move v9, v10

    .line 1054
    goto :goto_3

    :cond_9
    move v9, v10

    .line 1057
    goto :goto_4

    :cond_a
    move v11, v10

    .line 1060
    goto :goto_5

    .line 1067
    :cond_b
    if-eqz v4, :cond_c

    .line 1068
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    const v10, 0x7f0d0199

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setText(I)V

    goto :goto_6

    .line 1070
    :cond_c
    if-nez v6, :cond_d

    if-eqz v7, :cond_0

    .line 1071
    :cond_d
    iget-object v9, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    const v10, 0x7f0d0198

    invoke-virtual {v9, v10}, Landroid/widget/CompoundButton;->setText(I)V

    goto :goto_6
.end method


# virtual methods
.method public cancelIncomingCallActionTime()V
    .locals 4

    .prologue
    .line 1742
    const-string v0, "cancelIncomingCallActionTime()"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1744
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x1f4

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingCallActionTime:J

    .line 1745
    return-void
.end method

.method public cancelIncomingPingTime()V
    .locals 4

    .prologue
    .line 1800
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x4b0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingPingTime:J

    .line 1802
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelIncomingPingTime()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingPingTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1804
    return-void
.end method

.method public dismissAudioModePopup()V
    .locals 1

    .prologue
    .line 1187
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    .line 1188
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 1189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 1190
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopupVisible:Z

    .line 1192
    :cond_0
    return-void
.end method

.method public getTouchUiHeight()I
    .locals 4

    .prologue
    const v3, 0x7f0c000a

    .line 1285
    const/4 v0, 0x0

    .line 1288
    .local v0, height:I
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 1291
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c000b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 1293
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->getExtraButtonVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/android/phone/InCallTouchUi;->mNotShowDualTalkConference:Z

    if-eqz v1, :cond_1

    .line 1296
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 1303
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v0, v1

    .line 1305
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 558
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 559
    .local v0, id:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick(View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 561
    sparse-switch v0, :sswitch_data_0

    .line 593
    const-string v1, "InCallTouchUi"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClick: unexpected click: View "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    :goto_0
    return-void

    .line 573
    :sswitch_0
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1, v0}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    goto :goto_0

    .line 577
    :sswitch_1
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->handleAudioButtonClick()V

    goto :goto_0

    .line 586
    :sswitch_2
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1, v0}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    goto :goto_0

    .line 561
    :sswitch_data_0
    .sparse-switch
        0x7f080062 -> :sswitch_0
        0x7f080065 -> :sswitch_0
        0x7f080079 -> :sswitch_0
        0x7f08007d -> :sswitch_0
        0x7f08007e -> :sswitch_1
        0x7f08007f -> :sswitch_0
        0x7f080084 -> :sswitch_0
        0x7f080085 -> :sswitch_0
        0x7f080087 -> :sswitch_0
        0x7f080088 -> :sswitch_0
        0x7f080089 -> :sswitch_2
        0x7f08008b -> :sswitch_2
    .end sparse-switch
.end method

.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 1252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- onDismiss: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1253
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopupVisible:Z

    .line 1258
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 1260
    return-void
.end method

.method public onFinishFinalAnimation()V
    .locals 0

    .prologue
    .line 1416
    return-void
.end method

.method protected onFinishInflate()V
    .locals 7

    .prologue
    const v6, 0x7f080088

    const v5, 0x7f080087

    const/16 v4, 0x8

    .line 188
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "InCallTouchUi onFinishInflate(this = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 191
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    .line 195
    const v2, 0x7f08008a

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallTouchUi;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    .line 196
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v2, p0}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setOnTriggerListener(Lcom/android/internal/widget/multiwaveview/GlowPadView$OnTriggerListener;)V

    .line 199
    const v2, 0x7f080074

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallTouchUi;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    .line 200
    const v2, 0x7f08008c

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallTouchUi;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    .line 211
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080089

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    .line 212
    iget-boolean v2, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    if-eqz v2, :cond_4

    .line 214
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    .line 215
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    if-eqz v2, :cond_0

    .line 216
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 220
    :cond_0
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    .line 221
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    if-eqz v2, :cond_1

    .line 222
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 225
    :cond_1
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    if-eqz v2, :cond_2

    .line 226
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 262
    :cond_2
    :goto_0
    const v2, 0x7f08008b

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallTouchUi;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    .line 263
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080079

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    .line 270
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f08007d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CompoundButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    .line 272
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 274
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f08007f

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CompoundButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    .line 275
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 276
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 277
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f08007e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CompoundButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    .line 278
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAudioButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 280
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080084

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CompoundButton;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    .line 281
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 284
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080085

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    .line 285
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 287
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080086

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mHoldSwapSpacer:Landroid/view/View;

    .line 304
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const v3, 0x7f080076

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewStub;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mExtraButtonRow:Landroid/view/ViewStub;

    .line 307
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 308
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    new-instance v3, Lcom/android/phone/SmallerHitTargetTouchListener;

    invoke-direct {v3}, Lcom/android/phone/SmallerHitTargetTouchListener;-><init>()V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 312
    :cond_3
    new-instance v1, Lcom/android/phone/SmallerHitTargetTouchListener;

    invoke-direct {v1}, Lcom/android/phone/SmallerHitTargetTouchListener;-><init>()V

    .line 313
    .local v1, smallerHitTargetTouchListener:Landroid/view/View$OnTouchListener;
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 315
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/phone/ext/ExtensionManager;->getInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/mediatek/phone/ext/InCallTouchUiExtension;->onFinishInflate(Landroid/view/View;)V

    .line 316
    return-void

    .line 229
    .end local v1           #smallerHitTargetTouchListener:Landroid/view/View$OnTouchListener;
    :cond_4
    const-string v2, "ro.build.characteristics"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, productCharacteristic:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    .line 236
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    if-eqz v2, :cond_5

    .line 237
    if-eqz v0, :cond_7

    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 238
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    :cond_5
    :goto_1
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    .line 249
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    if-eqz v2, :cond_6

    .line 250
    if-eqz v0, :cond_8

    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 251
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    :cond_6
    :goto_2
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    if-eqz v2, :cond_2

    .line 258
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto/16 :goto_0

    .line 240
    :cond_7
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1

    .line 253
    :cond_8
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_2
.end method

.method public onGrabbed(Landroid/view/View;I)V
    .locals 0
    .parameter "v"
    .parameter "handle"

    .prologue
    .line 1316
    return-void
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .locals 5
    .parameter "v"
    .parameter "grabbedState"

    .prologue
    .line 1635
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-eqz v2, :cond_0

    .line 1641
    packed-switch p2, :pswitch_data_0

    .line 1648
    const-string v2, "InCallTouchUi"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onGrabbedStateChange: unexpected grabbedState: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1650
    const/4 v1, 0x0

    .line 1651
    .local v1, hintTextResId:I
    const/4 v0, 0x0

    .line 1657
    .local v0, hintColorResId:I
    :goto_0
    iget-object v2, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v2, v1, v0}, Lcom/android/phone/InCallScreen;->updateIncomingCallWidgetHint(II)V

    .line 1659
    .end local v0           #hintColorResId:I
    .end local v1           #hintTextResId:I
    :cond_0
    return-void

    .line 1644
    :pswitch_0
    const/4 v1, 0x0

    .line 1645
    .restart local v1       #hintTextResId:I
    const/4 v0, 0x0

    .line 1646
    .restart local v0       #hintColorResId:I
    goto :goto_0

    .line 1641
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onIncomingRing()V
    .locals 0

    .prologue
    .line 1672
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 7
    .parameter "view"

    .prologue
    const/4 v3, 0x0

    .line 643
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    .line 644
    .local v2, id:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onLongClick(View "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 646
    packed-switch v2, :pswitch_data_0

    .line 667
    :pswitch_0
    const-string v4, "InCallTouchUi"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLongClick() with unexpected View "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". Ignoring it."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    :goto_0
    return v3

    .line 654
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    .line 655
    .local v1, description:Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 658
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 660
    .local v0, cheatSheet:Landroid/widget/Toast;
    const/16 v4, 0x51

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v0, v4, v3, v5}, Landroid/widget/Toast;->setGravity(III)V

    .line 662
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 664
    .end local v0           #cheatSheet:Landroid/widget/Toast;
    :cond_0
    const/4 v3, 0x1

    goto :goto_0

    .line 646
    nop

    :pswitch_data_0
    .packed-switch 0x7f08007d
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v3, 0x1

    .line 1215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- onMenuItemClick: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  title: \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1219
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-nez v0, :cond_0

    .line 1220
    const-string v0, "InCallTouchUi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onMenuItemClick("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), but null mInCallScreen!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1243
    :goto_0
    return v3

    .line 1224
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1238
    const-string v0, "InCallTouchUi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onMenuItemClick:  unexpected View ID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (MenuItem = \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1226
    :pswitch_0
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v1, Lcom/android/phone/InCallScreen$InCallAudioMode;->SPEAKER:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 1232
    :pswitch_1
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v1, Lcom/android/phone/InCallScreen$InCallAudioMode;->EARPIECE:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 1235
    :pswitch_2
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v1, Lcom/android/phone/InCallScreen$InCallAudioMode;->BLUETOOTH:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 1224
    :pswitch_data_0
    .packed-switch 0x7f080134
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onReleased(Landroid/view/View;I)V
    .locals 0
    .parameter "v"
    .parameter "handle"

    .prologue
    .line 1321
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .locals 4
    .parameter "view"
    .parameter "whichHandle"

    .prologue
    const/4 v3, 0x0

    .line 1330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onTrigger(whichHandle = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1332
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-nez v0, :cond_0

    .line 1333
    const-string v0, "InCallTouchUi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTrigger("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") from incoming-call widget, but null mInCallScreen!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1412
    :goto_0
    return-void

    .line 1344
    :cond_0
    iput-boolean v3, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    .line 1345
    packed-switch p2, :pswitch_data_0

    .line 1396
    const-string v0, "InCallTouchUi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDialTrigger: unexpected whichHandle value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1407
    :goto_1
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->hideIncomingCallWidget()V

    .line 1411
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0, v3, v3}, Lcom/android/phone/InCallScreen;->updateIncomingCallWidgetHint(II)V

    goto :goto_0

    .line 1347
    :pswitch_0
    const-string v0, "ANSWER_CALL_ID: answer!"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1348
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->cancelIncomingPingTime()V

    .line 1349
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v1, 0x7f080008

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    .line 1350
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    .line 1355
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingCallActionTime:J

    goto :goto_1

    .line 1359
    :pswitch_1
    const-string v0, "SEND_SMS_ID!"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1360
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v1, 0x7f08000a

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    goto :goto_1

    .line 1388
    :pswitch_2
    const-string v0, "DECLINE_CALL_ID: reject!"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1389
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v1, 0x7f080009

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    .line 1392
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingCallActionTime:J

    goto :goto_1

    .line 1345
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public refreshAudioModePopup()V
    .locals 1

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopupVisible:Z

    if-eqz v0, :cond_0

    .line 1206
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 1208
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->showAudioModePopup()V

    .line 1210
    :cond_0
    return-void
.end method

.method setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "inCallScreen"

    .prologue
    .line 183
    iput-object p1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    .line 184
    return-void
.end method

.method public triggerPing()V
    .locals 4

    .prologue
    .line 1682
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "triggerPing: mIncomingCallWidget = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1684
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->isForegroundActivity()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1687
    const-string v0, "- triggerPing: InCallScreen no longer in foreground; ignoring..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1731
    :goto_0
    return-void

    .line 1691
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    if-nez v0, :cond_1

    .line 1694
    const-string v0, "InCallTouchUi"

    const-string v1, "- triggerPing: null mIncomingCallWidget!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1698
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- triggerPing: mIncomingCallWidget visibility = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->getVisibility()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 1701
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v0}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    .line 1702
    const-string v0, "- triggerPing: mIncomingCallWidget no longer visible; ignoring..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1708
    :cond_2
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mIncomingCallWidget:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v0}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->ping()V

    .line 1728
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x65

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method updateInCallControls(Lcom/android/internal/telephony/CallManager;)V
    .locals 9
    .parameter "cm"

    .prologue
    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v3, 0x1

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 677
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 678
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->updateInCallControlsDuringDMLocked()V

    .line 899
    :goto_0
    return-void

    .line 681
    :cond_0
    const/4 v1, 0x1

    .line 682
    .local v1, phoneType:I
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v4

    if-eqz v4, :cond_a

    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v4, v4, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v4}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 683
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v4, v4, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v4}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 700
    :goto_1
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v4}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v0

    .line 703
    .local v0, inCallControlState:Lcom/android/phone/InCallControlState;
    const-string v4, "updateInCallControls()..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 704
    invoke-virtual {v0}, Lcom/android/phone/InCallControlState;->dumpState()V

    .line 717
    iget-boolean v4, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    if-eqz v4, :cond_2

    .line 718
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canAddCall:Z

    if-eqz v4, :cond_b

    .line 719
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 720
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 721
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 748
    :goto_2
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canAddCall:Z

    if-eqz v4, :cond_2

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canMerge:Z

    if-eqz v4, :cond_2

    .line 749
    if-eq v1, v3, :cond_1

    if-ne v1, v7, :cond_10

    .line 756
    :cond_1
    const-string v4, "InCallTouchUi"

    const-string v7, "updateInCallControls: Add *and* Merge enabled, but can\'t show both!"

    invoke-static {v4, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    :cond_2
    :goto_3
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    if-eqz v4, :cond_3

    .line 773
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->canAddCall:Z

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 777
    :cond_3
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->isPhoneInEcm(Lcom/android/internal/telephony/Phone;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    if-eqz v4, :cond_4

    .line 778
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMenuButton:Landroid/widget/ImageButton;

    invoke-virtual {v4, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 782
    :cond_4
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->canEndCall:Z

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 786
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->dialpadEnabled:Z

    invoke-virtual {v4, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 787
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->dialpadVisible:Z

    invoke-virtual {v4, v7}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 790
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->canMute:Z

    invoke-virtual {v4, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 791
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMuteButton:Landroid/widget/CompoundButton;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->muteIndicatorOn:Z

    invoke-virtual {v4, v7}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 794
    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->updateAudioButton(Lcom/android/phone/InCallControlState;)V

    .line 800
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canHold:Z

    if-eqz v4, :cond_12

    .line 801
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 802
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 803
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    iget-boolean v7, v0, Lcom/android/phone/InCallControlState;->onHold:Z

    invoke-virtual {v4, v7}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 804
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 805
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldSwapSpacer:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 834
    :goto_4
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v4}, Lcom/android/phone/InCallScreen;->updateButtonStateOutsideInCallTouchUi()V

    .line 835
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canSwap:Z

    if-eqz v4, :cond_5

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canHold:Z

    if-eqz v4, :cond_5

    .line 841
    const-string v4, "InCallTouchUi"

    const-string v7, "updateInCallControls: Hold *and* Swap enabled, but can\'t show both!"

    invoke-static {v4, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    :cond_5
    if-ne v1, v8, :cond_6

    .line 845
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canSwap:Z

    if-eqz v4, :cond_6

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canMerge:Z

    if-eqz v4, :cond_6

    .line 851
    const-string v4, "InCallTouchUi"

    const-string v7, "updateInCallControls: Merge *and* Swapenabled, but can\'t show both!"

    invoke-static {v4, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 867
    :cond_6
    if-ne v1, v8, :cond_15

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canMerge:Z

    if-eqz v4, :cond_15

    move v2, v3

    .line 869
    .local v2, showCdmaMerge:Z
    :goto_5
    if-nez v2, :cond_7

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->manageConferenceVisible:Z

    if-eqz v4, :cond_16

    iget-boolean v4, p0, Lcom/android/phone/InCallTouchUi;->mNotShowDualTalkConference:Z

    if-eqz v4, :cond_16

    .line 871
    .local v3, showExtraButtonRow:Z
    :cond_7
    :goto_6
    if-eqz v3, :cond_19

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->dialpadVisible:Z

    if-nez v4, :cond_19

    .line 873
    invoke-direct {p0, v5}, Lcom/android/phone/InCallTouchUi;->setExtraButtonVisibility(I)V

    .line 877
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    if-nez v4, :cond_8

    .line 878
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->setupExtraButtons()V

    .line 880
    :cond_8
    iget-object v7, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    if-eqz v2, :cond_17

    move v4, v5

    :goto_7
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 881
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->manageConferenceVisible:Z

    if-eqz v4, :cond_18

    .line 882
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButton:Landroid/view/ViewGroup;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 883
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButtonImage:Landroid/widget/ImageButton;

    iget-boolean v5, v0, Lcom/android/phone/InCallControlState;->manageConferenceEnabled:Z

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 896
    :cond_9
    :goto_8
    const-string v4, "At the end of updateInCallControls()."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 897
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->dumpBottomButtonState()V

    goto/16 :goto_0

    .line 685
    .end local v0           #inCallControlState:Lcom/android/phone/InCallControlState;
    .end local v2           #showCdmaMerge:Z
    .end local v3           #showExtraButtonRow:Z
    :cond_a
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    goto/16 :goto_1

    .line 722
    .restart local v0       #inCallControlState:Lcom/android/phone/InCallControlState;
    :cond_b
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canMerge:Z

    if-eqz v4, :cond_f

    .line 723
    if-ne v1, v8, :cond_c

    .line 727
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_2

    .line 728
    :cond_c
    if-eq v1, v3, :cond_d

    if-ne v1, v7, :cond_e

    .line 730
    :cond_d
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 731
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 732
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_2

    .line 734
    :cond_e
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected phone type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 744
    :cond_f
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 745
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 746
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_2

    .line 758
    :cond_10
    if-ne v1, v8, :cond_11

    .line 761
    const-string v4, "updateInCallControls: CDMA: Add and Merge both enabled"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 763
    :cond_11
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected phone type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 806
    :cond_12
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canSwap:Z

    if-eqz v4, :cond_13

    .line 807
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 808
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 809
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v6}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 810
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldSwapSpacer:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_4

    .line 822
    :cond_13
    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->supportsHold:Z

    if-eqz v4, :cond_14

    .line 823
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 824
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 825
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 826
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 827
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldSwapSpacer:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_4

    .line 829
    :cond_14
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v6}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 830
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 831
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldSwapSpacer:Landroid/view/View;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_4

    :cond_15
    move v2, v5

    .line 867
    goto/16 :goto_5

    .restart local v2       #showCdmaMerge:Z
    :cond_16
    move v3, v5

    .line 869
    goto/16 :goto_6

    .restart local v3       #showExtraButtonRow:Z
    :cond_17
    move v4, v6

    .line 880
    goto/16 :goto_7

    .line 885
    :cond_18
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mManageConferenceButton:Landroid/view/ViewGroup;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 887
    iget-boolean v4, p0, Lcom/android/phone/InCallTouchUi;->mNotShowDualTalkConference:Z

    if-nez v4, :cond_9

    .line 888
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mCdmaMergeButton:Landroid/view/ViewGroup;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_8

    .line 892
    :cond_19
    invoke-direct {p0, v6}, Lcom/android/phone/InCallTouchUi;->setExtraButtonVisibility(I)V

    goto/16 :goto_8
.end method

.method updateInCallControlsDuringDMLocked()V
    .locals 5

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 600
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v0

    .line 607
    .local v0, inCallControlState:Lcom/android/phone/InCallControlState;
    iget-boolean v1, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    if-eqz v1, :cond_1

    .line 608
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    if-eqz v1, :cond_0

    .line 609
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 610
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mAddButton:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 613
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    if-eqz v1, :cond_1

    .line 614
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mMergeButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 621
    :cond_1
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mEndButton:Landroid/widget/Button;

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 623
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mDialpadButton:Landroid/widget/CompoundButton;

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->dialpadEnabled:Z

    invoke-virtual {v1, v4}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 624
    iget-object v4, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    iget-boolean v1, v0, Lcom/android/phone/InCallControlState;->canShowSwap:Z

    if-eqz v1, :cond_3

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 625
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mHoldButton:Landroid/widget/CompoundButton;

    invoke-virtual {v1, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 627
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    iget-boolean v4, v0, Lcom/android/phone/InCallControlState;->canShowSwap:Z

    if-eqz v4, :cond_2

    move v2, v3

    :cond_2
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 628
    iget-object v1, p0, Lcom/android/phone/InCallTouchUi;->mSwapButton:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 631
    invoke-direct {p0, v0}, Lcom/android/phone/InCallTouchUi;->updateAudioButton(Lcom/android/phone/InCallControlState;)V

    .line 632
    return-void

    :cond_3
    move v1, v3

    .line 624
    goto :goto_0
.end method

.method updateState(Lcom/android/internal/telephony/CallManager;)V
    .locals 12
    .parameter "cm"

    .prologue
    .line 327
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-nez v8, :cond_0

    .line 328
    const-string v8, "- updateState: mInCallScreen has been destroyed; bailing out..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 535
    :goto_0
    return-void

    .line 332
    :cond_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    .line 333
    .local v7, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateState: current state = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 335
    const/4 v6, 0x0

    .line 336
    .local v6, showIncomingCallControls:Z
    const/4 v5, 0x0

    .line 338
    .local v5, showInCallControls:Z
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    .line 339
    .local v4, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    .line 346
    .local v1, fgCallState:Lcom/android/internal/telephony/Call$State;
    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_6

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 358
    :cond_1
    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v8

    if-eqz v8, :cond_5

    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v8}, Lcom/android/phone/InCallScreen;->getOnAnswerAndEndFlag()Z

    move-result v8

    if-nez v8, :cond_5

    .line 359
    const-string v8, "- updateState: RINGING!  Showing incoming call controls..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 360
    const/4 v6, 0x1

    .line 381
    :cond_2
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 382
    .local v2, now:J
    iget-wide v8, p0, Lcom/android/phone/InCallTouchUi;->mLastIncomingCallActionTime:J

    const-wide/16 v10, 0x1f4

    add-long/2addr v8, v10

    cmp-long v8, v2, v8

    if-gez v8, :cond_3

    .line 383
    const-string v8, "updateState: Too soon after last action; not drawing!"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 384
    const/4 v6, 0x0

    .line 385
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 386
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const-wide/16 v9, 0x1f4

    invoke-virtual {v8, v9, v10}, Lcom/android/phone/InCallScreen;->requestUpdateScreenDelay(J)V

    .line 403
    :cond_3
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v8}, Lcom/android/phone/InCallScreen;->isQuickResponseDialogShowing()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 404
    const-string v8, "updateState: quickResponse visible. Cancel showing incoming call controls."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 405
    const/4 v6, 0x0

    .line 432
    .end local v2           #now:J
    :cond_4
    :goto_2
    if-eqz v6, :cond_a

    if-eqz v5, :cond_a

    .line 433
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "\'Incoming\' and \'in-call\' touch controls visible at the same time!"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 365
    :cond_5
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getFgCallConnections()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getBgCallConnections()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    add-int/2addr v8, v9

    if-lez v8, :cond_2

    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->okToShowInCallControls()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 367
    const/4 v5, 0x1

    goto :goto_1

    .line 409
    :cond_6
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->okToShowInCallControls()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 412
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 413
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 414
    .local v0, fg:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 415
    const/4 v5, 0x0

    .line 416
    const-string v8, "- updateState: dualtalk case NOT OK to show touch UI; disabling..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 418
    :cond_7
    const/4 v5, 0x1

    goto :goto_2

    .line 421
    .end local v0           #fg:Lcom/android/internal/telephony/Call;
    :cond_8
    const/4 v5, 0x1

    goto :goto_2

    .line 424
    :cond_9
    const-string v8, "- updateState: NOT OK to show touch UI; disabling..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 436
    :cond_a
    iget-boolean v8, p0, Lcom/android/phone/InCallTouchUi;->mShowInCallControlsDuringHidingAnimation:Z

    if-eqz v8, :cond_b

    .line 438
    const-string v8, "- updateState: FORCE showing in-call controls during incoming call widget being hidden with animation"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 441
    const/4 v5, 0x1

    .line 447
    :cond_b
    if-eqz v5, :cond_f

    .line 448
    const-string v8, "- updateState: showing in-call controls..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 449
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallTouchUi;->updateInCallControls(Lcom/android/internal/telephony/CallManager;)V

    .line 450
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 456
    :goto_3
    if-eqz v6, :cond_12

    .line 457
    const-string v8, "- updateState: showing incoming call widget..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 458
    invoke-direct {p0, v4}, Lcom/android/phone/InCallTouchUi;->showIncomingCallWidget(Lcom/android/internal/telephony/Call;)V

    .line 461
    iget-boolean v8, p0, Lcom/android/phone/InCallTouchUi;->mHasPermanentMenuKey:Z

    if-nez v8, :cond_10

    invoke-static {p1}, Lcom/mediatek/phone/InCallMenuState;->canIncomingMenuShow(Lcom/android/internal/telephony/CallManager;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 462
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 474
    :goto_4
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v8, v8, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableSystemBarNavigation(Z)V

    .line 475
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_c

    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 476
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f0d0166

    const/4 v10, 0x1

    invoke-static {v8, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 480
    :cond_c
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_11

    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->isMultiplePhoneActive()Z

    move-result v8

    if-eqz v8, :cond_11

    .line 495
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    if-eqz v8, :cond_d

    .line 496
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 524
    :cond_d
    :goto_5
    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v7, v8, :cond_14

    sget-object v8, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-eq v1, v8, :cond_e

    sget-object v8, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v8, :cond_14

    .line 534
    :cond_e
    :goto_6
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/phone/ext/ExtensionManager;->getInCallTouchUiExtension()Lcom/mediatek/phone/ext/InCallTouchUiExtension;

    move-result-object v8

    invoke-virtual {v8, p1}, Lcom/mediatek/phone/ext/InCallTouchUiExtension;->updateState(Lcom/android/internal/telephony/CallManager;)V

    goto/16 :goto_0

    .line 452
    :cond_f
    const-string v8, "- updateState: HIDING in-call controls..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 453
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mInCallControls:Landroid/view/View;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3

    .line 464
    :cond_10
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_4

    .line 498
    :cond_11
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    if-eqz v8, :cond_d

    .line 499
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_5

    .line 502
    :cond_12
    const-string v8, "- updateState: HIDING incoming call widget..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V

    .line 503
    invoke-direct {p0}, Lcom/android/phone/InCallTouchUi;->hideIncomingCallWidget()V

    .line 504
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mIncomingMenuButton:Landroid/widget/ImageButton;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 505
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    if-eqz v8, :cond_13

    .line 506
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mRejectCallNoti:Landroid/widget/TextView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 511
    :cond_13
    iget-object v8, p0, Lcom/android/phone/InCallTouchUi;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v8, v8, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableSystemBarNavigation(Z)V

    .line 513
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->cancelIncomingPingTime()V

    goto :goto_5

    .line 531
    :cond_14
    invoke-virtual {p0}, Lcom/android/phone/InCallTouchUi;->dismissAudioModePopup()V

    goto :goto_6
.end method
