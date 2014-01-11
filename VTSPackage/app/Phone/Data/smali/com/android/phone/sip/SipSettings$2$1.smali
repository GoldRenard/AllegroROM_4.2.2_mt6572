.class Lcom/android/phone/sip/SipSettings$2$1;
.super Ljava/lang/Object;
.source "SipSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/sip/SipSettings$2;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/phone/sip/SipSettings$2;

.field final synthetic val$enabled:Z


# direct methods
.method constructor <init>(Lcom/android/phone/sip/SipSettings$2;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 253
    iput-object p1, p0, Lcom/android/phone/sip/SipSettings$2$1;->this$1:Lcom/android/phone/sip/SipSettings$2;

    iput-boolean p2, p0, Lcom/android/phone/sip/SipSettings$2$1;->val$enabled:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/android/phone/sip/SipSettings$2$1;->this$1:Lcom/android/phone/sip/SipSettings$2;

    iget-object v0, v0, Lcom/android/phone/sip/SipSettings$2;->this$0:Lcom/android/phone/sip/SipSettings;

    iget-boolean v1, p0, Lcom/android/phone/sip/SipSettings$2$1;->val$enabled:Z

    #calls: Lcom/android/phone/sip/SipSettings;->handleSipReceiveCallsOption(Z)V
    invoke-static {v0, v1}, Lcom/android/phone/sip/SipSettings;->access$700(Lcom/android/phone/sip/SipSettings;Z)V

    .line 256
    return-void
.end method
