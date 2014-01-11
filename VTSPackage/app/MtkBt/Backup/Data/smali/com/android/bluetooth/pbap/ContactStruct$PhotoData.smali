.class public Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PhotoData"
.end annotation


# static fields
.field public static final FORMAT_FLASH:Ljava/lang/String; = "SWF"


# instance fields
.field public final formatName:Ljava/lang/String;

.field public final photoBytes:[B

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;[B)V
    .locals 0
    .parameter "dataType"
    .parameter "photoFormatName"
    .parameter "photoDataBytes"

    .prologue
    .line 680
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 681
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;->type:I

    .line 682
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;->formatName:Ljava/lang/String;

    .line 683
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;->photoBytes:[B

    .line 684
    return-void
.end method
