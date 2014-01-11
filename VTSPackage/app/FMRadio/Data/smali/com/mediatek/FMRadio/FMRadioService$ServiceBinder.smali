.class public Lcom/mediatek/FMRadio/FMRadioService$ServiceBinder;
.super Landroid/os/Binder;
.source "FMRadioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ServiceBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioService;


# direct methods
.method public constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;)V
    .locals 0
    .parameter

    .prologue
    .line 227
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$ServiceBinder;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method getService()Lcom/mediatek/FMRadio/FMRadioService;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioService$ServiceBinder;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    return-object v0
.end method
