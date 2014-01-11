// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.*;
import android.util.*;
import com.android.internal.view.menu.MenuItemImpl;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.view:
//            ActionProvider, InflateException, Menu, MenuItem, 
//            View, SubMenu

public class MenuInflater
{
    private static class InflatedOnMenuItemClickListener
        implements MenuItem.OnMenuItemClickListener
    {

        private static final Class PARAM_TYPES[] = {
            android/view/MenuItem
        };
        private Method mMethod;
        private Object mRealOwner;

        public boolean onMenuItemClick(MenuItem menuitem)
        {
            try
            {
                if (mMethod.getReturnType() == Boolean.TYPE)
                    return ((Boolean)mMethod.invoke(mRealOwner, new Object[] {
                        menuitem
                    })).booleanValue();
                mMethod.invoke(mRealOwner, new Object[] {
                    menuitem
                });
            }
            catch (Exception exception)
            {
                throw new RuntimeException(exception);
            }
            return true;
        }


        public InflatedOnMenuItemClickListener(Object obj, String s)
        {
            mRealOwner = obj;
            Class class1 = obj.getClass();
            try
            {
                mMethod = class1.getMethod(s, PARAM_TYPES);
                return;
            }
            catch (Exception exception)
            {
                InflateException inflateexception = new InflateException((new StringBuilder()).append("Couldn't resolve menu item onClick handler ").append(s).append(" in class ").append(class1.getName()).toString());
                inflateexception.initCause(exception);
                throw inflateexception;
            }
        }
    }

    private class MenuState
    {

        private static final int defaultGroupId = 0;
        private static final int defaultItemCategory = 0;
        private static final int defaultItemCheckable = 0;
        private static final boolean defaultItemChecked = false;
        private static final boolean defaultItemEnabled = true;
        private static final int defaultItemId = 0;
        private static final int defaultItemOrder = 0;
        private static final boolean defaultItemVisible = true;
        private int groupCategory;
        private int groupCheckable;
        private boolean groupEnabled;
        private int groupId;
        private int groupOrder;
        private boolean groupVisible;
        private ActionProvider itemActionProvider;
        private String itemActionProviderClassName;
        private String itemActionViewClassName;
        private int itemActionViewLayout;
        private boolean itemAdded;
        private char itemAlphabeticShortcut;
        private int itemCategoryOrder;
        private int itemCheckable;
        private boolean itemChecked;
        private boolean itemEnabled;
        private int itemIconResId;
        private int itemId;
        private String itemListenerMethodName;
        private char itemNumericShortcut;
        private int itemShowAsAction;
        private CharSequence itemTitle;
        private CharSequence itemTitleCondensed;
        private boolean itemVisible;
        private Menu menu;
        final MenuInflater this$0;

        private char getShortcut(String s)
        {
            if (s == null)
                return '\0';
            else
                return s.charAt(0);
        }

        private Object newInstance(String s, Class aclass[], Object aobj[])
        {
            Object obj;
            try
            {
                obj = mContext.getClassLoader().loadClass(s).getConstructor(aclass).newInstance(aobj);
            }
            catch (Exception exception)
            {
                Log.w("MenuInflater", (new StringBuilder()).append("Cannot instantiate class: ").append(s).toString(), exception);
                return null;
            }
            return obj;
        }

        private void setItem(MenuItem menuitem)
        {
            MenuItem menuitem1 = menuitem.setChecked(itemChecked).setVisible(itemVisible).setEnabled(itemEnabled);
            boolean flag;
            if (itemCheckable >= 1)
                flag = true;
            else
                flag = false;
            menuitem1.setCheckable(flag).setTitleCondensed(itemTitleCondensed).setIcon(itemIconResId).setAlphabeticShortcut(itemAlphabeticShortcut).setNumericShortcut(itemNumericShortcut);
            if (itemShowAsAction >= 0)
                menuitem.setShowAsAction(itemShowAsAction);
            if (itemListenerMethodName != null)
            {
                if (mContext.isRestricted())
                    throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
                menuitem.setOnMenuItemClickListener(new InflatedOnMenuItemClickListener(mRealOwner, itemListenerMethodName));
            }
            if (menuitem instanceof MenuItemImpl)
            {
                MenuItemImpl menuitemimpl = (MenuItemImpl)menuitem;
                if (itemCheckable >= 2)
                    menuitemimpl.setExclusiveCheckable(true);
            }
            String s = itemActionViewClassName;
            boolean flag1 = false;
            if (s != null)
            {
                menuitem.setActionView((View)newInstance(itemActionViewClassName, MenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, mActionViewConstructorArguments));
                flag1 = true;
            }
            if (itemActionViewLayout > 0)
                if (!flag1)
                    menuitem.setActionView(itemActionViewLayout);
                else
                    Log.w("MenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
            if (itemActionProvider != null)
                menuitem.setActionProvider(itemActionProvider);
        }

        public void addItem()
        {
            itemAdded = true;
            setItem(menu.add(groupId, itemId, itemCategoryOrder, itemTitle));
        }

        public SubMenu addSubMenuItem()
        {
            itemAdded = true;
            SubMenu submenu = menu.addSubMenu(groupId, itemId, itemCategoryOrder, itemTitle);
            setItem(submenu.getItem());
            return submenu;
        }

        public boolean hasAddedItem()
        {
            return itemAdded;
        }

        public void readGroup(AttributeSet attributeset)
        {
            TypedArray typedarray = mContext.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.MenuGroup);
            groupId = typedarray.getResourceId(1, 0);
            groupCategory = typedarray.getInt(3, 0);
            groupOrder = typedarray.getInt(4, 0);
            groupCheckable = typedarray.getInt(5, 0);
            groupVisible = typedarray.getBoolean(2, true);
            groupEnabled = typedarray.getBoolean(0, true);
            typedarray.recycle();
        }

        public void readItem(AttributeSet attributeset)
        {
            TypedArray typedarray = mContext.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.MenuItem);
            itemId = typedarray.getResourceId(2, 0);
            int i = typedarray.getInt(5, groupCategory);
            int j = typedarray.getInt(6, groupOrder);
            itemCategoryOrder = 0xffff0000 & i | 0xffff & j;
            itemTitle = typedarray.getText(7);
            itemTitleCondensed = typedarray.getText(8);
            itemIconResId = typedarray.getResourceId(0, 0);
            itemAlphabeticShortcut = getShortcut(typedarray.getString(9));
            itemNumericShortcut = getShortcut(typedarray.getString(10));
            if (typedarray.hasValue(11))
            {
                int k;
                if (typedarray.getBoolean(11, false))
                    k = 1;
                else
                    k = 0;
                itemCheckable = k;
            } else
            {
                itemCheckable = groupCheckable;
            }
            itemChecked = typedarray.getBoolean(3, false);
            itemVisible = typedarray.getBoolean(4, groupVisible);
            itemEnabled = typedarray.getBoolean(1, groupEnabled);
            itemShowAsAction = typedarray.getInt(13, -1);
            itemListenerMethodName = typedarray.getString(12);
            itemActionViewLayout = typedarray.getResourceId(14, 0);
            itemActionViewClassName = typedarray.getString(15);
            itemActionProviderClassName = typedarray.getString(16);
            boolean flag;
            if (itemActionProviderClassName != null)
                flag = true;
            else
                flag = false;
            if (flag && itemActionViewLayout == 0 && itemActionViewClassName == null)
            {
                itemActionProvider = (ActionProvider)newInstance(itemActionProviderClassName, MenuInflater.ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, mActionProviderConstructorArguments);
            } else
            {
                if (flag)
                    Log.w("MenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                itemActionProvider = null;
            }
            typedarray.recycle();
            itemAdded = false;
        }

        public void resetGroup()
        {
            groupId = 0;
            groupCategory = 0;
            groupOrder = 0;
            groupCheckable = 0;
            groupVisible = true;
            groupEnabled = true;
        }


        public MenuState(Menu menu1)
        {
            this$0 = MenuInflater.this;
            super();
            menu = menu1;
            resetGroup();
        }
    }


    private static final Class ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE[] = ACTION_VIEW_CONSTRUCTOR_SIGNATURE;
    private static final Class ACTION_VIEW_CONSTRUCTOR_SIGNATURE[] = {
        android/content/Context
    };
    private static final String LOG_TAG = "MenuInflater";
    private static final int NO_ID = 0;
    private static final String XML_GROUP = "group";
    private static final String XML_ITEM = "item";
    private static final String XML_MENU = "menu";
    private final Object mActionProviderConstructorArguments[];
    private final Object mActionViewConstructorArguments[];
    private Context mContext;
    private Object mRealOwner;

    public MenuInflater(Context context)
    {
        mContext = context;
        mRealOwner = context;
        mActionViewConstructorArguments = (new Object[] {
            context
        });
        mActionProviderConstructorArguments = mActionViewConstructorArguments;
    }

    public MenuInflater(Context context, Object obj)
    {
        mContext = context;
        mRealOwner = obj;
        mActionViewConstructorArguments = (new Object[] {
            context
        });
        mActionProviderConstructorArguments = mActionViewConstructorArguments;
    }

    private void parseMenu(XmlPullParser xmlpullparser, AttributeSet attributeset, Menu menu)
        throws XmlPullParserException, IOException
    {
        MenuState menustate = new MenuState(menu);
        int i = xmlpullparser.getEventType();
        boolean flag = false;
        String s = null;
        do
        {
            if (i == 2)
            {
                String s3 = xmlpullparser.getName();
                if (s3.equals("menu"))
                    i = xmlpullparser.next();
                else
                    throw new RuntimeException((new StringBuilder()).append("Expecting menu, got ").append(s3).toString());
                break;
            }
            i = xmlpullparser.next();
        } while (i != 1);
        boolean flag1 = false;
        while (!flag1) 
        {
            switch (i)
            {
            default:
                break;

            case 1: // '\001'
                throw new RuntimeException("Unexpected end of document");

            case 3: // '\003'
                String s2 = xmlpullparser.getName();
                if (flag && s2.equals(s))
                {
                    flag = false;
                    s = null;
                } else
                if (s2.equals("group"))
                    menustate.resetGroup();
                else
                if (s2.equals("item"))
                {
                    if (!menustate.hasAddedItem())
                        if (menustate.itemActionProvider != null && menustate.itemActionProvider.hasSubMenu())
                            menustate.addSubMenuItem();
                        else
                            menustate.addItem();
                } else
                if (s2.equals("menu"))
                    flag1 = true;
                break;

            case 2: // '\002'
                if (flag)
                    break;
                String s1 = xmlpullparser.getName();
                if (s1.equals("group"))
                {
                    menustate.readGroup(attributeset);
                    break;
                }
                if (s1.equals("item"))
                {
                    menustate.readItem(attributeset);
                    break;
                }
                if (s1.equals("menu"))
                {
                    parseMenu(xmlpullparser, attributeset, ((Menu) (menustate.addSubMenuItem())));
                } else
                {
                    flag = true;
                    s = s1;
                }
                break;
            }
            i = xmlpullparser.next();
        }
    }

    public void inflate(int i, Menu menu)
    {
        XmlResourceParser xmlresourceparser = null;
        xmlresourceparser = mContext.getResources().getLayout(i);
        parseMenu(xmlresourceparser, Xml.asAttributeSet(xmlresourceparser), menu);
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        return;
        XmlPullParserException xmlpullparserexception;
        xmlpullparserexception;
        throw new InflateException("Error inflating menu XML", xmlpullparserexception);
        Exception exception;
        exception;
        if (xmlresourceparser != null)
            xmlresourceparser.close();
        throw exception;
        IOException ioexception;
        ioexception;
        throw new InflateException("Error inflating menu XML", ioexception);
    }







}
