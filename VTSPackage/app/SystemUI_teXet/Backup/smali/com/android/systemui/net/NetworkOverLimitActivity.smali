.class public Lcom/android/systemui/net/NetworkOverLimitActivity;
.super Landroid/app/Activity;
.source "NetworkOverLimitActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NetworkOverLimitActivity"


# instance fields
.field private isReenabled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity;->isReenabled:Z

    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/net/NetworkOverLimitActivity;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity;->isReenabled:Z

    return v0
.end method

.method static synthetic access$002(Lcom/android/systemui/net/NetworkOverLimitActivity;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/android/systemui/net/NetworkOverLimitActivity;->isReenabled:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/systemui/net/NetworkOverLimitActivity;Landroid/net/NetworkTemplate;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/android/systemui/net/NetworkOverLimitActivity;->snoozePolicy(Landroid/net/NetworkTemplate;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/systemui/net/NetworkOverLimitActivity;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/android/systemui/net/NetworkOverLimitActivity;->sendBroadcast()V

    return-void
.end method

.method private static getLimitedDialogTitleForTemplate(Landroid/net/NetworkTemplate;)I
    .registers 2
    .parameter "template"

    .prologue
    .line 94
    invoke-virtual {p0}, Landroid/net/NetworkTemplate;->getMatchRule()I

    move-result v0

    packed-switch v0, :pswitch_data_18

    .line 102
    const v0, 0x7f0b003d

    :goto_a
    return v0

    .line 96
    :pswitch_b
    const v0, 0x7f0b003a

    goto :goto_a

    .line 98
    :pswitch_f
    const v0, 0x7f0b003b

    goto :goto_a

    .line 100
    :pswitch_13
    const v0, 0x7f0b003c

    goto :goto_a

    .line 94
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_13
        :pswitch_b
        :pswitch_f
    .end packed-switch
.end method

.method private sendBroadcast()V
    .registers 5

    .prologue
    .line 107
    const-string v0, "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

    .line 110
    .local v0, ACTION_DATA_USAGE_DISABLED_DIALOG_OK:Ljava/lang/String;
    const-string v2, "NetworkOverLimitActivity"

    const-string v3, "sendBroadcast ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

    invoke-static {v2, v3}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    .local v1, intent:Landroid/content/Intent;
    const/high16 v2, 0x2000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 113
    invoke-virtual {p0, v1}, Lcom/android/systemui/net/NetworkOverLimitActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 114
    return-void
.end method

.method private snoozePolicy(Landroid/net/NetworkTemplate;)V
    .registers 6
    .parameter "template"

    .prologue
    .line 84
    const-string v2, "netpolicy"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/net/INetworkPolicyManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/net/INetworkPolicyManager;

    move-result-object v1

    .line 87
    .local v1, policyService:Landroid/net/INetworkPolicyManager;
    :try_start_a
    invoke-interface {v1, p1}, Landroid/net/INetworkPolicyManager;->snoozeLimit(Landroid/net/NetworkTemplate;)V
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_d} :catch_e

    .line 91
    :goto_d
    return-void

    .line 88
    :catch_e
    move-exception v0

    .line 89
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "NetworkOverLimitActivity"

    const-string v3, "problem snoozing network policy"

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_d
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 7
    .parameter "icicle"

    .prologue
    .line 54
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    invoke-virtual {p0}, Lcom/android/systemui/net/NetworkOverLimitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "android.net.NETWORK_TEMPLATE"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/NetworkTemplate;

    .line 57
    .local v2, template:Landroid/net/NetworkTemplate;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 58
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-static {v2}, Lcom/android/systemui/net/NetworkOverLimitActivity;->getLimitedDialogTitleForTemplate(Landroid/net/NetworkTemplate;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 59
    const v3, 0x7f0b003e

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 61
    const v3, 0x104000a

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 62
    const v3, 0x7f0b003f

    new-instance v4, Lcom/android/systemui/net/NetworkOverLimitActivity$1;

    invoke-direct {v4, p0, v2}, Lcom/android/systemui/net/NetworkOverLimitActivity$1;-><init>(Lcom/android/systemui/net/NetworkOverLimitActivity;Landroid/net/NetworkTemplate;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 70
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 71
    .local v1, dialog:Landroid/app/Dialog;
    new-instance v3, Lcom/android/systemui/net/NetworkOverLimitActivity$2;

    invoke-direct {v3, p0}, Lcom/android/systemui/net/NetworkOverLimitActivity$2;-><init>(Lcom/android/systemui/net/NetworkOverLimitActivity;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 79
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x7d3

    invoke-virtual {v3, v4}, Landroid/view/Window;->setType(I)V

    .line 80
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 81
    return-void
.end method
