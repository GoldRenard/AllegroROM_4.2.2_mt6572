// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.vcard;

import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.android.vcard.exception.VCardAgentNotSupportedException;
import com.android.vcard.exception.VCardException;
import com.android.vcard.exception.VCardInvalidCommentLineException;
import com.android.vcard.exception.VCardInvalidLineException;
import com.android.vcard.exception.VCardVersionException;
import java.io.*;
import java.util.*;

// Referenced classes of package com.android.vcard:
//            VCardConfig, VCardProperty, VCardUtils, VCardInterpreter, 
//            VCardParser_V21

class VCardParserImpl_V21
{
    protected static final class CustomBufferedReader extends BufferedReader
    {

        private String mNextLine;
        private boolean mNextLineIsValid;
        private long mTime;

        public long getTotalmillisecond()
        {
            return mTime;
        }

        public String peekLine()
            throws IOException
        {
            if (!mNextLineIsValid)
            {
                long l = System.currentTimeMillis();
                String s = super.readLine();
                long l1 = System.currentTimeMillis();
                mTime = mTime + (l1 - l);
                mNextLine = s;
                mNextLineIsValid = true;
            }
            return mNextLine;
        }

        public String readLine()
            throws IOException
        {
            if (mNextLineIsValid)
            {
                String s1 = mNextLine;
                mNextLine = null;
                mNextLineIsValid = false;
                return s1;
            } else
            {
                long l = System.currentTimeMillis();
                String s = super.readLine();
                long l1 = System.currentTimeMillis();
                mTime = mTime + (l1 - l);
                return s;
            }
        }

        public CustomBufferedReader(Reader reader)
        {
            super(reader);
        }
    }


    private static final String DEFAULT_CHARSET = "UTF-8";
    private static final String DEFAULT_ENCODING = "8BIT";
    private static final String LOG_TAG = "vCard";
    private static final int STATE_GROUP_OR_PROPERTY_NAME = 0;
    private static final int STATE_PARAMS = 1;
    private static final int STATE_PARAMS_IN_DQUOTE = 2;
    private boolean mCanceled;
    protected String mCurrentCharset;
    protected String mCurrentEncoding;
    protected final String mIntermediateCharset;
    private final List mInterpreterList;
    protected CustomBufferedReader mReader;
    protected final Set mUnknownTypeSet;
    protected final Set mUnknownValueSet;

    public VCardParserImpl_V21()
    {
        this(VCardConfig.VCARD_TYPE_DEFAULT);
    }

    public VCardParserImpl_V21(int i)
    {
        mInterpreterList = new ArrayList();
        mUnknownTypeSet = new HashSet();
        mUnknownValueSet = new HashSet();
        mIntermediateCharset = "ISO-8859-1";
    }

    private String getPotentialMultiline(String s)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        do
        {
            String s1 = peekLine();
            if (s1 != null && s1.length() != 0 && getPropertyNameUpperCase(s1) == null)
            {
                getLine();
                stringbuilder.append(" ").append(s1);
            } else
            {
                return stringbuilder.toString();
            }
        } while (true);
    }

    private String getPropertyNameUpperCase(String s)
    {
        int i = s.indexOf(":");
        if (i > -1)
        {
            int j = s.indexOf(";");
            int k;
            if (i == -1)
                k = j;
            else
            if (j == -1)
                k = i;
            else
                k = Math.min(i, j);
            return s.substring(0, k).toUpperCase();
        } else
        {
            return null;
        }
    }

    private String getQuotedPrintablePart(String s)
        throws IOException, VCardException
    {
        if (s.trim().endsWith("="))
        {
            int i;
            for (i = -1 + s.length(); s.charAt(i) != '=';);
            StringBuilder stringbuilder = new StringBuilder();
            stringbuilder.append(s.substring(0, i + 1));
            stringbuilder.append("\r\n");
            String s1;
            do
            {
                s1 = getLine();
                if (s1 == null)
                    throw new VCardException("File ended during parsing a Quoted-Printable String");
                if (!s1.trim().endsWith("="))
                    break;
                int j;
                for (j = -1 + s1.length(); s1.charAt(j) != '=';);
                stringbuilder.append(s1.substring(0, j + 1));
                stringbuilder.append("\r\n");
            } while (true);
            stringbuilder.append(s1);
            s = stringbuilder.toString();
        }
        return s;
    }

    private void handleAdrOrgN(VCardProperty vcardproperty, String s, String s1, String s2)
        throws VCardException, IOException
    {
        ArrayList arraylist = new ArrayList();
        if (mCurrentEncoding.equals("QUOTED-PRINTABLE"))
        {
            String s3 = getQuotedPrintablePart(s);
            vcardproperty.setRawValue(s3);
            for (Iterator iterator2 = VCardUtils.constructListFromValue(s3, getVersion()).iterator(); iterator2.hasNext(); arraylist.add(VCardUtils.parseQuotedPrintable((String)iterator2.next(), false, s1, s2)));
        } else
        {
            for (Iterator iterator = VCardUtils.constructListFromValue(getPotentialMultiline(s), getVersion()).iterator(); iterator.hasNext(); arraylist.add(VCardUtils.convertStringCharset((String)iterator.next(), s1, s2)));
        }
        vcardproperty.setValues(arraylist);
        for (Iterator iterator1 = mInterpreterList.iterator(); iterator1.hasNext(); ((VCardInterpreter)iterator1.next()).onPropertyCreated(vcardproperty));
    }

    private void handleNest()
        throws IOException, VCardException
    {
        for (Iterator iterator = mInterpreterList.iterator(); iterator.hasNext(); ((VCardInterpreter)iterator.next()).onEntryStarted());
        parseItems();
        for (Iterator iterator1 = mInterpreterList.iterator(); iterator1.hasNext(); ((VCardInterpreter)iterator1.next()).onEntryEnded());
    }

    private boolean isAsciiLetter(char c)
    {
        return c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z';
    }

    private void parseItemInter(VCardProperty vcardproperty, String s)
        throws IOException, VCardException
    {
        String s1 = vcardproperty.getRawValue();
        if (s.equals("AGENT"))
        {
            handleAgent(vcardproperty);
            return;
        }
        if (isValidPropertyName(s))
        {
            if (s.equals("VERSION") && !s1.equals(getVersionString()))
            {
                throw new VCardVersionException((new StringBuilder()).append("Incompatible version: ").append(s1).append(" != ").append(getVersionString()).toString());
            } else
            {
                handlePropertyValue(vcardproperty, s);
                return;
            }
        } else
        {
            throw new VCardException((new StringBuilder()).append("Unknown property name: \"").append(s).append("\"").toString());
        }
    }

    private boolean parseOneVCard()
        throws IOException, VCardException
    {
        mCurrentEncoding = "8BIT";
        mCurrentCharset = "UTF-8";
        if (!readBeginVCard(false))
            return false;
        for (Iterator iterator = mInterpreterList.iterator(); iterator.hasNext(); ((VCardInterpreter)iterator.next()).onEntryStarted());
        parseItems();
        for (Iterator iterator1 = mInterpreterList.iterator(); iterator1.hasNext(); ((VCardInterpreter)iterator1.next()).onEntryEnded());
        return true;
    }

    static String unescapeCharacter(char c)
    {
        if (c != '\\' && c != ';' && c != ':' && c != ',')
            return null;
        else
            return String.valueOf(c);
    }

    public void addInterpreter(VCardInterpreter vcardinterpreter)
    {
        mInterpreterList.add(vcardinterpreter);
    }

    public final void cancel()
    {
        this;
        JVM INSTR monitorenter ;
        Log.i("vCard", "ParserImpl received cancel operation.");
        mCanceled = true;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    protected VCardProperty constructPropertyData(String s)
        throws VCardException
    {
        VCardProperty vcardproperty = new VCardProperty();
        int i = s.length();
        if (i > 0 && s.charAt(0) == '#')
            throw new VCardInvalidCommentLineException();
        int j = 0;
        int k = 0;
        for (int l = 0; l < i; l++)
        {
            char c = s.charAt(l);
            switch (j)
            {
            default:
                break;

            case 2: // '\002'
                if (c == '"')
                {
                    if ("2.1".equalsIgnoreCase(getVersionString()))
                        Log.w("vCard", "Double-quoted params found in vCard 2.1. Silently allow it");
                    j = 1;
                }
                break;

            case 1: // '\001'
                if (c == '"')
                {
                    if ("2.1".equalsIgnoreCase(getVersionString()))
                        Log.w("vCard", "Double-quoted params found in vCard 2.1. Silently allow it");
                    j = 2;
                    break;
                }
                if (c == ';')
                {
                    handleParams(vcardproperty, s.substring(k, l));
                    k = l + 1;
                    break;
                }
                if (c != ':')
                    break;
                handleParams(vcardproperty, s.substring(k, l));
                String s3;
                if (l < i - 1)
                    s3 = s.substring(l + 1);
                else
                    s3 = "";
                vcardproperty.setRawValue(s3);
                return vcardproperty;

            case 0: // '\0'
                if (c == ':')
                {
                    vcardproperty.setName(s.substring(k, l));
                    String s2;
                    if (l < i - 1)
                        s2 = s.substring(l + 1);
                    else
                        s2 = "";
                    vcardproperty.setRawValue(s2);
                    return vcardproperty;
                }
                if (c == '.')
                {
                    String s1 = s.substring(k, l);
                    if (s1.length() == 0)
                        Log.w("vCard", "Empty group found. Ignoring.");
                    else
                        vcardproperty.addGroup(s1);
                    k = l + 1;
                    break;
                }
                if (c == ';')
                {
                    vcardproperty.setName(s.substring(k, l));
                    k = l + 1;
                    j = 1;
                }
                break;
            }
        }

        throw new VCardInvalidLineException((new StringBuilder()).append("Invalid line: \"").append(s).append("\"").toString());
    }

    protected Set getAvailableEncodingSet()
    {
        return VCardParser_V21.sAvailableEncoding;
    }

    protected String getBase64(String s)
        throws IOException, VCardException
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(s);
        do
        {
            String s1 = peekLine();
            if (s1 == null)
                throw new VCardException("File ended during parsing BASE64 binary");
            String s2 = getPropertyNameUpperCase(s1);
            if (getKnownPropertyNameSet().contains(s2))
            {
                Log.w("vCard", "Found a next property during parsing a BASE64 string, which must not contain semi-colon or colon. Treat the line as next property.");
                Log.w("vCard", (new StringBuilder()).append("Problematic line: ").append(s1.trim()).toString());
                break;
            }
            getLine();
            if (s1.length() == 0)
                break;
            stringbuilder.append(s1);
        } while (true);
        return stringbuilder.toString();
    }

    protected String getCurrentCharset()
    {
        return mCurrentCharset;
    }

    protected String getDefaultCharset()
    {
        return "UTF-8";
    }

    protected String getDefaultEncoding()
    {
        return "8BIT";
    }

    protected Set getKnownPropertyNameSet()
    {
        return VCardParser_V21.sKnownPropertyNameSet;
    }

    protected Set getKnownTypeSet()
    {
        return VCardParser_V21.sKnownTypeSet;
    }

    protected Set getKnownValueSet()
    {
        return VCardParser_V21.sKnownValueSet;
    }

    protected String getLine()
        throws IOException
    {
        return mReader.readLine();
    }

    protected String getNonEmptyLine()
        throws IOException, VCardException
    {
        String s;
        do
        {
            s = getLine();
            if (s == null)
                throw new VCardException("Reached end of buffer.");
        } while (s.trim().length() <= 0);
        return s;
    }

    protected int getVersion()
    {
        return 0;
    }

    protected String getVersionString()
    {
        return "2.1";
    }

    protected void handleAgent(VCardProperty vcardproperty)
        throws VCardException
    {
        if (!vcardproperty.getRawValue().toUpperCase().contains("BEGIN:VCARD"))
        {
            for (Iterator iterator = mInterpreterList.iterator(); iterator.hasNext(); ((VCardInterpreter)iterator.next()).onPropertyCreated(vcardproperty));
            return;
        } else
        {
            throw new VCardAgentNotSupportedException("AGENT Property is not supported now.");
        }
    }

    protected void handleAnyParam(VCardProperty vcardproperty, String s, String s1)
    {
        vcardproperty.addParameter(s, s1);
    }

    protected void handleCharset(VCardProperty vcardproperty, String s)
    {
        mCurrentCharset = s;
        vcardproperty.addParameter("CHARSET", s);
    }

    protected void handleEncoding(VCardProperty vcardproperty, String s)
        throws VCardException
    {
        if (!getAvailableEncodingSet().contains(s) && !s.startsWith("X-"))
        {
            throw new VCardException((new StringBuilder()).append("Unknown encoding \"").append(s).append("\"").toString());
        } else
        {
            vcardproperty.addParameter("ENCODING", s);
            mCurrentEncoding = s.toUpperCase();
            return;
        }
    }

    protected void handleLanguage(VCardProperty vcardproperty, String s)
        throws VCardException
    {
        String as[] = s.split("-");
        if (as.length != 2)
            throw new VCardException((new StringBuilder()).append("Invalid Language: \"").append(s).append("\"").toString());
        String s1 = as[0];
        int i = s1.length();
        for (int j = 0; j < i; j++)
            if (!isAsciiLetter(s1.charAt(j)))
                throw new VCardException((new StringBuilder()).append("Invalid Language: \"").append(s).append("\"").toString());

        String s2 = as[1];
        int k = s2.length();
        for (int l = 0; l < k; l++)
            if (!isAsciiLetter(s2.charAt(l)))
                throw new VCardException((new StringBuilder()).append("Invalid Language: \"").append(s).append("\"").toString());

        vcardproperty.addParameter("LANGUAGE", s);
    }

    protected void handleParamWithoutName(VCardProperty vcardproperty, String s)
    {
        handleType(vcardproperty, s);
    }

    protected void handleParams(VCardProperty vcardproperty, String s)
        throws VCardException
    {
        String as[] = s.split("=", 2);
        if (as.length == 2)
        {
            String s1 = as[0].trim().toUpperCase();
            String s2 = as[1].trim();
            if (s1.equals("TYPE"))
            {
                handleType(vcardproperty, s2);
                return;
            }
            if (s1.equals("VALUE"))
            {
                handleValue(vcardproperty, s2);
                return;
            }
            if (s1.equals("ENCODING"))
            {
                handleEncoding(vcardproperty, s2);
                return;
            }
            if (s1.equals("CHARSET"))
            {
                handleCharset(vcardproperty, s2);
                return;
            }
            if (s1.equals("LANGUAGE"))
            {
                handleLanguage(vcardproperty, s2);
                return;
            }
            if (s1.startsWith("X-"))
            {
                handleAnyParam(vcardproperty, s1, s2);
                return;
            } else
            {
                throw new VCardException((new StringBuilder()).append("Unknown type \"").append(s1).append("\"").toString());
            }
        } else
        {
            handleParamWithoutName(vcardproperty, as[0]);
            return;
        }
    }

    protected void handlePropertyValue(VCardProperty vcardproperty, String s)
        throws IOException, VCardException
    {
        String s1;
        String s2;
        String s3;
        s1 = vcardproperty.getName().toUpperCase();
        s2 = vcardproperty.getRawValue();
        Collection collection = vcardproperty.getParameters("CHARSET");
        if (collection != null)
            s3 = (String)collection.iterator().next();
        else
            s3 = null;
        if (TextUtils.isEmpty(s3))
            s3 = "UTF-8";
        if (!s1.equals("ADR") && !s1.equals("ORG") && !s1.equals("N")) goto _L2; else goto _L1
_L1:
        handleAdrOrgN(vcardproperty, s2, "ISO-8859-1", s3);
_L4:
        return;
_L2:
        if (!mCurrentEncoding.equals("QUOTED-PRINTABLE") && (!s1.equals("FN") || vcardproperty.getParameters("ENCODING") != null || !VCardUtils.appearsLikeAndroidVCardQuotedPrintable(s2)))
            break; /* Loop/switch isn't completed */
        String s4 = getQuotedPrintablePart(s2);
        String s5 = VCardUtils.parseQuotedPrintable(s4, false, "ISO-8859-1", s3);
        vcardproperty.setRawValue(s4);
        vcardproperty.setValues(new String[] {
            s5
        });
        Iterator iterator = mInterpreterList.iterator();
        while (iterator.hasNext()) 
            ((VCardInterpreter)iterator.next()).onPropertyCreated(vcardproperty);
        if (true) goto _L4; else goto _L3
_L3:
        if (!mCurrentEncoding.equals("BASE64") && !mCurrentEncoding.equals("B"))
            break; /* Loop/switch isn't completed */
        String s6 = getBase64(s2);
        vcardproperty.setByteValue(Base64.decode(s6, 0));
        OutOfMemoryError outofmemoryerror;
        Iterator iterator1;
        Iterator iterator2 = mInterpreterList.iterator();
        while (iterator2.hasNext()) 
            ((VCardInterpreter)iterator2.next()).onPropertyCreated(vcardproperty);
        continue; /* Loop/switch isn't completed */
_L6:
        if (true) goto _L4; else goto _L5
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        try
        {
            throw new VCardException((new StringBuilder()).append("Decode error on base64 photo: ").append(s2).toString());
        }
        // Misplaced declaration of an exception variable
        catch (OutOfMemoryError outofmemoryerror)
        {
            Log.e("vCard", "OutOfMemoryError happened during parsing BASE64 data!");
            iterator1 = mInterpreterList.iterator();
            while (iterator1.hasNext()) 
                ((VCardInterpreter)iterator1.next()).onPropertyCreated(vcardproperty);
        }
          goto _L6
_L5:
        if (!mCurrentEncoding.equals("7BIT") && !mCurrentEncoding.equals("8BIT") && !mCurrentEncoding.startsWith("X-"))
        {
            Object aobj[] = new Object[2];
            aobj[0] = mCurrentEncoding;
            aobj[1] = getVersionString();
            Log.w("vCard", String.format("The encoding \"%s\" is unsupported by vCard %s", aobj));
        }
        if (getVersion() == 0)
        {
            StringBuilder stringbuilder = null;
            do
            {
                String s7 = peekLine();
                if (TextUtils.isEmpty(s7) || s7.charAt(0) != ' ' || "END:VCARD".contains(s7.toUpperCase()))
                    break;
                getLine();
                if (stringbuilder == null)
                {
                    stringbuilder = new StringBuilder();
                    stringbuilder.append(s2);
                }
                stringbuilder.append(s7.substring(1));
            } while (true);
            if (stringbuilder != null)
                s2 = stringbuilder.toString();
        }
        ArrayList arraylist = new ArrayList();
        arraylist.add(VCardUtils.convertStringCharset(maybeUnescapeText(s2), "ISO-8859-1", s3));
        vcardproperty.setValues(arraylist);
        Iterator iterator3 = mInterpreterList.iterator();
        while (iterator3.hasNext()) 
            ((VCardInterpreter)iterator3.next()).onPropertyCreated(vcardproperty);
        if (true) goto _L4; else goto _L7
_L7:
    }

    protected void handleType(VCardProperty vcardproperty, String s)
    {
        if (!getKnownTypeSet().contains(s.toUpperCase()) && !s.startsWith("X-") && !mUnknownTypeSet.contains(s))
        {
            mUnknownTypeSet.add(s);
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(getVersion());
            aobj[1] = s;
            Log.w("vCard", String.format("TYPE unsupported by %s: ", aobj));
        }
        vcardproperty.addParameter("TYPE", s);
    }

    protected void handleValue(VCardProperty vcardproperty, String s)
    {
        if (!getKnownValueSet().contains(s.toUpperCase()) && !s.startsWith("X-") && !mUnknownValueSet.contains(s))
        {
            mUnknownValueSet.add(s);
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(getVersion());
            aobj[1] = s;
            Log.w("vCard", String.format("The value unsupported by TYPE of %s: ", aobj));
        }
        vcardproperty.addParameter("VALUE", s);
    }

    protected boolean isValidPropertyName(String s)
    {
        if (!getKnownPropertyNameSet().contains(s.toUpperCase()) && !s.startsWith("X-") && !mUnknownTypeSet.contains(s))
        {
            mUnknownTypeSet.add(s);
            Log.w("vCard", (new StringBuilder()).append("Property name unsupported by vCard 2.1: ").append(s).toString());
        }
        return true;
    }

    protected String maybeUnescapeCharacter(char c)
    {
        return unescapeCharacter(c);
    }

    protected String maybeUnescapeText(String s)
    {
        return s;
    }

    public void parse(InputStream inputstream)
        throws IOException, VCardException
    {
        if (inputstream == null)
            throw new NullPointerException("InputStream must not be null.");
        mReader = new CustomBufferedReader(new InputStreamReader(inputstream, mIntermediateCharset));
        System.currentTimeMillis();
        for (Iterator iterator = mInterpreterList.iterator(); iterator.hasNext(); ((VCardInterpreter)iterator.next()).onVCardStarted());
_L4:
        this;
        JVM INSTR monitorenter ;
        if (!mCanceled) goto _L2; else goto _L1
_L1:
        Log.i("vCard", "Cancel request has come. exitting parse operation.");
        this;
        JVM INSTR monitorexit ;
_L3:
        for (Iterator iterator1 = mInterpreterList.iterator(); iterator1.hasNext(); ((VCardInterpreter)iterator1.next()).onVCardEnded());
        break MISSING_BLOCK_LABEL_159;
_L2:
        this;
        JVM INSTR monitorexit ;
        if (parseOneVCard()) goto _L4; else goto _L3
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected boolean parseItem()
        throws IOException, VCardException
    {
        mCurrentEncoding = "8BIT";
        VCardProperty vcardproperty = constructPropertyData(getNonEmptyLine());
        String s = vcardproperty.getName().toUpperCase();
        String s1 = vcardproperty.getRawValue();
        if (s.equals("BEGIN"))
        {
            if (s1.equalsIgnoreCase("VCARD"))
                handleNest();
            else
                throw new VCardException((new StringBuilder()).append("Unknown BEGIN type: ").append(s1).toString());
        } else
        {
            if (s.equals("END"))
                if (s1.equalsIgnoreCase("VCARD"))
                    return true;
                else
                    throw new VCardException((new StringBuilder()).append("Unknown END type: ").append(s1).toString());
            parseItemInter(vcardproperty, s);
        }
        return false;
    }

    protected void parseItems()
        throws IOException, VCardException
    {
        boolean flag;
        boolean flag1;
        boolean flag2;
        try
        {
            flag2 = parseItem();
        }
        catch (VCardInvalidCommentLineException vcardinvalidcommentlineexception)
        {
            Log.e("vCard", "Invalid line which looks like some comment was found. Ignored.");
            flag = false;
            continue; /* Loop/switch isn't completed */
        }
        flag = flag2;
_L2:
        if (flag)
            break; /* Loop/switch isn't completed */
        flag1 = parseItem();
        flag = flag1;
        continue; /* Loop/switch isn't completed */
        VCardInvalidCommentLineException vcardinvalidcommentlineexception1;
        vcardinvalidcommentlineexception1;
        Log.e("vCard", "Invalid line which looks like some comment was found. Ignored.");
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void parseOne(InputStream inputstream)
        throws IOException, VCardException
    {
        if (inputstream == null)
            throw new NullPointerException("InputStream must not be null.");
        mReader = new CustomBufferedReader(new InputStreamReader(inputstream, mIntermediateCharset));
        System.currentTimeMillis();
        for (Iterator iterator = mInterpreterList.iterator(); iterator.hasNext(); ((VCardInterpreter)iterator.next()).onVCardStarted());
        parseOneVCard();
        for (Iterator iterator1 = mInterpreterList.iterator(); iterator1.hasNext(); ((VCardInterpreter)iterator1.next()).onVCardEnded());
    }

    protected String peekLine()
        throws IOException
    {
        return mReader.peekLine();
    }

    protected boolean readBeginVCard(boolean flag)
        throws IOException, VCardException
    {
        do
        {
            String s;
            do
            {
                s = getLine();
                if (s == null)
                    return false;
            } while (s.trim().length() <= 0);
            String as[] = s.split(":", 2);
            if (as.length == 2 && as[0].trim().equalsIgnoreCase("BEGIN") && as[1].trim().equalsIgnoreCase("VCARD"))
                return true;
            if (!flag)
                throw new VCardException((new StringBuilder()).append("Expected String \"BEGIN:VCARD\" did not come (Instead, \"").append(s).append("\" came)").toString());
        } while (flag);
        throw new VCardException("Reached where must not be reached.");
    }
}
