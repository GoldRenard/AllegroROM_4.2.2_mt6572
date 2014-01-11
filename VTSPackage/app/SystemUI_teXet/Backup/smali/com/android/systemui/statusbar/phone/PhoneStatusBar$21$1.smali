.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21$1;
.super Ljava/lang/Object;
.source "PhoneStatusBar.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;)V
    .registers 2
    .parameter

    .prologue
    .line 2070
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4
    .parameter "v"
    .parameter "event"

    .prologue
    .line 2073
    const/4 v0, 0x1

    return v0
.end method
