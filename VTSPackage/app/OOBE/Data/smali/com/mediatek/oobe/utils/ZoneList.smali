.class public Lcom/mediatek/oobe/utils/ZoneList;
.super Landroid/app/ListActivity;
.source "ZoneList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/utils/ZoneList$MyComparator;
    }
.end annotation


# static fields
.field private static final HOURS_1:I = 0x36ee80

.field private static final HOURS_24:I = 0x5265c00

.field private static final HOURS_HALF:I = 0x1b7740

.field private static final KEY_DISPLAYNAME:Ljava/lang/String; = "name"

.field private static final KEY_GMT:Ljava/lang/String; = "gmt"

.field private static final KEY_ID:Ljava/lang/String; = "id"

.field private static final KEY_OFFSET:Ljava/lang/String; = "offset"

.field private static final MENU_ALPHABETICAL:I = 0x1

.field private static final MENU_TIMEZONE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ZoneList"

.field private static final XMLTAG_TIMEZONE:Ljava/lang/String; = "timezone"


# instance fields
.field private mAlphabeticalAdapter:Landroid/widget/SimpleAdapter;

.field private mDefault:I

.field private mSortedByTimezone:Z

.field private mTimezoneSortedAdapter:Landroid/widget/SimpleAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 266
    return-void
.end method

.method private getZones()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    .line 181
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 182
    .local v1, myData:Ljava/util/List;,"Ljava/util/List<Ljava/util/HashMap;>;"
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    .line 184
    .local v4, date:J
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/ZoneList;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v9, 0x7f050009

    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v8

    .line 185
    .local v8, xrp:Landroid/content/res/XmlResourceParser;
    :cond_0
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v0

    if-ne v0, v10, :cond_0

    .line 188
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I

    .line 189
    :goto_0
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    if-eq v0, v11, :cond_5

    .line 190
    :goto_1
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    if-eq v0, v10, :cond_2

    .line 191
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    const/4 v9, 0x1

    if-ne v0, v9, :cond_1

    .line 213
    .end local v8           #xrp:Landroid/content/res/XmlResourceParser;
    :goto_2
    return-object v1

    .line 194
    .restart local v8       #xrp:Landroid/content/res/XmlResourceParser;
    :cond_1
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 207
    .end local v8           #xrp:Landroid/content/res/XmlResourceParser;
    :catch_0
    move-exception v7

    .line 208
    .local v7, xppe:Lorg/xmlpull/v1/XmlPullParserException;
    const-string v0, "ZoneList"

    const-string v9, "Ill-formatted timezones.xml file"

    invoke-static {v0, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 196
    .end local v7           #xppe:Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v8       #xrp:Landroid/content/res/XmlResourceParser;
    :cond_2
    :try_start_1
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v9, "timezone"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 197
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/content/res/XmlResourceParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    .line 198
    .local v2, id:Ljava/lang/String;
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .local v3, displayName:Ljava/lang/String;
    move-object v0, p0

    .line 199
    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/oobe/utils/ZoneList;->addItem(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;J)V

    .line 201
    .end local v2           #id:Ljava/lang/String;
    .end local v3           #displayName:Ljava/lang/String;
    :cond_3
    :goto_3
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    if-eq v0, v11, :cond_4

    .line 202
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 209
    .end local v8           #xrp:Landroid/content/res/XmlResourceParser;
    :catch_1
    move-exception v6

    .line 210
    .local v6, ioe:Ljava/io/IOException;
    const-string v0, "ZoneList"

    const-string v9, "Unable to read timezones.xml file"

    invoke-static {v0, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 204
    .end local v6           #ioe:Ljava/io/IOException;
    .restart local v8       #xrp:Landroid/content/res/XmlResourceParser;
    :cond_4
    :try_start_2
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I

    goto :goto_0

    .line 206
    :cond_5
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2
.end method

.method private setSorting(Z)V
    .locals 1
    .parameter "timezone"

    .prologue
    .line 176
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/utils/ZoneList;->mTimezoneSortedAdapter:Landroid/widget/SimpleAdapter;

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/ZoneList;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 177
    iput-boolean p1, p0, Lcom/mediatek/oobe/utils/ZoneList;->mSortedByTimezone:Z

    .line 178
    return-void

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ZoneList;->mAlphabeticalAdapter:Landroid/widget/SimpleAdapter;

    goto :goto_0
.end method


# virtual methods
.method protected addItem(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 13
    .parameter
    .parameter "id"
    .parameter "displayName"
    .parameter "date"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 217
    .local p1, myData:Ljava/util/List;,"Ljava/util/List<Ljava/util/HashMap;>;"
    const/16 v8, 0x3e8

    .line 218
    .local v8, secondsInMillis:I
    const/16 v9, 0x3c

    .line 219
    .local v9, secondsInMinute:I
    const/16 v2, 0xa

    .line 220
    .local v2, decimal:I
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 221
    .local v3, map:Ljava/util/HashMap;
    const-string v11, "id"

    invoke-virtual {v3, v11, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string v11, "name"

    move-object/from16 v0, p3

    invoke-virtual {v3, v11, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    invoke-static {p2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v10

    .line 224
    .local v10, tz:Ljava/util/TimeZone;
    move-wide/from16 v0, p4

    invoke-virtual {v10, v0, v1}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v6

    .line 225
    .local v6, offset:I
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 226
    .local v7, p:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .local v5, name:Ljava/lang/StringBuilder;
    const-string v11, "GMT"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    if-gez v6, :cond_2

    .line 230
    const/16 v11, 0x2d

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 235
    :goto_0
    const v11, 0x36ee80

    div-int v11, v7, v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    const/16 v11, 0x3a

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    const v11, 0xea60

    div-int v4, v7, v11

    .line 239
    .local v4, min:I
    rem-int/lit8 v4, v4, 0x3c

    .line 241
    const/16 v11, 0xa

    if-ge v4, v11, :cond_0

    .line 242
    const/16 v11, 0x30

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 244
    :cond_0
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    const-string v11, "gmt"

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    const-string v11, "offset"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v3, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 250
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v11

    iput v11, p0, Lcom/mediatek/oobe/utils/ZoneList;->mDefault:I

    .line 253
    :cond_1
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    return-void

    .line 232
    .end local v4           #min:I
    :cond_2
    const/16 v11, 0x2b

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "icicle"

    .prologue
    .line 107
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 109
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "name"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "gmt"

    aput-object v1, v4, v0

    .line 110
    .local v4, from:[Ljava/lang/String;
    const/4 v0, 0x2

    new-array v5, v0, [I

    fill-array-data v5, :array_0

    .line 112
    .local v5, to:[I
    new-instance v12, Lcom/mediatek/oobe/utils/ZoneList$MyComparator;

    const-string v0, "offset"

    invoke-direct {v12, v0}, Lcom/mediatek/oobe/utils/ZoneList$MyComparator;-><init>(Ljava/lang/String;)V

    .line 114
    .local v12, comparator:Lcom/mediatek/oobe/utils/ZoneList$MyComparator;
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/ZoneList;->getZones()Ljava/util/List;

    move-result-object v2

    .line 115
    .local v2, timezoneSortedList:Ljava/util/List;,"Ljava/util/List<Ljava/util/HashMap;>;"
    invoke-static {v2, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    new-instance v0, Landroid/widget/SimpleAdapter;

    const v3, 0x1090004

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mediatek/oobe/utils/ZoneList;->mTimezoneSortedAdapter:Landroid/widget/SimpleAdapter;

    .line 119
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 120
    .local v8, alphabeticalList:Ljava/util/List;,"Ljava/util/List<Ljava/util/HashMap;>;"
    const-string v0, "name"

    invoke-virtual {v12, v0}, Lcom/mediatek/oobe/utils/ZoneList$MyComparator;->setSortingKey(Ljava/lang/String;)V

    .line 121
    invoke-static {v8, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 122
    new-instance v6, Landroid/widget/SimpleAdapter;

    const v9, 0x1090004

    move-object v7, p0

    move-object v10, v4

    move-object v11, v5

    invoke-direct/range {v6 .. v11}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v6, p0, Lcom/mediatek/oobe/utils/ZoneList;->mAlphabeticalAdapter:Landroid/widget/SimpleAdapter;

    .line 126
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/utils/ZoneList;->setSorting(Z)V

    .line 129
    iget v0, p0, Lcom/mediatek/oobe/utils/ZoneList;->mDefault:I

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/ZoneList;->setSelection(I)V

    .line 132
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/ZoneList;->setResult(I)V

    .line 133
    return-void

    .line 110
    nop

    :array_0
    .array-data 0x4
        0x14t 0x0t 0x2t 0x1t
        0x15t 0x0t 0x2t 0x1t
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 137
    const v0, 0x7f09002d

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108009c

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 139
    const/4 v0, 0x2

    const v1, 0x7f09002e

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020014

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 141
    return v3
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 3
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 258
    invoke-virtual {p1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 260
    .local v1, map:Ljava/util/Map;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/ZoneList;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 261
    .local v0, alarm:Landroid/app/AlarmManager;
    const-string v2, "id"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->setTimeZone(Ljava/lang/String;)V

    .line 262
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/ZoneList;->setResult(I)V

    .line 263
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/ZoneList;->finish()V

    .line 264
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 160
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    move v0, v1

    .line 171
    :goto_0
    return v0

    .line 163
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/mediatek/oobe/utils/ZoneList;->setSorting(Z)V

    goto :goto_0

    .line 167
    :pswitch_1
    invoke-direct {p0, v1}, Lcom/mediatek/oobe/utils/ZoneList;->setSorting(Z)V

    goto :goto_0

    .line 160
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 147
    iget-boolean v0, p0, Lcom/mediatek/oobe/utils/ZoneList;->mSortedByTimezone:Z

    if-eqz v0, :cond_0

    .line 148
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 149
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 155
    :goto_0
    return v1

    .line 151
    :cond_0
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 152
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0
.end method
