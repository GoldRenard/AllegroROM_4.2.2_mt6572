.class Lcom/cyanogenmod/trebuchet/Folder$6;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/OnAlarmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Folder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Folder;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Folder;)V
    .locals 0
    .parameter

    .prologue
    .line 586
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder$6;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAlarm(Lcom/cyanogenmod/trebuchet/Alarm;)V
    .locals 3
    .parameter "alarm"

    .prologue
    .line 588
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder$6;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder$6;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mEmptyCell:[I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Folder;->access$500(Lcom/cyanogenmod/trebuchet/Folder;)[I

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Folder$6;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mTargetCell:[I
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Folder;->access$600(Lcom/cyanogenmod/trebuchet/Folder;)[I

    move-result-object v2

    #calls: Lcom/cyanogenmod/trebuchet/Folder;->realTimeReorder([I[I)V
    invoke-static {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Folder;->access$700(Lcom/cyanogenmod/trebuchet/Folder;[I[I)V

    .line 589
    return-void
.end method
