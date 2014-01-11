// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.*;
import android.graphics.Canvas;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.util.Xml;
import android.widget.FrameLayout;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.view:
//            InflateException, ViewGroup, View, ViewStub

public abstract class LayoutInflater
{
    private static class BlinkLayout extends FrameLayout
    {

        private static final int BLINK_DELAY = 500;
        private static final int MESSAGE_BLINK = 66;
        private boolean mBlink;
        private boolean mBlinkState;
        private final Handler mHandler = new Handler(new _cls1());

        private void makeBlink()
        {
            Message message = mHandler.obtainMessage(66);
            mHandler.sendMessageDelayed(message, 500L);
        }

        protected void dispatchDraw(Canvas canvas)
        {
            if (mBlinkState)
                dispatchDraw(canvas);
        }

        protected void onAttachedToWindow()
        {
            onAttachedToWindow();
            mBlink = true;
            mBlinkState = true;
            makeBlink();
        }

        protected void onDetachedFromWindow()
        {
            onDetachedFromWindow();
            mBlink = false;
            mBlinkState = true;
            mHandler.removeMessages(66);
        }




/*
        static boolean access$102(BlinkLayout blinklayout, boolean flag)
        {
            blinklayout.mBlinkState = flag;
            return flag;
        }

*/


        public BlinkLayout(Context context, AttributeSet attributeset)
        {
            FrameLayout(context, attributeset);
        }
    }

    public static interface Factory
    {

        public abstract View onCreateView(String s, Context context, AttributeSet attributeset);
    }

    public static interface Factory2
        extends Factory
    {

        public abstract View onCreateView(View view, String s, Context context, AttributeSet attributeset);
    }

    private static class FactoryMerger
        implements Factory2
    {

        private final Factory mF1;
        private final Factory2 mF12;
        private final Factory mF2;
        private final Factory2 mF22;

        public View onCreateView(View view, String s, Context context, AttributeSet attributeset)
        {
            View view1;
            if (mF12 != null)
                view1 = mF12.onCreateView(view, s, context, attributeset);
            else
                view1 = mF1.onCreateView(s, context, attributeset);
            if (view1 != null)
                return view1;
            View view2;
            if (mF22 != null)
                view2 = mF22.onCreateView(view, s, context, attributeset);
            else
                view2 = mF2.onCreateView(s, context, attributeset);
            return view2;
        }

        public View onCreateView(String s, Context context, AttributeSet attributeset)
        {
            View view = mF1.onCreateView(s, context, attributeset);
            if (view != null)
                return view;
            else
                return mF2.onCreateView(s, context, attributeset);
        }

        FactoryMerger(Factory factory, Factory2 factory2, Factory factory1, Factory2 factory2_1)
        {
            mF1 = factory;
            mF2 = factory1;
            mF12 = factory2;
            mF22 = factory2_1;
        }
    }

    public static interface Filter
    {

        public abstract boolean onLoadClass(Class class1);
    }


    private static final String TAG_1995 = "blink";
    private static final String TAG_INCLUDE = "include";
    private static final String TAG_MERGE = "merge";
    private static final String TAG_REQUEST_FOCUS = "requestFocus";
    static final Class mConstructorSignature[] = {
        android/content/Context, android/util/AttributeSet
    };
    private static final HashMap sConstructorMap = new HashMap();
    private final boolean DEBUG;
    final Object mConstructorArgs[];
    protected final Context mContext;
    private Factory mFactory;
    private Factory2 mFactory2;
    private boolean mFactorySet;
    private Filter mFilter;
    private HashMap mFilterMap;
    private Factory2 mPrivateFactory;

    protected LayoutInflater(Context context)
    {
        DEBUG = false;
        mConstructorArgs = new Object[2];
        mContext = context;
    }

    protected LayoutInflater(LayoutInflater layoutinflater, Context context)
    {
        DEBUG = false;
        mConstructorArgs = new Object[2];
        mContext = context;
        mFactory = layoutinflater.mFactory;
        mFactory2 = layoutinflater.mFactory2;
        mPrivateFactory = layoutinflater.mPrivateFactory;
        mFilter = layoutinflater.mFilter;
    }

    private void failNotAllowed(String s, String s1, AttributeSet attributeset)
    {
        StringBuilder stringbuilder = (new StringBuilder()).append(attributeset.getPositionDescription()).append(": Class not allowed to be inflated ");
        if (s1 != null)
            s = (new StringBuilder()).append(s1).append(s).toString();
        throw new InflateException(stringbuilder.append(s).toString());
    }

    public static LayoutInflater from(Context context)
    {
        LayoutInflater layoutinflater = (LayoutInflater)context.getSystemService("layout_inflater");
        if (layoutinflater == null)
            throw new AssertionError("LayoutInflater not found.");
        else
            return layoutinflater;
    }

    private void parseInclude(XmlPullParser xmlpullparser, View view, AttributeSet attributeset)
        throws XmlPullParserException, IOException
    {
        if (!(view instanceof ViewGroup)) goto _L2; else goto _L1
_L1:
        XmlResourceParser xmlresourceparser;
        int i = attributeset.getAttributeResourceValue(null, "layout", 0);
        if (i == 0)
        {
            String s1 = attributeset.getAttributeValue(null, "layout");
            if (s1 == null)
                throw new InflateException("You must specifiy a layout in the include tag: <include layout=\"@layout/layoutID\" />");
            else
                throw new InflateException((new StringBuilder()).append("You must specifiy a valid layout reference. The layout ID ").append(s1).append(" is not valid.").toString());
        }
        xmlresourceparser = getContext().getResources().getLayout(i);
        AttributeSet attributeset1 = Xml.asAttributeSet(xmlresourceparser);
        int j;
        do
            j = xmlresourceparser.next();
        while (j != 2 && j != 1);
        if (j == 2)
            break MISSING_BLOCK_LABEL_176;
        throw new InflateException((new StringBuilder()).append(xmlresourceparser.getPositionDescription()).append(": No start tag found!").toString());
        Exception exception;
        exception;
        xmlresourceparser.close();
        throw exception;
        String s = xmlresourceparser.getName();
        if (!"merge".equals(s)) goto _L4; else goto _L3
_L3:
        rInflate(xmlresourceparser, view, attributeset1, false);
_L7:
        xmlresourceparser.close();
        int i1 = xmlpullparser.getDepth();
        int j1;
        do
            j1 = xmlpullparser.next();
        while ((j1 != 3 || xmlpullparser.getDepth() > i1) && j1 != 1);
        return;
_L4:
        View view1;
        ViewGroup viewgroup;
        view1 = createViewFromTag(view, s, attributeset1);
        viewgroup = (ViewGroup)view;
        ViewGroup.LayoutParams layoutparams1 = viewgroup.generateLayoutParams(attributeset);
        if (layoutparams1 == null)
            break MISSING_BLOCK_LABEL_289;
        view1.setLayoutParams(layoutparams1);
_L9:
        int k;
        int l;
        rInflate(xmlresourceparser, view1, attributeset1, true);
        TypedArray typedarray = mContext.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.View, 0, 0);
        k = typedarray.getResourceId(8, -1);
        l = typedarray.getInt(20, -1);
        typedarray.recycle();
        if (k == -1) goto _L6; else goto _L5
_L5:
        view1.setId(k);
          goto _L6
_L10:
        viewgroup.addView(view1);
          goto _L7
        RuntimeException runtimeexception;
        runtimeexception;
        ViewGroup.LayoutParams layoutparams = viewgroup.generateLayoutParams(attributeset1);
        if (layoutparams == null) goto _L9; else goto _L8
_L8:
        view1.setLayoutParams(layoutparams);
          goto _L9
        Exception exception1;
        exception1;
        if (true)
            break MISSING_BLOCK_LABEL_404;
        view1.setLayoutParams(null);
        throw exception1;
_L11:
        view1.setVisibility(0);
          goto _L10
_L12:
        view1.setVisibility(4);
          goto _L10
_L13:
        view1.setVisibility(8);
          goto _L10
_L2:
        throw new InflateException("<include /> can only be used inside of a ViewGroup");
_L6:
        l;
        JVM INSTR tableswitch 0 2: default 356
    //                   0 407
    //                   1 416
    //                   2 425;
           goto _L10 _L11 _L12 _L13
    }

    private void parseRequestFocus(XmlPullParser xmlpullparser, View view)
        throws XmlPullParserException, IOException
    {
        view.requestFocus();
        int i = xmlpullparser.getDepth();
        int j;
        do
            j = xmlpullparser.next();
        while ((j != 3 || xmlpullparser.getDepth() > i) && j != 1);
    }

    public abstract LayoutInflater cloneInContext(Context context);

    public final View createView(String s, String s1, AttributeSet attributeset)
        throws ClassNotFoundException, InflateException
    {
        boolean flag;
        Constructor constructor;
        Class class1;
        flag = true;
        constructor = (Constructor)sConstructorMap.get(s);
        class1 = null;
        if (constructor != null) goto _L2; else goto _L1
_L1:
        View view;
        String s4;
        Filter filter;
        Boolean boolean1;
        ClassLoader classloader;
        String s3;
        Object aobj[];
        boolean flag1;
        ClassLoader classloader1;
        try
        {
            classloader1 = mContext.getClassLoader();
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            StringBuilder stringbuilder2 = (new StringBuilder()).append(attributeset.getPositionDescription()).append(": Error inflating class ");
            if (s1 != null)
                s = (new StringBuilder()).append(s1).append(s).toString();
            InflateException inflateexception2 = new InflateException(stringbuilder2.append(s).toString());
            inflateexception2.initCause(nosuchmethodexception);
            throw inflateexception2;
        }
        catch (ClassCastException classcastexception)
        {
            StringBuilder stringbuilder1 = (new StringBuilder()).append(attributeset.getPositionDescription()).append(": Class is not a View ");
            if (s1 != null)
                s = (new StringBuilder()).append(s1).append(s).toString();
            InflateException inflateexception1 = new InflateException(stringbuilder1.append(s).toString());
            inflateexception1.initCause(classcastexception);
            throw inflateexception1;
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            throw classnotfoundexception;
        }
        catch (Exception exception)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append(attributeset.getPositionDescription()).append(": Error inflating class ");
            String s2;
            InflateException inflateexception;
            if (class1 == null)
                s2 = "<unknown>";
            else
                s2 = class1.getName();
            inflateexception = new InflateException(stringbuilder.append(s2).toString());
            inflateexception.initCause(exception);
            throw inflateexception;
        }
        class1 = null;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_585;
        s4 = (new StringBuilder()).append(s1).append(s).toString();
_L13:
        class1 = classloader1.loadClass(s4).asSubclass(android/view/View);
        if (mFilter == null || class1 == null)
            break MISSING_BLOCK_LABEL_106;
        if (!mFilter.onLoadClass(class1))
            failNotAllowed(s, s1, attributeset);
        constructor = class1.getConstructor(mConstructorSignature);
        sConstructorMap.put(s, constructor);
_L6:
        aobj = mConstructorArgs;
        aobj[1] = attributeset;
        view = (View)constructor.newInstance(aobj);
        if (!(view instanceof ViewStub)) goto _L4; else goto _L3
_L3:
        ((ViewStub)view).setLayoutInflater(this);
        return view;
_L2:
        filter = mFilter;
        class1 = null;
        if (filter == null) goto _L6; else goto _L5
_L5:
        boolean1 = (Boolean)mFilterMap.get(s);
        class1 = null;
        if (boolean1 != null)
            break MISSING_BLOCK_LABEL_392;
        classloader = mContext.getClassLoader();
        class1 = null;
        if (s1 == null) goto _L8; else goto _L7
_L7:
        s3 = (new StringBuilder()).append(s1).append(s).toString();
_L10:
        class1 = classloader.loadClass(s3).asSubclass(android/view/View);
        if (class1 == null)
            break MISSING_BLOCK_LABEL_386;
        if (!mFilter.onLoadClass(class1))
            break MISSING_BLOCK_LABEL_386;
_L11:
        mFilterMap.put(s, Boolean.valueOf(flag));
        if (flag) goto _L6; else goto _L9
_L9:
        failNotAllowed(s, s1, attributeset);
          goto _L6
_L8:
        s3 = s;
          goto _L10
        flag = false;
          goto _L11
        flag1 = boolean1.equals(Boolean.FALSE);
        class1 = null;
        if (!flag1) goto _L6; else goto _L12
_L12:
        failNotAllowed(s, s1, attributeset);
        class1 = null;
          goto _L6
_L4:
        return view;
        s4 = s;
          goto _L13
    }

    View createViewFromTag(View view, String s, AttributeSet attributeset)
    {
        if (s.equals("view"))
            s = attributeset.getAttributeValue(null, "class");
        if (mFactory2 == null) goto _L2; else goto _L1
_L1:
        View view1 = mFactory2.onCreateView(view, s, mContext, attributeset);
_L7:
        if (view1 == null)
            try
            {
                if (mPrivateFactory != null)
                    view1 = mPrivateFactory.onCreateView(view, s, mContext, attributeset);
            }
            catch (InflateException inflateexception2)
            {
                throw inflateexception2;
            }
            catch (ClassNotFoundException classnotfoundexception)
            {
                InflateException inflateexception1 = new InflateException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Error inflating class ").append(s).toString());
                inflateexception1.initCause(classnotfoundexception);
                throw inflateexception1;
            }
            catch (Exception exception)
            {
                InflateException inflateexception = new InflateException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Error inflating class ").append(s).toString());
                inflateexception.initCause(exception);
                throw inflateexception;
            }
        if (view1 != null) goto _L4; else goto _L3
_L3:
        if (-1 == s.indexOf('.'))
            return onCreateView(view, s, attributeset);
          goto _L5
_L2:
        View view2;
        if (mFactory != null)
        {
            view1 = mFactory.onCreateView(s, mContext, attributeset);
            continue; /* Loop/switch isn't completed */
        }
        view1 = null;
        continue; /* Loop/switch isn't completed */
_L5:
        view2 = createView(s, null, attributeset);
        return view2;
_L4:
        return view1;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public Context getContext()
    {
        return mContext;
    }

    public final Factory getFactory()
    {
        return mFactory;
    }

    public final Factory2 getFactory2()
    {
        return mFactory2;
    }

    public Filter getFilter()
    {
        return mFilter;
    }

    public View inflate(int i, ViewGroup viewgroup)
    {
        boolean flag;
        if (viewgroup != null)
            flag = true;
        else
            flag = false;
        return inflate(i, viewgroup, flag);
    }

    public View inflate(int i, ViewGroup viewgroup, boolean flag)
    {
        XmlResourceParser xmlresourceparser = getContext().getResources().getLayout(i);
        View view = inflate(((XmlPullParser) (xmlresourceparser)), viewgroup, flag);
        xmlresourceparser.close();
        return view;
        Exception exception;
        exception;
        xmlresourceparser.close();
        throw exception;
    }

    public View inflate(XmlPullParser xmlpullparser, ViewGroup viewgroup)
    {
        boolean flag;
        if (viewgroup != null)
            flag = true;
        else
            flag = false;
        return inflate(xmlpullparser, viewgroup, flag);
    }

    public View inflate(XmlPullParser xmlpullparser, ViewGroup viewgroup, boolean flag)
    {
        Object aobj[] = mConstructorArgs;
        aobj;
        JVM INSTR monitorenter ;
        AttributeSet attributeset;
        Context context;
        attributeset = Xml.asAttributeSet(xmlpullparser);
        context = (Context)mConstructorArgs[0];
        mConstructorArgs[0] = mContext;
        Object obj = viewgroup;
        int i;
        do
            i = xmlpullparser.next();
        while (i != 2 && i != 1);
        if (i == 2)
            break MISSING_BLOCK_LABEL_152;
        throw new InflateException((new StringBuilder()).append(xmlpullparser.getPositionDescription()).append(": No start tag found!").toString());
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        InflateException inflateexception1 = new InflateException(xmlpullparserexception.getMessage());
        inflateexception1.initCause(xmlpullparserexception);
        throw inflateexception1;
        Exception exception1;
        exception1;
        mConstructorArgs[0] = context;
        mConstructorArgs[1] = null;
        throw exception1;
        Exception exception;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
        String s = xmlpullparser.getName();
        if (!"merge".equals(s)) goto _L2; else goto _L1
_L1:
        if (viewgroup != null && flag)
            break MISSING_BLOCK_LABEL_244;
        throw new InflateException("<merge /> can be used only with a valid ViewGroup root and attachToRoot=true");
        IOException ioexception;
        ioexception;
        InflateException inflateexception = new InflateException((new StringBuilder()).append(xmlpullparser.getPositionDescription()).append(": ").append(ioexception.getMessage()).toString());
        inflateexception.initCause(ioexception);
        throw inflateexception;
        rInflate(xmlpullparser, viewgroup, attributeset, false);
_L8:
        mConstructorArgs[0] = context;
        mConstructorArgs[1] = null;
        aobj;
        JVM INSTR monitorexit ;
        return ((View) (obj));
_L2:
        if (!"blink".equals(s)) goto _L4; else goto _L3
_L3:
        Object obj1 = new BlinkLayout(mContext, attributeset);
_L6:
        ViewGroup.LayoutParams layoutparams;
        layoutparams = null;
        if (viewgroup == null)
            break MISSING_BLOCK_LABEL_325;
        layoutparams = viewgroup.generateLayoutParams(attributeset);
        if (flag)
            break MISSING_BLOCK_LABEL_325;
        ((View) (obj1)).setLayoutParams(layoutparams);
        rInflate(xmlpullparser, ((View) (obj1)), attributeset, true);
        if (viewgroup == null || !flag)
            break; /* Loop/switch isn't completed */
        viewgroup.addView(((View) (obj1)), layoutparams);
        break; /* Loop/switch isn't completed */
_L4:
        View view = createViewFromTag(viewgroup, s, attributeset);
        obj1 = view;
        if (true) goto _L6; else goto _L5
_L5:
        if (viewgroup == null || !flag)
            obj = obj1;
        if (true) goto _L8; else goto _L7
_L7:
    }

    protected View onCreateView(View view, String s, AttributeSet attributeset)
        throws ClassNotFoundException
    {
        return onCreateView(s, attributeset);
    }

    protected View onCreateView(String s, AttributeSet attributeset)
        throws ClassNotFoundException
    {
        return createView(s, "android.view.", attributeset);
    }

    void rInflate(XmlPullParser xmlpullparser, View view, AttributeSet attributeset, boolean flag)
        throws XmlPullParserException, IOException
    {
        int i = xmlpullparser.getDepth();
        do
        {
            int j = xmlpullparser.next();
            if (j == 3 && xmlpullparser.getDepth() <= i || j == 1)
                break;
            if (j == 2)
            {
                String s = xmlpullparser.getName();
                if ("requestFocus".equals(s))
                    parseRequestFocus(xmlpullparser, view);
                else
                if ("include".equals(s))
                {
                    if (xmlpullparser.getDepth() == 0)
                        throw new InflateException("<include /> cannot be the root element");
                    parseInclude(xmlpullparser, view, attributeset);
                } else
                {
                    if ("merge".equals(s))
                        throw new InflateException("<merge /> must be the root element");
                    if ("blink".equals(s))
                    {
                        BlinkLayout blinklayout = new BlinkLayout(mContext, attributeset);
                        ViewGroup viewgroup1 = (ViewGroup)view;
                        ViewGroup.LayoutParams layoutparams1 = viewgroup1.generateLayoutParams(attributeset);
                        rInflate(xmlpullparser, ((View) (blinklayout)), attributeset, true);
                        viewgroup1.addView(blinklayout, layoutparams1);
                    } else
                    {
                        View view1 = createViewFromTag(view, s, attributeset);
                        ViewGroup viewgroup = (ViewGroup)view;
                        ViewGroup.LayoutParams layoutparams = viewgroup.generateLayoutParams(attributeset);
                        rInflate(xmlpullparser, view1, attributeset, true);
                        viewgroup.addView(view1, layoutparams);
                    }
                }
            }
        } while (true);
        if (flag)
            view.onFinishInflate();
    }

    public void setFactory(Factory factory)
    {
        if (mFactorySet)
            throw new IllegalStateException("A factory has already been set on this LayoutInflater");
        if (factory == null)
            throw new NullPointerException("Given factory can not be null");
        mFactorySet = true;
        if (mFactory == null)
        {
            mFactory = factory;
            return;
        } else
        {
            mFactory = new FactoryMerger(factory, null, mFactory, mFactory2);
            return;
        }
    }

    public void setFactory2(Factory2 factory2)
    {
        if (mFactorySet)
            throw new IllegalStateException("A factory has already been set on this LayoutInflater");
        if (factory2 == null)
            throw new NullPointerException("Given factory can not be null");
        mFactorySet = true;
        if (mFactory == null)
        {
            mFactory2 = factory2;
            mFactory = factory2;
            return;
        } else
        {
            mFactory = new FactoryMerger(factory2, factory2, mFactory, mFactory2);
            return;
        }
    }

    public void setFilter(Filter filter)
    {
        mFilter = filter;
        if (filter != null)
            mFilterMap = new HashMap();
    }

    public void setPrivateFactory(Factory2 factory2)
    {
        mPrivateFactory = factory2;
    }


    // Unreferenced inner class android/view/LayoutInflater$BlinkLayout$1

/* anonymous class */
    class BlinkLayout._cls1
        implements android.os.Handler.Callback
    {

        final BlinkLayout this$0;

        public boolean handleMessage(Message message)
        {
            if (message.what == 66)
            {
                if (mBlink)
                {
                    BlinkLayout blinklayout = BlinkLayout.this;
                    boolean flag = mBlinkState;
                    boolean flag1 = false;
                    if (!flag)
                        flag1 = true;
                    blinklayout.mBlinkState = flag1;
                    makeBlink();
                }
                invalidate();
                return true;
            } else
            {
                return false;
            }
        }

            
            {
                this$0 = BlinkLayout.this;
                Object();
            }
    }

}
