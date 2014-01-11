.class public Lcom/mediatek/oobe/basic/ImportContactsActivity;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "ImportContactsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;,
        Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;,
        Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;,
        Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;,
        Lcom/mediatek/oobe/basic/ImportContactsActivity$ClockHandler;,
        Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    }
.end annotation


# static fields
.field private static final CLAUSE_ONLY_VISIBLE:Ljava/lang/String; = "in_visible_group=1"

.field private static final COPYING_DIALOG_ID:I = 0x65

.field private static final ID_CANCEL_COPY:I = 0x2

.field private static final ID_END_COPY:I = 0x1

.field private static final ID_IN_COPY:I = 0x0

.field private static final IMPORT_CONTACTS_STATE:Ljava/lang/String; = "is_import_state"

.field static final MESSAGE_TIME_OUT:I = 0x1

.field private static final NOTIFICATION_ID:I = 0x11

.field private static final QUERY_TOKEN:I = 0x1

.field private static final SIM_STATE_ABSENT:I = 0x3

.field private static final SIM_STATE_LOCK:I = 0x2

.field private static final SIM_STATE_NORMAL:I = 0x1

.field private static final SIM_SUCCESS_COPYCOUNT:Ljava/lang/String; = "sim_success_copycount"

.field private static final SIM_TOTAL_CONTACTS:Ljava/lang/String; = "sim_total"

.field private static final SLOT_INDEX_1:I = 0x0

.field private static final SLOT_INDEX_2:I = 0x1

.field private static final SLOT_INDEX_3:I = 0x2

.field private static final SLOT_INDEX_4:I = 0x3

#the value of this static final field might be set in the static constructor
.field private static final SLOT_TOTAL_NUMBER:I = 0x0

.field private static final SUMMARY_DISPLAY_NAME_ALTERNATIVE_COLUMN_INDEX:I = 0x2

.field private static final SUMMARY_DISPLAY_NAME_PRIMARY_COLUMN_INDEX:I = 0x1

.field private static final SUMMARY_HAS_PHONE_COLUMN_INDEX:I = 0xa

.field private static final SUMMARY_ID_COLUMN_INDEX:I = 0x0

.field private static final SUMMARY_LOOKUP_KEY_COLUMN_INDEX:I = 0x8

.field private static final SUMMARY_PHONETIC_NAME_COLUMN_INDEX:I = 0x9

.field private static final SUMMARY_PHOTO_ID_COLUMN_INDEX:I = 0x7

.field private static final SUMMARY_PRESENCE_STATUS_COLUMN_INDEX:I = 0x6

.field private static final SUMMARY_SNIPPET_DATA1_COLUMN_INDEX:I = 0xc

.field private static final SUMMARY_SNIPPET_DATA4_COLUMN_INDEX:I = 0xd

.field private static final SUMMARY_SNIPPET_MIMETYPE_COLUMN_INDEX:I = 0xb

.field private static final SUMMARY_SORT_KEY_PRIMARY_COLUMN_INDEX:I = 0x3

.field private static final SUMMARY_STARRED_COLUMN_INDEX:I = 0x4

.field private static final SUMMARY_TIMES_CONTACTED_COLUMN_INDEX:I = 0x5

.field private static final TAG:Ljava/lang/String; = "OOBE"

.field static final TAG_CANCEL:Ljava/lang/String; = "cancel"

.field static final TAG_IMPORT:Ljava/lang/String; = "import"

.field private static final UI_CANCEL_COPY:I = 0x4

.field private static final UI_FINISH_QUERY:I = 0x2

.field private static final UI_FNISH_COPY:I = 0x3

.field private static final UI_START_COPY:I = 0x2

.field private static final UI_START_QUERY:I = 0x1

.field private static sCanceled:Z

.field private static sCopying:Z

.field private static sFirstRunning:Z


# instance fields
.field private mBeingCopied:Z

.field private mBeingQuery:Z

.field private mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private final mContactsProjection:[Ljava/lang/String;

.field private mCopyHandler:Landroid/os/Handler;

.field private mCopyThread:Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;

.field private mCursorQuerySims:[Landroid/database/Cursor;

.field private mITelephony:Lcom/android/internal/telephony/ITelephony;

.field private mImportBtn:Landroid/widget/Button;

.field private mIsSlot1Insert:Z

.field private mIsSlot2Insert:Z

.field private mListView:Landroid/widget/ListView;

.field private mMapSlot2SimInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/provider/Telephony$SIMInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mNotification:Landroid/app/Notification;

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private mProgressBeenInitFlag:Z

.field private mQueryHandler:Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;

.field private mResultSimLock:Ljava/lang/Integer;

.field private mSelfChangeFlag:Z

.field private mServiceComplete:Ljava/lang/Runnable;

.field private mServiceCompleteThread:Ljava/lang/Thread;

.field private mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

.field mSimStateListener:Landroid/content/BroadcastReceiver;

.field private mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

.field private mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

.field private mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

.field private mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

.field private mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

.field final mTelephonyService:Lcom/android/internal/telephony/ITelephony;

.field private mTextCopyNote:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 112
    sget v0, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    sput v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    .line 218
    sput-boolean v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sFirstRunning:Z

    .line 219
    sput-boolean v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCopying:Z

    .line 220
    sput-boolean v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCanceled:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 146
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string v2, "display_name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "display_name_alt"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "sort_key"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "starred"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "times_contacted"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "contact_presence"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "photo_id"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "lookup"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "phonetic_name"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "has_phone_number"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "indicate_phone_or_sim_contact"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mContactsProjection:[Ljava/lang/String;

    .line 202
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mIsSlot1Insert:Z

    .line 203
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mIsSlot2Insert:Z

    .line 205
    sget v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    new-array v0, v0, [Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    .line 206
    sget v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    new-array v0, v0, [Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 207
    sget v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    new-array v0, v0, [Landroid/database/Cursor;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCursorQuerySims:[Landroid/database/Cursor;

    .line 212
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z

    .line 213
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingQuery:Z

    .line 216
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSelfChangeFlag:Z

    .line 217
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mProgressBeenInitFlag:Z

    .line 226
    const-string v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    .line 228
    new-instance v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;Lcom/mediatek/oobe/basic/ImportContactsActivity$1;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;

    .line 229
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mResultSimLock:Ljava/lang/Integer;

    .line 235
    new-instance v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$1;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimStateListener:Landroid/content/BroadcastReceiver;

    .line 254
    new-instance v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mServiceComplete:Ljava/lang/Runnable;

    .line 264
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mServiceComplete:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mServiceCompleteThread:Ljava/lang/Thread;

    .line 265
    new-instance v0, Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mServiceCompleteThread:Ljava/lang/Thread;

    invoke-direct {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 1039
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateSimPreference()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Landroid/database/Cursor;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCursorQuerySims:[Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic access$1100()I
    .locals 1

    .prologue
    .line 105
    sget v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    return v0
.end method

.method static synthetic access$1200(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->startCopy()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->finishProgressBar(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/mediatek/oobe/basic/ImportContactsActivity;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 105
    invoke-direct {p0, p1, p2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->incrementProgressTo(II)V

    return-void
.end method

.method static synthetic access$1500(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V

    return-void
.end method

.method static synthetic access$1600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->dealWithCancel()V

    return-void
.end method

.method static synthetic access$1700(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z

    return v0
.end method

.method static synthetic access$1702(Lcom/mediatek/oobe/basic/ImportContactsActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 105
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z

    return p1
.end method

.method static synthetic access$1800()Z
    .locals 1

    .prologue
    .line 105
    sget-boolean v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCanceled:Z

    return v0
.end method

.method static synthetic access$1802(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    sput-boolean p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCanceled:Z

    return p0
.end method

.method static synthetic access$1900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->disableSimPreference()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Ljava/lang/Integer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mResultSimLock:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$302(Lcom/mediatek/oobe/basic/ImportContactsActivity;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mResultSimLock:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Lcom/mediatek/CellConnService/CellConnMgr;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->startQuery()V

    return-void
.end method

.method static synthetic access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBackBtn:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    return-object v0
.end method

.method private addGeminiSimInfoPreference()V
    .locals 18

    .prologue
    .line 518
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 519
    invoke-static/range {p0 .. p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v14

    .line 521
    .local v14, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sim number is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/provider/Telephony$SIMInfo;

    .line 523
    .local v16, siminfo:Landroid/provider/Telephony$SIMInfo;
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "siminfo.mSlot "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    iget v4, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    move-object/from16 v0, v16

    iget v3, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 527
    .end local v16           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v15

    .line 528
    .local v15, simPrefScreen:Landroid/preference/PreferenceScreen;
    if-nez v15, :cond_2

    .line 529
    const-string v2, "OOBE"

    const-string v3, "simPrefScreen is null"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    :cond_1
    :goto_1
    return-void

    .line 532
    :cond_2
    invoke-virtual {v15}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 534
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_3
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 535
    .local v17, slotIndex:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/provider/Telephony$SIMInfo;

    .line 537
    .restart local v16       #siminfo:Landroid/provider/Telephony$SIMInfo;
    if-nez v16, :cond_4

    .line 538
    const-string v2, "OOBE"

    const-string v3, "siminfo is null"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v17

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    goto :goto_1

    .line 553
    :cond_4
    const/4 v6, -0x1

    .line 555
    .local v6, status:I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v0, v16

    iget v3, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 559
    :goto_3
    new-instance v1, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    move-object/from16 v0, v16

    iget-object v3, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v0, v16

    iget-object v4, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    move-object/from16 v0, v16

    iget v5, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move-object/from16 v0, v16

    iget v7, v0, Landroid/provider/Telephony$SIMInfo;->mColor:I

    move-object/from16 v0, v16

    iget v8, v0, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    move-object/from16 v0, v16

    iget-wide v9, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    const/4 v11, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v11}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V

    .line 562
    .local v1, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    sget-boolean v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sFirstRunning:Z

    if-eqz v2, :cond_5

    .line 563
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v17

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    .line 565
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setCheck(Z)V

    .line 566
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setImporting(Z)V

    .line 567
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setFinishImporting(Z)V

    .line 569
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "simid status is  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    if-eqz v1, :cond_3

    .line 572
    move-object/from16 v0, v16

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v2, :cond_6

    .line 573
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mIsSlot1Insert:Z

    .line 574
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 575
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    .line 576
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v15, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    .line 556
    .end local v1           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :catch_0
    move-exception v12

    .line 557
    .local v12, exception:Landroid/os/RemoteException;
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RemoteException "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 577
    .end local v12           #exception:Landroid/os/RemoteException;
    .restart local v1       #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :cond_6
    move-object/from16 v0, v16

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_7

    .line 578
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mIsSlot2Insert:Z

    .line 579
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 580
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v3, 0x1

    aput-object v1, v2, v3

    .line 581
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v15, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    .line 582
    :cond_7
    move-object/from16 v0, v16

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_8

    .line 583
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 584
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v3, 0x2

    aput-object v1, v2, v3

    .line 585
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v15, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    .line 586
    :cond_8
    move-object/from16 v0, v16

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    .line 587
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 588
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v3, 0x3

    aput-object v1, v2, v3

    .line 589
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v15, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2
.end method

.method private addSingleSimPrefrence()V
    .locals 15

    .prologue
    .line 596
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v13

    .line 597
    .local v13, simPrefScreen:Landroid/preference/PreferenceScreen;
    if-nez v13, :cond_1

    .line 629
    :cond_0
    :goto_0
    return-void

    .line 600
    :cond_1
    invoke-virtual {v13}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 602
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v12

    .line 603
    .local v12, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 606
    const/4 v1, 0x0

    invoke-interface {v12, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/provider/Telephony$SIMInfo;

    .line 607
    .local v14, siminfo:Landroid/provider/Telephony$SIMInfo;
    const/4 v5, -0x1

    .line 609
    .local v5, status:I
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorState()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 613
    :goto_1
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    iget-object v2, v14, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iget-object v3, v14, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    iget v4, v14, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iget v6, v14, Landroid/provider/Telephony$SIMInfo;->mColor:I

    iget v7, v14, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    iget-wide v8, v14, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    const/4 v10, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v10}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V

    .line 616
    .local v0, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    iget v2, v14, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    sget-boolean v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sFirstRunning:Z

    if-eqz v1, :cond_2

    .line 619
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    .line 621
    :cond_2
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setCheck(Z)V

    .line 622
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setImporting(Z)V

    .line 623
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setFinishImporting(Z)V

    .line 625
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mIsSlot1Insert:Z

    .line 626
    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 627
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 628
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 610
    .end local v0           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :catch_0
    move-exception v11

    .line 611
    .local v11, exception:Landroid/os/RemoteException;
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RemoteException "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v11}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private cancelImporting()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 838
    const/4 v1, 0x1

    sput-boolean v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCanceled:Z

    .line 839
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 842
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v1, :cond_0

    .line 843
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iput v2, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    .line 842
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 845
    :cond_0
    return-void
.end method

.method private checkSimState()Z
    .locals 13

    .prologue
    const/16 v12, 0x12e

    const/4 v11, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 803
    const-string v6, "OOBE"

    const-string v9, "checkSimState() begin "

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 805
    invoke-static {}, Lcom/mediatek/oobe/utils/Utils;->isGemini()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 806
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 807
    .local v2, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_4

    .line 808
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/provider/Telephony$SIMInfo;

    .line 809
    .local v4, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget v5, v4, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    .line 810
    .local v5, slotIndex:I
    const/4 v3, -0x1

    .line 812
    .local v3, simState:I
    :try_start_0
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v6, v5}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 816
    :goto_1
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v5

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v6, :cond_1

    .line 817
    if-eq v3, v11, :cond_0

    if-ne v3, v8, :cond_1

    .line 819
    :cond_0
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v6, v5, v12}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    move v6, v7

    .line 834
    .end local v1           #i:I
    .end local v2           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v3           #simState:I
    .end local v4           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v5           #slotIndex:I
    :goto_2
    return v6

    .line 813
    .restart local v1       #i:I
    .restart local v2       #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .restart local v3       #simState:I
    .restart local v4       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v5       #slotIndex:I
    :catch_0
    move-exception v0

    .line 814
    .local v0, exception:Landroid/os/RemoteException;
    const-string v6, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "RemoteException "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 807
    .end local v0           #exception:Landroid/os/RemoteException;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 825
    .end local v1           #i:I
    .end local v2           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v3           #simState:I
    .end local v4           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v5           #slotIndex:I
    :cond_2
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v7

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v6, :cond_4

    .line 826
    const-string v6, "phone"

    invoke-virtual {p0, v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    .line 827
    .restart local v3       #simState:I
    if-eq v3, v11, :cond_3

    const/4 v6, 0x3

    if-ne v3, v6, :cond_4

    .line 829
    :cond_3
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v6, v7, v12}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    move v6, v7

    .line 830
    goto :goto_2

    .end local v3           #simState:I
    :cond_4
    move v6, v8

    .line 834
    goto :goto_2
.end method

.method private createProgressNotificationBar()V
    .locals 12

    .prologue
    const v11, 0x7f090051

    const/4 v10, 0x0

    .line 716
    const-string v5, "notification"

    invoke-virtual {p0, v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/NotificationManager;

    iput-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotificationManager:Landroid/app/NotificationManager;

    .line 717
    new-instance v5, Landroid/app/Notification;

    const v6, 0x7f020009

    invoke-virtual {p0, v11}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    iput-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    .line 720
    new-instance v1, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f030007

    invoke-direct {v1, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 721
    .local v1, contentView:Landroid/widget/RemoteViews;
    const v5, 0x7f0b0016

    const v6, 0x7f02000a

    invoke-virtual {v1, v5, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 722
    const v5, 0x7f0b0017

    invoke-virtual {p0, v11}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 724
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    iput-object v1, v5, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 727
    new-instance v3, Landroid/content/Intent;

    const-class v5, Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-direct {v3, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 728
    .local v3, notificationIntent:Landroid/content/Intent;
    const/high16 v5, 0x2000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 729
    invoke-static {p0, v10, v3, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 732
    .local v0, contentIntent:Landroid/app/PendingIntent;
    const/4 v4, 0x0

    .line 733
    .local v4, totalNum:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    sget v5, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v2, v5, :cond_0

    .line 734
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v5, v5, v2

    iget v5, v5, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    add-int/2addr v4, v5

    .line 733
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 736
    :cond_0
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    iget-object v5, v5, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v6, 0x7f0b0018

    invoke-virtual {v5, v6, v4, v10, v10}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 738
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v6, 0x11

    iget-object v7, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    invoke-virtual {v5, v6, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 740
    return-void
.end method

.method private dealWithCancel()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 698
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v2, :cond_2

    .line 699
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v2, :cond_1

    .line 700
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "dealWithCancel(), slot "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not selected, so no need to cancel, just jump"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 698
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 704
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iput-boolean v5, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    .line 705
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iput-boolean v5, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    .line 706
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v1, v2, v0

    .line 707
    .local v1, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    if-eqz v1, :cond_0

    .line 708
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dealWithCancel(), slot="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 709
    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->dealWithCancel()V

    goto :goto_1

    .line 712
    .end local v1           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 713
    return-void
.end method

.method private disableSimPreference()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x1

    .line 1466
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_0

    .line 1467
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    .line 1469
    :cond_0
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_1

    .line 1470
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    .line 1472
    :cond_1
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_2

    .line 1473
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    .line 1475
    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_3

    .line 1476
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    .line 1478
    :cond_3
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 1479
    .local v1, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    const-string v3, "hotswapdbg"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sim number is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1481
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_4
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    .line 1482
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v3, :cond_5

    .line 1483
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_4

    .line 1484
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    goto :goto_0

    .line 1486
    :cond_5
    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-ne v3, v6, :cond_6

    .line 1487
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_4

    .line 1488
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    goto :goto_0

    .line 1490
    :cond_6
    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_7

    .line 1491
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_4

    .line 1492
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot3SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    goto :goto_0

    .line 1494
    :cond_7
    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_4

    .line 1495
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v3, :cond_4

    .line 1496
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlot4SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v3, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setEnabled(Z)V

    goto :goto_0

    .line 1501
    .end local v2           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_8
    return-void
.end method

.method private finishProgressBar(I)V
    .locals 3
    .parameter "simIndex"

    .prologue
    .line 678
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v0, v0, p1

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    .line 679
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "finishProgressBar() for SIM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mFinishImporting="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->isFinishImporting()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 681
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->finishProgressBar()V

    .line 682
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 683
    return-void
.end method

.method private getSimStatus(I)I
    .locals 5
    .parameter "slot"

    .prologue
    .line 1517
    const/4 v1, -0x1

    .line 1519
    .local v1, status:I
    :try_start_0
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    .line 1520
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v2, p1}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1527
    :goto_0
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getSimStatus: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1528
    return v1

    .line 1522
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorState()I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    goto :goto_0

    .line 1524
    :catch_0
    move-exception v0

    .line 1525
    .local v0, exception:Landroid/os/RemoteException;
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RemoteException "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private importContacts()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 848
    const/4 v2, 0x1

    .line 849
    .local v2, notSelected:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget v5, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v1, v5, :cond_1

    .line 850
    if-eqz v2, :cond_0

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v5, v5, v1

    iget-boolean v5, v5, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v5, :cond_0

    move v2, v3

    .line 849
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v2, v4

    .line 850
    goto :goto_1

    .line 852
    :cond_1
    if-eqz v2, :cond_2

    .line 853
    const-string v3, "OOBE"

    const-string v4, "No SIM is selected"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 910
    :goto_2
    return-void

    .line 856
    :cond_2
    sget-boolean v4, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCopying:Z

    if-eqz v4, :cond_3

    .line 857
    const-string v3, "OOBE"

    const-string v4, "onClick() importing already, return"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 858
    const/16 v3, 0x65

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->showDialog(I)V

    goto :goto_2

    .line 861
    :cond_3
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->checkSimState()Z

    move-result v4

    if-nez v4, :cond_4

    .line 862
    const-string v3, "OOBE"

    const-string v4, "SIM Locked"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 871
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/mediatek/oobe/utils/Utils;->isGemini()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 877
    const/4 v1, 0x0

    :goto_3
    sget v4, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v1, v4, :cond_7

    .line 878
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v4, v4, v1

    iget-boolean v4, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v4, v1}, Lcom/android/internal/telephony/ITelephony;->getIccCardTypeGemini(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "USIM"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 879
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v4, v4, v1

    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSrcSimUSIM:Z

    .line 877
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 884
    :cond_6
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    if-eqz v4, :cond_7

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v4}, Lcom/android/internal/telephony/ITelephony;->getIccCardType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "USIM"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 885
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSrcSimUSIM:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 908
    :cond_7
    :goto_4
    invoke-direct {p0, v3}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V

    .line 909
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->startQuery()V

    goto :goto_2

    .line 888
    :catch_0
    move-exception v0

    .line 889
    .local v0, ex:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_4
.end method

.method private incrementProgressTo(II)V
    .locals 3
    .parameter "simIndex"
    .parameter "newProgress"

    .prologue
    .line 691
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "SIM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " incrementProgressTo "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->incrementProgressTo(I)V

    .line 694
    invoke-direct {p0, p2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateProgressNotification(I)V

    .line 695
    return-void
.end method

.method private initProgressBar()V
    .locals 5

    .prologue
    .line 662
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v2, :cond_2

    .line 663
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v2, :cond_1

    .line 664
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ImportContacts.initProgressBar(), slot "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not selected to import, jump"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 667
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v1, v2, v0

    .line 668
    .local v1, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    if-eqz v1, :cond_0

    .line 669
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ImportContacts.initProgressBar(), slot="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mTotalCount="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v4, v4, v0

    iget v4, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->initProgressBar(I)V

    goto :goto_1

    .line 674
    .end local v1           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->createProgressNotificationBar()V

    .line 675
    return-void
.end method

.method private initSim()V
    .locals 1

    .prologue
    .line 388
    const-string v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    .line 390
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    .line 391
    new-instance v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;

    invoke-direct {v0, p0, p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mQueryHandler:Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;

    .line 392
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0, p0}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 393
    return-void
.end method

.method private static setFirstRunning(Z)V
    .locals 0
    .parameter "first"

    .prologue
    .line 251
    sput-boolean p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sFirstRunning:Z

    .line 252
    return-void
.end method

.method private startCopy()V
    .locals 1

    .prologue
    .line 999
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V

    .line 1000
    new-instance v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyThread:Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;

    .line 1001
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyThread:Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->start()V

    .line 1002
    return-void
.end method

.method private startQuery()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 913
    const-string v0, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " slot number ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 915
    const-string v0, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " slot number ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 916
    const/4 v1, 0x0

    .local v1, slot:I
    :goto_0
    sget v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v1, v0, :cond_2

    .line 917
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v0, v0, v1

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v0, :cond_0

    .line 918
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v0, v0, v1

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSrcSimUSIM:Z

    if-nez v0, :cond_1

    .line 920
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mQueryHandler:Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;

    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mContactsProjection:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "indicate_phone_or_sim_contact = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget-wide v7, v5, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "in_visible_group=1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "sort_key"

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 916
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 925
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mQueryHandler:Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;

    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mContactsProjection:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "indicate_phone_or_sim_contact = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget-wide v7, v5, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "sort_key"

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 931
    :cond_2
    return-void
.end method

.method private updateCopyNote()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 444
    const/4 v1, 0x1

    .line 445
    .local v1, isCopying:Z
    const/4 v3, 0x1

    .line 446
    .local v3, isImported:Z
    const/4 v2, 0x1

    .line 447
    .local v2, isFinished:Z
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v6, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v6, :cond_5

    .line 448
    if-eqz v1, :cond_2

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v5

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    if-eqz v6, :cond_2

    move v1, v4

    .line 449
    :goto_1
    if-eqz v3, :cond_3

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v0

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v0

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v6, :cond_3

    :cond_0
    move v3, v4

    .line 450
    :goto_2
    if-eqz v2, :cond_4

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v6, v6, v0

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v6, v6, v0

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v6, :cond_4

    :cond_1
    move v2, v4

    .line 447
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    move v1, v5

    .line 448
    goto :goto_1

    :cond_3
    move v3, v5

    .line 449
    goto :goto_2

    :cond_4
    move v2, v5

    .line 450
    goto :goto_3

    .line 452
    :cond_5
    if-eqz v1, :cond_a

    .line 454
    if-eqz v3, :cond_9

    .line 456
    if-eqz v2, :cond_8

    .line 457
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 462
    :goto_4
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v5, 0x7f09006c

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 473
    :cond_6
    :goto_5
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    if-eqz v4, :cond_7

    .line 474
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    const v5, 0x7f090048

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 479
    :cond_7
    :goto_6
    return-void

    .line 459
    :cond_8
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v5, "import"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 460
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const v5, 0x7f090068

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    goto :goto_4

    .line 463
    :cond_9
    if-nez v2, :cond_6

    .line 465
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v7, "cancel"

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 466
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v6, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 467
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const v6, 0x7f090069

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setText(I)V

    .line 469
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 470
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v5, 0x7f09006b

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_5

    .line 477
    :cond_a
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    const v5, 0x7f09004b

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    goto :goto_6
.end method

.method private updateProgressNotification(I)V
    .locals 5
    .parameter "progress"

    .prologue
    .line 743
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    if-eqz v2, :cond_1

    .line 744
    const/4 v1, 0x0

    .line 745
    .local v1, totalNum:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v2, :cond_0

    .line 746
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    add-int/2addr v1, v2

    .line 745
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 748
    :cond_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    iget-object v2, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v3, 0x7f0b0018

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v1, p1, v4}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 749
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v3, 0x11

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNotification:Landroid/app/Notification;

    invoke-virtual {v2, v3, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 751
    .end local v0           #i:I
    .end local v1           #totalNum:I
    :cond_1
    return-void
.end method

.method private updateSimPreference()V
    .locals 9

    .prologue
    .line 1503
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 1504
    .local v3, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    const-string v6, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateSimPreference(), sim number:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1505
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v4

    .line 1506
    .local v4, simNum:I
    add-int/lit8 v0, v4, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_2

    .line 1507
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 1508
    .local v2, preference:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 1509
    .local v5, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget v6, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->getSlotIndex()I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 1510
    iget v6, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getSimStatus(I)I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setStatus(I)V

    goto :goto_1

    .line 1506
    .end local v5           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1515
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #preference:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    :cond_2
    return-void
.end method

.method private updateUI(I)V
    .locals 7
    .parameter "state"

    .prologue
    const v6, 0x7f090068

    const/4 v5, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 754
    if-ne p1, v2, :cond_1

    .line 755
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingQuery:Z

    .line 756
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v4, "cancel"

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 757
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 758
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const v4, 0x7f090069

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(I)V

    .line 759
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 760
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 761
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 762
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v3, 0x7f09006a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 800
    :cond_0
    :goto_0
    return-void

    .line 764
    :cond_1
    const/4 v4, 0x2

    if-ne p1, v4, :cond_2

    .line 765
    iput-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingQuery:Z

    .line 766
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 767
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->initProgressBar()V

    .line 768
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 769
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 770
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    const v4, 0x7f090048

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 771
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v4, 0x7f09006b

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 773
    sput-boolean v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCopying:Z

    goto :goto_0

    .line 774
    :cond_2
    const/4 v4, 0x3

    if-ne p1, v4, :cond_7

    .line 775
    const/4 v1, 0x1

    .line 776
    .local v1, isImported:Z
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget v4, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v4, :cond_5

    .line 777
    if-eqz v1, :cond_4

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    aget-object v4, v4, v0

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v4, v4, v0

    iget-boolean v4, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v4, :cond_4

    :cond_3
    move v1, v2

    .line 776
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    move v1, v3

    .line 777
    goto :goto_2

    .line 779
    :cond_5
    if-eqz v1, :cond_6

    .line 781
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 786
    :goto_3
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v4, 0x7f09006c

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 788
    sput-boolean v3, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCopying:Z

    goto :goto_0

    .line 783
    :cond_6
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setText(I)V

    .line 784
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v4, "import"

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto :goto_3

    .line 789
    .end local v0           #i:I
    .end local v1           #isImported:Z
    :cond_7
    if-ne p1, v5, :cond_0

    .line 790
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 791
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setText(I)V

    .line 792
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v5, "import"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 793
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 794
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 795
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;

    const v4, 0x7f09004b

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(I)V

    .line 796
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    const v4, 0x7f09006d

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 798
    sput-boolean v3, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sCopying:Z

    goto/16 :goto_0
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1455
    const-string v0, "ImportContactsActivity"

    return-object v0
.end method

.method public initSimSlotStatus()V
    .locals 3

    .prologue
    .line 380
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v1, :cond_0

    .line 381
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    new-instance v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    invoke-direct {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;-><init>()V

    aput-object v2, v1, v0

    .line 380
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 384
    :cond_0
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->setFirstRunning(Z)V

    .line 385
    return-void
.end method

.method protected initSpecialLayout()V
    .locals 2

    .prologue
    .line 366
    const v0, 0x7f090051

    const v1, 0x7f090052

    invoke-super {p0, v0, v1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->initSpecialLayout(II)V

    .line 368
    const v0, 0x7f0b0014

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    .line 369
    const v0, 0x7f0b0015

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;

    .line 370
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 371
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mListView:Landroid/widget/ListView;

    .line 372
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const-string v1, "import"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 373
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x1

    .line 502
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 503
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "import"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 504
    const-string v0, "OOBE"

    const-string v1, "onClick() importContacts()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSelfChangeFlag:Z

    .line 506
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->importContacts()V

    .line 515
    :goto_0
    return-void

    .line 508
    :cond_0
    const-string v0, "OOBE"

    const-string v1, "onClick() cancelImporting()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSelfChangeFlag:Z

    .line 510
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->cancelImporting()V

    goto :goto_0

    .line 513
    :cond_1
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 343
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnCreate ImportContactsActivity, isFirstRunning?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->sFirstRunning:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 345
    const v0, 0x7f030006

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->setContentView(I)V

    .line 346
    const v0, 0x7f050002

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->addPreferencesFromResource(I)V

    .line 347
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->initSimSlotStatus()V

    .line 348
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->initLayout()V

    .line 349
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->initSpecialLayout()V

    .line 350
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->initSim()V

    .line 352
    invoke-static {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->registerCallback(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    .line 353
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "dialogId"

    .prologue
    .line 1533
    packed-switch p1, :pswitch_data_0

    .line 1547
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 1535
    :pswitch_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040014

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f090022

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    new-instance v3, Lcom/mediatek/oobe/basic/ImportContactsActivity$3;

    invoke-direct {v3, p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity$3;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1545
    .local v0, dialog:Landroid/app/AlertDialog;
    goto :goto_0

    .line 1533
    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->unregister()V

    .line 399
    invoke-static {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->unregisterCallback(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    .line 400
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->setFirstRunning(Z)V

    .line 401
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onDestroy()V

    .line 402
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 484
    packed-switch p1, :pswitch_data_0

    .line 497
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 487
    :pswitch_0
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingQuery:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z

    if-eqz v0, :cond_0

    .line 488
    :cond_1
    const-string v0, "OOBE"

    const-string v1, "Being queried or copied"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    const/4 v0, 0x1

    goto :goto_0

    .line 484
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 407
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onPause()V

    .line 408
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimStateListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 409
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 7
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x1

    .line 633
    instance-of v1, p2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v1, :cond_0

    move-object v1, p2

    .line 634
    check-cast v1, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->getSlotIndex()I

    move-result v0

    .line 635
    .local v0, slotIndex:I
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v1, :cond_1

    .line 636
    const-string v1, "OOBE"

    const-string v2, "Importing contact, SIM contact has already been imported, can not be unchecked, jump"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    .end local v0           #slotIndex:I
    .end local p2
    :cond_0
    :goto_0
    return v4

    .line 639
    .restart local v0       #slotIndex:I
    .restart local p2
    :cond_1
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    if-eqz v1, :cond_2

    .line 640
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Importing contact, SIM contact in SIM "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is being copy, can not be clicked, jump"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    move-object v1, p2

    .line 644
    check-cast v1, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->getCheck()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 645
    check-cast p2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .end local p2
    invoke-virtual {p2, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setCheck(Z)V

    .line 646
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Slot "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is unselected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    if-le v0, v5, :cond_0

    sget v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v1, :cond_0

    .line 648
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iput-boolean v6, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    goto :goto_0

    .line 651
    .restart local p2
    :cond_3
    check-cast p2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .end local p2
    invoke-virtual {p2, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setCheck(Z)V

    .line 652
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Slot "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    if-le v0, v5, :cond_0

    sget v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v1, :cond_0

    .line 654
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iput-boolean v4, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    goto/16 :goto_0
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedState"

    .prologue
    .line 362
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 363
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 414
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 415
    const-string v2, "OOBE"

    const-string v3, "onResume"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v2, :cond_0

    .line 417
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSlotSimPref:[Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    .line 416
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 421
    :cond_0
    sget v2, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    .line 422
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->addGeminiSimInfoPreference()V

    .line 427
    :goto_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mMapSlot2SimInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 428
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 433
    :goto_2
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 434
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.PHB_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 435
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 436
    const-string v2, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 437
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimStateListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 439
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->setListViewHeightBasedOnChildren(Landroid/widget/ListView;)V

    .line 440
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateCopyNote()V

    .line 441
    return-void

    .line 424
    .end local v1           #intentFilter:Landroid/content/IntentFilter;
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->addSingleSimPrefrence()V

    goto :goto_1

    .line 430
    :cond_2
    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_2
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "outState"

    .prologue
    .line 357
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 358
    return-void
.end method

.method public refreshCancel()V
    .locals 2

    .prologue
    .line 1447
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1448
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mImportBtn:Landroid/widget/Button;

    const v1, 0x7f090068

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 1449
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->dealWithCancel()V

    .line 1450
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V

    .line 1451
    return-void
.end method

.method public refreshProgress()V
    .locals 4

    .prologue
    .line 1416
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ImportContacts===========refreshProgress()==========selfChangeFlag="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSelfChangeFlag:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1417
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSelfChangeFlag:Z

    if-eqz v1, :cond_1

    .line 1444
    :cond_0
    return-void

    .line 1421
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v1, Lcom/mediatek/oobe/basic/ImportContactsActivity;->SLOT_TOTAL_NUMBER:I

    if-ge v0, v1, :cond_0

    .line 1422
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v1, :cond_3

    .line 1423
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SIM in slot "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not selected for contact import, so do not refresh it"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1421
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1431
    :cond_3
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v1, :cond_2

    .line 1432
    :cond_4
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mProgressBeenInitFlag:Z

    if-nez v1, :cond_5

    .line 1433
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mProgressBeenInitFlag:Z

    .line 1434
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V

    .line 1436
    :cond_5
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v1, :cond_6

    .line 1437
    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->finishProgressBar(I)V

    .line 1438
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateCopyNote()V

    goto :goto_1

    .line 1440
    :cond_6
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    invoke-direct {p0, v0, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->incrementProgressTo(II)V

    goto :goto_1
.end method

.method public setListViewHeightBasedOnChildren(Landroid/widget/ListView;)V
    .locals 9
    .parameter "listView"

    .prologue
    const/4 v7, 0x0

    .line 320
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6}, Landroid/preference/PreferenceScreen;->getRootAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    .line 321
    .local v2, listAdapter:Landroid/widget/ListAdapter;
    if-nez v2, :cond_0

    .line 339
    :goto_0
    return-void

    .line 325
    :cond_0
    const/4 v5, 0x0

    .line 326
    .local v5, totalHeight:I
    const/4 v0, 0x0

    .local v0, i:I
    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    .local v1, len:I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 327
    const/4 v6, 0x0

    invoke-interface {v2, v0, v6, p1}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 328
    .local v3, listItem:Landroid/view/View;
    invoke-virtual {v3, v7, v7}, Landroid/view/View;->measure(II)V

    .line 329
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    add-int/2addr v5, v6

    .line 326
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 333
    .end local v3           #listItem:Landroid/view/View;
    :cond_1
    invoke-virtual {p1}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 334
    .local v4, params:Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1}, Landroid/widget/ListView;->getDividerHeight()I

    move-result v6

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    mul-int/2addr v6, v7

    add-int/2addr v6, v5

    iput v6, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 335
    const-string v6, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Total height: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " and height: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Divider Height is :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/widget/ListView;->getDividerHeight()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    invoke-virtual {p1, v4}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method
