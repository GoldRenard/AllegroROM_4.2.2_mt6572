// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.textservice;

import android.os.*;
import android.util.Log;
import com.android.internal.textservice.ITextServicesManager;
import java.util.Locale;

// Referenced classes of package android.view.textservice:
//            SpellCheckerSubtype, SpellCheckerInfo, SpellCheckerSession

public final class TextServicesManager
{

    private static final boolean DBG;
    private static final String TAG = android/view/textservice/TextServicesManager.getSimpleName();
    private static TextServicesManager sInstance;
    private static ITextServicesManager sService;

    private TextServicesManager()
    {
        if (sService == null)
            sService = com.android.internal.textservice.ITextServicesManager.Stub.asInterface(ServiceManager.getService("textservices"));
    }

    public static TextServicesManager getInstance()
    {
        android/view/textservice/TextServicesManager;
        JVM INSTR monitorenter ;
        TextServicesManager textservicesmanager;
        if (sInstance == null)
            break MISSING_BLOCK_LABEL_18;
        textservicesmanager = sInstance;
        android/view/textservice/TextServicesManager;
        JVM INSTR monitorexit ;
        return textservicesmanager;
        sInstance = new TextServicesManager();
        android/view/textservice/TextServicesManager;
        JVM INSTR monitorexit ;
        return sInstance;
        Exception exception;
        exception;
        android/view/textservice/TextServicesManager;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public SpellCheckerInfo getCurrentSpellChecker()
    {
        SpellCheckerInfo spellcheckerinfo;
        try
        {
            spellcheckerinfo = sService.getCurrentSpellChecker(null);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return spellcheckerinfo;
    }

    public SpellCheckerSubtype getCurrentSpellCheckerSubtype(boolean flag)
    {
        if (sService != null)
            break MISSING_BLOCK_LABEL_17;
        Log.e(TAG, "sService is null.");
        return null;
        SpellCheckerSubtype spellcheckersubtype;
        try
        {
            spellcheckersubtype = sService.getCurrentSpellCheckerSubtype(null, flag);
        }
        catch (RemoteException remoteexception)
        {
            Log.e(TAG, (new StringBuilder()).append("Error in getCurrentSpellCheckerSubtype: ").append(remoteexception).toString());
            return null;
        }
        return spellcheckersubtype;
    }

    public SpellCheckerInfo[] getEnabledSpellCheckers()
    {
        SpellCheckerInfo aspellcheckerinfo[];
        try
        {
            aspellcheckerinfo = sService.getEnabledSpellCheckers();
        }
        catch (RemoteException remoteexception)
        {
            Log.e(TAG, (new StringBuilder()).append("Error in getEnabledSpellCheckers: ").append(remoteexception).toString());
            return null;
        }
        return aspellcheckerinfo;
    }

    public boolean isSpellCheckerEnabled()
    {
        boolean flag;
        try
        {
            flag = sService.isSpellCheckerEnabled();
        }
        catch (RemoteException remoteexception)
        {
            Log.e(TAG, (new StringBuilder()).append("Error in isSpellCheckerEnabled:").append(remoteexception).toString());
            return false;
        }
        return flag;
    }

    public SpellCheckerSession newSpellCheckerSession(Bundle bundle, Locale locale, SpellCheckerSession.SpellCheckerSessionListener spellcheckersessionlistener, boolean flag)
    {
        SpellCheckerInfo spellcheckerinfo;
        SpellCheckerSubtype spellcheckersubtype;
        if (spellcheckersessionlistener == null)
            throw new NullPointerException();
        if (!flag && locale == null)
            throw new IllegalArgumentException("Locale should not be null if you don't refer settings.");
        if (flag && !isSpellCheckerEnabled())
            return null;
        try
        {
            spellcheckerinfo = sService.getCurrentSpellChecker(null);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (spellcheckerinfo == null)
            return null;
        spellcheckersubtype = null;
        if (!flag) goto _L2; else goto _L1
_L1:
        spellcheckersubtype = getCurrentSpellCheckerSubtype(true);
        if (spellcheckersubtype == null)
            return null;
        if (locale != null)
        {
            String s2 = spellcheckersubtype.getLocale();
            String s3 = locale.toString();
            if (s2.length() < 2 || s3.length() < 2 || !s2.substring(0, 2).equals(s3.substring(0, 2)))
                return null;
        }
          goto _L3
_L2:
        String s;
        int i;
        s = locale.toString();
        i = 0;
_L8:
        if (i >= spellcheckerinfo.getSubtypeCount()) goto _L3; else goto _L4
_L4:
        SpellCheckerSubtype spellcheckersubtype1;
        String s1;
        spellcheckersubtype1 = spellcheckerinfo.getSubtypeAt(i);
        s1 = spellcheckersubtype1.getLocale();
        if (!s1.equals(s)) goto _L6; else goto _L5
_L5:
        spellcheckersubtype = spellcheckersubtype1;
_L3:
        if (spellcheckersubtype == null)
            return null;
        break; /* Loop/switch isn't completed */
_L6:
        if (s.length() >= 2 && s1.length() >= 2 && s.startsWith(s1))
            spellcheckersubtype = spellcheckersubtype1;
        i++;
        if (true) goto _L8; else goto _L7
_L7:
        SpellCheckerSession spellcheckersession = new SpellCheckerSession(spellcheckerinfo, sService, spellcheckersessionlistener, spellcheckersubtype);
        try
        {
            sService.getSpellCheckerService(spellcheckerinfo.getId(), spellcheckersubtype.getLocale(), spellcheckersession.getTextServicesSessionListener(), spellcheckersession.getSpellCheckerSessionListener(), bundle);
        }
        catch (RemoteException remoteexception1)
        {
            return null;
        }
        return spellcheckersession;
    }

    public void setCurrentSpellChecker(SpellCheckerInfo spellcheckerinfo)
    {
        if (spellcheckerinfo == null)
        {
            try
            {
                throw new NullPointerException("SpellCheckerInfo is null.");
            }
            catch (RemoteException remoteexception)
            {
                Log.e(TAG, (new StringBuilder()).append("Error in setCurrentSpellChecker: ").append(remoteexception).toString());
            }
            return;
        }
        sService.setCurrentSpellChecker(null, spellcheckerinfo.getId());
        return;
    }

    public void setSpellCheckerEnabled(boolean flag)
    {
        try
        {
            sService.setSpellCheckerEnabled(flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e(TAG, (new StringBuilder()).append("Error in setSpellCheckerEnabled:").append(remoteexception).toString());
        }
    }

    public void setSpellCheckerSubtype(SpellCheckerSubtype spellcheckersubtype)
    {
        if (spellcheckersubtype != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L3:
        int i;
        try
        {
            sService.setCurrentSpellCheckerSubtype(null, j);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e(TAG, (new StringBuilder()).append("Error in setSpellCheckerSubtype:").append(remoteexception).toString());
        }
        break MISSING_BLOCK_LABEL_59;
_L2:
        i = spellcheckersubtype.hashCode();
        j = i;
          goto _L3
    }

}
