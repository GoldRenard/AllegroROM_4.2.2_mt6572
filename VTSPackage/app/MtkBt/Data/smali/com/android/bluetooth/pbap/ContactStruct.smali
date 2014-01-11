.class public Lcom/android/bluetooth/pbap/ContactStruct;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/bluetooth/pbap/ContactStruct$Property;,
        Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;,
        Lcom/android/bluetooth/pbap/ContactStruct$ImData;,
        Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;,
        Lcom/android/bluetooth/pbap/ContactStruct$PostalData;,
        Lcom/android/bluetooth/pbap/ContactStruct$EmailData;,
        Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
    }
.end annotation


# static fields
.field private static final ACCOUNT_TYPE_GOOGLE:Ljava/lang/String; = "com.google"

.field private static final GOOGLE_MY_CONTACTS_GROUP:Ljava/lang/String; = "System Group: My Contacts"

.field private static final IM_MAP:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String; = "vcard.ContactStruct"


# instance fields
.field private final mAccount:Landroid/accounts/Account;

.field private mBirthday:Ljava/lang/String;

.field private mDisplayName:Ljava/lang/String;

.field private mEmailList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$EmailData;",
            ">;"
        }
    .end annotation
.end field

.field private mFamilyName:Ljava/lang/String;

.field private mFullName:Ljava/lang/String;

.field private mGivenName:Ljava/lang/String;

.field private mImList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$ImData;",
            ">;"
        }
    .end annotation
.end field

.field private mMiddleName:Ljava/lang/String;

.field private mNickNameList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mNoteList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mOrganizationList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;",
            ">;"
        }
    .end annotation
.end field

.field private mPhoneList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;",
            ">;"
        }
    .end annotation
.end field

.field private mPhoneticFamilyName:Ljava/lang/String;

.field private mPhoneticFullName:Ljava/lang/String;

.field private mPhoneticGivenName:Ljava/lang/String;

.field private mPhoneticMiddleName:Ljava/lang/String;

.field private mPhotoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;",
            ">;"
        }
    .end annotation
.end field

.field private mPostalList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PostalData;",
            ">;"
        }
    .end annotation
.end field

.field private mPrefIsSetAddress:Z

.field private mPrefIsSetEmail:Z

.field private mPrefIsSetOrganization:Z

.field private mPrefIsSetPhone:Z

.field private mPrefix:Ljava/lang/String;

.field private mSuffix:Ljava/lang/String;

.field private final mVCardType:I

.field private mWebsiteList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    .line 101
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-AIM"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-MSN"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-YAHOO"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-ICQ"

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-JABBER"

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-SKYPE-USERNAME"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-GOOGLE-TALK"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    const-string v1, "X-GOOGLE TALK"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 803
    const/high16 v0, -0x4000

    invoke-direct {p0, v0}, Lcom/android/bluetooth/pbap/ContactStruct;-><init>(I)V

    .line 804
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "vcardType"

    .prologue
    .line 807
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/bluetooth/pbap/ContactStruct;-><init>(ILandroid/accounts/Account;)V

    .line 808
    return-void
.end method

.method public constructor <init>(ILandroid/accounts/Account;)V
    .locals 0
    .parameter "vcardType"
    .parameter "account"

    .prologue
    .line 810
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 811
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mVCardType:I

    .line 812
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mAccount:Landroid/accounts/Account;

    .line 813
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .parameter "givenName"
    .parameter "familyName"
    .parameter "middleName"
    .parameter "prefix"
    .parameter "suffix"
    .parameter "phoneticGivenName"
    .parameter "pheneticFamilyName"
    .parameter "phoneticMiddleName"
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$EmailData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PostalData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 824
    .local p9, photoBytesList:Ljava/util/List;,"Ljava/util/List<[B>;"
    .local p10, notes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .local p11, phoneList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;>;"
    .local p12, emailList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/ContactStruct$EmailData;>;"
    .local p13, postalList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/ContactStruct$PostalData;>;"
    .local p14, organizationList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;>;"
    .local p15, photoList:Ljava/util/List;,"Ljava/util/List<Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;>;"
    .local p16, websiteList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/high16 v1, -0x4000

    invoke-direct {p0, v1}, Lcom/android/bluetooth/pbap/ContactStruct;-><init>(I)V

    .line 825
    iput-object p1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    .line 826
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    .line 827
    iput-object p4, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    .line 828
    iput-object p5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    .line 829
    iput-object p1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    .line 830
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    .line 831
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    .line 832
    iput-object p12, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    .line 833
    iput-object p13, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    .line 834
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    .line 835
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    .line 836
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    .line 837
    return-void
.end method

.method private addEmail(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .parameter "type"
    .parameter "data"
    .parameter "label"
    .parameter "isPrimary"

    .prologue
    .line 1020
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1021
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    .line 1023
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    new-instance v1, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1024
    return-void
.end method

.method private addIm(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .parameter "type"
    .parameter "data"
    .parameter "label"
    .parameter "isPrimary"

    .prologue
    .line 1042
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mImList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1043
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mImList:Ljava/util/List;

    .line 1045
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mImList:Ljava/util/List;

    new-instance v1, Lcom/android/bluetooth/pbap/ContactStruct$ImData;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/android/bluetooth/pbap/ContactStruct$ImData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1046
    return-void
.end method

.method private addNickName(Ljava/lang/String;)V
    .locals 1
    .parameter "nickName"

    .prologue
    .line 1013
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1014
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    .line 1016
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1017
    return-void
.end method

.method private addNote(Ljava/lang/String;)V
    .locals 2
    .parameter "note"

    .prologue
    .line 1049
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1050
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    .line 1052
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1053
    return-void
.end method

.method private addOrganization(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .parameter "type"
    .parameter "companyName"
    .parameter "positionName"
    .parameter "isPrimary"

    .prologue
    .line 1035
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1036
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    .line 1038
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    new-instance v1, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1039
    return-void
.end method

.method private addPhone(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .parameter "type"
    .parameter "data"
    .parameter "label"
    .parameter "isPrimary"

    .prologue
    .line 993
    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    if-nez v6, :cond_0

    .line 994
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    .line 996
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 997
    .local v0, builder:Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 998
    .local v5, trimed:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 999
    .local v3, length:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v3, :cond_3

    .line 1000
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1001
    .local v1, ch:C
    invoke-static {v1}, Lcom/android/bluetooth/pbap/VCardUtils;->isAllowablePhoneNumberChar(C)Z

    move-result v6

    if-nez v6, :cond_1

    if-nez v2, :cond_2

    const/16 v6, 0x2b

    if-ne v1, v6, :cond_2

    .line 1002
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 999
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1006
    .end local v1           #ch:C
    :cond_3
    new-instance v4, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, p1, v6, p3, p4}, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1009
    .local v4, phoneData:Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1010
    return-void
.end method

.method private addPhotoBytes(Ljava/lang/String;[B)V
    .locals 3
    .parameter "formatName"
    .parameter "photoBytes"

    .prologue
    .line 1056
    iget-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    if-nez v1, :cond_0

    .line 1057
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    .line 1059
    :cond_0
    new-instance v0, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p2}, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;-><init>(ILjava/lang/String;[B)V

    .line 1060
    .local v0, photoData:Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;
    iget-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1061
    return-void
.end method

.method private addPostal(ILjava/util/List;Ljava/lang/String;Z)V
    .locals 2
    .parameter "type"
    .parameter
    .parameter "label"
    .parameter "isPrimary"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 1027
    .local p2, propValueList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1028
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    .line 1030
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    new-instance v1, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;-><init>(ILjava/util/List;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1031
    return-void
.end method

.method private constructDisplayName()V
    .locals 12

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1449
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 1450
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1452
    .local v0, builder:Ljava/lang/StringBuilder;
    iget v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mVCardType:I

    invoke-static {v5}, Lcom/android/bluetooth/pbap/VCardConfig;->getNameOrderType(I)I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 1468
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    aput-object v6, v5, v11

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 1472
    .local v3, nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    const/4 v1, 0x1

    .line 1473
    .local v1, first:Z
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1474
    .local v4, namePart:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1475
    if-eqz v1, :cond_3

    .line 1476
    const/4 v1, 0x0

    .line 1480
    :goto_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1454
    .end local v1           #first:Z
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v4           #namePart:Ljava/lang/String;
    :sswitch_0
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    invoke-static {v5}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    invoke-static {v5}, Lcom/android/bluetooth/pbap/VCardUtils;->containsOnlyPrintableAscii(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1456
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    aput-object v6, v5, v11

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .restart local v3       #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 1459
    .end local v3           #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    aput-object v6, v5, v11

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 1462
    .restart local v3       #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 1464
    .end local v3           #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :sswitch_1
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    aput-object v6, v5, v10

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    aput-object v6, v5, v11

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 1466
    .restart local v3       #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    goto/16 :goto_0

    .line 1478
    .restart local v1       #first:Z
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v4       #namePart:Ljava/lang/String;
    :cond_3
    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1483
    .end local v4           #namePart:Ljava/lang/String;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    .line 1498
    .end local v0           #builder:Ljava/lang/StringBuilder;
    .end local v1           #first:Z
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #nameList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    :goto_3
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    if-nez v5, :cond_6

    .line 1499
    const-string v5, ""

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    .line 1501
    :cond_6
    return-void

    .line 1484
    :cond_7
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 1485
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    goto :goto_3

    .line 1486
    :cond_8
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 1488
    :cond_9
    iget v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mVCardType:I

    iget-object v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    iget-object v7, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    iget-object v8, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    invoke-static {v5, v6, v7, v8}, Lcom/android/bluetooth/pbap/VCardUtils;->constructNameFromElements(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    goto :goto_3

    .line 1490
    :cond_a
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    if-eqz v5, :cond_b

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_b

    .line 1491
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    iget-object v5, v5, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    goto :goto_3

    .line 1492
    :cond_b
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    if-eqz v5, :cond_c

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_c

    .line 1493
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    iget-object v5, v5, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    goto :goto_3

    .line 1494
    :cond_c
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_5

    .line 1495
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    iget v6, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mVCardType:I

    invoke-virtual {v5, v6}, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->getFormattedAddress(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    goto/16 :goto_3

    .line 1452
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method private handleNProperty(Ljava/util/List;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, elems:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1090
    if-nez p1, :cond_1

    .line 1134
    :cond_0
    :goto_0
    return-void

    .line 1093
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 1094
    .local v0, size:I
    if-lt v0, v3, :cond_0

    .line 1098
    const/4 v1, 0x5

    if-le v0, v1, :cond_2

    .line 1099
    const/4 v0, 0x5

    .line 1102
    :cond_2
    packed-switch v0, :pswitch_data_0

    .line 1131
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1105
    :pswitch_0
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    .line 1106
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    .line 1107
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    .line 1108
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    .line 1109
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1113
    :pswitch_1
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    .line 1114
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    .line 1115
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    .line 1116
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1120
    :pswitch_2
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    .line 1121
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    .line 1122
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1126
    :pswitch_3
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    .line 1127
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    goto/16 :goto_0

    .line 1102
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handlePhoneticNameFromSound(Ljava/util/List;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, elems:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1147
    if-nez p1, :cond_1

    .line 1176
    :cond_0
    :goto_0
    return-void

    .line 1150
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 1151
    .local v0, size:I
    if-lt v0, v3, :cond_0

    .line 1155
    const/4 v1, 0x3

    if-le v0, v1, :cond_2

    .line 1156
    const/4 v0, 0x3

    .line 1159
    :cond_2
    packed-switch v0, :pswitch_data_0

    .line 1173
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1162
    :pswitch_0
    const/4 v1, 0x2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    .line 1163
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    .line 1164
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1168
    :pswitch_1
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    .line 1169
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    goto :goto_0

    .line 1159
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private listToString(Ljava/util/List;)Ljava/lang/String;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 1749
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 1750
    .local v3, size:I
    if-le v3, v5, :cond_2

    .line 1751
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1752
    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 1753
    .local v1, i:I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1754
    .local v4, type:Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1755
    add-int/lit8 v5, v3, -0x1

    if-ge v1, v5, :cond_0

    .line 1756
    const-string v5, ";"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1759
    .end local v4           #type:Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1763
    .end local v0           #builder:Ljava/lang/StringBuilder;
    .end local v1           #i:I
    .end local v2           #i$:Ljava/util/Iterator;
    :goto_1
    return-object v5

    .line 1760
    :cond_2
    if-ne v3, v5, :cond_3

    .line 1761
    const/4 v5, 0x0

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto :goto_1

    .line 1763
    :cond_3
    const-string v5, ""

    goto :goto_1
.end method

.method private setPosition(Ljava/lang/String;)V
    .locals 6
    .parameter "positionValue"

    .prologue
    .line 1073
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    if-nez v2, :cond_0

    .line 1074
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    .line 1076
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 1077
    .local v1, size:I
    if-nez v1, :cond_1

    .line 1078
    const/4 v2, 0x2

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/android/bluetooth/pbap/ContactStruct;->addOrganization(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1080
    const/4 v1, 0x1

    .line 1082
    :cond_1
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    .line 1083
    .local v0, lastData:Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;
    iput-object p1, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    .line 1084
    return-void
.end method


# virtual methods
.method public addProperty(Lcom/android/bluetooth/pbap/ContactStruct$Property;)V
    .locals 24
    .parameter "property"

    .prologue
    .line 1179
    #getter for: Lcom/android/bluetooth/pbap/ContactStruct$Property;->mPropertyName:Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/ContactStruct$Property;->access$000(Lcom/android/bluetooth/pbap/ContactStruct$Property;)Ljava/lang/String;

    move-result-object v12

    .line 1180
    .local v12, propName:Ljava/lang/String;
    #getter for: Lcom/android/bluetooth/pbap/ContactStruct$Property;->mParameterMap:Ljava/util/Map;
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/ContactStruct$Property;->access$100(Lcom/android/bluetooth/pbap/ContactStruct$Property;)Ljava/util/Map;

    move-result-object v9

    .line 1181
    .local v9, paramMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    #getter for: Lcom/android/bluetooth/pbap/ContactStruct$Property;->mPropertyValueList:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/ContactStruct$Property;->access$200(Lcom/android/bluetooth/pbap/ContactStruct$Property;)Ljava/util/List;

    move-result-object v14

    .line 1182
    .local v14, propValueList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    #getter for: Lcom/android/bluetooth/pbap/ContactStruct$Property;->mPropertyBytes:[B
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/ContactStruct$Property;->access$300(Lcom/android/bluetooth/pbap/ContactStruct$Property;)[B

    move-result-object v11

    .line 1184
    .local v11, propBytes:[B
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v21

    if-nez v21, :cond_1

    .line 1443
    :cond_0
    :goto_0
    return-void

    .line 1187
    :cond_1
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/bluetooth/pbap/ContactStruct;->listToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 1189
    .local v13, propValue:Ljava/lang/String;
    const-string v21, "VERSION"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 1190
    const-string v21, "vcard.ContactStruct"

    const-string v22, "addProperty,propName equals VERSION"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1192
    :cond_2
    const-string v21, "FN"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 1193
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    goto :goto_0

    .line 1194
    :cond_3
    const-string v21, "NAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    move-object/from16 v21, v0

    if-nez v21, :cond_4

    .line 1198
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    goto :goto_0

    .line 1199
    :cond_4
    const-string v21, "N"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 1200
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/bluetooth/pbap/ContactStruct;->handleNProperty(Ljava/util/List;)V

    goto :goto_0

    .line 1201
    :cond_5
    const-string v21, "SORT-STRING"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 1202
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFullName:Ljava/lang/String;

    goto :goto_0

    .line 1203
    :cond_6
    const-string v21, "NICKNAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_7

    const-string v21, "X-NICKNAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_8

    .line 1204
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/bluetooth/pbap/ContactStruct;->addNickName(Ljava/lang/String;)V

    goto :goto_0

    .line 1205
    :cond_8
    const-string v21, "SOUND"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 1206
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1207
    .local v16, typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_9

    const-string v21, "X-IRMC-N"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_9

    .line 1208
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/bluetooth/pbap/ContactStruct;->handlePhoneticNameFromSound(Ljava/util/List;)V

    goto/16 :goto_0

    .line 1210
    :cond_9
    const-string v21, "vcard.ContactStruct"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "addProperty,typeCollection is null,or typeCollection doesn\'t contains"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "X-IRMC-N"

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1214
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_a
    const-string v21, "ADR"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_16

    .line 1215
    const/16 v20, 0x1

    .line 1216
    .local v20, valuesAreAllEmpty:Z
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 1217
    .local v19, value:Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_b

    .line 1218
    const/16 v20, 0x0

    .line 1222
    .end local v19           #value:Ljava/lang/String;
    :cond_c
    if-nez v20, :cond_0

    .line 1226
    const/4 v15, -0x1

    .line 1227
    .local v15, type:I
    const-string v8, ""

    .line 1228
    .local v8, label:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1229
    .local v6, isPrimary:Z
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1230
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_14

    .line 1231
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_14

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 1232
    .local v18, typeString:Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v18

    .line 1233
    const-string v21, "PREF"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetAddress:Z

    move/from16 v21, v0

    if-nez v21, :cond_d

    .line 1235
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetAddress:Z

    .line 1236
    const/4 v6, 0x1

    goto :goto_1

    .line 1237
    :cond_d
    const-string v21, "HOME"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_e

    .line 1238
    const/4 v15, 0x1

    .line 1239
    const-string v8, ""

    goto :goto_1

    .line 1240
    :cond_e
    const-string v21, "WORK"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_f

    const-string v21, "COMPANY"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_10

    .line 1247
    :cond_f
    const/4 v15, 0x2

    .line 1248
    const-string v8, ""

    goto :goto_1

    .line 1249
    :cond_10
    const-string v21, "PARCEL"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_11

    const-string v21, "DOM"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_11

    const-string v21, "INTL"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_12

    .line 1251
    :cond_11
    const-string v21, "vcard.ContactStruct"

    const-string v22, "addProperty,typeString equals PARCEL or DOM or INTL"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1255
    :cond_12
    const-string v21, "X-"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_13

    if-gez v15, :cond_13

    .line 1256
    const/16 v21, 0x2

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 1262
    :cond_13
    const/4 v15, 0x0

    .line 1263
    move-object/from16 v8, v18

    goto/16 :goto_1

    .line 1268
    .end local v18           #typeString:Ljava/lang/String;
    :cond_14
    if-gez v15, :cond_15

    .line 1269
    const/4 v15, 0x1

    .line 1272
    :cond_15
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v14, v8, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addPostal(ILjava/util/List;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1273
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v6           #isPrimary:Z
    .end local v8           #label:Ljava/lang/String;
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v20           #valuesAreAllEmpty:Z
    :cond_16
    const-string v21, "EMAIL"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1e

    .line 1274
    const/4 v15, -0x1

    .line 1275
    .restart local v15       #type:I
    const/4 v8, 0x0

    .line 1276
    .restart local v8       #label:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1277
    .restart local v6       #isPrimary:Z
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1278
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_1c

    .line 1279
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5       #i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_1c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 1280
    .restart local v18       #typeString:Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v18

    .line 1281
    const-string v21, "PREF"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetEmail:Z

    move/from16 v21, v0

    if-nez v21, :cond_17

    .line 1283
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetEmail:Z

    .line 1284
    const/4 v6, 0x1

    goto :goto_2

    .line 1285
    :cond_17
    const-string v21, "HOME"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_18

    .line 1286
    const/4 v15, 0x1

    goto :goto_2

    .line 1287
    :cond_18
    const-string v21, "WORK"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_19

    .line 1288
    const/4 v15, 0x2

    goto :goto_2

    .line 1289
    :cond_19
    const-string v21, "CELL"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1a

    .line 1290
    const/4 v15, 0x4

    goto :goto_2

    .line 1292
    :cond_1a
    const-string v21, "X-"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_1b

    if-gez v15, :cond_1b

    .line 1293
    const/16 v21, 0x2

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 1298
    :cond_1b
    const/4 v15, 0x0

    .line 1299
    move-object/from16 v8, v18

    goto :goto_2

    .line 1303
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v18           #typeString:Ljava/lang/String;
    :cond_1c
    if-gez v15, :cond_1d

    .line 1304
    const/4 v15, 0x3

    .line 1306
    :cond_1d
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13, v8, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addEmail(ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1307
    .end local v6           #isPrimary:Z
    .end local v8           #label:Ljava/lang/String;
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_1e
    const-string v21, "ORG"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_23

    .line 1309
    const/4 v15, 0x1

    .line 1310
    .restart local v15       #type:I
    const/4 v6, 0x0

    .line 1312
    .restart local v6       #isPrimary:Z
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1313
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_20

    .line 1314
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5       #i$:Ljava/util/Iterator;
    :cond_1f
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_20

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 1315
    .restart local v18       #typeString:Ljava/lang/String;
    const-string v21, "PREF"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetOrganization:Z

    move/from16 v21, v0

    if-nez v21, :cond_1f

    .line 1319
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetOrganization:Z

    .line 1320
    const/4 v6, 0x1

    goto :goto_3

    .line 1325
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v18           #typeString:Ljava/lang/String;
    :cond_20
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1326
    .local v3, builder:Ljava/lang/StringBuilder;
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_21
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_22

    .line 1327
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1328
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_21

    .line 1329
    const/16 v21, 0x20

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 1332
    :cond_22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    const-string v22, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v15, v1, v2, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addOrganization(ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1333
    .end local v3           #builder:Ljava/lang/StringBuilder;
    .end local v6           #isPrimary:Z
    .end local v7           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_23
    const-string v21, "TITLE"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_24

    .line 1334
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/bluetooth/pbap/ContactStruct;->setPosition(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1335
    :cond_24
    const-string v21, "ROLE"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_25

    .line 1336
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/bluetooth/pbap/ContactStruct;->setPosition(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1337
    :cond_25
    const-string v21, "PHOTO"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_26

    const-string v21, "LOGO"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_29

    .line 1338
    :cond_26
    const/4 v4, 0x0

    .line 1339
    .local v4, formatName:Ljava/lang/String;
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1340
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_27

    .line 1341
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .end local v4           #formatName:Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 1343
    .restart local v4       #formatName:Ljava/lang/String;
    :cond_27
    const-string v21, "VALUE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Collection;

    .line 1344
    .local v10, paramMapValue:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v10, :cond_28

    const-string v21, "URL"

    move-object/from16 v0, v21

    invoke-interface {v10, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_28

    .line 1345
    const-string v21, "vcard.ContactStruct"

    const-string v22, "addProperty,paramMapValue is null, or paramMapValue doesn\'t contains URL"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1349
    :cond_28
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v11}, Lcom/android/bluetooth/pbap/ContactStruct;->addPhotoBytes(Ljava/lang/String;[B)V

    goto/16 :goto_0

    .line 1351
    .end local v4           #formatName:Ljava/lang/String;
    .end local v10           #paramMapValue:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_29
    const-string v21, "TEL"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2d

    .line 1352
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1353
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static/range {v16 .. v16}, Lcom/android/bluetooth/pbap/VCardUtils;->getPhoneTypeFromStrings(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v17

    .line 1356
    .local v17, typeObject:Ljava/lang/Object;
    move-object/from16 v0, v17

    instance-of v0, v0, Ljava/lang/Integer;

    move/from16 v21, v0

    if-eqz v21, :cond_2a

    .line 1357
    check-cast v17, Ljava/lang/Integer;

    .end local v17           #typeObject:Ljava/lang/Object;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 1358
    .restart local v15       #type:I
    const/4 v8, 0x0

    .line 1365
    .restart local v8       #label:Ljava/lang/String;
    :goto_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetPhone:Z

    move/from16 v21, v0

    if-nez v21, :cond_2c

    if-eqz v16, :cond_2c

    const-string v21, "PREF"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2c

    .line 1367
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetPhone:Z

    .line 1368
    const/4 v6, 0x1

    .line 1372
    .restart local v6       #isPrimary:Z
    :goto_6
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13, v8, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addPhone(ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1360
    .end local v6           #isPrimary:Z
    .end local v8           #label:Ljava/lang/String;
    .end local v15           #type:I
    .restart local v17       #typeObject:Ljava/lang/Object;
    :cond_2a
    const/4 v15, 0x0

    .line 1361
    .restart local v15       #type:I
    if-eqz v17, :cond_2b

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .restart local v8       #label:Ljava/lang/String;
    :goto_7
    goto :goto_5

    .end local v8           #label:Ljava/lang/String;
    :cond_2b
    const-string v8, ""

    goto :goto_7

    .line 1370
    .end local v17           #typeObject:Ljava/lang/Object;
    .restart local v8       #label:Ljava/lang/String;
    :cond_2c
    const/4 v6, 0x0

    .restart local v6       #isPrimary:Z
    goto :goto_6

    .line 1373
    .end local v6           #isPrimary:Z
    .end local v8           #label:Ljava/lang/String;
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_2d
    const-string v21, "X-SKYPE-PSTNNUMBER"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2f

    .line 1375
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1378
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v15, 0x7

    .line 1379
    .restart local v15       #type:I
    const/4 v8, 0x0

    .line 1381
    .restart local v8       #label:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetPhone:Z

    move/from16 v21, v0

    if-nez v21, :cond_2e

    if-eqz v16, :cond_2e

    const-string v21, "PREF"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2e

    .line 1383
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetPhone:Z

    .line 1384
    const/4 v6, 0x1

    .line 1388
    .restart local v6       #isPrimary:Z
    :goto_8
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13, v8, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addPhone(ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1386
    .end local v6           #isPrimary:Z
    :cond_2e
    const/4 v6, 0x0

    .restart local v6       #isPrimary:Z
    goto :goto_8

    .line 1389
    .end local v6           #isPrimary:Z
    .end local v8           #label:Ljava/lang/String;
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_2f
    sget-object v21, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    move-object/from16 v0, v21

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_35

    .line 1390
    sget-object v21, Lcom/android/bluetooth/pbap/ContactStruct;->IM_MAP:Ljava/util/Map;

    move-object/from16 v0, v21

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 1391
    .restart local v15       #type:I
    const/4 v6, 0x0

    .line 1392
    .restart local v6       #isPrimary:Z
    const-string v21, "TYPE"

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Collection;

    .line 1393
    .restart local v16       #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v16, :cond_33

    .line 1394
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5       #i$:Ljava/util/Iterator;
    :cond_30
    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_33

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 1395
    .restart local v18       #typeString:Ljava/lang/String;
    const-string v21, "PREF"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_31

    .line 1396
    const/4 v6, 0x1

    goto :goto_9

    .line 1397
    :cond_31
    const-string v21, "HOME"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_32

    .line 1398
    const/4 v15, 0x1

    goto :goto_9

    .line 1399
    :cond_32
    const-string v21, "WORK"

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_30

    .line 1400
    const/4 v15, 0x3

    goto :goto_9

    .line 1404
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v18           #typeString:Ljava/lang/String;
    :cond_33
    if-gez v15, :cond_34

    .line 1405
    const/4 v15, 0x1

    .line 1407
    :cond_34
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v15, v13, v1, v6}, Lcom/android/bluetooth/pbap/ContactStruct;->addIm(ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1408
    .end local v6           #isPrimary:Z
    .end local v15           #type:I
    .end local v16           #typeCollection:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_35
    const-string v21, "NOTE"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_36

    .line 1409
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/bluetooth/pbap/ContactStruct;->addNote(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1410
    :cond_36
    const-string v21, "URL"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_38

    .line 1411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    move-object/from16 v21, v0

    if-nez v21, :cond_37

    .line 1412
    new-instance v21, Ljava/util/ArrayList;

    const/16 v22, 0x1

    invoke-direct/range {v21 .. v22}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    .line 1414
    :cond_37
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1415
    :cond_38
    const-string v21, "X-PHONETIC-FIRST-NAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_39

    .line 1416
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    goto/16 :goto_0

    .line 1417
    :cond_39
    const-string v21, "X-PHONETIC-MIDDLE-NAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3a

    .line 1418
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    goto/16 :goto_0

    .line 1419
    :cond_3a
    const-string v21, "X-PHONETIC-LAST-NAME"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3b

    .line 1420
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    goto/16 :goto_0

    .line 1421
    :cond_3b
    const-string v21, "BDAY"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3c

    .line 1422
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mBirthday:Ljava/lang/String;

    goto/16 :goto_0

    .line 1440
    :cond_3c
    const-string v21, "vcard.ContactStruct"

    const-string v22, "addProperty,propName is unknown"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public consolidateFields()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1507
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/ContactStruct;->constructDisplayName()V

    .line 1509
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFullName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1510
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFullName:Ljava/lang/String;

    .line 1514
    :cond_0
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetPhone:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 1515
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    iput-boolean v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    .line 1518
    :cond_1
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetAddress:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 1519
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    iput-boolean v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    .line 1521
    :cond_2
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetEmail:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 1522
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    iput-boolean v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    .line 1524
    :cond_3
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefIsSetOrganization:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 1525
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    iput-boolean v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    .line 1527
    :cond_4
    return-void
.end method

.method public getBirthday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 940
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mBirthday:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 930
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 931
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/ContactStruct;->constructDisplayName()V

    .line 933
    :cond_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mDisplayName:Ljava/lang/String;

    return-object v0
.end method

.method public final getEmailList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$EmailData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 968
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    return-object v0
.end method

.method public getFamilyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 853
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    return-object v0
.end method

.method public getFullName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mFullName:Ljava/lang/String;

    return-object v0
.end method

.method public getGivenName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 860
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    return-object v0
.end method

.method public getMiddleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 867
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    return-object v0
.end method

.method public final getNickNameList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 923
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    return-object v0
.end method

.method public final getNotes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 954
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    return-object v0
.end method

.method public final getOrganizationList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 982
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    return-object v0
.end method

.method public final getPhoneList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 961
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    return-object v0
.end method

.method public getPhoneticFamilyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 895
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneticFullName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 916
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFullName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneticGivenName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 902
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneticMiddleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 909
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    return-object v0
.end method

.method public final getPhotoList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 947
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    return-object v0
.end method

.method public final getPostalList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/bluetooth/pbap/ContactStruct$PostalData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 975
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 874
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 881
    iget-object v0, p0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    return-object v0
.end method

.method public isIgnorable()Z
    .locals 1

    .prologue
    .line 1745
    invoke-virtual {p0}, Lcom/android/bluetooth/pbap/ContactStruct;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pushIntoContentResolver(Landroid/content/ContentResolver;)V
    .locals 24
    .parameter "resolver"

    .prologue
    .line 1535
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 1536
    .local v18, operationList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v2, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1538
    .local v8, builder:Landroid/content/ContentProviderOperation$Builder;
    const/4 v15, 0x0

    .line 1539
    .local v15, myGroupsId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mAccount:Landroid/accounts/Account;

    if-eqz v2, :cond_4

    .line 1540
    const-string v2, "account_name"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mAccount:Landroid/accounts/Account;

    iget-object v3, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1541
    const-string v2, "account_type"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mAccount:Landroid/accounts/Account;

    iget-object v3, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1546
    const-string v2, "com.google"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mAccount:Landroid/accounts/Account;

    iget-object v3, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1547
    sget-object v3, Landroid/provider/ContactsContract$Groups;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v5, "sourceid"

    aput-object v5, v4, v2

    const-string v5, "title=?"

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v7, "System Group: My Contacts"

    aput-object v7, v6, v2

    const/4 v7, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1553
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_0

    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1554
    const/4 v2, 0x0

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v15

    .line 1557
    :cond_0
    if-eqz v9, :cond_1

    .line 1558
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 1566
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_1
    :goto_0
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1568
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1569
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1570
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/name"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1571
    const-string v2, "data2"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mGivenName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1572
    const-string v2, "data3"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mFamilyName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1573
    const-string v2, "data5"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mMiddleName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1574
    const-string v2, "data4"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPrefix:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1575
    const-string v2, "data6"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mSuffix:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1576
    const-string v2, "data7"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticGivenName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1577
    const-string v2, "data9"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticFamilyName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1578
    const-string v2, "data8"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneticMiddleName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1579
    const-string v2, "data1"

    invoke-virtual/range {p0 .. p0}, Lcom/android/bluetooth/pbap/ContactStruct;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1580
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1582
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    if-eqz v2, :cond_5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 1583
    const/4 v12, 0x1

    .line 1584
    .local v12, first:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mNickNameList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 1585
    .local v16, nickName:Ljava/lang/String;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1586
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1587
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/nickname"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1589
    const-string v2, "data2"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1590
    const-string v2, "data1"

    move-object/from16 v0, v16

    invoke-virtual {v8, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1591
    if-eqz v12, :cond_2

    .line 1592
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1593
    const/4 v12, 0x0

    .line 1595
    :cond_2
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1557
    .end local v12           #first:Z
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v16           #nickName:Ljava/lang/String;
    .restart local v9       #cursor:Landroid/database/Cursor;
    :catchall_0
    move-exception v2

    if-eqz v9, :cond_3

    .line 1558
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v2

    .line 1563
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_4
    const-string v2, "account_name"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1564
    const-string v2, "account_type"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    goto/16 :goto_0

    .line 1599
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    if-eqz v2, :cond_8

    .line 1600
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhoneList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    .line 1601
    .local v20, phoneData:Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1602
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1603
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1605
    const-string v2, "data2"

    move-object/from16 v0, v20

    iget v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1606
    move-object/from16 v0, v20

    iget v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    if-nez v2, :cond_6

    .line 1607
    const-string v2, "data3"

    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1609
    :cond_6
    const-string v2, "data1"

    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1610
    move-object/from16 v0, v20

    iget-boolean v2, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    if-eqz v2, :cond_7

    .line 1611
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1613
    :cond_7
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1617
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v20           #phoneData:Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    if-eqz v2, :cond_a

    .line 1618
    const/4 v12, 0x1

    .line 1619
    .restart local v12       #first:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mOrganizationList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    .line 1620
    .local v19, organizationData:Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1621
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1622
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/organization"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1625
    const-string v2, "data2"

    move-object/from16 v0, v19

    iget v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1626
    const-string v2, "data1"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1627
    const-string v2, "data4"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1628
    if-eqz v12, :cond_9

    .line 1629
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1631
    :cond_9
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1635
    .end local v12           #first:Z
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v19           #organizationData:Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    if-eqz v2, :cond_d

    .line 1636
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mEmailList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    .line 1637
    .local v11, emailData:Lcom/android/bluetooth/pbap/ContactStruct$EmailData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1638
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1639
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1641
    const-string v2, "data2"

    iget v3, v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1642
    iget v2, v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    if-nez v2, :cond_b

    .line 1643
    const-string v2, "data3"

    iget-object v3, v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1645
    :cond_b
    const-string v2, "data1"

    iget-object v3, v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1646
    iget-boolean v2, v11, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    if-eqz v2, :cond_c

    .line 1647
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1649
    :cond_c
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1653
    .end local v11           #emailData:Lcom/android/bluetooth/pbap/ContactStruct$EmailData;
    .end local v13           #i$:Ljava/util/Iterator;
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    if-eqz v2, :cond_e

    .line 1654
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPostalList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    .line 1655
    .local v22, postalData:Lcom/android/bluetooth/pbap/ContactStruct$PostalData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1656
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mVCardType:I

    move-object/from16 v0, v22

    invoke-static {v2, v8, v0}, Lcom/android/bluetooth/pbap/VCardUtils;->insertStructuredPostalDataUsingContactsStruct(ILandroid/content/ContentProviderOperation$Builder;Lcom/android/bluetooth/pbap/ContactStruct$PostalData;)V

    .line 1658
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 1662
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v22           #postalData:Lcom/android/bluetooth/pbap/ContactStruct$PostalData;
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mImList:Ljava/util/List;

    if-eqz v2, :cond_11

    .line 1663
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mImList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :cond_f
    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;

    .line 1664
    .local v14, imData:Lcom/android/bluetooth/pbap/ContactStruct$ImData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1665
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1666
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/im"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1668
    const-string v2, "data2"

    iget v3, v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1669
    iget v2, v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    if-nez v2, :cond_10

    .line 1670
    const-string v2, "data3"

    iget-object v3, v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1672
    :cond_10
    const-string v2, "data1"

    iget-object v3, v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1673
    iget-boolean v2, v14, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    if-eqz v2, :cond_f

    .line 1674
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    goto :goto_6

    .line 1679
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #imData:Lcom/android/bluetooth/pbap/ContactStruct$ImData;
    :cond_11
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    if-eqz v2, :cond_12

    .line 1680
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mNoteList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 1681
    .local v17, note:Ljava/lang/String;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1682
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1683
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/note"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1685
    const-string v2, "data1"

    move-object/from16 v0, v17

    invoke-virtual {v8, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1686
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 1690
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v17           #note:Ljava/lang/String;
    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    if-eqz v2, :cond_14

    .line 1691
    const/4 v12, 0x1

    .line 1692
    .restart local v12       #first:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mPhotoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_8
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;

    .line 1693
    .local v21, photoData:Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1694
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1695
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/photo"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1696
    const-string v2, "data15"

    move-object/from16 v0, v21

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;->photoBytes:[B

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1697
    if-eqz v12, :cond_13

    .line 1698
    const-string v2, "is_primary"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1699
    const/4 v12, 0x0

    .line 1701
    :cond_13
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 1705
    .end local v12           #first:Z
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v21           #photoData:Lcom/android/bluetooth/pbap/ContactStruct$PhotoData;
    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    if-eqz v2, :cond_15

    .line 1706
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mWebsiteList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/String;

    .line 1707
    .local v23, website:Ljava/lang/String;
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1708
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1709
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/website"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1710
    const-string v2, "data1"

    move-object/from16 v0, v23

    invoke-virtual {v8, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1713
    const-string v2, "data2"

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1714
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1718
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v23           #website:Ljava/lang/String;
    :cond_15
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mBirthday:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_16

    .line 1719
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1720
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1721
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/contact_event"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1722
    const-string v2, "data1"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct;->mBirthday:Ljava/lang/String;

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1723
    const-string v2, "data2"

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1724
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1727
    :cond_16
    if-eqz v15, :cond_17

    .line 1728
    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v8

    .line 1729
    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1730
    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/group_membership"

    invoke-virtual {v8, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1731
    const-string v2, "group_sourceid"

    invoke-virtual {v8, v2, v15}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1732
    invoke-virtual {v8}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1736
    :cond_17
    :try_start_1
    const-string v2, "com.android.contacts"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/OperationApplicationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1742
    :goto_a
    return-void

    .line 1737
    :catch_0
    move-exception v10

    .line 1738
    .local v10, e:Landroid/os/RemoteException;
    const-string v2, "vcard.ContactStruct"

    const-string v3, "%s: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v10}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v10}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 1739
    .end local v10           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v10

    .line 1740
    .local v10, e:Landroid/content/OperationApplicationException;
    const-string v2, "vcard.ContactStruct"

    const-string v3, "%s: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v10}, Landroid/content/OperationApplicationException;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v10}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method
