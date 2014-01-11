.class public abstract Landroid/app/ANRManagerNative;
.super Landroid/os/Binder;
.source "ANRManagerNative.java"

# interfaces
.implements Landroid/app/IANRManager;


# static fields
.field private static final gDefault:Landroid/util/Singleton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Singleton",
            "<",
            "Landroid/app/IANRManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    new-instance v0, Landroid/app/ANRManagerNative$1;

    invoke-direct {v0}, Landroid/app/ANRManagerNative$1;-><init>()V

    sput-object v0, Landroid/app/ANRManagerNative;->gDefault:Landroid/util/Singleton;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 41
    const-string v0, "android.app.IANRManager"

    invoke-virtual {p0, p0, v0}, Landroid/app/ANRManagerNative;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/app/IANRManager;
    .locals 2
    .parameter "obj"

    .prologue
    .line 21
    if-nez p0, :cond_1

    .line 22
    const/4 v0, 0x0

    .line 30
    :cond_0
    :goto_0
    return-object v0

    .line 24
    :cond_1
    const-string v1, "android.app.IANRManager"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Landroid/app/IANRManager;

    .line 26
    .local v0, in:Landroid/app/IANRManager;
    if-nez v0, :cond_0

    .line 30
    new-instance v0, Landroid/app/ANRManagerProxy;

    .end local v0           #in:Landroid/app/IANRManager;
    invoke-direct {v0, p0}, Landroid/app/ANRManagerProxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method

.method public static getDefault()Landroid/app/IANRManager;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Landroid/app/ANRManagerNative;->gDefault:Landroid/util/Singleton;

    invoke-virtual {v0}, Landroid/util/Singleton;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/IANRManager;

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 78
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 6
    .parameter "code"
    .parameter "data"
    .parameter "reply"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 46
    packed-switch p1, :pswitch_data_0

    .line 74
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v5

    :goto_0
    return v5

    .line 50
    :pswitch_0
    const-string v4, "android.app.IANRManager"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 52
    .local v1, pid:I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, reason:Ljava/lang/String;
    invoke-virtual {p0, v1, v2}, Landroid/app/ANRManagerNative;->notifyWNR(ILjava/lang/String;)Z

    move-result v3

    .line 54
    .local v3, result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 55
    if-eqz v3, :cond_0

    move v4, v5

    :goto_1
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 61
    .end local v1           #pid:I
    .end local v2           #reason:Ljava/lang/String;
    .end local v3           #result:Z
    :pswitch_1
    const-string v4, "android.app.IActivityManager"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 63
    .restart local v1       #pid:I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 65
    .restart local v2       #reason:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 66
    .local v0, message:I
    invoke-virtual {p0, v1, v2, v0}, Landroid/app/ANRManagerNative;->notifyLightWeightANR(ILjava/lang/String;I)V

    .line 68
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 46
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
