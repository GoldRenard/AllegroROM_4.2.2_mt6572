// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableMap, Hashing, Collections2, ImmutableSet, 
//            ImmutableCollection, ImmutableEntry, UnmodifiableIterator, AbstractIndexedListIterator

final class RegularImmutableMap extends ImmutableMap
{
    private static class EntrySet extends ImmutableSet.ArrayImmutableSet
    {

        final transient RegularImmutableMap map;

        public boolean contains(Object obj)
        {
            boolean flag = obj instanceof java.util.Map.Entry;
            boolean flag1 = false;
            if (flag)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Object obj1 = map.get(entry.getKey());
                flag1 = false;
                if (obj1 != null)
                {
                    boolean flag2 = obj1.equals(entry.getValue());
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
            }
            return flag1;
        }

        EntrySet(RegularImmutableMap regularimmutablemap)
        {
            super(regularimmutablemap.entries);
            map = regularimmutablemap;
        }
    }

    private static class KeySet extends ImmutableSet.TransformedImmutableSet
    {

        final RegularImmutableMap map;

        public boolean contains(Object obj)
        {
            return map.containsKey(obj);
        }

        boolean isPartialView()
        {
            return true;
        }

        volatile Object transform(Object obj)
        {
            return transform((java.util.Map.Entry)obj);
        }

        Object transform(java.util.Map.Entry entry)
        {
            return entry.getKey();
        }

        KeySet(RegularImmutableMap regularimmutablemap)
        {
            super(regularimmutablemap.entries, regularimmutablemap.keySetHashCode);
            map = regularimmutablemap;
        }
    }

    private static interface LinkedEntry
        extends java.util.Map.Entry
    {

        public abstract LinkedEntry next();
    }

    private static final class NonTerminalEntry extends ImmutableEntry
        implements LinkedEntry
    {

        final LinkedEntry next;

        public LinkedEntry next()
        {
            return next;
        }

        NonTerminalEntry(Object obj, Object obj1, LinkedEntry linkedentry)
        {
            super(obj, obj1);
            next = linkedentry;
        }
    }

    private static final class TerminalEntry extends ImmutableEntry
        implements LinkedEntry
    {

        public LinkedEntry next()
        {
            return null;
        }

        TerminalEntry(Object obj, Object obj1)
        {
            super(obj, obj1);
        }
    }

    private static class Values extends ImmutableCollection
    {

        final RegularImmutableMap map;

        public boolean contains(Object obj)
        {
            return map.containsValue(obj);
        }

        boolean isPartialView()
        {
            return true;
        }

        public UnmodifiableIterator iterator()
        {
            return new AbstractIndexedListIterator(map.entries.length) {

                final Values this$0;

                protected Object get(int i)
                {
                    return map.entries[i].getValue();
                }

            
            {
                this$0 = Values.this;
                super(i);
            }
            }
;
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return map.entries.length;
        }

        Values(RegularImmutableMap regularimmutablemap)
        {
            map = regularimmutablemap;
        }
    }


    private static final long serialVersionUID;
    private final transient LinkedEntry entries[];
    private transient ImmutableSet entrySet;
    private transient ImmutableSet keySet;
    private final transient int keySetHashCode;
    private final transient int mask;
    private final transient LinkedEntry table[];
    private transient ImmutableCollection values;

    transient RegularImmutableMap(java.util.Map.Entry aentry[])
    {
        int i = aentry.length;
        entries = createEntryArray(i);
        int j = chooseTableSize(i);
        table = createEntryArray(j);
        mask = j - 1;
        int k = 0;
        for (int l = 0; l < i; l++)
        {
            java.util.Map.Entry entry = aentry[l];
            Object obj = entry.getKey();
            int i1 = obj.hashCode();
            k += i1;
            int j1 = Hashing.smear(i1) & mask;
            LinkedEntry linkedentry = table[j1];
            LinkedEntry linkedentry1 = newLinkedEntry(obj, entry.getValue(), linkedentry);
            table[j1] = linkedentry1;
            entries[l] = linkedentry1;
            for (; linkedentry != null; linkedentry = linkedentry.next())
            {
                boolean flag;
                if (!obj.equals(linkedentry.getKey()))
                    flag = true;
                else
                    flag = false;
                Preconditions.checkArgument(flag, "duplicate key: %s", new Object[] {
                    obj
                });
            }

        }

        keySetHashCode = k;
    }

    private static int chooseTableSize(int i)
    {
        int j = Integer.highestOneBit(i) << 1;
        boolean flag;
        if (j > 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "table too large: %s", aobj);
        return j;
    }

    private LinkedEntry[] createEntryArray(int i)
    {
        return new LinkedEntry[i];
    }

    private static LinkedEntry newLinkedEntry(Object obj, Object obj1, LinkedEntry linkedentry)
    {
        if (linkedentry == null)
            return new TerminalEntry(obj, obj1);
        else
            return new NonTerminalEntry(obj, obj1, linkedentry);
    }

    public boolean containsValue(Object obj)
    {
        if (obj != null)
        {
            LinkedEntry alinkedentry[] = entries;
            int i = alinkedentry.length;
            for (int j = 0; j < i; j++)
                if (alinkedentry[j].getValue().equals(obj))
                    return true;

        }
        return false;
    }

    public ImmutableSet entrySet()
    {
        Object obj = entrySet;
        if (obj == null)
        {
            obj = new EntrySet(this);
            entrySet = ((ImmutableSet) (obj));
        }
        return ((ImmutableSet) (obj));
    }

    public volatile Set entrySet()
    {
        return entrySet();
    }

    public Object get(Object obj)
    {
        if (obj != null)
        {
            int i = Hashing.smear(obj.hashCode()) & mask;
            for (LinkedEntry linkedentry = table[i]; linkedentry != null; linkedentry = linkedentry.next())
                if (obj.equals(linkedentry.getKey()))
                    return linkedentry.getValue();

        }
        return null;
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return false;
    }

    public ImmutableSet keySet()
    {
        Object obj = keySet;
        if (obj == null)
        {
            obj = new KeySet(this);
            keySet = ((ImmutableSet) (obj));
        }
        return ((ImmutableSet) (obj));
    }

    public volatile Set keySet()
    {
        return keySet();
    }

    public int size()
    {
        return entries.length;
    }

    public String toString()
    {
        StringBuilder stringbuilder = Collections2.newStringBuilderForCollection(size()).append('{');
        Collections2.STANDARD_JOINER.appendTo(stringbuilder, entries);
        return stringbuilder.append('}').toString();
    }

    public ImmutableCollection values()
    {
        Object obj = values;
        if (obj == null)
        {
            obj = new Values(this);
            values = ((ImmutableCollection) (obj));
        }
        return ((ImmutableCollection) (obj));
    }

    public volatile Collection values()
    {
        return values();
    }


}
