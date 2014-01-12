// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.*;
import java.lang.reflect.Field;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multimap, Multiset

final class Serialization
{
    static final class FieldSetter
    {

        private final Field field;

        void set(Object obj, int i)
        {
            try
            {
                field.set(obj, Integer.valueOf(i));
                return;
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                throw new AssertionError(illegalaccessexception);
            }
        }

        void set(Object obj, Object obj1)
        {
            try
            {
                field.set(obj, obj1);
                return;
            }
            catch (IllegalAccessException illegalaccessexception)
            {
                throw new AssertionError(illegalaccessexception);
            }
        }

        private FieldSetter(Field field1)
        {
            field = field1;
            field1.setAccessible(true);
        }

    }


    private Serialization()
    {
    }

    static FieldSetter getFieldSetter(Class class1, String s)
    {
        FieldSetter fieldsetter;
        try
        {
            fieldsetter = new FieldSetter(class1.getDeclaredField(s));
        }
        catch (NoSuchFieldException nosuchfieldexception)
        {
            throw new AssertionError(nosuchfieldexception);
        }
        return fieldsetter;
    }

    static void populateMap(Map map, ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        populateMap(map, objectinputstream, objectinputstream.readInt());
    }

    static void populateMap(Map map, ObjectInputStream objectinputstream, int i)
        throws IOException, ClassNotFoundException
    {
        for (int j = 0; j < i; j++)
            map.put(objectinputstream.readObject(), objectinputstream.readObject());

    }

    static void populateMultimap(Multimap multimap, ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        populateMultimap(multimap, objectinputstream, objectinputstream.readInt());
    }

    static void populateMultimap(Multimap multimap, ObjectInputStream objectinputstream, int i)
        throws IOException, ClassNotFoundException
    {
        for (int j = 0; j < i; j++)
        {
            Collection collection = multimap.get(objectinputstream.readObject());
            int k = objectinputstream.readInt();
            for (int l = 0; l < k; l++)
                collection.add(objectinputstream.readObject());

        }

    }

    static void populateMultiset(Multiset multiset, ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        populateMultiset(multiset, objectinputstream, objectinputstream.readInt());
    }

    static void populateMultiset(Multiset multiset, ObjectInputStream objectinputstream, int i)
        throws IOException, ClassNotFoundException
    {
        for (int j = 0; j < i; j++)
            multiset.add(objectinputstream.readObject(), objectinputstream.readInt());

    }

    static int readCount(ObjectInputStream objectinputstream)
        throws IOException
    {
        return objectinputstream.readInt();
    }

    static void writeMap(Map map, ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.writeInt(map.size());
        java.util.Map.Entry entry;
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); objectoutputstream.writeObject(entry.getValue()))
        {
            entry = (java.util.Map.Entry)iterator.next();
            objectoutputstream.writeObject(entry.getKey());
        }

    }

    static void writeMultimap(Multimap multimap, ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.writeInt(multimap.asMap().size());
        for (Iterator iterator = multimap.asMap().entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            objectoutputstream.writeObject(entry.getKey());
            objectoutputstream.writeInt(((Collection)entry.getValue()).size());
            Iterator iterator1 = ((Collection)entry.getValue()).iterator();
            while (iterator1.hasNext()) 
                objectoutputstream.writeObject(iterator1.next());
        }

    }

    static void writeMultiset(Multiset multiset, ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.writeInt(multiset.entrySet().size());
        Multiset.Entry entry;
        for (Iterator iterator = multiset.entrySet().iterator(); iterator.hasNext(); objectoutputstream.writeInt(entry.getCount()))
        {
            entry = (Multiset.Entry)iterator.next();
            objectoutputstream.writeObject(entry.getElement());
        }

    }
}
