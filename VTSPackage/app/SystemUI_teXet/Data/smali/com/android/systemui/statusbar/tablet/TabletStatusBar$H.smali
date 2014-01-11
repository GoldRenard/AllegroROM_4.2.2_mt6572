.class Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;
.super Lcom/android/systemui/statusbar/BaseStatusBar$H;
.source "TabletStatusBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/tablet/TabletStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "H"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;


# direct methods
.method private constructor <init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V
    .registers 2
    .parameter

    .prologue
    .line 703
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/BaseStatusBar$H;-><init>(Lcom/android/systemui/statusbar/BaseStatusBar;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;Lcom/android/systemui/statusbar/tablet/TabletStatusBar$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 703
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;-><init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 13
    .parameter "m"

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    const/16 v5, 0x8

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 705
    invoke-super {p0, p1}, Lcom/android/systemui/statusbar/BaseStatusBar$H;->handleMessage(Landroid/os/Message;)V

    .line 706
    iget v4, p1, Landroid/os/Message;->what:I

    sparse-switch v4, :sswitch_data_1de

    .line 833
    :cond_e
    :goto_e
    return-void

    .line 710
    :sswitch_f
    iget v4, p1, Landroid/os/Message;->arg1:I

    if-ltz v4, :cond_e

    .line 711
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$700(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/NotificationData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/NotificationData;->size()I

    move-result v0

    .line 713
    .local v0, N:I
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-boolean v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDMode:Z

    if-nez v4, :cond_4d

    .line 714
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    if-ltz v4, :cond_4d

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    if-ge v4, v0, :cond_4d

    .line 715
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$800(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/NotificationData;

    move-result-object v4

    add-int/lit8 v5, v0, -0x1

    iget-object v6, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v6, v6, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/NotificationData;->get(I)Lcom/android/systemui/statusbar/NotificationData$Entry;

    move-result-object v2

    .line 716
    .local v2, entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iget-object v4, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    invoke-virtual {v4, v7}, Lcom/android/systemui/statusbar/StatusBarIconView;->setBackgroundColor(I)V

    .line 717
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iput v9, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    .line 718
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iput-object v10, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekKey:Landroid/os/IBinder;

    .line 722
    .end local v2           #entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :cond_4d
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 723
    .local v3, peekIndex:I
    if-ge v3, v0, :cond_e

    .line 725
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-boolean v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDMode:Z

    if-eqz v4, :cond_b1

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v2, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDDummyEntry:Lcom/android/systemui/statusbar/NotificationData$Entry;

    .line 729
    .restart local v2       #entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :goto_5b
    new-instance v1, Lcom/android/systemui/statusbar/NotificationData$Entry;

    iget-object v4, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->key:Landroid/os/IBinder;

    iget-object v5, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->notification:Lcom/android/internal/statusbar/StatusBarNotification;

    iget-object v6, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    invoke-direct {v1, v4, v5, v6}, Lcom/android/systemui/statusbar/NotificationData$Entry;-><init>(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;Lcom/android/systemui/statusbar/StatusBarIconView;)V

    .line 733
    .local v1, copy:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v5, v5, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekRow:Landroid/view/ViewGroup;

    invoke-static {v4, v1, v5}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1000(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;Lcom/android/systemui/statusbar/NotificationData$Entry;Landroid/view/ViewGroup;)Z

    .line 735
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-boolean v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDMode:Z

    if-eqz v4, :cond_7f

    .line 736
    iget-object v4, v1, Lcom/android/systemui/statusbar/NotificationData$Entry;->content:Landroid/view/View;

    new-instance v5, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H$1;

    invoke-direct {v5, p0}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H$1;-><init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 747
    :cond_7f
    iget-object v4, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    const v5, 0x20ffffff

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/StatusBarIconView;->setBackgroundColor(I)V

    .line 754
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekRow:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 755
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekRow:Landroid/view/ViewGroup;

    iget-object v5, v1, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 757
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekWindow:Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;

    invoke-virtual {v4, v7}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->setVisibility(I)V

    .line 758
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v4, v7, v8}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->show(ZZ)V

    .line 760
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iput v3, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    .line 761
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v5, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->key:Landroid/os/IBinder;

    iput-object v5, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekKey:Landroid/os/IBinder;

    goto/16 :goto_e

    .line 725
    .end local v1           #copy:Lcom/android/systemui/statusbar/NotificationData$Entry;
    .end local v2           #entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :cond_b1
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$900(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/NotificationData;

    move-result-object v4

    add-int/lit8 v5, v0, -0x1

    sub-int/2addr v5, v3

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/NotificationData;->get(I)Lcom/android/systemui/statusbar/NotificationData$Entry;

    move-result-object v2

    goto :goto_5b

    .line 767
    .end local v0           #N:I
    .end local v3           #peekIndex:I
    :sswitch_bf
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekWindow:Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->setVisibility(I)V

    .line 768
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekRow:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 770
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1200(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/NotificationData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/NotificationData;->size()I

    move-result v0

    .line 771
    .restart local v0       #N:I
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    if-ltz v4, :cond_f2

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    if-ge v4, v0, :cond_f2

    .line 772
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-boolean v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDMode:Z

    if-eqz v4, :cond_fc

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v2, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationDNDDummyEntry:Lcom/android/systemui/statusbar/NotificationData$Entry;

    .line 776
    .restart local v2       #entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :goto_ed
    iget-object v4, v2, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    invoke-virtual {v4, v7}, Lcom/android/systemui/statusbar/StatusBarIconView;->setBackgroundColor(I)V

    .line 779
    .end local v2           #entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :cond_f2
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iput v9, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    .line 780
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iput-object v10, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekKey:Landroid/os/IBinder;

    goto/16 :goto_e

    .line 772
    :cond_fc
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1300(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/NotificationData;

    move-result-object v4

    add-int/lit8 v5, v0, -0x1

    iget-object v6, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget v6, v6, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPeekIndex:I

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/NotificationData;->get(I)Lcom/android/systemui/statusbar/NotificationData$Entry;

    move-result-object v2

    goto :goto_ed

    .line 784
    .end local v0           #N:I
    :sswitch_10e
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->isShowing()Z

    move-result v4

    if-nez v4, :cond_e

    .line 785
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v4, v8, v8}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->show(ZZ)V

    .line 786
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationArea:Landroid/view/View;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 787
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mTicker:Lcom/android/systemui/statusbar/tablet/TabletTicker;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->halt()V

    goto/16 :goto_e

    .line 792
    :sswitch_130
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 793
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v4, v7, v8}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->show(ZZ)V

    .line 794
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mNotificationArea:Landroid/view/View;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_e

    .line 799
    :sswitch_14a
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1400(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;

    move-result-object v4

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1400(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;->openPanel()V

    goto/16 :goto_e

    .line 803
    :sswitch_15d
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1400(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;

    move-result-object v4

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1400(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/android/systemui/statusbar/tablet/InputMethodsPanel;->closePanel(Z)V

    goto/16 :goto_e

    .line 807
    :sswitch_170
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1500(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/CompatModePanel;

    move-result-object v4

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1500(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/CompatModePanel;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->openPanel()V

    goto/16 :goto_e

    .line 811
    :sswitch_183
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1500(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/CompatModePanel;

    move-result-object v4

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1500(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)Lcom/android/systemui/statusbar/tablet/CompatModePanel;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->closePanel()V

    goto/16 :goto_e

    .line 815
    :sswitch_196
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mBarContents:Landroid/view/ViewGroup;

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 816
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mShadow:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 817
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    const/4 v5, -0x2

    invoke-static {v4, v5}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1672(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;I)I

    .line 818
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1700(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V

    goto/16 :goto_e

    .line 822
    :sswitch_1b1
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->animateCollapsePanels()V

    .line 823
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4, v7}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1800(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;Z)V

    .line 824
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mBarContents:Landroid/view/ViewGroup;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 825
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mShadow:Landroid/view/View;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 826
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4, v8}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1676(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;I)I

    .line 827
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v4}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1700(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V

    goto/16 :goto_e

    .line 830
    :sswitch_1d5
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$H;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v4, v4, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->mTicker:Lcom/android/systemui/statusbar/tablet/TabletTicker;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->halt()V

    goto/16 :goto_e

    .line 706
    :sswitch_data_1de
    .sparse-switch
        0x3e8 -> :sswitch_10e
        0x3e9 -> :sswitch_130
        0x3ea -> :sswitch_f
        0x3eb -> :sswitch_bf
        0x406 -> :sswitch_196
        0x407 -> :sswitch_1b1
        0x410 -> :sswitch_14a
        0x411 -> :sswitch_15d
        0x41a -> :sswitch_170
        0x41b -> :sswitch_183
        0x7d0 -> :sswitch_1d5
    .end sparse-switch
.end method
