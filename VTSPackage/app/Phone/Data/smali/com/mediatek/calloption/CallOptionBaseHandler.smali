.class public abstract Lcom/mediatek/calloption/CallOptionBaseHandler;
.super Ljava/lang/Object;
.source "CallOptionBaseHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;
    }
.end annotation


# instance fields
.field protected mDialog:Landroid/app/Dialog;

.field protected mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public dismissDialog()V
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 61
    :cond_0
    return-void
.end method

.method public abstract handleRequest(Lcom/mediatek/calloption/Request;)V
.end method

.method public setSuccessor(Lcom/mediatek/calloption/CallOptionBaseHandler;)V
    .locals 0
    .parameter "successor"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    .line 68
    return-void
.end method
