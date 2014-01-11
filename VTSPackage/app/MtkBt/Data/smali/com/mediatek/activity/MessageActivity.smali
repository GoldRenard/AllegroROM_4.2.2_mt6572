.class public Lcom/mediatek/activity/MessageActivity;
.super Landroid/app/Activity;
.source "MessageActivity.java"


# static fields
.field private static final MESSAGE:Ljava/lang/String; = "message"

.field private static final NEGATIVE_BUTTON:Ljava/lang/String; = "negativeButton"

.field private static final POSITIVE_BUTTON:Ljava/lang/String; = "positiveButton"

.field private static final POSITIVE_INTENT:Ljava/lang/String; = "positiveIntent"

.field public static final RESULT_ACTION_CANCEL:I = 0x2

.field public static final RESULT_ACTION_CLEAR:I = 0x0

.field public static final RESULT_ACTION_RETRY:I = 0x1

.field private static final TITLE:Ljava/lang/String; = "title"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 6
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "button"

    .prologue
    const/4 v3, 0x0

    .line 136
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/mediatek/activity/MessageActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "positiveButton"
    .parameter "positiveIntent"
    .parameter "negativeButton"

    .prologue
    .line 142
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/activity/MessageActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 143
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    const-string v1, "message"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    const-string v1, "positiveButton"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 146
    const-string v1, "positiveIntent"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 147
    const-string v1, "negativeButton"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 148
    return-object v0
.end method


# virtual methods
.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 9
    .parameter "id"

    .prologue
    .line 84
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "MessageActivity.onCreateDialog()[+]: task"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/mediatek/activity/MessageActivity;->getTaskId()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/mediatek/activity/MessageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 87
    .local v1, intent:Landroid/content/Intent;
    const-string v7, "title"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 88
    .local v6, title:Ljava/lang/String;
    const-string v7, "message"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, message:Ljava/lang/String;
    const-string v7, "positiveButton"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 90
    .local v4, positiveButton:Ljava/lang/String;
    const-string v7, "negativeButton"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, negativeButton:Ljava/lang/String;
    new-instance v7, Landroid/app/AlertDialog$Builder;

    invoke-direct {v7, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    new-instance v8, Lcom/mediatek/activity/MessageActivity$2;

    invoke-direct {v8, p0}, Lcom/mediatek/activity/MessageActivity$2;-><init>(Lcom/mediatek/activity/MessageActivity;)V

    invoke-virtual {v7, v3, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    new-instance v8, Lcom/mediatek/activity/MessageActivity$1;

    invoke-direct {v8, p0}, Lcom/mediatek/activity/MessageActivity$1;-><init>(Lcom/mediatek/activity/MessageActivity;)V

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 116
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    if-eqz v4, :cond_0

    .line 118
    const-string v7, "positiveIntent"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/content/Intent;

    .line 119
    .local v5, positiveIntent:Landroid/content/Intent;
    new-instance v7, Lcom/mediatek/activity/MessageActivity$3;

    invoke-direct {v7, p0, v5}, Lcom/mediatek/activity/MessageActivity$3;-><init>(Lcom/mediatek/activity/MessageActivity;Landroid/content/Intent;)V

    invoke-virtual {v0, v4, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 131
    .end local v5           #positiveIntent:Landroid/content/Intent;
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    return-object v7
.end method

.method protected onResume()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 77
    invoke-virtual {p0, v0}, Lcom/mediatek/activity/MessageActivity;->setVisible(Z)V

    .line 78
    invoke-virtual {p0, v0}, Lcom/mediatek/activity/MessageActivity;->showDialog(I)V

    .line 79
    return-void
.end method
