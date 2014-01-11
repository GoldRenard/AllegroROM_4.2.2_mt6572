.class Lcom/mediatek/phone/recording/PhoneRecorderHandler$2;
.super Ljava/lang/Object;
.source "PhoneRecorderHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/recording/PhoneRecorderHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 104
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->checkRecordDisk()V
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    .line 107
    return-void
.end method
