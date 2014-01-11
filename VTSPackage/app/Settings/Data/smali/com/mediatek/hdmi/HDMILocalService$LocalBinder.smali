.class public Lcom/mediatek/hdmi/HDMILocalService$LocalBinder;
.super Landroid/os/Binder;
.source "HDMILocalService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/hdmi/HDMILocalService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LocalBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/hdmi/HDMILocalService;


# direct methods
.method public constructor <init>(Lcom/mediatek/hdmi/HDMILocalService;)V
    .locals 0
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lcom/mediatek/hdmi/HDMILocalService$LocalBinder;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/mediatek/hdmi/HDMILocalService;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/hdmi/HDMILocalService$LocalBinder;->this$0:Lcom/mediatek/hdmi/HDMILocalService;

    return-object v0
.end method
