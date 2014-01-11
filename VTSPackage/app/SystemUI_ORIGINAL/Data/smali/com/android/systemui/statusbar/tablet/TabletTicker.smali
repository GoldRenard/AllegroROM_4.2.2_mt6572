.class public Lcom/android/systemui/statusbar/tablet/TabletTicker;
.super Landroid/os/Handler;
.source "TabletTicker.java"

# interfaces
.implements Landroid/animation/LayoutTransition$TransitionListener;


# static fields
.field private static final ADVANCE_DELAY:I = 0x1388

.field private static final CLICKABLE_TICKER:Z = true

.field private static final MSG_ADVANCE:I = 0x1

.field private static final QUEUE_LENGTH:I = 0x3

.field private static final TAG:Ljava/lang/String; = "StatusBar.TabletTicker"


# instance fields
.field private mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

.field private final mContext:Landroid/content/Context;

.field private mCurrentKey:Landroid/os/IBinder;

.field private mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

.field private mCurrentView:Landroid/view/View;

.field private mKeys:[Landroid/os/IBinder;

.field private final mLargeIconHeight:I

.field private mLayoutTransition:Landroid/animation/LayoutTransition;

.field private mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

.field private mQueuePos:I

.field private mWindow:Landroid/view/ViewGroup;

.field private final mWindowManager:Landroid/view/WindowManager;

.field private mWindowShouldClose:Z


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V
    .locals 3
    .parameter "bar"

    .prologue
    const/4 v2, 0x3

    .line 83
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 72
    new-array v1, v2, [Landroid/os/IBinder;

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    .line 73
    new-array v1, v2, [Lcom/android/internal/statusbar/StatusBarNotification;

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    .line 84
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    .line 85
    invoke-virtual {p1}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    .line 86
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    const-string v2, "window"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowManager:Landroid/view/WindowManager;

    .line 87
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 88
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x1050006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLargeIconHeight:I

    .line 90
    return-void
.end method

.method private advance()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 166
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    if-eqz v1, :cond_1

    .line 167
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    .line 168
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 170
    :cond_0
    iput-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    .line 171
    iput-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentKey:Landroid/os/IBinder;

    .line 172
    iput-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

    .line 176
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->dequeue()V

    .line 177
    :goto_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

    if-eqz v1, :cond_3

    .line 178
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->makeTickerView(Lcom/android/internal/statusbar/StatusBarNotification;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    .line 179
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    if-eqz v1, :cond_4

    .line 180
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    if-nez v1, :cond_2

    .line 181
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->makeWindow()Landroid/view/ViewGroup;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    .line 182
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    :cond_2
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 186
    const-wide/16 v1, 0x1388

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->sendEmptyMessageDelayed(IJ)Z

    .line 193
    :cond_3
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    if-eqz v1, :cond_5

    :goto_1
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowShouldClose:Z

    .line 194
    return-void

    .line 189
    :cond_4
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->dequeue()V

    goto :goto_0

    .line 193
    :cond_5
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private dequeue()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 197
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    aget-object v2, v2, v3

    iput-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentKey:Landroid/os/IBinder;

    .line 198
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    aget-object v2, v2, v3

    iput-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

    .line 202
    iget v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    .line 203
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 204
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    iget-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    add-int/lit8 v4, v1, 0x1

    aget-object v3, v3, v4

    aput-object v3, v2, v1

    .line 205
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    iget-object v3, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    add-int/lit8 v4, v1, 0x1

    aget-object v3, v3, v4

    aput-object v3, v2, v1

    .line 203
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 207
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    aput-object v5, v2, v0

    .line 208
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    aput-object v5, v2, v0

    .line 209
    iget v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    if-lez v2, :cond_1

    .line 210
    iget v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    .line 212
    :cond_1
    return-void
.end method

.method private makeTickerView(Lcom/android/internal/statusbar/StatusBarNotification;)Landroid/view/View;
    .locals 27
    .parameter "notification"

    .prologue
    .line 254
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/statusbar/StatusBarNotification;->notification:Landroid/app/Notification;

    move-object/from16 v23, v0

    .line 256
    .local v23, n:Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/view/LayoutInflater;

    .line 262
    .local v19, inflater:Landroid/view/LayoutInflater;
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->largeIcon:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_0

    .line 263
    const v17, 0x7f080117

    .line 267
    .local v17, iconId:I
    :goto_0
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->tickerView:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_3

    .line 268
    const v2, 0x7f040048

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/view/ViewGroup;

    .line 269
    .local v15, group:Landroid/view/ViewGroup;
    const v2, 0x7f080118

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout;

    .line 270
    .local v10, content:Landroid/view/ViewGroup;
    const/4 v14, 0x0

    .line 271
    .local v14, expanded:Landroid/view/View;
    const/4 v13, 0x0

    .line 273
    .local v13, exception:Ljava/lang/Exception;
    :try_start_0
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->tickerView:Landroid/widget/RemoteViews;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3, v10}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v14

    .line 278
    :goto_1
    if-nez v14, :cond_1

    .line 279
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/internal/statusbar/StatusBarNotification;->pkg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/internal/statusbar/StatusBarNotification;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 281
    .local v18, ident:Ljava/lang/String;
    const-string v2, "StatusBar.TabletTicker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "couldn\'t inflate view for notification "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v13}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 282
    const/4 v2, 0x0

    .line 335
    .end local v10           #content:Landroid/view/ViewGroup;
    .end local v13           #exception:Ljava/lang/Exception;
    .end local v14           #expanded:Landroid/view/View;
    .end local v18           #ident:Ljava/lang/String;
    :goto_2
    return-object v2

    .line 265
    .end local v15           #group:Landroid/view/ViewGroup;
    .end local v17           #iconId:I
    :cond_0
    const v17, 0x7f080115

    .restart local v17       #iconId:I
    goto :goto_0

    .line 275
    .restart local v10       #content:Landroid/view/ViewGroup;
    .restart local v13       #exception:Ljava/lang/Exception;
    .restart local v14       #expanded:Landroid/view/View;
    .restart local v15       #group:Landroid/view/ViewGroup;
    :catch_0
    move-exception v12

    .line 276
    .local v12, e:Ljava/lang/RuntimeException;
    move-object v13, v12

    goto :goto_1

    .line 284
    .end local v12           #e:Ljava/lang/RuntimeException;
    :cond_1
    new-instance v22, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x1

    move-object/from16 v0, v22

    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 287
    .local v22, lp:Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, v22

    invoke-virtual {v10, v14, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 301
    .end local v10           #content:Landroid/view/ViewGroup;
    .end local v13           #exception:Ljava/lang/Exception;
    .end local v14           #expanded:Landroid/view/View;
    .end local v22           #lp:Landroid/widget/FrameLayout$LayoutParams;
    :goto_3
    const v2, 0x7f080114

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/ImageView;

    .line 302
    .local v21, largeIcon:Landroid/widget/ImageView;
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->largeIcon:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_2

    .line 303
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->largeIcon:Landroid/graphics/Bitmap;

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 304
    const/4 v2, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 305
    invoke-virtual/range {v21 .. v21}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    .line 306
    .local v22, lp:Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->getStatusBarHeight()I

    move-result v24

    .line 307
    .local v24, statusBarHeight:I
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->largeIcon:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    move/from16 v0, v24

    if-gt v2, v0, :cond_5

    .line 310
    move/from16 v0, v24

    move-object/from16 v1, v22

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 314
    :goto_4
    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 318
    .end local v22           #lp:Landroid/view/ViewGroup$LayoutParams;
    .end local v24           #statusBarHeight:I
    :cond_2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/statusbar/StatusBarNotification;->notification:Landroid/app/Notification;

    iget-object v11, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 319
    .local v11, contentIntent:Landroid/app/PendingIntent;
    if-eqz v11, :cond_6

    .line 322
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/internal/statusbar/StatusBarNotification;->pkg:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/internal/statusbar/StatusBarNotification;->tag:Ljava/lang/String;

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/internal/statusbar/StatusBarNotification;->id:I

    invoke-virtual {v2, v11, v3, v4, v5}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->makeClicker(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;I)Lcom/android/systemui/statusbar/BaseStatusBar$NotificationClicker;

    move-result-object v9

    .line 324
    .local v9, clicker:Landroid/view/View$OnClickListener;
    new-instance v2, Lcom/android/systemui/statusbar/tablet/TabletTicker$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v9}, Lcom/android/systemui/statusbar/tablet/TabletTicker$1;-><init>(Lcom/android/systemui/statusbar/tablet/TabletTicker;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .end local v9           #clicker:Landroid/view/View$OnClickListener;
    :goto_5
    move-object v2, v15

    .line 335
    goto :goto_2

    .line 288
    .end local v11           #contentIntent:Landroid/app/PendingIntent;
    .end local v15           #group:Landroid/view/ViewGroup;
    .end local v21           #largeIcon:Landroid/widget/ImageView;
    :cond_3
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    if-eqz v2, :cond_4

    .line 289
    const v2, 0x7f040047

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/view/ViewGroup;

    .line 290
    .restart local v15       #group:Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    new-instance v2, Lcom/android/internal/statusbar/StatusBarIcon;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/internal/statusbar/StatusBarNotification;->pkg:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/internal/statusbar/StatusBarNotification;->user:Landroid/os/UserHandle;

    move-object/from16 v0, v23

    iget v5, v0, Landroid/app/Notification;->icon:I

    move-object/from16 v0, v23

    iget v6, v0, Landroid/app/Notification;->iconLevel:I

    const/4 v7, 0x0

    move-object/from16 v0, v23

    iget-object v8, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    invoke-direct/range {v2 .. v8}, Lcom/android/internal/statusbar/StatusBarIcon;-><init>(Ljava/lang/String;Landroid/os/UserHandle;IIILjava/lang/CharSequence;)V

    move-object/from16 v0, v26

    invoke-static {v0, v2}, Lcom/android/systemui/statusbar/StatusBarIconView;->getIcon(Landroid/content/Context;Lcom/android/internal/statusbar/StatusBarIcon;)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 293
    .local v16, icon:Landroid/graphics/drawable/Drawable;
    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/ImageView;

    .line 294
    .local v20, iv:Landroid/widget/ImageView;
    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 295
    const/4 v2, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 296
    const v2, 0x7f080116

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v25

    check-cast v25, Landroid/widget/TextView;

    .line 297
    .local v25, tv:Landroid/widget/TextView;
    move-object/from16 v0, v23

    iget-object v2, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 299
    .end local v15           #group:Landroid/view/ViewGroup;
    .end local v16           #icon:Landroid/graphics/drawable/Drawable;
    .end local v20           #iv:Landroid/widget/ImageView;
    .end local v25           #tv:Landroid/widget/TextView;
    :cond_4
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "tickerView==null && tickerText==null"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 312
    .restart local v15       #group:Landroid/view/ViewGroup;
    .restart local v21       #largeIcon:Landroid/widget/ImageView;
    .restart local v22       #lp:Landroid/view/ViewGroup$LayoutParams;
    .restart local v24       #statusBarHeight:I
    :cond_5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLargeIconHeight:I

    move-object/from16 v0, v22

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto/16 :goto_4

    .line 331
    .end local v22           #lp:Landroid/view/ViewGroup$LayoutParams;
    .end local v24           #statusBarHeight:I
    .restart local v11       #contentIntent:Landroid/app/PendingIntent;
    :cond_6
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5
.end method

.method private makeWindow()Landroid/view/ViewGroup;
    .locals 8

    .prologue
    .line 215
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 216
    .local v6, res:Landroid/content/res/Resources;
    new-instance v7, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mContext:Landroid/content/Context;

    invoke-direct {v7, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 217
    .local v7, view:Landroid/widget/FrameLayout;
    const v2, 0x7f0d004b

    invoke-virtual {v6, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 218
    .local v1, width:I
    const/16 v4, 0x308

    .line 222
    .local v4, windowFlags:I
    or-int/lit8 v4, v4, 0x20

    .line 226
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    iget v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLargeIconHeight:I

    const/16 v3, 0x7e8

    const/4 v5, -0x3

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 229
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0x55

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 232
    new-instance v2, Landroid/animation/LayoutTransition;

    invoke-direct {v2}, Landroid/animation/LayoutTransition;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLayoutTransition:Landroid/animation/LayoutTransition;

    .line 233
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v2, p0}, Landroid/animation/LayoutTransition;->addTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 234
    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v7, v2}, Landroid/widget/FrameLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 235
    const-string v2, "NotificationTicker"

    invoke-virtual {v0, v2}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 236
    invoke-virtual {v7, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    return-object v7
.end method


# virtual methods
.method public add(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;)V
    .locals 2
    .parameter "key"
    .parameter "notification"

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->remove(Landroid/os/IBinder;Z)V

    .line 101
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    iget v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    aput-object p1, v0, v1

    .line 102
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    iget v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    aput-object p2, v0, v1

    .line 105
    iget v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentNotification:Lcom/android/internal/statusbar/StatusBarNotification;

    if-nez v0, :cond_0

    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->sendEmptyMessage(I)Z

    .line 109
    :cond_0
    iget v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    .line 110
    iget v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    .line 112
    :cond_1
    return-void
.end method

.method public endTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 2
    .parameter "transition"
    .parameter "container"
    .parameter "view"
    .parameter "transitionType"

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowShouldClose:Z

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 247
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindow:Landroid/view/ViewGroup;

    .line 248
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mWindowShouldClose:Z

    .line 249
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->doneTicking()V

    .line 251
    :cond_0
    return-void
.end method

.method public halt()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 145
    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->removeMessages(I)V

    .line 146
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentView:Landroid/view/View;

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    if-eqz v1, :cond_2

    .line 147
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 148
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    aput-object v3, v1, v0

    .line 149
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    aput-object v3, v1, v0

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 151
    :cond_1
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    .line 152
    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->sendEmptyMessage(I)Z

    .line 154
    .end local v0           #i:I
    :cond_2
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 157
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 162
    :goto_0
    return-void

    .line 159
    :pswitch_0
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->advance()V

    goto :goto_0

    .line 157
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public remove(Landroid/os/IBinder;)V
    .locals 1
    .parameter "key"

    .prologue
    .line 115
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->remove(Landroid/os/IBinder;Z)V

    .line 116
    return-void
.end method

.method public remove(Landroid/os/IBinder;Z)V
    .locals 6
    .parameter "key"
    .parameter "advance"

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x1

    const/4 v4, 0x2

    .line 119
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mCurrentKey:Landroid/os/IBinder;

    if-ne v1, p1, :cond_1

    .line 121
    if-eqz p2, :cond_0

    .line 122
    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->removeMessages(I)V

    .line 123
    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/tablet/TabletTicker;->sendEmptyMessage(I)Z

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    .line 128
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_3

    .line 129
    :goto_2
    if-ge v0, v4, :cond_2

    .line 130
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    add-int/lit8 v3, v0, 0x1

    aget-object v2, v2, v3

    aput-object v2, v1, v0

    .line 131
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    iget-object v2, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    add-int/lit8 v3, v0, 0x1

    aget-object v2, v2, v3

    aput-object v2, v1, v0

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 133
    :cond_2
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mKeys:[Landroid/os/IBinder;

    aput-object v5, v1, v4

    .line 134
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueue:[Lcom/android/internal/statusbar/StatusBarNotification;

    aput-object v5, v1, v4

    .line 135
    iget v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    if-lez v1, :cond_0

    .line 136
    iget v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/android/systemui/statusbar/tablet/TabletTicker;->mQueuePos:I

    goto :goto_0

    .line 127
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public startTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 0
    .parameter "transition"
    .parameter "container"
    .parameter "view"
    .parameter "transitionType"

    .prologue
    .line 241
    return-void
.end method
