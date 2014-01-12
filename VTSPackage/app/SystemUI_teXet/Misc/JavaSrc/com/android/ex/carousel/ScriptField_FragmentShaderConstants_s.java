// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.renderscript.*;
import java.lang.ref.WeakReference;

public class ScriptField_FragmentShaderConstants_s extends android.renderscript.Script.FieldBase
{
    public static class Item
    {

        public static final int sizeof = 8;
        float fadeAmount;
        float overallAlpha;

    }


    private static WeakReference mElementCache = new WeakReference(null);
    private FieldPacker mIOBuffer;
    private Item mItemArray[];

    private ScriptField_FragmentShaderConstants_s(RenderScript renderscript)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
    }

    public ScriptField_FragmentShaderConstants_s(RenderScript renderscript, int i)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i);
    }

    public ScriptField_FragmentShaderConstants_s(RenderScript renderscript, int i, int j)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i, j);
    }

    private void copyToArray(Item item, int i)
    {
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(8 * getType().getX());
        mIOBuffer.reset(i * 8);
        copyToArrayLocal(item, mIOBuffer);
    }

    private void copyToArrayLocal(Item item, FieldPacker fieldpacker)
    {
        fieldpacker.addF32(item.fadeAmount);
        fieldpacker.addF32(item.overallAlpha);
    }

    public static ScriptField_FragmentShaderConstants_s create1D(RenderScript renderscript, int i)
    {
        return create1D(renderscript, i, 1);
    }

    public static ScriptField_FragmentShaderConstants_s create1D(RenderScript renderscript, int i, int j)
    {
        ScriptField_FragmentShaderConstants_s scriptfield_fragmentshaderconstants_s = new ScriptField_FragmentShaderConstants_s(renderscript);
        scriptfield_fragmentshaderconstants_s.mAllocation = Allocation.createSized(renderscript, scriptfield_fragmentshaderconstants_s.mElement, i, j);
        return scriptfield_fragmentshaderconstants_s;
    }

    public static ScriptField_FragmentShaderConstants_s create2D(RenderScript renderscript, int i, int j)
    {
        return create2D(renderscript, i, j, 1);
    }

    public static ScriptField_FragmentShaderConstants_s create2D(RenderScript renderscript, int i, int j, int k)
    {
        ScriptField_FragmentShaderConstants_s scriptfield_fragmentshaderconstants_s = new ScriptField_FragmentShaderConstants_s(renderscript);
        android.renderscript.Type.Builder builder = new android.renderscript.Type.Builder(renderscript, scriptfield_fragmentshaderconstants_s.mElement);
        builder.setX(i);
        builder.setY(j);
        scriptfield_fragmentshaderconstants_s.mAllocation = Allocation.createTyped(renderscript, builder.create(), k);
        return scriptfield_fragmentshaderconstants_s;
    }

    public static ScriptField_FragmentShaderConstants_s createCustom(RenderScript renderscript, android.renderscript.Type.Builder builder, int i)
    {
        ScriptField_FragmentShaderConstants_s scriptfield_fragmentshaderconstants_s = new ScriptField_FragmentShaderConstants_s(renderscript);
        Type type = builder.create();
        if (type.getElement() != scriptfield_fragmentshaderconstants_s.mElement)
        {
            throw new RSIllegalArgumentException("Type.Builder did not match expected element type.");
        } else
        {
            scriptfield_fragmentshaderconstants_s.mAllocation = Allocation.createTyped(renderscript, type, i);
            return scriptfield_fragmentshaderconstants_s;
        }
    }

    public static Element createElement(RenderScript renderscript)
    {
        android.renderscript.Element.Builder builder = new android.renderscript.Element.Builder(renderscript);
        builder.add(Element.F32(renderscript), "fadeAmount");
        builder.add(Element.F32(renderscript), "overallAlpha");
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

    public float get_fadeAmount(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        float f = 0.0F;
_L4:
        this;
        JVM INSTR monitorexit ;
        return f;
_L2:
        f = mItemArray[i].fadeAmount;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public float get_overallAlpha(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        float f = 0.0F;
_L4:
        this;
        JVM INSTR monitorexit ;
        return f;
_L2:
        f = mItemArray[i].overallAlpha;
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
            mIOBuffer = new FieldPacker(8 * getType().getX());
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
            break MISSING_BLOCK_LABEL_68;
        copyToArray(item, i);
        FieldPacker fieldpacker = new FieldPacker(8);
        copyToArrayLocal(item, fieldpacker);
        mAllocation.setFromFieldPacker(i, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_fadeAmount(int i, float f, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(8 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].fadeAmount = f;
        if (!flag)
            break MISSING_BLOCK_LABEL_133;
        mIOBuffer.reset(i * 8);
        mIOBuffer.addF32(f);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addF32(f);
        mAllocation.setFromFieldPacker(i, 0, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_overallAlpha(int i, float f, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(8 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].overallAlpha = f;
        if (!flag)
            break MISSING_BLOCK_LABEL_135;
        mIOBuffer.reset(4 + i * 8);
        mIOBuffer.addF32(f);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addF32(f);
        mAllocation.setFromFieldPacker(i, 1, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

}
