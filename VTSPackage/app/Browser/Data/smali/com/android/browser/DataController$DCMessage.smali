.class Lcom/android/browser/DataController$DCMessage;
.super Ljava/lang/Object;
.source "DataController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/DataController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DCMessage"
.end annotation


# instance fields
.field obj:Ljava/lang/Object;

.field replyTo:Ljava/lang/Object;

.field what:I


# direct methods
.method constructor <init>(ILjava/lang/Object;)V
    .locals 0
    .parameter "w"
    .parameter "o"

    .prologue
    .line 68
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput p1, p0, Lcom/android/browser/DataController$DCMessage;->what:I

    .line 70
    iput-object p2, p0, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    .line 71
    return-void
.end method
