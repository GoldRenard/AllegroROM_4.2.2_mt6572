.class public Lcom/android/systemui/statusbar/NotificationData;
.super Ljava/lang/Object;
.source "NotificationData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/NotificationData$Entry;
    }
.end annotation


# instance fields
.field private final mEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/NotificationData$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final mEntryCmp:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/android/systemui/statusbar/NotificationData$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    .line 88
    new-instance v0, Lcom/android/systemui/statusbar/NotificationData$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/NotificationData$1;-><init>(Lcom/android/systemui/statusbar/NotificationData;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntryCmp:Ljava/util/Comparator;

    return-void
.end method

.method public static getIsExpandable(Landroid/view/View;)Z
    .locals 1
    .parameter "row"

    .prologue
    .line 196
    const v0, 0x7f080002

    invoke-static {p0, v0}, Lcom/android/systemui/statusbar/NotificationData;->readBooleanTag(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public static getUserExpanded(Landroid/view/View;)Z
    .locals 1
    .parameter "row"

    .prologue
    .line 203
    const v0, 0x7f080003

    invoke-static {p0, v0}, Lcom/android/systemui/statusbar/NotificationData;->readBooleanTag(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public static getUserLocked(Landroid/view/View;)Z
    .locals 1
    .parameter "row"

    .prologue
    .line 217
    const v0, 0x7f080004

    invoke-static {p0, v0}, Lcom/android/systemui/statusbar/NotificationData;->readBooleanTag(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method protected static readBooleanTag(Landroid/view/View;I)Z
    .locals 3
    .parameter "view"
    .parameter "id"

    .prologue
    const/4 v1, 0x0

    .line 177
    if-eqz p0, :cond_0

    .line 178
    invoke-virtual {p0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    .line 179
    .local v0, value:Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v2, v0, Ljava/lang/Boolean;

    if-eqz v2, :cond_0

    check-cast v0, Ljava/lang/Boolean;

    .end local v0           #value:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 181
    :cond_0
    return v1
.end method

.method public static setUserExpanded(Landroid/view/View;Z)Z
    .locals 1
    .parameter "row"
    .parameter "userExpanded"

    .prologue
    .line 210
    const v0, 0x7f080003

    invoke-static {p0, v0, p1}, Lcom/android/systemui/statusbar/NotificationData;->writeBooleanTag(Landroid/view/View;IZ)Z

    move-result v0

    return v0
.end method

.method public static setUserLocked(Landroid/view/View;Z)Z
    .locals 1
    .parameter "row"
    .parameter "userLocked"

    .prologue
    .line 224
    const v0, 0x7f080004

    invoke-static {p0, v0, p1}, Lcom/android/systemui/statusbar/NotificationData;->writeBooleanTag(Landroid/view/View;IZ)Z

    move-result v0

    return v0
.end method

.method protected static writeBooleanTag(Landroid/view/View;IZ)Z
    .locals 1
    .parameter "view"
    .parameter "id"
    .parameter "value"

    .prologue
    .line 185
    if-eqz p0, :cond_0

    .line 186
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 189
    .end local p2
    :goto_0
    return p2

    .restart local p2
    :cond_0
    const/4 p2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/android/systemui/statusbar/StatusBarIconView;)I
    .locals 2
    .parameter "key"
    .parameter "notification"
    .parameter "row"
    .parameter "content"
    .parameter "expanded"
    .parameter "icon"

    .prologue
    .line 131
    new-instance v0, Lcom/android/systemui/statusbar/NotificationData$Entry;

    invoke-direct {v0}, Lcom/android/systemui/statusbar/NotificationData$Entry;-><init>()V

    .line 132
    .local v0, entry:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iput-object p1, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->key:Landroid/os/IBinder;

    .line 133
    iput-object p2, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->notification:Lcom/android/internal/statusbar/StatusBarNotification;

    .line 134
    iput-object p3, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->row:Landroid/view/View;

    .line 135
    iput-object p4, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->content:Landroid/view/View;

    .line 136
    iput-object p5, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->expanded:Landroid/view/View;

    .line 137
    iput-object p6, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->icon:Lcom/android/systemui/statusbar/StatusBarIconView;

    .line 138
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->largeIcon:Landroid/widget/ImageView;

    .line 139
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/NotificationData;->add(Lcom/android/systemui/statusbar/NotificationData$Entry;)I

    move-result v1

    return v1
.end method

.method public add(Lcom/android/systemui/statusbar/NotificationData$Entry;)I
    .locals 4
    .parameter "entry"

    .prologue
    .line 119
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 120
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 121
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntryCmp:Ljava/util/Comparator;

    iget-object v3, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_1

    .line 125
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 126
    return v1

    .line 120
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public findByKey(Landroid/os/IBinder;)Lcom/android/systemui/statusbar/NotificationData$Entry;
    .locals 3
    .parameter "key"

    .prologue
    .line 109
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/NotificationData$Entry;

    .line 110
    .local v0, e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iget-object v2, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->key:Landroid/os/IBinder;

    if-ne v2, p1, :cond_0

    .line 114
    .end local v0           #e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(I)Lcom/android/systemui/statusbar/NotificationData$Entry;
    .locals 1
    .parameter "i"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/NotificationData$Entry;

    return-object v0
.end method

.method public hasClearableItems()Z
    .locals 3

    .prologue
    .line 166
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/NotificationData$Entry;

    .line 167
    .local v0, e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iget-object v2, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->expanded:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 168
    iget-object v2, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->notification:Lcom/android/internal/statusbar/StatusBarNotification;

    invoke-virtual {v2}, Lcom/android/internal/statusbar/StatusBarNotification;->isClearable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    const/4 v2, 0x1

    .line 173
    .end local v0           #e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public hasVisibleItems()Z
    .locals 3

    .prologue
    .line 154
    iget-object v2, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/NotificationData$Entry;

    .line 155
    .local v0, e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    iget-object v2, v0, Lcom/android/systemui/statusbar/NotificationData$Entry;->expanded:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 156
    const/4 v2, 0x1

    .line 159
    .end local v0           #e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public remove(Landroid/os/IBinder;)Lcom/android/systemui/statusbar/NotificationData$Entry;
    .locals 2
    .parameter "key"

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/NotificationData;->findByKey(Landroid/os/IBinder;)Lcom/android/systemui/statusbar/NotificationData$Entry;

    move-result-object v0

    .line 144
    .local v0, e:Lcom/android/systemui/statusbar/NotificationData$Entry;
    if-eqz v0, :cond_0

    .line 145
    iget-object v1, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 147
    :cond_0
    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/android/systemui/statusbar/NotificationData;->mEntries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
