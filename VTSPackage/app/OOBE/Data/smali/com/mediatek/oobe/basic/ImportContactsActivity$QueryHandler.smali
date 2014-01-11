.class Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QueryHandler"
.end annotation


# instance fields
.field protected final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/mediatek/oobe/basic/ImportContactsActivity;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method public constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    .line 936
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    .line 937
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 938
    new-instance v0, Ljava/lang/ref/WeakReference;

    check-cast p2, Lcom/mediatek/oobe/basic/ImportContactsActivity;

    .end local p2
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 939
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 9
    .parameter "token"
    .parameter "cookie"
    .parameter "cursor"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 943
    const-string v6, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Query Complete: cursor.getcount is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 944
    move v3, p1

    .line 948
    .local v3, slotIndex:I
    :try_start_0
    invoke-static {}, Lcom/mediatek/oobe/utils/Utils;->isGemini()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 949
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v6, v3}, Lcom/android/internal/telephony/ITelephony;->isRadioOnGemini(I)Z

    move-result v6

    if-nez v6, :cond_1

    .line 950
    :cond_0
    const-string v6, "OOBE"

    const-string v7, " query cursor enter gemini phone, null cursor"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 951
    const/4 p3, 0x0

    .line 965
    :cond_1
    :goto_0
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v3

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v6, :cond_5

    .line 966
    if-eqz p3, :cond_2

    .line 967
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    .line 995
    :cond_2
    :goto_1
    return-void

    .line 954
    :cond_3
    :try_start_1
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v6}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v6

    if-nez v6, :cond_1

    .line 955
    :cond_4
    const/4 p3, 0x0

    .line 956
    const-string v6, "OOBE"

    const-string v7, " query cursor enter single phone, null cursor"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 960
    :catch_0
    move-exception v0

    .line 961
    .local v0, e:Landroid/os/RemoteException;
    const-string v4, "OOBE"

    const-string v5, "RemoteException!"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 971
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_5
    if-nez p3, :cond_6

    .line 972
    const-string v6, "OOBE"

    const-string v7, "Contact import, query cursor is null, Just return"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 973
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$700(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 974
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mTextCopyNote:Landroid/widget/TextView;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$700(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/TextView;

    move-result-object v5

    const v6, 0x7f090083

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 975
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBackBtn:Landroid/widget/Button;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$800(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 976
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mNextBtn:Landroid/widget/Button;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 979
    :cond_6
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v7

    iput v7, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    .line 980
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v3

    iput-boolean v4, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsCopying:Z

    .line 981
    const-string v6, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Query Complete: Total contact count of SIM "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v8}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v8

    aget-object v8, v8, v3

    iget v8, v8, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 984
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCursorQuerySims:[Landroid/database/Cursor;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1000(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Landroid/database/Cursor;

    move-result-object v6

    aput-object p3, v6, v3

    .line 985
    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v3

    iput-boolean v4, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mQuerySimDone:Z

    .line 987
    const/4 v2, 0x1

    .line 988
    .local v2, queryDone:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1100()I

    move-result v6

    if-ge v1, v6, :cond_9

    .line 989
    if-eqz v2, :cond_8

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v1

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v6, :cond_7

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v1

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v6, :cond_8

    iget-object v6, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v6}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v6

    aget-object v6, v6, v1

    iget-boolean v6, v6, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mQuerySimDone:Z

    if-eqz v6, :cond_8

    :cond_7
    move v2, v4

    .line 988
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_8
    move v2, v5

    .line 989
    goto :goto_3

    .line 992
    :cond_9
    if-eqz v2, :cond_2

    .line 993
    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$QueryHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->startCopy()V
    invoke-static {v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1200(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    goto/16 :goto_1
.end method
