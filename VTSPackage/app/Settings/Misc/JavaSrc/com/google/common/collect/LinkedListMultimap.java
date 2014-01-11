// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ListMultimap, LinkedHashMultiset, Maps, Multimap, 
//            Multiset, Lists, AbstractMapEntry, Iterators, 
//            Sets, Multisets

public class LinkedListMultimap
    implements ListMultimap, Serializable
{
    private class AsMapEntries extends AbstractSet
    {

        final LinkedListMultimap this$0;

        public Iterator iterator()
        {
            return (new DistinctKeyIterator()). new Iterator() {

                final AsMapEntries this$1;
                final Iterator val$keyIterator;

                public boolean hasNext()
                {
                    return keyIterator.hasNext();
                }

                public volatile Object next()
                {
                    return next();
                }

                public java.util.Map.Entry next()
                {
                    return ((_cls1) (keyIterator.next())). new AbstractMapEntry() {

                        final AsMapEntries._cls1 this$2;
                        final Object val$key;

                        public Object getKey()
                        {
                            return key;
                        }

                        public volatile Object getValue()
                        {
                            return getValue();
                        }

                        public Collection getValue()
                        {
                            return get(key);
                        }

            
            {
                this$2 = final__pcls1;
                key = Object.this;
                super();
            }
                    }
;
                }

                public void remove()
                {
                    keyIterator.remove();
                }

            
            {
                this$1 = final_asmapentries;
                keyIterator = Iterator.this;
                super();
            }
            }
;
        }

        public int size()
        {
            return keyCount.elementSet().size();
        }

        private AsMapEntries()
        {
            this$0 = LinkedListMultimap.this;
            super();
        }

    }

    private class DistinctKeyIterator
        implements Iterator
    {

        Node current;
        Node next;
        final Set seenKeys;
        final LinkedListMultimap this$0;

        public boolean hasNext()
        {
            return next != null;
        }

        public Object next()
        {
            LinkedListMultimap.checkElement(next);
            current = next;
            seenKeys.add(current.key);
            do
                next = next.next;
            while (next != null && !seenKeys.add(next.key));
            return current.key;
        }

        public void remove()
        {
            boolean flag;
            if (current != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            removeAllNodes(current.key);
            current = null;
        }

        private DistinctKeyIterator()
        {
            this$0 = LinkedListMultimap.this;
            super();
            seenKeys = Sets.newHashSetWithExpectedSize(keySet().size());
            next = head;
        }

    }

    private class MultisetView extends AbstractCollection
        implements Multiset
    {

        final LinkedListMultimap this$0;

        public int add(Object obj, int i)
        {
            throw new UnsupportedOperationException();
        }

        public int count(Object obj)
        {
            return keyCount.count(obj);
        }

        public Set elementSet()
        {
            return keySet();
        }

        public Set entrySet()
        {
            return new AbstractSet() {

                final MultisetView this$1;

                public Iterator iterator()
                {
                    return (new DistinctKeyIterator()). new Iterator() {

                        final MultisetView._cls2 this$2;
                        final Iterator val$keyIterator;

                        public boolean hasNext()
                        {
                            return keyIterator.hasNext();
                        }

                        public Multiset.Entry next()
                        {
                            return ((_cls1) (keyIterator.next())). new Multisets.AbstractEntry() {

                                final MultisetView._cls2._cls1 this$3;
                                final Object val$key;

                                public int getCount()
                                {
                                    return keyCount.count(key);
                                }

                                public Object getElement()
                                {
                                    return key;
                                }

            
            {
                this$3 = final__pcls1;
                key = Object.this;
                super();
            }
                            }
;
                        }

                        public volatile Object next()
                        {
                            return next();
                        }

                        public void remove()
                        {
                            keyIterator.remove();
                        }

            
            {
                this$2 = final__pcls2;
                keyIterator = Iterator.this;
                super();
            }
                    }
;
                }

                public int size()
                {
                    return keyCount.elementSet().size();
                }

            
            {
                this$1 = MultisetView.this;
                super();
            }
            }
;
        }

        public boolean equals(Object obj)
        {
            return keyCount.equals(obj);
        }

        public int hashCode()
        {
            return keyCount.hashCode();
        }

        public Iterator iterator()
        {
            return (new NodeIterator()). new Iterator() {

                final MultisetView this$1;
                final Iterator val$nodes;

                public boolean hasNext()
                {
                    return nodes.hasNext();
                }

                public Object next()
                {
                    return ((Node)nodes.next()).key;
                }

                public void remove()
                {
                    nodes.remove();
                }

            
            {
                this$1 = final_multisetview;
                nodes = Iterator.this;
                super();
            }
            }
;
        }

        public int remove(Object obj, int i)
        {
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            int j = count(obj);
            ValueForKeyIterator valueforkeyiterator = new ValueForKeyIterator(obj);
            int k = i;
            do
            {
                int l = k - 1;
                if (k > 0 && valueforkeyiterator.hasNext())
                {
                    valueforkeyiterator.next();
                    valueforkeyiterator.remove();
                    k = l;
                } else
                {
                    return j;
                }
            } while (true);
        }

        public boolean removeAll(Collection collection)
        {
            return Iterators.removeAll(iterator(), collection);
        }

        public boolean retainAll(Collection collection)
        {
            return Iterators.retainAll(iterator(), collection);
        }

        public int setCount(Object obj, int i)
        {
            return Multisets.setCountImpl(this, obj, i);
        }

        public boolean setCount(Object obj, int i, int j)
        {
            return Multisets.setCountImpl(this, obj, i, j);
        }

        public int size()
        {
            return keyCount.size();
        }

        public String toString()
        {
            return keyCount.toString();
        }

        private MultisetView()
        {
            this$0 = LinkedListMultimap.this;
            super();
        }

    }

    private static final class Node
    {

        final Object key;
        Node next;
        Node nextSibling;
        Node previous;
        Node previousSibling;
        Object value;

        public String toString()
        {
            return (new StringBuilder()).append(key).append("=").append(value).toString();
        }

        Node(Object obj, Object obj1)
        {
            key = obj;
            value = obj1;
        }
    }

    private class NodeIterator
        implements ListIterator
    {

        Node current;
        Node next;
        int nextIndex;
        Node previous;
        final LinkedListMultimap this$0;

        public void add(Node node)
        {
            throw new UnsupportedOperationException();
        }

        public volatile void add(Object obj)
        {
            add((Node)obj);
        }

        public boolean hasNext()
        {
            return next != null;
        }

        public boolean hasPrevious()
        {
            return previous != null;
        }

        public Node next()
        {
            LinkedListMultimap.checkElement(next);
            Node node = next;
            current = node;
            previous = node;
            next = next.next;
            nextIndex = 1 + nextIndex;
            return current;
        }

        public volatile Object next()
        {
            return next();
        }

        public int nextIndex()
        {
            return nextIndex;
        }

        public Node previous()
        {
            LinkedListMultimap.checkElement(previous);
            Node node = previous;
            current = node;
            next = node;
            previous = previous.previous;
            nextIndex = -1 + nextIndex;
            return current;
        }

        public volatile Object previous()
        {
            return previous();
        }

        public int previousIndex()
        {
            return -1 + nextIndex;
        }

        public void remove()
        {
            boolean flag;
            if (current != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            if (current != next)
            {
                previous = current.previous;
                nextIndex = -1 + nextIndex;
            } else
            {
                next = current.next;
            }
            removeNode(current);
            current = null;
        }

        public void set(Node node)
        {
            throw new UnsupportedOperationException();
        }

        public volatile void set(Object obj)
        {
            set((Node)obj);
        }

        void setValue(Object obj)
        {
            boolean flag;
            if (current != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            current.value = obj;
        }

        NodeIterator()
        {
            this$0 = LinkedListMultimap.this;
            super();
            next = head;
        }

        NodeIterator(int i)
        {
            this$0 = LinkedListMultimap.this;
            super();
            int j = size();
            Preconditions.checkPositionIndex(i, j);
            if (i >= j / 2)
            {
                previous = tail;
                nextIndex = j;
                int i1 = i;
                do
                {
                    int j1 = i1 + 1;
                    if (i1 >= j)
                        break;
                    previous();
                    i1 = j1;
                } while (true);
            } else
            {
                next = head;
                int k = i;
                do
                {
                    int l = k - 1;
                    if (k <= 0)
                        break;
                    next();
                    k = l;
                } while (true);
            }
            current = null;
        }
    }

    private class ValueForKeyIterator
        implements ListIterator
    {

        Node current;
        final Object key;
        Node next;
        int nextIndex;
        Node previous;
        final LinkedListMultimap this$0;

        public void add(Object obj)
        {
            previous = addNode(key, obj, next);
            nextIndex = 1 + nextIndex;
            current = null;
        }

        public boolean hasNext()
        {
            return next != null;
        }

        public boolean hasPrevious()
        {
            return previous != null;
        }

        public Object next()
        {
            LinkedListMultimap.checkElement(next);
            Node node = next;
            current = node;
            previous = node;
            next = next.nextSibling;
            nextIndex = 1 + nextIndex;
            return current.value;
        }

        public int nextIndex()
        {
            return nextIndex;
        }

        public Object previous()
        {
            LinkedListMultimap.checkElement(previous);
            Node node = previous;
            current = node;
            next = node;
            previous = previous.previousSibling;
            nextIndex = -1 + nextIndex;
            return current.value;
        }

        public int previousIndex()
        {
            return -1 + nextIndex;
        }

        public void remove()
        {
            boolean flag;
            if (current != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            if (current != next)
            {
                previous = current.previousSibling;
                nextIndex = -1 + nextIndex;
            } else
            {
                next = current.nextSibling;
            }
            removeNode(current);
            current = null;
        }

        public void set(Object obj)
        {
            boolean flag;
            if (current != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            current.value = obj;
        }

        ValueForKeyIterator(Object obj)
        {
            this$0 = LinkedListMultimap.this;
            super();
            key = obj;
            next = (Node)keyToKeyHead.get(obj);
        }

        public ValueForKeyIterator(Object obj, int i)
        {
            this$0 = LinkedListMultimap.this;
            super();
            int j = keyCount.count(obj);
            Preconditions.checkPositionIndex(i, j);
            if (i >= j / 2)
            {
                previous = (Node)keyToKeyTail.get(obj);
                nextIndex = j;
                int i1 = i;
                do
                {
                    int j1 = i1 + 1;
                    if (i1 >= j)
                        break;
                    previous();
                    i1 = j1;
                } while (true);
            } else
            {
                next = (Node)keyToKeyHead.get(obj);
                int k = i;
                do
                {
                    int l = k - 1;
                    if (k <= 0)
                        break;
                    next();
                    k = l;
                } while (true);
            }
            key = obj;
            current = null;
        }
    }


    private static final long serialVersionUID;
    private transient List entries;
    private transient Node head;
    private transient Multiset keyCount;
    private transient Set keySet;
    private transient Map keyToKeyHead;
    private transient Map keyToKeyTail;
    private transient Multiset keys;
    private transient Map map;
    private transient Node tail;
    private transient List valuesList;

    LinkedListMultimap()
    {
        keyCount = LinkedHashMultiset.create();
        keyToKeyHead = Maps.newHashMap();
        keyToKeyTail = Maps.newHashMap();
    }

    private LinkedListMultimap(int i)
    {
        keyCount = LinkedHashMultiset.create(i);
        keyToKeyHead = Maps.newHashMapWithExpectedSize(i);
        keyToKeyTail = Maps.newHashMapWithExpectedSize(i);
    }

    private LinkedListMultimap(Multimap multimap)
    {
        this(multimap.keySet().size());
        putAll(multimap);
    }

    private Node addNode(Object obj, Object obj1, Node node)
    {
        Node node1 = new Node(obj, obj1);
        if (head == null)
        {
            tail = node1;
            head = node1;
            keyToKeyHead.put(obj, node1);
            keyToKeyTail.put(obj, node1);
        } else
        if (node == null)
        {
            tail.next = node1;
            node1.previous = tail;
            Node node2 = (Node)keyToKeyTail.get(obj);
            if (node2 == null)
            {
                keyToKeyHead.put(obj, node1);
            } else
            {
                node2.nextSibling = node1;
                node1.previousSibling = node2;
            }
            keyToKeyTail.put(obj, node1);
            tail = node1;
        } else
        {
            node1.previous = node.previous;
            node1.previousSibling = node.previousSibling;
            node1.next = node;
            node1.nextSibling = node;
            if (node.previousSibling == null)
                keyToKeyHead.put(obj, node1);
            else
                node.previousSibling.nextSibling = node1;
            if (node.previous == null)
                head = node1;
            else
                node.previous.next = node1;
            node.previous = node1;
            node.previousSibling = node1;
        }
        keyCount.add(obj);
        return node1;
    }

    private static void checkElement(Object obj)
    {
        if (obj == null)
            throw new NoSuchElementException();
        else
            return;
    }

    public static LinkedListMultimap create()
    {
        return new LinkedListMultimap();
    }

    public static LinkedListMultimap create(int i)
    {
        return new LinkedListMultimap(i);
    }

    public static LinkedListMultimap create(Multimap multimap)
    {
        return new LinkedListMultimap(multimap);
    }

    private static java.util.Map.Entry createEntry(Node node)
    {
        return new AbstractMapEntry(node) {

            final Node val$node;

            public Object getKey()
            {
                return node.key;
            }

            public Object getValue()
            {
                return node.value;
            }

            public Object setValue(Object obj)
            {
                Object obj1 = node.value;
                node.value = obj;
                return obj1;
            }

            
            {
                node = node1;
                super();
            }
        }
;
    }

    private List getCopy(Object obj)
    {
        return Collections.unmodifiableList(Lists.newArrayList(new ValueForKeyIterator(obj)));
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        keyCount = LinkedHashMultiset.create();
        keyToKeyHead = Maps.newHashMap();
        keyToKeyTail = Maps.newHashMap();
        int i = objectinputstream.readInt();
        for (int j = 0; j < i; j++)
            put(objectinputstream.readObject(), objectinputstream.readObject());

    }

    private void removeAllNodes(Object obj)
    {
        for (ValueForKeyIterator valueforkeyiterator = new ValueForKeyIterator(obj); valueforkeyiterator.hasNext(); valueforkeyiterator.remove())
            valueforkeyiterator.next();

    }

    private void removeNode(Node node)
    {
        if (node.previous != null)
            node.previous.next = node.next;
        else
            head = node.next;
        if (node.next != null)
            node.next.previous = node.previous;
        else
            tail = node.previous;
        if (node.previousSibling != null)
            node.previousSibling.nextSibling = node.nextSibling;
        else
        if (node.nextSibling != null)
            keyToKeyHead.put(node.key, node.nextSibling);
        else
            keyToKeyHead.remove(node.key);
        if (node.nextSibling != null)
            node.nextSibling.previousSibling = node.previousSibling;
        else
        if (node.previousSibling != null)
            keyToKeyTail.put(node.key, node.previousSibling);
        else
            keyToKeyTail.remove(node.key);
        keyCount.remove(node.key);
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        objectoutputstream.writeInt(size());
        java.util.Map.Entry entry;
        for (Iterator iterator = entries().iterator(); iterator.hasNext(); objectoutputstream.writeObject(entry.getValue()))
        {
            entry = (java.util.Map.Entry)iterator.next();
            objectoutputstream.writeObject(entry.getKey());
        }

    }

    public Map asMap()
    {
        Object obj = map;
        if (obj == null)
        {
            obj = new AbstractMap() {

                Set entrySet;
                final LinkedListMultimap this$0;

                public boolean containsKey(Object obj1)
                {
                    return LinkedListMultimap.this.containsKey(obj1);
                }

                public Set entrySet()
                {
                    Object obj1 = entrySet;
                    if (obj1 == null)
                    {
                        obj1 = new AsMapEntries();
                        entrySet = ((Set) (obj1));
                    }
                    return ((Set) (obj1));
                }

                public volatile Object get(Object obj1)
                {
                    return get(obj1);
                }

                public Collection get(Object obj1)
                {
                    List list = LinkedListMultimap.this.get(obj1);
                    if (list.isEmpty())
                        list = null;
                    return list;
                }

                public volatile Object remove(Object obj1)
                {
                    return remove(obj1);
                }

                public Collection remove(Object obj1)
                {
                    List list = removeAll(obj1);
                    if (list.isEmpty())
                        list = null;
                    return list;
                }

            
            {
                this$0 = LinkedListMultimap.this;
                super();
            }
            }
;
            map = ((Map) (obj));
        }
        return ((Map) (obj));
    }

    public void clear()
    {
        head = null;
        tail = null;
        keyCount.clear();
        keyToKeyHead.clear();
        keyToKeyTail.clear();
    }

    public boolean containsEntry(Object obj, Object obj1)
    {
        for (ValueForKeyIterator valueforkeyiterator = new ValueForKeyIterator(obj); valueforkeyiterator.hasNext();)
            if (Objects.equal(valueforkeyiterator.next(), obj1))
                return true;

        return false;
    }

    public boolean containsKey(Object obj)
    {
        return keyToKeyHead.containsKey(obj);
    }

    public boolean containsValue(Object obj)
    {
        for (NodeIterator nodeiterator = new NodeIterator(); nodeiterator.hasNext();)
            if (Objects.equal(((Node)nodeiterator.next()).value, obj))
                return true;

        return false;
    }

    public volatile Collection entries()
    {
        return entries();
    }

    public List entries()
    {
        Object obj = entries;
        if (obj == null)
        {
            obj = new AbstractSequentialList() {

                final LinkedListMultimap this$0;

                public ListIterator listIterator(int i)
                {
                    return (new NodeIterator(i)). new ListIterator() {

                        final _cls5 this$1;
                        final ListIterator val$nodes;

                        public volatile void add(Object obj)
                        {
                            add((java.util.Map.Entry)obj);
                        }

                        public void add(java.util.Map.Entry entry)
                        {
                            throw new UnsupportedOperationException();
                        }

                        public boolean hasNext()
                        {
                            return nodes.hasNext();
                        }

                        public boolean hasPrevious()
                        {
                            return nodes.hasPrevious();
                        }

                        public volatile Object next()
                        {
                            return next();
                        }

                        public java.util.Map.Entry next()
                        {
                            return LinkedListMultimap.createEntry((Node)nodes.next());
                        }

                        public int nextIndex()
                        {
                            return nodes.nextIndex();
                        }

                        public volatile Object previous()
                        {
                            return previous();
                        }

                        public java.util.Map.Entry previous()
                        {
                            return LinkedListMultimap.createEntry((Node)nodes.previous());
                        }

                        public int previousIndex()
                        {
                            return nodes.previousIndex();
                        }

                        public void remove()
                        {
                            nodes.remove();
                        }

                        public volatile void set(Object obj)
                        {
                            set((java.util.Map.Entry)obj);
                        }

                        public void set(java.util.Map.Entry entry)
                        {
                            throw new UnsupportedOperationException();
                        }

            
            {
                this$1 = final__pcls5;
                nodes = ListIterator.this;
                super();
            }
                    }
;
                }

                public int size()
                {
                    return keyCount.size();
                }

            
            {
                this$0 = LinkedListMultimap.this;
                super();
            }
            }
;
            entries = ((List) (obj));
        }
        return ((List) (obj));
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof Multimap)
        {
            Multimap multimap = (Multimap)obj;
            return asMap().equals(multimap.asMap());
        } else
        {
            return false;
        }
    }

    public volatile Collection get(Object obj)
    {
        return get(obj);
    }

    public List get(final Object key)
    {
        return new AbstractSequentialList() {

            final LinkedListMultimap this$0;
            final Object val$key;

            public ListIterator listIterator(int i)
            {
                return new ValueForKeyIterator(key, i);
            }

            public boolean removeAll(Collection collection)
            {
                return Iterators.removeAll(iterator(), collection);
            }

            public boolean retainAll(Collection collection)
            {
                return Iterators.retainAll(iterator(), collection);
            }

            public int size()
            {
                return keyCount.count(key);
            }

            
            {
                this$0 = LinkedListMultimap.this;
                key = obj;
                super();
            }
        }
;
    }

    public int hashCode()
    {
        return asMap().hashCode();
    }

    public boolean isEmpty()
    {
        return head == null;
    }

    public Set keySet()
    {
        Object obj = keySet;
        if (obj == null)
        {
            obj = new AbstractSet() {

                final LinkedListMultimap this$0;

                public boolean contains(Object obj1)
                {
                    return keyCount.contains(obj1);
                }

                public Iterator iterator()
                {
                    return new DistinctKeyIterator();
                }

                public boolean removeAll(Collection collection)
                {
                    Preconditions.checkNotNull(collection);
                    return super.removeAll(collection);
                }

                public int size()
                {
                    return keyCount.elementSet().size();
                }

            
            {
                this$0 = LinkedListMultimap.this;
                super();
            }
            }
;
            keySet = ((Set) (obj));
        }
        return ((Set) (obj));
    }

    public Multiset keys()
    {
        Object obj = keys;
        if (obj == null)
        {
            obj = new MultisetView();
            keys = ((Multiset) (obj));
        }
        return ((Multiset) (obj));
    }

    public boolean put(Object obj, Object obj1)
    {
        addNode(obj, obj1, null);
        return true;
    }

    public boolean putAll(Multimap multimap)
    {
        boolean flag = false;
        for (Iterator iterator = multimap.entries().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            flag |= put(entry.getKey(), entry.getValue());
        }

        return flag;
    }

    public boolean putAll(Object obj, Iterable iterable)
    {
        boolean flag = false;
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
            flag |= put(obj, iterator.next());

        return flag;
    }

    public boolean remove(Object obj, Object obj1)
    {
        for (ValueForKeyIterator valueforkeyiterator = new ValueForKeyIterator(obj); valueforkeyiterator.hasNext();)
            if (Objects.equal(valueforkeyiterator.next(), obj1))
            {
                valueforkeyiterator.remove();
                return true;
            }

        return false;
    }

    public volatile Collection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public List removeAll(Object obj)
    {
        List list = getCopy(obj);
        removeAllNodes(obj);
        return list;
    }

    public volatile Collection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public List replaceValues(Object obj, Iterable iterable)
    {
        List list = getCopy(obj);
        ValueForKeyIterator valueforkeyiterator = new ValueForKeyIterator(obj);
        Iterator iterator;
        for (iterator = iterable.iterator(); valueforkeyiterator.hasNext() && iterator.hasNext(); valueforkeyiterator.set(iterator.next()))
            valueforkeyiterator.next();

        for (; valueforkeyiterator.hasNext(); valueforkeyiterator.remove())
            valueforkeyiterator.next();

        for (; iterator.hasNext(); valueforkeyiterator.add(iterator.next()));
        return list;
    }

    public int size()
    {
        return keyCount.size();
    }

    public String toString()
    {
        return asMap().toString();
    }

    public volatile Collection values()
    {
        return values();
    }

    public List values()
    {
        Object obj = valuesList;
        if (obj == null)
        {
            obj = new AbstractSequentialList() {

                final LinkedListMultimap this$0;

                public ListIterator listIterator(int i)
                {
                    return (new NodeIterator(i)). new ListIterator() {

                        final _cls3 this$1;
                        final NodeIterator val$nodes;

                        public void add(Object obj)
                        {
                            throw new UnsupportedOperationException();
                        }

                        public boolean hasNext()
                        {
                            return nodes.hasNext();
                        }

                        public boolean hasPrevious()
                        {
                            return nodes.hasPrevious();
                        }

                        public Object next()
                        {
                            return nodes.next().value;
                        }

                        public int nextIndex()
                        {
                            return nodes.nextIndex();
                        }

                        public Object previous()
                        {
                            return nodes.previous().value;
                        }

                        public int previousIndex()
                        {
                            return nodes.previousIndex();
                        }

                        public void remove()
                        {
                            nodes.remove();
                        }

                        public void set(Object obj)
                        {
                            nodes.setValue(obj);
                        }

            
            {
                this$1 = final__pcls3;
                nodes = NodeIterator.this;
                super();
            }
                    }
;
                }

                public int size()
                {
                    return keyCount.size();
                }

            
            {
                this$0 = LinkedListMultimap.this;
                super();
            }
            }
;
            valuesList = ((List) (obj));
        }
        return ((List) (obj));
    }










}
