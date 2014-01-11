// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.util.Log;
import java.util.*;

public class VCardProperty
{

    private static final String LOG_TAG = "vCard";
    private byte mByteValue[];
    private List mGroupList;
    private String mName;
    private Map mParameterMap;
    private String mRawValue;
    private List mValueList;

    public VCardProperty()
    {
        mParameterMap = new HashMap();
    }

    public void addGroup(String s)
    {
        if (mGroupList == null)
            mGroupList = new ArrayList();
        mGroupList.add(s);
    }

    public void addParameter(String s, String s1)
    {
        Object obj;
        if (!mParameterMap.containsKey(s))
        {
            if (s.equals("TYPE"))
                obj = new HashSet();
            else
                obj = new ArrayList();
            mParameterMap.put(s, obj);
        } else
        {
            obj = (Collection)mParameterMap.get(s);
        }
        ((Collection) (obj)).add(s1);
    }

    public void addValues(List list)
    {
        if (mValueList == null)
        {
            mValueList = new ArrayList(list);
            return;
        } else
        {
            mValueList.addAll(list);
            return;
        }
    }

    public transient void addValues(String as[])
    {
        if (mValueList == null)
        {
            mValueList = Arrays.asList(as);
            return;
        } else
        {
            mValueList.addAll(Arrays.asList(as));
            return;
        }
    }

    public byte[] getByteValue()
    {
        return mByteValue;
    }

    public List getGroupList()
    {
        return mGroupList;
    }

    public String getName()
    {
        return mName;
    }

    public Map getParameterMap()
    {
        return mParameterMap;
    }

    public Collection getParameters(String s)
    {
        return (Collection)mParameterMap.get(s);
    }

    public String getRawValue()
    {
        return mRawValue;
    }

    public List getValueList()
    {
        return mValueList;
    }

    public void setByteValue(byte abyte0[])
    {
        mByteValue = abyte0;
    }

    public void setName(String s)
    {
        if (mName != null)
        {
            Object aobj[] = new Object[2];
            aobj[0] = mName;
            aobj[1] = s;
            Log.w("vCard", String.format("Property name is re-defined (existing: %s, requested: %s", aobj));
        }
        mName = s;
    }

    public void setParameter(String s, String s1)
    {
        mParameterMap.clear();
        addParameter(s, s1);
    }

    public void setRawValue(String s)
    {
        mRawValue = s;
    }

    public void setValues(List list)
    {
        mValueList = list;
    }

    public transient void setValues(String as[])
    {
        mValueList = Arrays.asList(as);
    }
}
