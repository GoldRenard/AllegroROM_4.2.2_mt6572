// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractSortedMultiset, GeneralRange, Ordering, Iterables, 
//            BstCountBasedBalancePolicies, BstMutationRule, BstNode, BstOperations, 
//            BstMutationResult, BstInOrderPath, Serialization, BstRangeOps, 
//            BstSide, BstAggregate, BstNodeFactory, BstPathFactory, 
//            SortedMultiset, BoundType, BstModifier, BstModificationResult, 
//            AbstractLinkedIterator

public final class TreeMultiset extends AbstractSortedMultiset
    implements Serializable
{
    private final class AddModifier extends MultisetModifier
    {

        private final int countToAdd;
        final TreeMultiset this$0;

        int newCount(int i)
        {
            boolean flag;
            if (countToAdd <= 0x7fffffff - i)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag, "Cannot add this many elements");
            return i + countToAdd;
        }

        private AddModifier(int i)
        {
            this$0 = TreeMultiset.this;
            super();
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            countToAdd = i;
        }

    }

    private final class ConditionalSetCountModifier extends MultisetModifier
    {

        private final int expectedCount;
        private final int setCount;
        final TreeMultiset this$0;

        int newCount(int i)
        {
            if (i == expectedCount)
                i = setCount;
            return i;
        }

        private ConditionalSetCountModifier(int i, int j)
        {
            boolean flag = true;
            this$0 = TreeMultiset.this;
            super();
            boolean flag1;
            if (j >= 0)
                flag1 = flag;
            else
                flag1 = false;
            if (i < 0)
                flag = false;
            Preconditions.checkArgument(flag & flag1);
            expectedCount = i;
            setCount = j;
        }

    }

    class LiveEntry extends Multisets.AbstractEntry
    {

        private int count;
        private final Object element;
        private Node expectedRoot;
        final TreeMultiset this$0;

        public int getCount()
        {
            if (rootReference.get() == expectedRoot)
            {
                return count;
            } else
            {
                expectedRoot = (Node)rootReference.get();
                int i = TreeMultiset.this.count(element);
                count = i;
                return i;
            }
        }

        public Object getElement()
        {
            return element;
        }

        private LiveEntry(Object obj, int i)
        {
            this$0 = TreeMultiset.this;
            super();
            expectedRoot = (Node)rootReference.get();
            element = obj;
            count = i;
        }

    }

    private abstract class MultisetModifier
        implements BstModifier
    {

        final TreeMultiset this$0;

        public volatile BstModificationResult modify(Object obj, BstNode bstnode)
        {
            return modify(obj, (Node)bstnode);
        }

        public BstModificationResult modify(Object obj, Node node)
        {
            int i = TreeMultiset.countOrZero(node);
            int j = newCount(i);
            if (i == j)
                return BstModificationResult.identity(node);
            if (j == 0)
                return BstModificationResult.rebalancingChange(node, null);
            if (i == 0)
                return BstModificationResult.rebalancingChange(null, new Node(obj, j));
            else
                return BstModificationResult.rebuildingChange(node, new Node(node.getKey(), j));
        }

        abstract int newCount(int i);

        private MultisetModifier()
        {
            this$0 = TreeMultiset.this;
            super();
        }

    }

    private static final class Node extends BstNode
        implements Serializable
    {

        private static final long serialVersionUID;
        private final int distinct;
        private final long size;

        int elemCount()
        {
            return Ints.checkedCast(size - TreeMultiset.sizeOrZero((Node)childOrNull(BstSide.LEFT)) - TreeMultiset.sizeOrZero((Node)childOrNull(BstSide.RIGHT)));
        }



        private Node(Object obj, int i)
        {
            this(obj, i, null, null);
        }


        private Node(Object obj, int i, Node node, Node node1)
        {
            super(obj, node, node1);
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            size = (long)i + TreeMultiset.sizeOrZero(node) + TreeMultiset.sizeOrZero(node1);
            distinct = 1 + TreeMultiset.distinctOrZero(node) + TreeMultiset.distinctOrZero(node1);
        }

    }

    static final class Reference
    {

        Object value;

        public boolean compareAndSet(Object obj, Object obj1)
        {
            if (value == obj)
            {
                value = obj1;
                return true;
            } else
            {
                return false;
            }
        }

        public Object get()
        {
            return value;
        }

    }

    private final class RemoveModifier extends MultisetModifier
    {

        private final int countToRemove;
        final TreeMultiset this$0;

        int newCount(int i)
        {
            return Math.max(0, i - countToRemove);
        }

        private RemoveModifier(int i)
        {
            this$0 = TreeMultiset.this;
            super();
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            countToRemove = i;
        }

    }

    private final class SetCountModifier extends MultisetModifier
    {

        private final int countToSet;
        final TreeMultiset this$0;

        int newCount(int i)
        {
            return countToSet;
        }

        private SetCountModifier(int i)
        {
            this$0 = TreeMultiset.this;
            super();
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            countToSet = i;
        }

    }


    private static final BstAggregate DISTINCT_AGGREGATE = new BstAggregate() {

        public volatile int entryValue(BstNode bstnode)
        {
            return entryValue((Node)bstnode);
        }

        public int entryValue(Node node)
        {
            return 1;
        }

        public volatile long treeValue(BstNode bstnode)
        {
            return treeValue((Node)bstnode);
        }

        public long treeValue(Node node)
        {
            return (long)TreeMultiset.distinctOrZero(node);
        }

    }
;
    private static final BstNodeFactory NODE_FACTORY = new BstNodeFactory() {

        public volatile BstNode createNode(BstNode bstnode, BstNode bstnode1, BstNode bstnode2)
        {
            return createNode((Node)bstnode, (Node)bstnode1, (Node)bstnode2);
        }

        public Node createNode(Node node, Node node1, Node node2)
        {
            return new Node(node.getKey(), node.elemCount(), node1, node2);
        }

    }
;
    private static final BstAggregate SIZE_AGGREGATE = new BstAggregate() {

        public volatile int entryValue(BstNode bstnode)
        {
            return entryValue((Node)bstnode);
        }

        public int entryValue(Node node)
        {
            return node.elemCount();
        }

        public volatile long treeValue(BstNode bstnode)
        {
            return treeValue((Node)bstnode);
        }

        public long treeValue(Node node)
        {
            return TreeMultiset.sizeOrZero(node);
        }

    }
;
    private static final long serialVersionUID = 1L;
    private final transient GeneralRange range;
    private final transient Reference rootReference;

    private TreeMultiset(GeneralRange generalrange, Reference reference)
    {
        super(generalrange.comparator());
        range = generalrange;
        rootReference = reference;
    }

    private TreeMultiset(Comparator comparator1)
    {
        super(comparator1);
        range = GeneralRange.all(comparator1);
        rootReference = new Reference();
    }

    private static int countOrZero(Node node)
    {
        if (node == null)
            return 0;
        else
            return node.elemCount();
    }

    public static TreeMultiset create()
    {
        return new TreeMultiset(Ordering.natural());
    }

    public static TreeMultiset create(Iterable iterable)
    {
        TreeMultiset treemultiset = create();
        Iterables.addAll(treemultiset, iterable);
        return treemultiset;
    }

    public static TreeMultiset create(Comparator comparator1)
    {
        if (comparator1 == null)
            return new TreeMultiset(Ordering.natural());
        else
            return new TreeMultiset(comparator1);
    }

    private BstAggregate distinctAggregate()
    {
        return DISTINCT_AGGREGATE;
    }

    private static int distinctOrZero(Node node)
    {
        if (node == null)
            return 0;
        else
            return node.distinct;
    }

    private Iterator iteratorInDirection(final BstInOrderPath final_bstinorderpath, BstSide bstside)
    {
        return new Iterator() {

            final TreeMultiset this$0;
            Object toRemove;
            final Iterator val$pathIterator;

            public boolean hasNext()
            {
                return pathIterator.hasNext();
            }

            public Multiset.Entry next()
            {
                BstInOrderPath bstinorderpath = (BstInOrderPath)pathIterator.next();
                TreeMultiset treemultiset = TreeMultiset.this;
                Object obj = ((Node)bstinorderpath.getTip()).getKey();
                toRemove = obj;
                return treemultiset. new LiveEntry(obj, ((Node)bstinorderpath.getTip()).elemCount());
            }

            public volatile Object next()
            {
                return next();
            }

            public void remove()
            {
                boolean flag;
                if (toRemove != null)
                    flag = true;
                else
                    flag = false;
                Preconditions.checkState(flag);
                setCount(toRemove, 0);
                toRemove = null;
            }

            
            {
                this$0 = TreeMultiset.this;
                pathIterator = iterator1;
                super();
                toRemove = null;
            }
        }
;
    }

    private int mutate(Object obj, MultisetModifier multisetmodifier)
    {
        BstMutationRule bstmutationrule = BstMutationRule.createRule(multisetmodifier, BstCountBasedBalancePolicies.singleRebalancePolicy(distinctAggregate()), nodeFactory());
        BstMutationResult bstmutationresult = BstOperations.mutate(comparator(), bstmutationrule, (BstNode)rootReference.get(), obj);
        if (!rootReference.compareAndSet(bstmutationresult.getOriginalRoot(), bstmutationresult.getChangedRoot()))
            throw new ConcurrentModificationException();
        else
            return countOrZero((Node)bstmutationresult.getOriginalTarget());
    }

    private BstNodeFactory nodeFactory()
    {
        return NODE_FACTORY;
    }

    private BstPathFactory pathFactory()
    {
        return BstInOrderPath.inOrderFactory();
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        Comparator comparator1 = (Comparator)objectinputstream.readObject();
        Serialization.getFieldSetter(com/google/common/collect/AbstractSortedMultiset, "comparator").set(this, comparator1);
        Serialization.getFieldSetter(com/google/common/collect/TreeMultiset, "range").set(this, GeneralRange.all(comparator1));
        Serialization.getFieldSetter(com/google/common/collect/TreeMultiset, "rootReference").set(this, new Reference());
        Serialization.populateMultiset(this, objectinputstream);
    }

    private BstAggregate sizeAggregate()
    {
        return SIZE_AGGREGATE;
    }

    private static long sizeOrZero(Node node)
    {
        if (node == null)
            return 0L;
        else
            return node.size;
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        objectoutputstream.writeObject(elementSet().comparator());
        Serialization.writeMultiset(this, objectoutputstream);
    }

    public int add(Object obj, int i)
    {
        checkElement(obj);
        if (i == 0)
        {
            return count(obj);
        } else
        {
            Preconditions.checkArgument(range.contains(obj));
            return mutate(obj, new AddModifier(i));
        }
    }

    public volatile boolean add(Object obj)
    {
        return super.add(obj);
    }

    public volatile boolean addAll(Collection collection)
    {
        return super.addAll(collection);
    }

    Object checkElement(Object obj)
    {
        return obj;
    }

    public void clear()
    {
        Node node = (Node)rootReference.get();
        Node node1 = (Node)BstRangeOps.minusRange(range, BstCountBasedBalancePolicies.fullRebalancePolicy(distinctAggregate()), nodeFactory(), node);
        if (!rootReference.compareAndSet(node, node1))
            throw new ConcurrentModificationException();
        else
            return;
    }

    public Comparator comparator()
    {
        return super.comparator();
    }

    public volatile boolean contains(Object obj)
    {
        return super.contains(obj);
    }

    public int count(Object obj)
    {
label0:
        {
            int i;
            try
            {
                Object obj1 = checkElement(obj);
                if (!range.contains(obj1))
                    break label0;
                i = countOrZero((Node)BstOperations.seek(comparator(), (BstNode)rootReference.get(), obj1));
            }
            catch (ClassCastException classcastexception)
            {
                return 0;
            }
            catch (NullPointerException nullpointerexception)
            {
                return 0;
            }
            return i;
        }
        return 0;
    }

    Iterator descendingEntryIterator()
    {
        Node node = (Node)rootReference.get();
        return iteratorInDirection((BstInOrderPath)BstRangeOps.furthestPath(range, BstSide.RIGHT, pathFactory(), node), BstSide.LEFT);
    }

    public volatile SortedMultiset descendingMultiset()
    {
        return super.descendingMultiset();
    }

    int distinctElements()
    {
        Node node = (Node)rootReference.get();
        return Ints.checkedCast(BstRangeOps.totalInRange(distinctAggregate(), range, node));
    }

    public volatile SortedSet elementSet()
    {
        return super.elementSet();
    }

    Iterator entryIterator()
    {
        Node node = (Node)rootReference.get();
        return iteratorInDirection((BstInOrderPath)BstRangeOps.furthestPath(range, BstSide.LEFT, pathFactory(), node), BstSide.RIGHT);
    }

    public volatile Set entrySet()
    {
        return super.entrySet();
    }

    public volatile boolean equals(Object obj)
    {
        return super.equals(obj);
    }

    public volatile Multiset.Entry firstEntry()
    {
        return super.firstEntry();
    }

    public volatile int hashCode()
    {
        return super.hashCode();
    }

    public SortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        Preconditions.checkNotNull(obj);
        return new TreeMultiset(range.intersect(GeneralRange.upTo(super.comparator, obj, boundtype)), rootReference);
    }

    public volatile boolean isEmpty()
    {
        return super.isEmpty();
    }

    public Iterator iterator()
    {
        return super.iterator();
    }

    public volatile Multiset.Entry lastEntry()
    {
        return super.lastEntry();
    }

    public volatile Multiset.Entry pollFirstEntry()
    {
        return super.pollFirstEntry();
    }

    public volatile Multiset.Entry pollLastEntry()
    {
        return super.pollLastEntry();
    }

    public int remove(Object obj, int i)
    {
        if (obj != null) goto _L2; else goto _L1
_L1:
        return 0;
_L2:
        if (i == 0)
            return count(obj);
        Object obj1 = checkElement(obj);
        if (!range.contains(obj1)) goto _L1; else goto _L3
_L3:
        int j = mutate(obj1, new RemoveModifier(i));
        return j;
        ClassCastException classcastexception;
        classcastexception;
        return 0;
    }

    public volatile boolean remove(Object obj)
    {
        return super.remove(obj);
    }

    public volatile boolean removeAll(Collection collection)
    {
        return super.removeAll(collection);
    }

    public volatile boolean retainAll(Collection collection)
    {
        return super.retainAll(collection);
    }

    public int setCount(Object obj, int i)
    {
        checkElement(obj);
        Preconditions.checkArgument(range.contains(obj));
        return mutate(obj, new SetCountModifier(i));
    }

    public boolean setCount(Object obj, int i, int j)
    {
        checkElement(obj);
        Preconditions.checkArgument(range.contains(obj));
        return mutate(obj, new ConditionalSetCountModifier(i, j)) == i;
    }

    public int size()
    {
        Node node = (Node)rootReference.get();
        return Ints.saturatedCast(BstRangeOps.totalInRange(sizeAggregate(), range, node));
    }

    public volatile SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
    {
        return super.subMultiset(obj, boundtype, obj1, boundtype1);
    }

    public SortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        Preconditions.checkNotNull(obj);
        return new TreeMultiset(range.intersect(GeneralRange.downTo(super.comparator, obj, boundtype)), rootReference);
    }

    public volatile String toString()
    {
        return super.toString();
    }







    // Unreferenced inner class com/google/common/collect/TreeMultiset$1

/* anonymous class */
    class _cls1 extends AbstractLinkedIterator
    {

        final TreeMultiset this$0;
        final BstSide val$direction;

        protected BstInOrderPath computeNext(BstInOrderPath bstinorderpath)
        {
            if (!bstinorderpath.hasNext(direction))
                return null;
            BstInOrderPath bstinorderpath1 = bstinorderpath.next(direction);
            if (!range.contains(((Node)bstinorderpath1.getTip()).getKey()))
                bstinorderpath1 = null;
            return bstinorderpath1;
        }

        protected volatile Object computeNext(Object obj)
        {
            return computeNext((BstInOrderPath)obj);
        }

            
            {
                this$0 = TreeMultiset.this;
                direction = bstside;
                super(final_bstinorderpath);
            }
    }

}
