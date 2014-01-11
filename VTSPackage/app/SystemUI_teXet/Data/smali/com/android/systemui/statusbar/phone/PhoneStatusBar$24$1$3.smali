.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1$3;
.super Ljava/lang/Object;
.source "PhoneStatusBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;)V
    .registers 2
    .parameter

    .prologue
    .line 2574
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1$3;->this$2:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 2577
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1$3;->this$2:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24;

    iget-object v0, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$24;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->animateCollapsePanels(I)V

    .line 2578
    return-void
.end method
