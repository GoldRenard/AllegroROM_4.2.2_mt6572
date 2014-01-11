// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.Xml;
import com.android.internal.util.XmlUtils;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.app:
//            Activity

public class AliasActivity extends Activity
{

    public final String ALIAS_META_DATA = "android.app.alias";


    private Intent parseAlias(XmlPullParser xmlpullparser)
        throws XmlPullParserException, IOException
    {
        android.util.AttributeSet attributeset = Xml.asAttributeSet(xmlpullparser);
        Intent intent = null;
        int i;
        do
            i = xmlpullparser.next();
        while (i != 1 && i != 2);
        String s = xmlpullparser.getName();
        if (!"alias".equals(s))
            throw new RuntimeException((new StringBuilder()).append("Alias meta-data must start with <alias> tag; found").append(s).append(" at ").append(xmlpullparser.getPositionDescription()).toString());
        int j = xmlpullparser.getDepth();
        do
        {
            int k;
            do
            {
                k = xmlpullparser.next();
                if (k == 1 || k == 3 && xmlpullparser.getDepth() <= j)
                    return intent;
            } while (k == 3 || k == 4);
            if ("intent".equals(xmlpullparser.getName()))
            {
                Intent intent1 = Intent.parseIntent(getResources(), xmlpullparser, attributeset);
                if (intent == null)
                    intent = intent1;
            } else
            {
                XmlUtils.skipCurrentTag(xmlpullparser);
            }
        } while (true);
    }

    protected void onCreate(Bundle bundle)
    {
        XmlResourceParser xmlresourceparser;
        super.onCreate(bundle);
        xmlresourceparser = null;
        xmlresourceparser = getPackageManager().getActivityInfo(getComponentName(), 128).loadXmlMetaData(getPackageManager(), "android.app.alias");
        if (xmlresourceparser != null)
            break MISSING_BLOCK_LABEL_74;
        throw new RuntimeException("Alias requires a meta-data field android.app.alias");
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        throw new RuntimeException("Error parsing alias", namenotfoundexception);
        Exception exception;
        exception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        throw exception;
        Intent intent = parseAlias(xmlresourceparser);
        if (intent != null)
            break MISSING_BLOCK_LABEL_110;
        throw new RuntimeException("No <intent> tag found in alias description");
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        throw new RuntimeException("Error parsing alias", xmlpullparserexception);
        startActivity(intent);
        finish();
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        return;
        IOException ioexception;
        ioexception;
        throw new RuntimeException("Error parsing alias", ioexception);
    }
}
