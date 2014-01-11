// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            ImageView

public class QuickContactBadge extends ImageView
    implements android.view.View.OnClickListener
{
    private class QueryHandler extends AsyncQueryHandler
    {

        final QuickContactBadge this$0;

        protected void onQueryComplete(int i, Object obj, Cursor cursor)
        {
            Uri uri;
            Uri uri1;
            boolean flag;
            uri = null;
            uri1 = null;
            flag = false;
            i;
            JVM INSTR tableswitch 0 3: default 40
        //                       0 177
        //                       1 117
        //                       2 162
        //                       3 102;
               goto _L1 _L2 _L3 _L4 _L5
_L1:
            if (cursor != null)
                cursor.close();
            mContactUri = uri;
            onContactUriChanged();
            if (!flag || uri == null) goto _L7; else goto _L6
_L6:
            android.provider.ContactsContract.QuickContact.showQuickContact(getContext(), QuickContactBadge.this, uri, 3, mExcludeMimes);
_L9:
            return;
_L5:
            flag = true;
            uri1 = Uri.fromParts("tel", (String)obj, null);
_L3:
            uri = null;
            if (cursor == null)
                continue; /* Loop/switch isn't completed */
            boolean flag2 = cursor.moveToFirst();
            uri = null;
            if (!flag2)
                continue; /* Loop/switch isn't completed */
            uri = android.provider.ContactsContract.Contacts.getLookupUri(cursor.getLong(0), cursor.getString(1));
            continue; /* Loop/switch isn't completed */
_L4:
            flag = true;
            uri1 = Uri.fromParts("mailto", (String)obj, null);
_L2:
            uri = null;
            if (cursor == null)
                continue; /* Loop/switch isn't completed */
            boolean flag1 = cursor.moveToFirst();
            uri = null;
            if (!flag1)
                continue; /* Loop/switch isn't completed */
            Uri uri2 = android.provider.ContactsContract.Contacts.getLookupUri(cursor.getLong(0), cursor.getString(1));
            uri = uri2;
            continue; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
_L7:
            if (uri1 == null) goto _L9; else goto _L8
_L8:
            try
            {
                Intent intent = new Intent("com.android.contacts.action.SHOW_OR_CREATE_CONTACT", uri1);
                getContext().startActivity(intent);
                return;
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                return;
            }
            if (true) goto _L1; else goto _L10
_L10:
        }

        public QueryHandler(ContentResolver contentresolver)
        {
            this$0 = QuickContactBadge.this;
            super(contentresolver);
        }
    }


    static final int EMAIL_ID_COLUMN_INDEX = 0;
    static final String EMAIL_LOOKUP_PROJECTION[] = {
        "contact_id", "lookup"
    };
    static final int EMAIL_LOOKUP_STRING_COLUMN_INDEX = 1;
    static final int PHONE_ID_COLUMN_INDEX = 0;
    static final String PHONE_LOOKUP_PROJECTION[] = {
        "_id", "lookup"
    };
    static final int PHONE_LOOKUP_STRING_COLUMN_INDEX = 1;
    private static final int TOKEN_EMAIL_LOOKUP = 0;
    private static final int TOKEN_EMAIL_LOOKUP_AND_TRIGGER = 2;
    private static final int TOKEN_PHONE_LOOKUP = 1;
    private static final int TOKEN_PHONE_LOOKUP_AND_TRIGGER = 3;
    private String mContactEmail;
    private String mContactPhone;
    private Uri mContactUri;
    private Drawable mDefaultAvatar;
    protected String mExcludeMimes[];
    private Drawable mOverlay;
    private QueryHandler mQueryHandler;

    public QuickContactBadge(Context context)
    {
        this(context, null);
    }

    public QuickContactBadge(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public QuickContactBadge(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mExcludeMimes = null;
        TypedArray typedarray = super.mContext.obtainStyledAttributes(com.android.internal.R.styleable.Theme);
        mOverlay = typedarray.getDrawable(233);
        typedarray.recycle();
        mQueryHandler = new QueryHandler(super.mContext.getContentResolver());
        setOnClickListener(this);
    }

    private boolean isAssigned()
    {
        return mContactUri != null || mContactEmail != null || mContactPhone != null;
    }

    private void onContactUriChanged()
    {
        setEnabled(isAssigned());
    }

    public void assignContactFromEmail(String s, boolean flag)
    {
        mContactEmail = s;
        if (!flag)
        {
            mQueryHandler.startQuery(0, null, Uri.withAppendedPath(android.provider.ContactsContract.CommonDataKinds.Email.CONTENT_LOOKUP_URI, Uri.encode(mContactEmail)), EMAIL_LOOKUP_PROJECTION, null, null, null);
            return;
        } else
        {
            mContactUri = null;
            onContactUriChanged();
            return;
        }
    }

    public void assignContactFromPhone(String s, boolean flag)
    {
        mContactPhone = s;
        if (!flag)
        {
            mQueryHandler.startQuery(1, null, Uri.withAppendedPath(android.provider.ContactsContract.PhoneLookup.CONTENT_FILTER_URI, mContactPhone), PHONE_LOOKUP_PROJECTION, null, null, null);
            return;
        } else
        {
            mContactUri = null;
            onContactUriChanged();
            return;
        }
    }

    public void assignContactUri(Uri uri)
    {
        mContactUri = uri;
        mContactEmail = null;
        mContactPhone = null;
        onContactUriChanged();
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mOverlay != null && mOverlay.isStateful())
        {
            mOverlay.setState(getDrawableState());
            invalidate();
        }
    }

    public void onClick(View view)
    {
        if (mContactUri != null)
        {
            android.provider.ContactsContract.QuickContact.showQuickContact(getContext(), this, mContactUri, 3, mExcludeMimes);
        } else
        {
            if (mContactEmail != null)
            {
                mQueryHandler.startQuery(2, mContactEmail, Uri.withAppendedPath(android.provider.ContactsContract.CommonDataKinds.Email.CONTENT_LOOKUP_URI, Uri.encode(mContactEmail)), EMAIL_LOOKUP_PROJECTION, null, null, null);
                return;
            }
            if (mContactPhone != null)
            {
                mQueryHandler.startQuery(3, mContactPhone, Uri.withAppendedPath(android.provider.ContactsContract.PhoneLookup.CONTENT_FILTER_URI, mContactPhone), PHONE_LOOKUP_PROJECTION, null, null, null);
                return;
            }
        }
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        if (isEnabled() && mOverlay != null && mOverlay.getIntrinsicWidth() != 0 && mOverlay.getIntrinsicHeight() != 0)
        {
            mOverlay.setBounds(0, 0, getWidth(), getHeight());
            if (super.mPaddingTop == 0 && super.mPaddingLeft == 0)
            {
                mOverlay.draw(canvas);
                return;
            } else
            {
                int i = canvas.getSaveCount();
                canvas.save();
                canvas.translate(super.mPaddingLeft, super.mPaddingTop);
                mOverlay.draw(canvas);
                canvas.restoreToCount(i);
                return;
            }
        } else
        {
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/QuickContactBadge.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/QuickContactBadge.getName());
    }

    public void setExcludeMimes(String as[])
    {
        mExcludeMimes = as;
    }

    public void setImageToDefault()
    {
        if (mDefaultAvatar == null)
            mDefaultAvatar = getResources().getDrawable(0x10802bf);
        setImageDrawable(mDefaultAvatar);
    }

    public void setMode(int i)
    {
    }



/*
    static Uri access$002(QuickContactBadge quickcontactbadge, Uri uri)
    {
        quickcontactbadge.mContactUri = uri;
        return uri;
    }

*/

}
