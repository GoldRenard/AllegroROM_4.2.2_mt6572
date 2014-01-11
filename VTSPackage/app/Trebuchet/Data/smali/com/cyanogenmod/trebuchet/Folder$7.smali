.class Lcom/cyanogenmod/trebuchet/Folder$7;
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
    .line 679
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder$7;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAlarm(Lcom/cyanogenmod/trebuchet/Alarm;)V
    .locals 1
    .parameter "alarm"

    .prologue
    .line 681
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder$7;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->completeDragExit()V

    .line 682
    return-void
.end method
