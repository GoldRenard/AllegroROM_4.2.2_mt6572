// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.renderscript.*;
import java.lang.ref.WeakReference;

public class ScriptField_ProgramStore_s extends android.renderscript.Script.FieldBase
{
    public static class Item
    {

        public static final int sizeof = 4;
        ProgramStore programStore;

    }


    private static WeakReference mElementCache = new WeakReference(null);
    private FieldPacker mIOBuffer;
    private Item mItemArray[];

    private ScriptField_ProgramStore_s(RenderScript renderscript)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
    }

    public ScriptField_ProgramStore_s(RenderScript renderscript, int i)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i);
    }

    public ScriptField_ProgramStore_s(RenderScript renderscript, int i, int j)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i, j);
    }

    private void copyToArray(Item item, int i)
    {
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(4 * getType().getX());
        mIOBuffer.reset(i * 4);
        copyToArrayLocal(item, mIOBuffer);
    }

    private void copyToArrayLocal(Item item, FieldPacker fieldpacker)
    {
        fieldpacker.addObj(item.programStore);
    }

    public static ScriptField_ProgramStore_s create1D(RenderScript renderscript, int i)
    {
        return create1D(renderscript, i, 1);
    }

    public static ScriptField_ProgramStore_s create1D(RenderScript renderscript, int i, int j)
    {
        ScriptField_ProgramStore_s scriptfield_programstore_s = new ScriptField_ProgramStore_s(renderscript);
        scriptfield_programstore_s.mAllocation = Allocation.createSized(renderscript, scriptfield_programstore_s.mElement, i, j);
        return scriptfield_programstore_s;
    }

    public static ScriptField_ProgramStore_s create2D(RenderScript renderscript, int i, int j)
    {
        return create2D(renderscript, i, j, 1);
    }

    public static ScriptField_ProgramStore_s create2D(RenderScript renderscript, int i, int j, int k)
    {
        ScriptField_ProgramStore_s scriptfield_programstore_s = new ScriptField_ProgramStore_s(renderscript);
        android.renderscript.Type.Builder builder = new android.renderscript.Type.Builder(renderscript, scriptfield_programstore_s.mElement);
        builder.setX(i);
        builder.setY(j);
        scriptfield_programstore_s.mAllocation = Allocation.createTyped(renderscript, builder.create(), k);
        return scriptfield_programstore_s;
    }

    public static ScriptField_ProgramStore_s createCustom(RenderScript renderscript, android.renderscript.Type.Builder builder, int i)
    {
        ScriptField_ProgramStore_s scriptfield_programstore_s = new ScriptField_ProgramStore_s(renderscript);
        Type type = builder.create();
        if (type.getElement() != scriptfield_programstore_s.mElement)
        {
            throw new RSIllegalArgumentException("Type.Builder did not match expected element type.");
        } else
        {
            scriptfield_programstore_s.mAllocation = Allocation.createTyped(renderscript, type, i);
            return scriptfield_programstore_s;
        }
    }

    public static Element createElement(RenderScript renderscript)
    {
        android.renderscript.Element.Builder builder = new android.renderscript.Element.Builder(renderscript);
        builder.add(Element.PROGRAM_STORE(renderscript), "programStore");
        return builder.create();
    }

    public static android.renderscript.Type.Builder createTypeBuilder(RenderScript renderscript)
    {
        return new android.renderscript.Type.Builder(renderscript, createElement(renderscript));
    }

    public void copyAll()
    {
        this;
        JVM INSTR monitorenter ;
        int i = 0;
_L2:
        if (i >= mItemArray.length)
            break; /* Loop/switch isn't completed */
        copyToArray(mItemArray[i], i);
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        mAllocation.setFromFieldPacker(0, mIOBuffer);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public Item get(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Item item = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return item;
_L2:
        item = mItemArray[i];
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public ProgramStore get_programStore(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        ProgramStore programstore = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return programstore;
_L2:
        programstore = mItemArray[i].programStore;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public void resize(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mItemArray == null) goto _L2; else goto _L1
_L1:
        int j;
        int k;
        j = mItemArray.length;
        k = Math.min(j, i);
        if (i != j) goto _L4; else goto _L3
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        Item aitem[] = new Item[i];
        System.arraycopy(mItemArray, 0, aitem, 0, k);
        mItemArray = aitem;
_L2:
        mAllocation.resize(i);
        if (mIOBuffer != null)
            mIOBuffer = new FieldPacker(4 * getType().getX());
        if (true) goto _L3; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    public void set(Item item, int i, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        mItemArray[i] = item;
        if (!flag)
            break MISSING_BLOCK_LABEL_67;
        copyToArray(item, i);
        FieldPacker fieldpacker = new FieldPacker(4);
        copyToArrayLocal(item, fieldpacker);
        mAllocation.setFromFieldPacker(i, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_programStore(int i, ProgramStore programstore, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(4 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].programStore = programstore;
        if (!flag)
            break MISSING_BLOCK_LABEL_131;
        mIOBuffer.reset(i * 4);
        mIOBuffer.addObj(programstore);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addObj(programstore);
        mAllocation.setFromFieldPacker(i, 0, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

}
