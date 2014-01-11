.class public Landroid/widget/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Utils"

.field static mClearBitmapHandle:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static callPassSim(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 4
    .parameter "context"
    .parameter "phone"
    .parameter "sim"

    .prologue
    .line 90
    const-string v2, "tel"

    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 92
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.DIAL"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 100
    .local v0, intent:Landroid/content/Intent;
    const/high16 v2, 0x1000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 101
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 102
    return-void
.end method

.method public static clearView(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 143
    if-nez p0, :cond_1

    .line 157
    :cond_0
    return-void

    .line 147
    :cond_1
    instance-of v2, p0, Landroid/widget/ImageView;

    if-nez v2, :cond_0

    .line 151
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    move-object v0, p0

    .line 152
    check-cast v0, Landroid/view/ViewGroup;

    .line 153
    .local v0, group:Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 154
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/widget/Utils;->clearView(Landroid/view/View;)V

    .line 153
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getWidgetHostView(Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 3
    .parameter "view"

    .prologue
    const/4 v1, 0x0

    .line 160
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_1

    :cond_0
    move-object p0, v1

    .line 170
    .end local p0
    :goto_0
    return-object p0

    .line 163
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 164
    .local v0, viewParent:Landroid/view/ViewParent;
    if-eqz v0, :cond_2

    instance-of v2, v0, Landroid/view/View;

    if-nez v2, :cond_3

    :cond_2
    move-object p0, v1

    .line 165
    goto :goto_0

    .line 167
    :cond_3
    instance-of v1, v0, Landroid/appwidget/AppWidgetHostView;

    if-eqz v1, :cond_4

    .line 168
    check-cast p0, Landroid/view/ViewGroup;

    goto :goto_0

    .line 170
    :cond_4
    check-cast v0, Landroid/view/View;

    .end local v0           #viewParent:Landroid/view/ViewParent;
    invoke-static {v0}, Landroid/widget/Utils;->getWidgetHostView(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object p0

    goto :goto_0
.end method

.method public static hasInLancher(Landroid/view/View;)Z
    .locals 3
    .parameter "view"

    .prologue
    const/4 v1, 0x0

    .line 129
    if-nez p0, :cond_1

    .line 139
    :cond_0
    :goto_0
    return v1

    .line 132
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 133
    .local v0, viewParent:Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    instance-of v2, v0, Landroid/view/View;

    if-eqz v2, :cond_0

    .line 136
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Workspace"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_2

    .line 137
    const/4 v1, 0x1

    goto :goto_0

    .line 139
    :cond_2
    check-cast v0, Landroid/view/View;

    .end local v0           #viewParent:Landroid/view/ViewParent;
    invoke-static {v0}, Landroid/widget/Utils;->hasInLancher(Landroid/view/View;)Z

    move-result v1

    goto :goto_0
.end method

.method public static initiateCall(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 5
    .parameter "context"
    .parameter "phoneNumber"

    .prologue
    .line 62
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL_PRIVILEGED"

    const-string v2, "tel"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 64
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 65
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 66
    return-void
.end method

.method public static initiateSms(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 5
    .parameter "context"
    .parameter "phoneNumber"

    .prologue
    .line 72
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SENDTO"

    const-string v2, "sms"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 74
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 75
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 76
    return-void
.end method

.method public static onDetachedFromWindowClearUp(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 106
    sget-object v0, Landroid/widget/Utils;->mClearBitmapHandle:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Landroid/widget/Utils$1;

    invoke-direct {v0}, Landroid/widget/Utils$1;-><init>()V

    sput-object v0, Landroid/widget/Utils;->mClearBitmapHandle:Landroid/os/Handler;

    .line 124
    :cond_0
    sget-object v0, Landroid/widget/Utils;->mClearBitmapHandle:Landroid/os/Handler;

    sget-object v1, Landroid/widget/Utils;->mClearBitmapHandle:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 126
    return-void
.end method
