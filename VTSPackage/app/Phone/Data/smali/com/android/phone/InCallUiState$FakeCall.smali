.class public Lcom/android/phone/InCallUiState$FakeCall;
.super Ljava/lang/Object;
.source "InCallUiState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/InCallUiState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FakeCall"
.end annotation


# instance fields
.field cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

.field conn:Lcom/android/internal/telephony/Connection;

.field number:Ljava/lang/String;

.field phoneType:I

.field slotId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 502
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
