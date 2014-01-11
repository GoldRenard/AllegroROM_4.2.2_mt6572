.class Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;
.super Ljava/lang/Object;
.source "VoiceUiSwitchPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;


# direct methods
.method constructor <init>(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 55
    iput-object p1, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;->this$0:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 60
    const-string v0, "VoiceUiSwitchPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCheckedChanged isChecked="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mChecked="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;->this$0:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z
    invoke-static {v2}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->access$000(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;->this$0:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;

    #getter for: Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->mChecked:Z
    invoke-static {v0}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->access$000(Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;)Z

    move-result v0

    if-eq p2, v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference$1;->this$0:Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;

    invoke-virtual {v0, p2}, Lcom/mediatek/voicesettings/VoiceUiSwitchPreference;->setChecked(Z)V

    .line 65
    :cond_0
    return-void
.end method
