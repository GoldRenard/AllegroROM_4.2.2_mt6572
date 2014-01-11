.class Lcom/mediatek/phone/vt/VTInCallScreen$13;
.super Ljava/lang/Object;
.source "VTInCallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialogEx(ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

.field final synthetic val$number:Ljava/lang/String;

.field final synthetic val$slot:I


# direct methods
.method constructor <init>(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2310
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iput-object p2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->val$number:Ljava/lang/String;

    iput p3, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->val$slot:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 2315
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showReCallDialogEx... , on click, which="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V

    .line 2317
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$2200(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2318
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$2200(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 2319
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$2202(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 2321
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$500(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/phone/InCallScreen;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 2322
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->this$0:Lcom/mediatek/phone/vt/VTInCallScreen;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->val$number:Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen$13;->val$slot:I

    #calls: Lcom/mediatek/phone/vt/VTInCallScreen;->makeVoiceReCall(Ljava/lang/String;I)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->access$2300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;I)V

    .line 2323
    return-void
.end method
