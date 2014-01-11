.class public interface abstract Lcom/mediatek/settings/ext/IApnEditorExt;
.super Ljava/lang/Object;
.source "IApnEditorExt.java"


# static fields
.field public static final CMCC_CARD_1:Ljava/lang/String; = "46000"

.field public static final CMCC_CARD_2:Ljava/lang/String; = "46002"

.field public static final CMCC_CARD_3:Ljava/lang/String; = "46007"


# virtual methods
.method public abstract getApnTypeArray(Landroid/content/Context;III)[Ljava/lang/String;
.end method

.method public abstract getApnTypeArrayByCard(Landroid/content/Context;Ljava/lang/String;ZIII[Ljava/lang/String;)[Ljava/lang/String;
.end method

.method public abstract getUriFromIntent(Landroid/content/Context;Landroid/content/Intent;)Landroid/net/Uri;
.end method

.method public abstract setPreferenceState(Landroid/preference/DialogPreference;)V
.end method
