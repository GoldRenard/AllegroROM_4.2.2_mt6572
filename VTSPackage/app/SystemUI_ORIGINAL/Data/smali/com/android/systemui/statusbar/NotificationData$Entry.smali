.class public final Lcom/android/systemui/statusbar/NotificationData$Entry;
.super Ljava/lang/Object;
.source "NotificationData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/NotificationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public content:Landroid/view/View;

.field public expanded:Landroid/view/View;

.field protected expandedLarge:Landroid/view/View;

.field public icon:Lcom/android/systemui/statusbar/StatusBarIconView;

.field public key:Landroid/os/IBinder;

.field public largeIcon:Landroid/widget/ImageView;

.field public notification:Lcom/android/internal/statusbar/StatusBarNotification;

.field public row:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;Lcom/android/systemui/statusbar/StatusBarIconView;)V
    .locals 0
    .parameter "key"
    .parameter "n"
    .parameter "ic"

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->key:Landroid/os/IBinder;

    .line 46
    iput-object p2, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->notification:Lcom/android/internal/statusbar/StatusBarNotification;

    .line 47
    iput-object p3, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    .line 48
    return-void
.end method


# virtual methods
.method public expandable()Z
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/statusbar/NotificationData;->getIsExpandable(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public getLargeView()Landroid/view/View;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->expandedLarge:Landroid/view/View;

    return-object v0
.end method

.method public setLargeView(Landroid/view/View;)V
    .locals 3
    .parameter "expandedLarge"

    .prologue
    .line 50
    iput-object p1, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->expandedLarge:Landroid/view/View;

    .line 51
    iget-object v1, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    const v2, 0x7f080002

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Lcom/android/systemui/statusbar/NotificationData;->writeBooleanTag(Landroid/view/View;IZ)Z

    .line 52
    return-void

    .line 51
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUserExpanded(Z)Z
    .locals 1
    .parameter "userExpanded"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-static {v0, p1}, Lcom/android/systemui/statusbar/NotificationData;->setUserExpanded(Landroid/view/View;Z)Z

    move-result v0

    return v0
.end method

.method public setUserLocked(Z)Z
    .locals 1
    .parameter "userLocked"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-static {v0, p1}, Lcom/android/systemui/statusbar/NotificationData;->setUserLocked(Landroid/view/View;Z)Z

    move-result v0

    return v0
.end method

.method public userExpanded()Z
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/statusbar/NotificationData;->getUserExpanded(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public userLocked()Z
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/statusbar/NotificationData;->getUserLocked(Landroid/view/View;)Z

    move-result v0

    return v0
.end method
