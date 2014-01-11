// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.UriMatcher;
import android.provider.BaseColumns;

public class CallRejectContentData
{
    public static final class UserTableData
        implements BaseColumns
    {

        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/com.android.rejects";
        public static final String CONTENT_TYPE_ITME = "vnd.android.cursor.item/com.android.reject";
        public static final String NAME = "Name";
        public static final String NUMBER = "Number";
        public static final int REJECT = 2;
        public static final int REJECTS = 1;
        public static final String TABLE_NAME = "list";
        public static final String TYPE = "Type";
        public static final UriMatcher URIMATCHER;

        static 
        {
            URIMATCHER = new UriMatcher(-1);
            URIMATCHER.addURI("reject", "list", 1);
            URIMATCHER.addURI("reject", "list/#", 2);
        }

    }


    public static final String AUTHORITY = "reject";
    public static final String DATABASE_NAME = "reject.db";
    public static final int DATABASE_VERSION = 4;
    public static final String USERS_TABLE_NAME = "list";

}
