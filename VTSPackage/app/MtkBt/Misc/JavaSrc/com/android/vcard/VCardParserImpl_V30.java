// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.util.Log;
import com.android.vcard.exception.VCardException;
import java.io.IOException;
import java.util.Set;

// Referenced classes of package com.android.vcard:
//            VCardParserImpl_V21, VCardProperty, VCardUtils, VCardParser_V30

class VCardParserImpl_V30 extends VCardParserImpl_V21
{

    private static final String LOG_TAG = "vCard";
    private boolean mEmittedAgentWarning;
    private String mPreviousLine;

    public VCardParserImpl_V30()
    {
        mEmittedAgentWarning = false;
    }

    public VCardParserImpl_V30(int i)
    {
        super(i);
        mEmittedAgentWarning = false;
    }

    private void splitAndPutParam(VCardProperty vcardproperty, String s, String s1)
    {
        StringBuilder stringbuilder;
label0:
        {
            stringbuilder = null;
            boolean flag = false;
            int i = s1.length();
            for (int j = 0; j < i; j++)
            {
                char c = s1.charAt(j);
                if (c == '"')
                {
                    if (flag)
                    {
                        vcardproperty.addParameter(s, encodeParamValue(stringbuilder.toString()));
                        stringbuilder = null;
                        flag = false;
                        continue;
                    }
                    if (stringbuilder != null)
                        if (stringbuilder.length() > 0)
                            Log.w("vCard", "Unexpected Dquote inside property.");
                        else
                            vcardproperty.addParameter(s, encodeParamValue(stringbuilder.toString()));
                    flag = true;
                    continue;
                }
                if (c == ',' && !flag)
                {
                    if (stringbuilder == null)
                    {
                        Log.w("vCard", (new StringBuilder()).append("Comma is used before actual string comes. (").append(s1).append(")").toString());
                    } else
                    {
                        vcardproperty.addParameter(s, encodeParamValue(stringbuilder.toString()));
                        stringbuilder = null;
                    }
                    continue;
                }
                if (stringbuilder == null)
                    stringbuilder = new StringBuilder();
                stringbuilder.append(c);
            }

            if (flag)
                Log.d("vCard", "Dangling Dquote.");
            if (stringbuilder != null)
            {
                if (stringbuilder.length() != 0)
                    break label0;
                Log.w("vCard", "Unintended behavior. We must not see empty StringBuilder at the end of parameter value parsing.");
            }
            return;
        }
        vcardproperty.addParameter(s, encodeParamValue(stringbuilder.toString()));
    }

    public static String unescapeCharacter(char c)
    {
        if (c != 'n' && c != 'N')
            return String.valueOf(c);
        else
            return "\n";
    }

    public static String unescapeText(String s)
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = s.length();
        for (int j = 0; j < i; j++)
        {
            char c = s.charAt(j);
            if (c == '\\' && j < i - 1)
            {
                j++;
                char c1 = s.charAt(j);
                if (c1 != 'n' && c1 != 'N')
                    stringbuilder.append(c1);
                else
                    stringbuilder.append("\n");
            } else
            {
                stringbuilder.append(c);
            }
        }

        return stringbuilder.toString();
    }

    protected String encodeParamValue(String s)
    {
        return VCardUtils.convertStringCharset(s, "ISO-8859-1", "UTF-8");
    }

    protected String getBase64(String s)
        throws IOException, VCardException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        do
        {
            String s1;
label0:
            {
                s1 = getLine();
                if (s1 == null)
                    throw new VCardException("File ended during parsing BASE64 binary");
                if (s1.length() != 0)
                {
                    if (s1.startsWith(" ") || s1.startsWith("\t"))
                        break label0;
                    mPreviousLine = s1;
                }
                return stringbuilder.toString();
            }
            stringbuilder.append(s1);
        } while (true);
    }

    protected Set getKnownPropertyNameSet()
    {
        return VCardParser_V30.sKnownPropertyNameSet;
    }

    protected String getLine()
        throws IOException
    {
        if (mPreviousLine != null)
        {
            String s = mPreviousLine;
            mPreviousLine = null;
            return s;
        } else
        {
            return super.mReader.readLine();
        }
    }

    protected String getNonEmptyLine()
        throws IOException, VCardException
    {
        StringBuilder stringbuilder = null;
        do
        {
            String s = super.mReader.readLine();
            if (s == null)
            {
                if (stringbuilder != null)
                    return stringbuilder.toString();
                if (mPreviousLine != null)
                {
                    String s3 = mPreviousLine;
                    mPreviousLine = null;
                    return s3;
                } else
                {
                    throw new VCardException("Reached end of buffer.");
                }
            }
            if (s.length() == 0)
            {
                if (stringbuilder != null)
                    return stringbuilder.toString();
                if (mPreviousLine != null)
                {
                    String s2 = mPreviousLine;
                    mPreviousLine = null;
                    return s2;
                }
            } else
            if (s.charAt(0) != ' ' && s.charAt(0) != '\t')
            {
                if (mPreviousLine == null)
                {
                    mPreviousLine = s;
                    if (stringbuilder != null)
                        return stringbuilder.toString();
                } else
                {
                    String s1 = mPreviousLine;
                    mPreviousLine = s;
                    return s1;
                }
            } else
            if (stringbuilder != null)
                stringbuilder.append(s.substring(1));
            else
            if (mPreviousLine != null)
            {
                stringbuilder = new StringBuilder();
                stringbuilder.append(mPreviousLine);
                mPreviousLine = null;
                stringbuilder.append(s.substring(1));
            } else
            {
                throw new VCardException("Space exists at the beginning of the line");
            }
        } while (true);
    }

    protected int getVersion()
    {
        return 1;
    }

    protected String getVersionString()
    {
        return "3.0";
    }

    protected void handleAgent(VCardProperty vcardproperty)
    {
        if (!mEmittedAgentWarning)
        {
            Log.w("vCard", "AGENT in vCard 3.0 is not supported yet. Ignore it");
            mEmittedAgentWarning = true;
        }
    }

    protected void handleAnyParam(VCardProperty vcardproperty, String s, String s1)
    {
        splitAndPutParam(vcardproperty, s, s1);
    }

    protected void handleParamWithoutName(VCardProperty vcardproperty, String s)
    {
        handleType(vcardproperty, s);
    }

    protected void handleParams(VCardProperty vcardproperty, String s)
        throws VCardException
    {
        try
        {
            super.handleParams(vcardproperty, s);
            return;
        }
        catch (VCardException vcardexception)
        {
            String as[] = s.split("=", 2);
            if (as.length == 2)
            {
                handleAnyParam(vcardproperty, as[0], as[1]);
                return;
            } else
            {
                throw new VCardException((new StringBuilder()).append("Unknown params value: ").append(s).toString());
            }
        }
    }

    protected void handleType(VCardProperty vcardproperty, String s)
    {
        splitAndPutParam(vcardproperty, "TYPE", s);
    }

    protected String maybeUnescapeCharacter(char c)
    {
        return unescapeCharacter(c);
    }

    protected String maybeUnescapeText(String s)
    {
        return unescapeText(s);
    }

    protected boolean readBeginVCard(boolean flag)
        throws IOException, VCardException
    {
        return super.readBeginVCard(flag);
    }
}
