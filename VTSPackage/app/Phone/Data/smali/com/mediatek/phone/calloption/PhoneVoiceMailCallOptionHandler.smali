.class public Lcom/mediatek/phone/calloption/PhoneVoiceMailCallOptionHandler;
.super Lcom/mediatek/calloption/VoiceMailCallOptionHandler;
.source "PhoneVoiceMailCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PhoneVoiceMailCallOptionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/mediatek/calloption/VoiceMailCallOptionHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 66
    const-string v0, "PhoneVoiceMailCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    return-void
.end method


# virtual methods
.method protected showMissedingVoiceMailDialog(Lcom/mediatek/calloption/Request;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 3
    .parameter "request"
    .parameter "clickListener"
    .parameter "dismissListener"
    .parameter "cancelListener"

    .prologue
    .line 54
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 55
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const v1, 0x7f0d01a2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0d01a3

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    invoke-virtual {v1, v2, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0d01a4

    invoke-virtual {v1, v2, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 59
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    .line 60
    iget-object v1, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1, p3}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 61
    iget-object v1, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1, p4}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 62
    iget-object v1, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 63
    return-void
.end method
