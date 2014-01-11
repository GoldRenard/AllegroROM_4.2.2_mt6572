.class Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FMRadioEMActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FactoryTestModeReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 202
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;Lcom/mediatek/FMRadio/FMRadioEMActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 205
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const/4 v1, 0x1

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->factorymode:Z
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$602(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)Z

    .line 206
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->StartToHandlerFactoryMode()V
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    .line 207
    return-void
.end method
