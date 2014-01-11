// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardConfig, VCardBuilder, VCardPhoneNumberTranslationCallback

public class VCardComposer
{

    private static final boolean DEBUG = false;
    public static final String FAILURE_REASON_FAILED_TO_GET_DATABASE_INFO = "Failed to get database information";
    public static final String FAILURE_REASON_NOT_INITIALIZED = "The vCard composer object is not correctly initialized";
    public static final String FAILURE_REASON_NO_ENTRY = "There's no exportable in the database";
    public static final String FAILURE_REASON_UNSUPPORTED_URI = "The Uri vCard composer received is not supported by the composer.";
    private static final String LOG_TAG = "VCardComposer";
    public static final String NO_ERROR = "No error";
    private static final String SHIFT_JIS = "SHIFT_JIS";
    private static final String UTF_8 = "UTF-8";
    private static final String sContactsProjection[] = {
        "_id"
    };
    private static final Map sImMap;
    private final String mCharset;
    private final ContentResolver mContentResolver;
    private Uri mContentUriForRawContactsEntity;
    private Cursor mCursor;
    private boolean mCursorSuppliedFromOutside;
    private String mErrorReason;
    private boolean mFirstVCardEmittedInDoCoMoCase;
    private int mIdColumn;
    private boolean mInitDone;
    private final boolean mIsDoCoMo;
    private VCardPhoneNumberTranslationCallback mPhoneTranslationCallback;
    private boolean mTerminateCalled;
    private final int mVCardType;

    public VCardComposer(Context context)
    {
        this(context, VCardConfig.VCARD_TYPE_DEFAULT, null, true);
    }

    public VCardComposer(Context context, int i)
    {
        this(context, i, null, true);
    }

    public VCardComposer(Context context, int i, String s)
    {
        this(context, i, s, true);
    }

    public VCardComposer(Context context, int i, String s, boolean flag)
    {
        this(context, context.getContentResolver(), i, s, flag);
    }

    public VCardComposer(Context context, int i, boolean flag)
    {
        this(context, i, null, flag);
    }

    public VCardComposer(Context context, ContentResolver contentresolver, int i, String s, boolean flag)
    {
        boolean flag1 = true;
        super();
        mErrorReason = "No error";
        mTerminateCalled = flag1;
        mVCardType = i;
        mContentResolver = contentresolver;
        mIsDoCoMo = VCardConfig.isDoCoMo(i);
        if (TextUtils.isEmpty(s))
            s = "UTF-8";
        if (VCardConfig.isVersion30(i) && "UTF-8".equalsIgnoreCase(s))
            flag1 = false;
        if (!mIsDoCoMo && !flag1)
        {
            if (TextUtils.isEmpty(s))
                mCharset = "UTF-8";
            else
                mCharset = s;
        } else
        if ("SHIFT_JIS".equalsIgnoreCase(s))
            mCharset = s;
        else
        if (TextUtils.isEmpty(s))
            mCharset = "SHIFT_JIS";
        else
            mCharset = s;
        Log.d("VCardComposer", (new StringBuilder()).append("Use the charset \"").append(mCharset).append("\"").toString());
    }

    private void closeCursorIfAppropriate()
    {
        if (!mCursorSuppliedFromOutside && mCursor != null)
        {
            try
            {
                mCursor.close();
            }
            catch (SQLiteException sqliteexception)
            {
                Log.e("VCardComposer", (new StringBuilder()).append("SQLiteException on Cursor#close(): ").append(sqliteexception.getMessage()).toString());
            }
            mCursor = null;
        }
    }

    private String createOneEntryInternal(String s, Method method)
    {
        HashMap hashmap;
        EntityIterator entityiterator;
        hashmap = new HashMap();
        entityiterator = null;
        Uri uri;
        String as[];
        uri = mContentUriForRawContactsEntity;
        as = (new String[] {
            s
        });
        if (method == null) goto _L2; else goto _L1
_L1:
        Object aobj[] = new Object[5];
        aobj[0] = mContentResolver;
        aobj[1] = uri;
        aobj[2] = "contact_id=?";
        aobj[3] = as;
        aobj[4] = null;
        entityiterator = (EntityIterator)method.invoke(null, aobj);
_L12:
        if (entityiterator != null) goto _L4; else goto _L3
_L3:
        Log.e("VCardComposer", "EntityIterator is null");
        String s2;
        s2 = "";
        if (entityiterator != null)
            entityiterator.close();
_L6:
        return s2;
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        Log.e("VCardComposer", (new StringBuilder()).append("IllegalArgumentException has been thrown: ").append(illegalargumentexception.getMessage()).toString());
        entityiterator = null;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if (entityiterator != null)
            entityiterator.close();
        throw exception;
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        Log.e("VCardComposer", (new StringBuilder()).append("IllegalAccessException has been thrown: ").append(illegalaccessexception.getMessage()).toString());
        entityiterator = null;
        continue; /* Loop/switch isn't completed */
        InvocationTargetException invocationtargetexception;
        invocationtargetexception;
        Log.e("VCardComposer", "InvocationTargetException has been thrown: ", invocationtargetexception);
        throw new RuntimeException("InvocationTargetException has been thrown");
_L2:
        entityiterator = android.provider.ContactsContract.RawContacts.newEntityIterator(mContentResolver.query(uri, null, "contact_id=?", as, null));
        continue; /* Loop/switch isn't completed */
_L4:
        if (entityiterator.hasNext())
            break MISSING_BLOCK_LABEL_302;
        Log.w("VCardComposer", (new StringBuilder()).append("Data does not exist. contactId: ").append(s).toString());
        s2 = "";
        if (entityiterator == null) goto _L6; else goto _L5
_L5:
        entityiterator.close();
        return s2;
        long l = getNameRawContactId(mContentResolver, "_id=?", as);
_L10:
        Entity entity;
        Iterator iterator;
        if (!entityiterator.hasNext())
            break MISSING_BLOCK_LABEL_539;
        entity = (Entity)entityiterator.next();
        iterator = entity.getSubValues().iterator();
_L8:
        ContentValues contentvalues;
        String s1;
        if (!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        contentvalues = ((android.content.Entity.NamedContentValues)iterator.next()).values;
        s1 = contentvalues.getAsString("mimetype");
        if (s1 == null)
            continue; /* Loop/switch isn't completed */
        Object obj = (List)hashmap.get(s1);
        if (obj != null)
            break MISSING_BLOCK_LABEL_426;
        obj = new ArrayList();
        hashmap.put(s1, obj);
        if (!s1.equals("vnd.android.cursor.item/name"))
            break MISSING_BLOCK_LABEL_476;
        if (!s1.equals("vnd.android.cursor.item/name"))
            continue; /* Loop/switch isn't completed */
        if (l == -1L)
            break MISSING_BLOCK_LABEL_476;
        if (l != entity.getEntityValues().getAsLong("_id").longValue())
            continue; /* Loop/switch isn't completed */
        if (isAasEnabled(entity.getEntityValues().getAsString("account_type")) && "vnd.android.cursor.item/phone_v2".equals(s1))
        {
            contentvalues.put("data2", Integer.valueOf(2));
            Log.i("VCardComposer", "AAS: set phone type to be Mobile.");
        }
        ((List) (obj)).add(contentvalues);
        if (true) goto _L8; else goto _L7
_L7:
        if (true) goto _L10; else goto _L9
_L9:
        if (entityiterator != null)
            entityiterator.close();
        return buildVCard(hashmap);
        if (true) goto _L12; else goto _L11
_L11:
    }

    private long getNameRawContactId(ContentResolver contentresolver, String s, String as[])
    {
        long l;
        Cursor cursor;
        l = -1L;
        cursor = null;
        cursor = mContentResolver.query(android.provider.ContactsContract.Contacts.CONTENT_URI, new String[] {
            "name_raw_contact_id"
        }, s, as, null);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_62;
        long l1;
        if (!cursor.moveToNext())
            break MISSING_BLOCK_LABEL_62;
        l1 = cursor.getLong(0);
        l = l1;
        if (cursor != null)
            cursor.close();
        return l;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    private boolean initInterCursorCreationPart(Uri uri, String as[], String s, String as1[], String s1)
    {
        mCursorSuppliedFromOutside = false;
        mCursor = mContentResolver.query(uri, as, s, as1, s1);
        if (mCursor == null)
        {
            Log.e("VCardComposer", String.format("Cursor became null unexpectedly", new Object[0]));
            mErrorReason = "Failed to get database information";
            return false;
        } else
        {
            return true;
        }
    }

    private boolean initInterFirstPart(Uri uri)
    {
        if (uri == null)
            uri = android.provider.ContactsContract.RawContactsEntity.CONTENT_URI;
        mContentUriForRawContactsEntity = uri;
        if (mInitDone)
        {
            Log.e("VCardComposer", "init() is already called");
            return false;
        } else
        {
            return true;
        }
    }

    private boolean initInterLastPart()
    {
        mInitDone = true;
        mTerminateCalled = false;
        return true;
    }

    private boolean initInterMainPart()
    {
        if (mCursor.getCount() != 0 && mCursor.moveToFirst())
        {
            mIdColumn = mCursor.getColumnIndex("_id");
            if (mIdColumn >= 0)
                return true;
        } else
        {
            closeCursorIfAppropriate();
        }
        return false;
    }

    private boolean isAasEnabled(String s)
    {
        return "OP03".equals(SystemProperties.get("ro.operator.optr")) && "USIM Account".equals(s);
    }

    public String buildVCard(Map map)
    {
        if (map == null)
        {
            Log.e("VCardComposer", "The given map is null. Ignore and return empty String");
            return "";
        }
        VCardBuilder vcardbuilder = new VCardBuilder(mVCardType, mCharset);
        vcardbuilder.appendNameProperties((List)map.get("vnd.android.cursor.item/name")).appendNickNames((List)map.get("vnd.android.cursor.item/nickname")).appendPhones((List)map.get("vnd.android.cursor.item/phone_v2"), mPhoneTranslationCallback).appendEmails((List)map.get("vnd.android.cursor.item/email_v2")).appendPostals((List)map.get("vnd.android.cursor.item/postal-address_v2")).appendOrganizations((List)map.get("vnd.android.cursor.item/organization")).appendWebsites((List)map.get("vnd.android.cursor.item/website"));
        if ((0x800000 & mVCardType) == 0)
            vcardbuilder.appendPhotos((List)map.get("vnd.android.cursor.item/photo"));
        vcardbuilder.appendNotes((List)map.get("vnd.android.cursor.item/note")).appendEvents((List)map.get("vnd.android.cursor.item/contact_event")).appendIms((List)map.get("vnd.android.cursor.item/im")).appendSipAddresses((List)map.get("vnd.android.cursor.item/sip_address")).appendRelation((List)map.get("vnd.android.cursor.item/relation"));
        return vcardbuilder.toString();
    }

    public String createOneEntry()
    {
        return createOneEntry(null);
    }

    public String createOneEntry(Method method)
    {
        if (mIsDoCoMo && !mFirstVCardEmittedInDoCoMoCase)
            mFirstVCardEmittedInDoCoMoCase = true;
        String s = createOneEntryInternal(mCursor.getString(mIdColumn), method);
        if (!mCursor.moveToNext())
            Log.e("VCardComposer", "Cursor#moveToNext() returned false");
        return s;
    }

    protected void finalize()
        throws Throwable
    {
        if (!mTerminateCalled)
            Log.e("VCardComposer", "finalized() is called before terminate() being called");
        super.finalize();
        return;
        Exception exception;
        exception;
        super.finalize();
        throw exception;
    }

    public int getCount()
    {
        if (mCursor == null)
        {
            Log.w("VCardComposer", "This object is not ready yet.");
            return 0;
        } else
        {
            return mCursor.getCount();
        }
    }

    public String getErrorReason()
    {
        return mErrorReason;
    }

    public boolean init()
    {
        return init(null, null);
    }

    public boolean init(Cursor cursor)
    {
        if (initInterFirstPart(null))
        {
            mCursorSuppliedFromOutside = true;
            mCursor = cursor;
            if (initInterMainPart())
                return initInterLastPart();
        }
        return false;
    }

    public boolean init(Uri uri, String s, String as[], String s1)
    {
        return init(uri, sContactsProjection, s, as, s1, null);
    }

    public boolean init(Uri uri, String s, String as[], String s1, Uri uri1)
    {
        return init(uri, sContactsProjection, s, as, s1, uri1);
    }

    public boolean init(Uri uri, String as[], String s, String as1[], String s1, Uri uri1)
    {
        if (!"com.android.contacts".equals(uri.getAuthority()))
            mErrorReason = "The Uri vCard composer received is not supported by the composer.";
        else
        if (initInterFirstPart(uri1) && initInterCursorCreationPart(uri, as, s, as1, s1) && initInterMainPart())
            return initInterLastPart();
        return false;
    }

    public boolean init(String s, String as[])
    {
        return init(android.provider.ContactsContract.Contacts.CONTENT_URI, sContactsProjection, s, as, null, null);
    }

    public boolean initWithRawContactsEntityUri(Uri uri)
    {
        return init(android.provider.ContactsContract.Contacts.CONTENT_URI, sContactsProjection, null, null, null, uri);
    }

    public boolean isAfterLast()
    {
        if (mCursor == null)
        {
            Log.w("VCardComposer", "This object is not ready yet.");
            return false;
        } else
        {
            return mCursor.isAfterLast();
        }
    }

    public void setPhoneNumberTranslationCallback(VCardPhoneNumberTranslationCallback vcardphonenumbertranslationcallback)
    {
        mPhoneTranslationCallback = vcardphonenumbertranslationcallback;
    }

    public void terminate()
    {
        closeCursorIfAppropriate();
        mTerminateCalled = true;
    }

    static 
    {
        sImMap = new HashMap();
        sImMap.put(Integer.valueOf(0), "X-AIM");
        sImMap.put(Integer.valueOf(1), "X-MSN");
        sImMap.put(Integer.valueOf(2), "X-YAHOO");
        sImMap.put(Integer.valueOf(6), "X-ICQ");
        sImMap.put(Integer.valueOf(7), "X-JABBER");
        sImMap.put(Integer.valueOf(3), "X-SKYPE-USERNAME");
    }
}
