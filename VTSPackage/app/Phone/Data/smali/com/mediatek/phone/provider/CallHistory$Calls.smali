.class public Lcom/mediatek/phone/provider/CallHistory$Calls;
.super Ljava/lang/Object;
.source "CallHistory.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Calls"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    }
.end annotation


# static fields
.field public static final AREA_CODE:Ljava/lang/String; = "area_code"

.field private static final AREA_CODE_PROJECTION:[Ljava/lang/String; = null

.field private static final CALL_HISTORY_MAX_COUNT:I = 0x3e8

.field private static final CALL_INFO_PROJECTION:[Ljava/lang/String; = null

.field public static final CONFIRM:Ljava/lang/String; = "confirm"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/calls"

.field public static final CONTENT_URI_CALLS:Landroid/net/Uri; = null

.field public static final COUNTRY_ISO:Ljava/lang/String; = "country_iso"

.field private static final COUNTRY_ISO_PROJECTION:[Ljava/lang/String; = null

.field public static final DATE:Ljava/lang/String; = "date"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "date DESC"

.field public static final NUMBER:Ljava/lang/String; = "number"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 59
    const-string v0, "content://call_history/calls"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    .line 100
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "country_iso"

    aput-object v1, v0, v3

    const-string v1, "area_code"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string v2, "confirm"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/phone/provider/CallHistory$Calls;->CALL_INFO_PROJECTION:[Ljava/lang/String;

    .line 106
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "country_iso"

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/phone/provider/CallHistory$Calls;->COUNTRY_ISO_PROJECTION:[Ljava/lang/String;

    .line 110
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "area_code"

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/phone/provider/CallHistory$Calls;->AREA_CODE_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method

.method public static addCallNumber(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JIZ)V
    .locals 17
    .parameter "context"
    .parameter "number"
    .parameter "currentCountryISO"
    .parameter "start"
    .parameter "slotId"
    .parameter "isMultiSim"

    .prologue
    .line 130
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "addCallNumber(), number = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", currentCountryISO = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", slotId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p5

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", isMultiSim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p6

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 134
    move-object/from16 v0, p0

    move/from16 v1, p5

    move/from16 v2, p6

    invoke-static {v0, v1, v2}, Lcom/mediatek/calloption/CallOptionUtils;->queryIPPrefix(Landroid/content/Context;IZ)Ljava/lang/String;

    move-result-object v13

    .line 135
    .local v13, ipPrefix:Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 136
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 137
    const-string v3, ""

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 140
    :cond_0
    invoke-static/range {p1 .. p2}, Lcom/mediatek/calloption/CallOptionUtils;->getNumberInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;

    move-result-object v15

    .line 142
    .local v15, numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    move-object/from16 v5, p2

    .line 143
    .local v5, countryISO:Ljava/lang/String;
    if-nez v15, :cond_2

    .line 144
    const-string v3, "addCallNumber(), numberInfo is null"

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 145
    const-string v6, ""

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-wide/from16 v7, p3

    invoke-static/range {v3 .. v8}, Lcom/mediatek/phone/provider/CallHistory$Calls;->addCallNumberInternal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 171
    :cond_1
    :goto_0
    return-void

    .line 148
    :cond_2
    iget-object v3, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mCountryCode:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 149
    invoke-static {}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/android/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v3

    iget-object v4, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mCountryCode:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getRegionCodeForCountryCode(I)Ljava/lang/String;

    move-result-object v5

    .line 151
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "addCallNumber(), numberInfo.mCountryCode is NOT empty, countryISO = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 154
    :cond_3
    iget-object v4, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    iget-object v6, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    move-object/from16 v3, p0

    move-wide/from16 v7, p3

    invoke-static/range {v3 .. v8}, Lcom/mediatek/phone/provider/CallHistory$Calls;->addCallNumberInternal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 155
    iget-object v3, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v15, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, ""

    move-object/from16 v3, p0

    move-wide/from16 v7, p3

    invoke-static/range {v3 .. v8}, Lcom/mediatek/phone/provider/CallHistory$Calls;->addCallNumberInternal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 162
    :cond_4
    invoke-static/range {p2 .. p2}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->getInternationalPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 163
    .local v12, internationlPrefix:Ljava/lang/String;
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 164
    invoke-static {v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v16

    .line 165
    .local v16, pattern:Ljava/util/regex/Pattern;
    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 166
    .local v14, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v14}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 168
    const-string v9, ""

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-wide/from16 v10, p3

    invoke-static/range {v6 .. v11}, Lcom/mediatek/phone/provider/CallHistory$Calls;->addCallNumberInternal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    goto/16 :goto_0
.end method

.method private static addCallNumberInternal(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10
    .parameter "context"
    .parameter "number"
    .parameter "countryISO"
    .parameter "areaCode"
    .parameter "start"

    .prologue
    .line 175
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 177
    .local v3, resolver:Landroid/content/ContentResolver;
    const/4 v4, 0x0

    .line 178
    .local v4, result:Landroid/net/Uri;
    invoke-static {p0, p1}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getCallInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;

    move-result-object v0

    .line 179
    .local v0, callInfo:Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    if-eqz v0, :cond_2

    .line 180
    iget-wide v1, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mConfirm:J

    .line 182
    .local v1, confirm:J
    const-wide/16 v7, 0x1

    cmp-long v7, v7, v1

    if-nez v7, :cond_0

    .line 183
    iget-object v7, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 185
    const-string v7, "addCallNumber(), set confirm from 1 to 0"

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v7}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 186
    const-wide/16 v1, 0x0

    .line 190
    :cond_0
    new-instance v6, Landroid/content/ContentValues;

    const/4 v7, 0x4

    invoke-direct {v6, v7}, Landroid/content/ContentValues;-><init>(I)V

    .line 192
    .local v6, values:Landroid/content/ContentValues;
    const-string v7, "country_iso"

    invoke-virtual {v6, v7, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 194
    const-string v7, "area_code"

    invoke-virtual {v6, v7, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    :cond_1
    const-string v7, "date"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 197
    const-string v7, "confirm"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 199
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "addCallNumber(), country iso = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", area code = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", confirm = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v7}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 201
    new-instance v5, Lcom/mediatek/phone/provider/SelectionBuilder;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "number = \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .local v5, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    sget-object v7, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    invoke-virtual {v5}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v3, v7, v6, v8, v9}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 215
    .end local v1           #confirm:J
    .end local v5           #selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    :goto_0
    return-void

    .line 204
    .end local v6           #values:Landroid/content/ContentValues;
    :cond_2
    new-instance v6, Landroid/content/ContentValues;

    const/4 v7, 0x5

    invoke-direct {v6, v7}, Landroid/content/ContentValues;-><init>(I)V

    .line 205
    .restart local v6       #values:Landroid/content/ContentValues;
    const-string v7, "number"

    invoke-virtual {v6, v7, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    const-string v7, "country_iso"

    invoke-virtual {v6, v7, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 208
    const-string v7, "area_code"

    invoke-virtual {v6, v7, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    :cond_3
    const-string v7, "date"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 211
    const-string v7, "confirm"

    const-wide/16 v8, 0x1

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 212
    sget-object v7, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    invoke-virtual {v3, v7, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4

    .line 213
    invoke-static {p0}, Lcom/mediatek/phone/provider/CallHistory$Calls;->removeExpiredEntries(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static deleteNumber(Landroid/content/Context;Ljava/lang/String;)I
    .locals 6
    .parameter "context"
    .parameter "number"

    .prologue
    .line 290
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 291
    .local v2, resolver:Landroid/content/ContentResolver;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "number = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 292
    .local v3, where:Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/mediatek/phone/provider/CallHistory$Calls;->getCallInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;

    move-result-object v0

    .line 293
    .local v0, callInfo:Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    if-eqz v0, :cond_0

    iget-object v4, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 294
    iget-object v4, v0, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;->mCountryISO:Ljava/lang/String;

    invoke-static {p1, v4}, Lcom/mediatek/calloption/CallOptionUtils;->getNumberInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;

    move-result-object v1

    .line 296
    .local v1, numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    if-eqz v1, :cond_0

    .line 297
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " OR number = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 298
    iget-object v4, v1, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 300
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " OR number = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCodePrefix:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;->mSubscriber:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 305
    .end local v1           #numberInfo:Lcom/mediatek/calloption/CallOptionUtils$NumberInfo;
    :cond_0
    sget-object v4, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v3, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    return v4
.end method

.method public static getAllCountryISO(Landroid/content/Context;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 252
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/phone/provider/CallHistory$Calls;->COUNTRY_ISO_PROJECTION:[Ljava/lang/String;

    const-string v5, "date"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 254
    .local v6, cursor:Landroid/database/Cursor;
    if-nez v6, :cond_0

    .line 255
    const-string v0, "cursor is null..."

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 258
    :goto_0
    return-object v3

    :cond_0
    move-object v3, v6

    goto :goto_0
.end method

.method public static getCallInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    .locals 11
    .parameter "context"
    .parameter "number"

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v4, 0x0

    .line 218
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 219
    new-instance v8, Lcom/mediatek/phone/provider/SelectionBuilder;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "number = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .local v8, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "select builder = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/phone/provider/CallHistory$Calls;->CALL_INFO_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v8}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v3

    const-string v5, "date DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 223
    .local v7, cursor:Landroid/database/Cursor;
    if-nez v7, :cond_0

    .line 224
    const-string v0, "cursor is null..."

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 241
    :goto_0
    return-object v4

    .line 228
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-gtz v0, :cond_1

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cursor count is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 230
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 233
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 234
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_3

    .line 235
    :cond_2
    const-string v0, "country code is empty or count < 0"

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 236
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 239
    :cond_3
    new-instance v6, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 240
    .local v6, callInfo:Lcom/mediatek/phone/provider/CallHistory$Calls$CallInfo;
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v4, v6

    .line 241
    goto :goto_0
.end method

.method public static getLatestAreaCode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "context"
    .parameter "countryISO"

    .prologue
    const/4 v4, 0x0

    .line 262
    new-instance v8, Lcom/mediatek/phone/provider/SelectionBuilder;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "country_iso = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .local v8, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    const-string v0, "area_code IS NOT NULL"

    invoke-virtual {v8, v0}, Lcom/mediatek/phone/provider/SelectionBuilder;->addClause(Ljava/lang/String;)Lcom/mediatek/phone/provider/SelectionBuilder;

    .line 264
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/phone/provider/CallHistory$Calls;->AREA_CODE_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v8}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v3

    const-string v5, "date DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 266
    .local v7, cursor:Landroid/database/Cursor;
    if-nez v7, :cond_0

    .line 267
    const-string v0, "cursor is null..."

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 278
    :goto_0
    return-object v4

    .line 270
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 271
    const-string v0, "cursor count is 0"

    #calls: Lcom/mediatek/phone/provider/CallHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/phone/provider/CallHistory;->access$000(Ljava/lang/String;)V

    .line 272
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 275
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 276
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 277
    .local v6, areaCode:Ljava/lang/String;
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v4, v6

    .line 278
    goto :goto_0
.end method

.method private static removeExpiredEntries(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 245
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 246
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    const-string v2, "_id IN (SELECT _id FROM calls ORDER BY date DESC LIMIT -1 OFFSET 1000)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 249
    return-void
.end method

.method public static updateConfirmFlag(Landroid/content/Context;Ljava/lang/String;J)I
    .locals 6
    .parameter "context"
    .parameter "number"
    .parameter "confirm"

    .prologue
    .line 282
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 283
    .local v0, resolver:Landroid/content/ContentResolver;
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 284
    .local v2, values:Landroid/content/ContentValues;
    const-string v3, "confirm"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 285
    new-instance v1, Lcom/mediatek/phone/provider/SelectionBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "number = \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/mediatek/phone/provider/SelectionBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .local v1, selectionBuilder:Lcom/mediatek/phone/provider/SelectionBuilder;
    sget-object v3, Lcom/mediatek/phone/provider/CallHistory$Calls;->CONTENT_URI_CALLS:Landroid/net/Uri;

    invoke-virtual {v1}, Lcom/mediatek/phone/provider/SelectionBuilder;->build()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v2, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    return v3
.end method
