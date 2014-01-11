.class Lcom/android/phone/InCallScreen$21;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/InCallScreen;->showExitingECMDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/InCallScreen;

.field final synthetic val$inCallUiState:Lcom/android/phone/InCallUiState;


# direct methods
.method constructor <init>(Lcom/android/phone/InCallScreen;Lcom/android/phone/InCallUiState;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 5167
    iput-object p1, p0, Lcom/android/phone/InCallScreen$21;->this$0:Lcom/android/phone/InCallScreen;

    iput-object p2, p0, Lcom/android/phone/InCallScreen$21;->val$inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 5169
    iget-object v0, p0, Lcom/android/phone/InCallScreen$21;->val$inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v0}, Lcom/android/phone/InCallUiState;->clearPendingCallStatusCode()V

    .line 5170
    return-void
.end method
