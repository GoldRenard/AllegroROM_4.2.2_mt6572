.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$2;
.super Ljava/lang/Object;
.source "PhoneStatusBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;Landroid/content/Context;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 3045
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$2;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iput-object p2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$2;->val$context:Landroid/content/Context;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 3047
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$2;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 3048
    return-void
.end method
