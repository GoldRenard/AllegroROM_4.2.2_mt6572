.class Lcom/android/browser/PieControl$1;
.super Ljava/lang/Object;
.source "PieControl.java"

# interfaces
.implements Lcom/android/browser/view/PieMenu$PieView$OnLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/PieControl;->populateMenu()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/PieControl;


# direct methods
.method constructor <init>(Lcom/android/browser/PieControl;)V
    .locals 0
    .parameter

    .prologue
    .line 153
    iput-object p1, p0, Lcom/android/browser/PieControl$1;->this$0:Lcom/android/browser/PieControl;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayout(IIZ)V
    .locals 1
    .parameter "ax"
    .parameter "ay"
    .parameter "left"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/android/browser/PieControl$1;->this$0:Lcom/android/browser/PieControl;

    #calls: Lcom/android/browser/PieControl;->buildTabs()V
    invoke-static {v0}, Lcom/android/browser/PieControl;->access$000(Lcom/android/browser/PieControl;)V

    .line 157
    return-void
.end method
