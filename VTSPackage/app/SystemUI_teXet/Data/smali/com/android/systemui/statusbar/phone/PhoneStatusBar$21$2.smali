.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21$2;
.super Ljava/lang/Object;
.source "PhoneStatusBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 2075
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21$2;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 2078
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21$2;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;

    iget-object v0, v0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$21;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->hideCling()V

    .line 2079
    return-void
.end method
