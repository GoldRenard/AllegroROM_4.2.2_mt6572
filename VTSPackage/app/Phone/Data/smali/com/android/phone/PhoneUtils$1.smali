.class final Lcom/android/phone/PhoneUtils$1;
.super Ljava/lang/Object;
.source "PhoneUtils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/PhoneUtils;->displayMMICompleteExt(Lcom/android/internal/telephony/Phone;Landroid/content/Context;Lcom/android/internal/telephony/MmiCode;Landroid/os/Message;Landroid/app/AlertDialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$inputText:Landroid/widget/EditText;

.field final synthetic val$mmiCode:Lcom/android/internal/telephony/MmiCode;

.field final synthetic val$phone:Lcom/android/internal/telephony/Phone;

.field final synthetic val$simId:I


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/Phone;Landroid/widget/EditText;ILcom/android/internal/telephony/MmiCode;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1423
    iput-object p1, p0, Lcom/android/phone/PhoneUtils$1;->val$phone:Lcom/android/internal/telephony/Phone;

    iput-object p2, p0, Lcom/android/phone/PhoneUtils$1;->val$inputText:Landroid/widget/EditText;

    iput p3, p0, Lcom/android/phone/PhoneUtils$1;->val$simId:I

    iput-object p4, p0, Lcom/android/phone/PhoneUtils$1;->val$mmiCode:Lcom/android/internal/telephony/MmiCode;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    const/4 v3, 0x0

    .line 1425
    packed-switch p2, :pswitch_data_0

    .line 1444
    :goto_0
    return-void

    .line 1430
    :pswitch_0
    iget-object v0, p0, Lcom/android/phone/PhoneUtils$1;->val$phone:Lcom/android/internal/telephony/Phone;

    iget-object v1, p0, Lcom/android/phone/PhoneUtils$1;->val$inputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/android/phone/PhoneUtils$1;->val$simId:I

    invoke-static {v0, v1, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->sendUssdResponse(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)V

    .line 1431
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->access$502(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 1432
    sput-object v3, Lcom/android/phone/PhoneUtils;->sUssdActivity:Lcom/mediatek/phone/UssdAlertActivity;

    goto :goto_0

    .line 1436
    :pswitch_1
    iget-object v0, p0, Lcom/android/phone/PhoneUtils$1;->val$mmiCode:Lcom/android/internal/telephony/MmiCode;

    invoke-interface {v0}, Lcom/android/internal/telephony/MmiCode;->isCancelable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1437
    iget-object v0, p0, Lcom/android/phone/PhoneUtils$1;->val$mmiCode:Lcom/android/internal/telephony/MmiCode;

    invoke-interface {v0}, Lcom/android/internal/telephony/MmiCode;->cancel()V

    .line 1440
    :cond_0
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->access$502(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 1441
    sput-object v3, Lcom/android/phone/PhoneUtils;->sUssdActivity:Lcom/mediatek/phone/UssdAlertActivity;

    goto :goto_0

    .line 1425
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
