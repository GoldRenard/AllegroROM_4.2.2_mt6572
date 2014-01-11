.class public Lcom/mediatek/calloption/Request;
.super Ljava/lang/Object;
.source "Request.java"


# instance fields
.field private mActivityContext:Landroid/content/Context;

.field private mApplicationContext:Landroid/content/Context;

.field private mCallOptionHandlerFactory:Lcom/mediatek/calloption/CallOptionHandlerFactory;

.field private mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mIntent:Landroid/content/Intent;

.field private mIs3GSwitchSupport:Z

.field private mIsMultipleSim:Z

.field private mResultHandler:Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

.field private mTelephonyInterface:Lcom/android/internal/telephony/ITelephony;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Context;Landroid/content/Intent;Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;Lcom/mediatek/CellConnService/CellConnMgr;Lcom/android/internal/telephony/ITelephony;ZZLcom/mediatek/calloption/CallOptionHandlerFactory;)V
    .locals 0
    .parameter "activityContext"
    .parameter "applicationContext"
    .parameter "intent"
    .parameter "resultHandler"
    .parameter "cellConnMgr"
    .parameter "telephonyInterface"
    .parameter "isMultipleSim"
    .parameter "is3GSwitchSupport"
    .parameter "callOptionHandlerFactory"

    .prologue
    .line 59
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/mediatek/calloption/Request;->mActivityContext:Landroid/content/Context;

    .line 61
    iput-object p2, p0, Lcom/mediatek/calloption/Request;->mApplicationContext:Landroid/content/Context;

    .line 62
    iput-object p3, p0, Lcom/mediatek/calloption/Request;->mIntent:Landroid/content/Intent;

    .line 63
    iput-object p4, p0, Lcom/mediatek/calloption/Request;->mResultHandler:Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    .line 64
    iput-object p5, p0, Lcom/mediatek/calloption/Request;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 65
    iput-object p6, p0, Lcom/mediatek/calloption/Request;->mTelephonyInterface:Lcom/android/internal/telephony/ITelephony;

    .line 66
    iput-boolean p7, p0, Lcom/mediatek/calloption/Request;->mIsMultipleSim:Z

    .line 67
    iput-boolean p8, p0, Lcom/mediatek/calloption/Request;->mIs3GSwitchSupport:Z

    .line 68
    iput-object p9, p0, Lcom/mediatek/calloption/Request;->mCallOptionHandlerFactory:Lcom/mediatek/calloption/CallOptionHandlerFactory;

    .line 69
    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mActivityContext:Landroid/content/Context;

    return-object v0
.end method

.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mCallOptionHandlerFactory:Lcom/mediatek/calloption/CallOptionHandlerFactory;

    return-object v0
.end method

.method public getCellConnMgr()Lcom/mediatek/CellConnService/CellConnMgr;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mResultHandler:Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    return-object v0
.end method

.method public getTelephonyInterface()Lcom/android/internal/telephony/ITelephony;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mediatek/calloption/Request;->mTelephonyInterface:Lcom/android/internal/telephony/ITelephony;

    return-object v0
.end method

.method public is3GSwitchSupport()Z
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/mediatek/calloption/Request;->mIs3GSwitchSupport:Z

    return v0
.end method

.method public isMultipleSim()Z
    .locals 1

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/mediatek/calloption/Request;->mIsMultipleSim:Z

    return v0
.end method
