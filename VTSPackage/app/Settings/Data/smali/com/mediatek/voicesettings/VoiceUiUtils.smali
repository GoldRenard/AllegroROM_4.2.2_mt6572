.class public Lcom/mediatek/voicesettings/VoiceUiUtils;
.super Ljava/lang/Object;
.source "VoiceUiUtils.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "VoiceUiUtils"


# instance fields
.field private final mAlarmId:I

.field private mAlarmKeywords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mAlarmProcessName:Ljava/lang/String;

.field private mKeyId:Ljava/lang/String;

.field private mKeyWord:Ljava/lang/String;

.field private mVoiceProcessName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x3

    iput v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmId:I

    .line 25
    const-string v0, "com.android.deskclock"

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmProcessName:Ljava/lang/String;

    .line 27
    const-string v0, "KeyWord"

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mKeyWord:Ljava/lang/String;

    .line 28
    const-string v0, "ID"

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mKeyId:Ljava/lang/String;

    .line 29
    const-string v0, "ProcessName"

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mVoiceProcessName:Ljava/lang/String;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmKeywords:Ljava/util/List;

    .line 36
    const-string v0, "VoiceUiUtils"

    const-string v1, "VoiceUiUtils constructor "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    return-void
.end method


# virtual methods
.method public readKeyWordFromXml(Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 13
    .parameter
    .parameter "filename"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, voiceKeyWordInfos:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .local v3, keyWordFile:Ljava/io/File;
    const/4 v4, 0x0

    .line 44
    .local v4, keyWordReader:Ljava/io/FileReader;
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v4           #keyWordReader:Ljava/io/FileReader;
    .local v5, keyWordReader:Ljava/io/FileReader;
    :try_start_1
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 52
    .local v7, parser:Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v7, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 53
    const-string v10, "KeyWordInfos"

    invoke-static {v7, v10}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 55
    :cond_0
    :goto_0
    invoke-static {v7}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 56
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_5

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_1

    .line 90
    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7

    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    :goto_1
    move-object v4, v5

    .line 95
    .end local v5           #keyWordReader:Ljava/io/FileReader;
    .restart local v4       #keyWordReader:Ljava/io/FileReader;
    :goto_2
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, e:Ljava/io/FileNotFoundException;
    const-string v10, "VoiceUiUtils"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Couldn\'t find or open file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 59
    .end local v0           #e:Ljava/io/FileNotFoundException;
    .end local v4           #keyWordReader:Ljava/io/FileReader;
    .restart local v5       #keyWordReader:Ljava/io/FileReader;
    .restart local v7       #parser:Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    :try_start_3
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 60
    .local v6, name:Ljava/lang/String;
    const-string v10, "KeyWordInfo"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 61
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mVoiceProcessName:Ljava/lang/String;

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 63
    .local v9, processName:Ljava/lang/String;
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mKeyId:Ljava/lang/String;

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 64
    .local v8, procId:Ljava/lang/String;
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mKeyWord:Ljava/lang/String;

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, keyWord:Ljava/lang/String;
    if-eqz v9, :cond_3

    if-eqz v1, :cond_3

    .line 67
    const-string v10, "VoiceUiUtils"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "readEnglishKeyWordFromXml id = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " processName   = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  KeyWord ="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    const-string v10, ","

    invoke-virtual {v1, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, keyWordArray:[Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v11, 0x3

    if-ne v10, v11, :cond_2

    .line 71
    iget-object v10, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmKeywords:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 72
    const-string v10, "VoiceUiUtils"

    iget-object v11, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmKeywords:Ljava/util/List;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const-string v10, "com.android.deskclock"

    iget-object v11, p0, Lcom/mediatek/voicesettings/VoiceUiUtils;->mAlarmKeywords:Ljava/util/List;

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/String;

    invoke-interface {v11, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p1, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_5

    goto/16 :goto_0

    .line 82
    .end local v1           #keyWord:Ljava/lang/String;
    .end local v2           #keyWordArray:[Ljava/lang/String;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v8           #procId:Ljava/lang/String;
    .end local v9           #processName:Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 83
    .local v0, e:Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_4
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    :try_start_5
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_1

    .line 91
    :catch_2
    move-exception v0

    .line 92
    .local v0, e:Ljava/io/IOException;
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 75
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #keyWord:Ljava/lang/String;
    .restart local v2       #keyWordArray:[Ljava/lang/String;
    .restart local v6       #name:Ljava/lang/String;
    .restart local v7       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v8       #procId:Ljava/lang/String;
    .restart local v9       #processName:Ljava/lang/String;
    :cond_2
    :try_start_6
    invoke-virtual {p1, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_5

    goto/16 :goto_0

    .line 84
    .end local v1           #keyWord:Ljava/lang/String;
    .end local v2           #keyWordArray:[Ljava/lang/String;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v8           #procId:Ljava/lang/String;
    .end local v9           #processName:Ljava/lang/String;
    :catch_3
    move-exception v0

    .line 85
    .restart local v0       #e:Ljava/io/IOException;
    :try_start_7
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 90
    :try_start_8
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    goto/16 :goto_1

    .line 91
    :catch_4
    move-exception v0

    .line 92
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 78
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #keyWord:Ljava/lang/String;
    .restart local v6       #name:Ljava/lang/String;
    .restart local v7       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v8       #procId:Ljava/lang/String;
    .restart local v9       #processName:Ljava/lang/String;
    :cond_3
    :try_start_9
    const-string v10, "VoiceUiUtils"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error processName or keyWord "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_5

    goto/16 :goto_0

    .line 86
    .end local v1           #keyWord:Ljava/lang/String;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v8           #procId:Ljava/lang/String;
    .end local v9           #processName:Ljava/lang/String;
    :catch_5
    move-exception v0

    .line 87
    .local v0, e:Ljava/lang/NumberFormatException;
    :try_start_a
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got NumberFormatException parsing number error."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 90
    :try_start_b
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    goto/16 :goto_1

    .line 91
    :catch_6
    move-exception v0

    .line 92
    .local v0, e:Ljava/io/IOException;
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 91
    .end local v0           #e:Ljava/io/IOException;
    .restart local v7       #parser:Lorg/xmlpull/v1/XmlPullParser;
    :catch_7
    move-exception v0

    .line 92
    .restart local v0       #e:Ljava/io/IOException;
    const-string v10, "VoiceUiUtils"

    const-string v11, "Got execption parsing permissions."

    invoke-static {v10, v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 89
    .end local v0           #e:Ljava/io/IOException;
    .end local v7           #parser:Lorg/xmlpull/v1/XmlPullParser;
    :catchall_0
    move-exception v10

    .line 90
    :try_start_c
    invoke-virtual {v5}, Ljava/io/FileReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 93
    :goto_3
    throw v10

    .line 91
    :catch_8
    move-exception v0

    .line 92
    .restart local v0       #e:Ljava/io/IOException;
    const-string v11, "VoiceUiUtils"

    const-string v12, "Got execption parsing permissions."

    invoke-static {v11, v12, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method
