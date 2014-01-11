.class Lcom/mediatek/settings/SipCallSetting$1;
.super Ljava/lang/Object;
.source "SipCallSetting.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/SipCallSetting;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/SipCallSetting;

.field final synthetic val$intEnable:I


# direct methods
.method constructor <init>(Lcom/mediatek/settings/SipCallSetting;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 181
    iput-object p1, p0, Lcom/mediatek/settings/SipCallSetting$1;->this$0:Lcom/mediatek/settings/SipCallSetting;

    iput p2, p0, Lcom/mediatek/settings/SipCallSetting$1;->val$intEnable:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 183
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting$1;->this$0:Lcom/mediatek/settings/SipCallSetting;

    iget v2, p0, Lcom/mediatek/settings/SipCallSetting$1;->val$intEnable:I

    if-ne v2, v0, :cond_0

    :goto_0
    #calls: Lcom/mediatek/settings/SipCallSetting;->handleSipReceiveCallsOption(Z)V
    invoke-static {v1, v0}, Lcom/mediatek/settings/SipCallSetting;->access$000(Lcom/mediatek/settings/SipCallSetting;Z)V

    .line 184
    return-void

    .line 183
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
