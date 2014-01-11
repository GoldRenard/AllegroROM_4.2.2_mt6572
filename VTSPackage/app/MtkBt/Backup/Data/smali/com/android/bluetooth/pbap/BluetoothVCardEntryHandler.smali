.class public Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;
.super Ljava/lang/Object;
.source "BluetoothVCardEntryHandler.java"

# interfaces
.implements Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;


# static fields
.field private static final TAG:Ljava/lang/String; = "BluetoothVCardEntryHandler"


# instance fields
.field mVcard:Ljava/lang/String;

.field mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "ownerNumberVcard"

    .prologue
    .line 50
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 52
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mVcard:Ljava/lang/String;

    .line 53
    return-void
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v0}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->getPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onEntryCreated(Ljava/lang/String;)Z
    .locals 1
    .parameter "vcard"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->write(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onInit(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 60
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-direct {v0}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 62
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->init(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 64
    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 75
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    return v0

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mVcard:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mVcard:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->onEntryCreated(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v0}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    .line 69
    iput-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    goto :goto_0

    .line 75
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onTerminate()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    invoke-virtual {v0}, Lcom/android/bluetooth/pbap/BluetoothPbapWriter;->terminate()V

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->mWriter:Lcom/android/bluetooth/pbap/BluetoothPbapWriter;

    .line 87
    :cond_0
    return-void
.end method
