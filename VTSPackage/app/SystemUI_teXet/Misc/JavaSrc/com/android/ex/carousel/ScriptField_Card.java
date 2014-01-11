// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.renderscript.*;
import java.lang.ref.WeakReference;

public class ScriptField_Card extends android.renderscript.Script.FieldBase
{
    public static class Item
    {

        public static final int sizeof = 160;
        int cardVisible;
        Float2 detailLineOffset;
        Allocation detailTexture;
        Float2 detailTextureOffset;
        Float2 detailTexturePosition[];
        int detailTextureState;
        long detailTextureTimeStamp;
        int detailVisible;
        Mesh geometry;
        int geometryState;
        long geometryTimeStamp;
        Matrix4f matrix;
        int shouldPrefetch;
        Allocation texture;
        int textureState;
        long textureTimeStamp;

        Item()
        {
            detailTextureOffset = new Float2();
            detailLineOffset = new Float2();
            detailTexturePosition = new Float2[2];
            for (int i = 0; i < 2; i++)
                detailTexturePosition[i] = new Float2();

            matrix = new Matrix4f();
        }
    }


    private static WeakReference mElementCache = new WeakReference(null);
    private FieldPacker mIOBuffer;
    private Item mItemArray[];

    private ScriptField_Card(RenderScript renderscript)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
    }

    public ScriptField_Card(RenderScript renderscript, int i)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i);
    }

    public ScriptField_Card(RenderScript renderscript, int i, int j)
    {
        mItemArray = null;
        mIOBuffer = null;
        mElement = createElement(renderscript);
        init(renderscript, i, j);
    }

    private void copyToArray(Item item, int i)
    {
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        mIOBuffer.reset(i * 160);
        copyToArrayLocal(item, mIOBuffer);
    }

    private void copyToArrayLocal(Item item, FieldPacker fieldpacker)
    {
        fieldpacker.addObj(item.texture);
        fieldpacker.addObj(item.detailTexture);
        fieldpacker.addF32(item.detailTextureOffset);
        fieldpacker.addF32(item.detailLineOffset);
        for (int i = 0; i < 2; i++)
            fieldpacker.addF32(item.detailTexturePosition[i]);

        fieldpacker.addObj(item.geometry);
        fieldpacker.addMatrix(item.matrix);
        fieldpacker.addI32(item.textureState);
        fieldpacker.addI32(item.detailTextureState);
        fieldpacker.addI32(item.geometryState);
        fieldpacker.addI32(item.cardVisible);
        fieldpacker.addI32(item.detailVisible);
        fieldpacker.addI32(item.shouldPrefetch);
        fieldpacker.skip(4);
        fieldpacker.addI64(item.textureTimeStamp);
        fieldpacker.addI64(item.detailTextureTimeStamp);
        fieldpacker.addI64(item.geometryTimeStamp);
    }

    public static ScriptField_Card create1D(RenderScript renderscript, int i)
    {
        return create1D(renderscript, i, 1);
    }

    public static ScriptField_Card create1D(RenderScript renderscript, int i, int j)
    {
        ScriptField_Card scriptfield_card = new ScriptField_Card(renderscript);
        scriptfield_card.mAllocation = Allocation.createSized(renderscript, scriptfield_card.mElement, i, j);
        return scriptfield_card;
    }

    public static ScriptField_Card create2D(RenderScript renderscript, int i, int j)
    {
        return create2D(renderscript, i, j, 1);
    }

    public static ScriptField_Card create2D(RenderScript renderscript, int i, int j, int k)
    {
        ScriptField_Card scriptfield_card = new ScriptField_Card(renderscript);
        android.renderscript.Type.Builder builder = new android.renderscript.Type.Builder(renderscript, scriptfield_card.mElement);
        builder.setX(i);
        builder.setY(j);
        scriptfield_card.mAllocation = Allocation.createTyped(renderscript, builder.create(), k);
        return scriptfield_card;
    }

    public static ScriptField_Card createCustom(RenderScript renderscript, android.renderscript.Type.Builder builder, int i)
    {
        ScriptField_Card scriptfield_card = new ScriptField_Card(renderscript);
        Type type = builder.create();
        if (type.getElement() != scriptfield_card.mElement)
        {
            throw new RSIllegalArgumentException("Type.Builder did not match expected element type.");
        } else
        {
            scriptfield_card.mAllocation = Allocation.createTyped(renderscript, type, i);
            return scriptfield_card;
        }
    }

    public static Element createElement(RenderScript renderscript)
    {
        android.renderscript.Element.Builder builder = new android.renderscript.Element.Builder(renderscript);
        builder.add(Element.ALLOCATION(renderscript), "texture");
        builder.add(Element.ALLOCATION(renderscript), "detailTexture");
        builder.add(Element.F32_2(renderscript), "detailTextureOffset");
        builder.add(Element.F32_2(renderscript), "detailLineOffset");
        builder.add(Element.F32_2(renderscript), "detailTexturePosition", 2);
        builder.add(Element.MESH(renderscript), "geometry");
        builder.add(Element.MATRIX_4X4(renderscript), "matrix");
        builder.add(Element.I32(renderscript), "textureState");
        builder.add(Element.I32(renderscript), "detailTextureState");
        builder.add(Element.I32(renderscript), "geometryState");
        builder.add(Element.I32(renderscript), "cardVisible");
        builder.add(Element.I32(renderscript), "detailVisible");
        builder.add(Element.I32(renderscript), "shouldPrefetch");
        builder.add(Element.U32(renderscript), "#rs_padding_1");
        builder.add(Element.I64(renderscript), "textureTimeStamp");
        builder.add(Element.I64(renderscript), "detailTextureTimeStamp");
        builder.add(Element.I64(renderscript), "geometryTimeStamp");
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

    public int get_cardVisible(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].cardVisible;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Float2 get_detailLineOffset(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Float2 float2 = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return float2;
_L2:
        float2 = mItemArray[i].detailLineOffset;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Allocation get_detailTexture(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Allocation allocation = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return allocation;
_L2:
        allocation = mItemArray[i].detailTexture;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Float2 get_detailTextureOffset(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Float2 float2 = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return float2;
_L2:
        float2 = mItemArray[i].detailTextureOffset;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Float2[] get_detailTexturePosition(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Float2 afloat2[] = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return afloat2;
_L2:
        afloat2 = mItemArray[i].detailTexturePosition;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int get_detailTextureState(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].detailTextureState;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public long get_detailTextureTimeStamp(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        long l = 0L;
_L4:
        this;
        JVM INSTR monitorexit ;
        return l;
_L2:
        l = mItemArray[i].detailTextureTimeStamp;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int get_detailVisible(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].detailVisible;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Mesh get_geometry(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Mesh mesh = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return mesh;
_L2:
        mesh = mItemArray[i].geometry;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int get_geometryState(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].geometryState;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public long get_geometryTimeStamp(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        long l = 0L;
_L4:
        this;
        JVM INSTR monitorexit ;
        return l;
_L2:
        l = mItemArray[i].geometryTimeStamp;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Matrix4f get_matrix(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Matrix4f matrix4f = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return matrix4f;
_L2:
        matrix4f = mItemArray[i].matrix;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int get_shouldPrefetch(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].shouldPrefetch;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public Allocation get_texture(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        Allocation allocation = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return allocation;
_L2:
        allocation = mItemArray[i].texture;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public int get_textureState(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        j = mItemArray[i].textureState;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public long get_textureTimeStamp(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Item aitem[] = mItemArray;
        if (aitem != null) goto _L2; else goto _L1
_L1:
        long l = 0L;
_L4:
        this;
        JVM INSTR monitorexit ;
        return l;
_L2:
        l = mItemArray[i].textureTimeStamp;
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
            mIOBuffer = new FieldPacker(160 * getType().getX());
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
            break MISSING_BLOCK_LABEL_69;
        copyToArray(item, i);
        FieldPacker fieldpacker = new FieldPacker(160);
        copyToArrayLocal(item, fieldpacker);
        mAllocation.setFromFieldPacker(i, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_cardVisible(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].cardVisible = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(120 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 10, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailLineOffset(int i, Float2 float2, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailLineOffset = float2;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(16 + i * 160);
        mIOBuffer.addF32(float2);
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addF32(float2);
        mAllocation.setFromFieldPacker(i, 3, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTexture(int i, Allocation allocation, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailTexture = allocation;
        if (!flag)
            break MISSING_BLOCK_LABEL_137;
        mIOBuffer.reset(4 + i * 160);
        mIOBuffer.addObj(allocation);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addObj(allocation);
        mAllocation.setFromFieldPacker(i, 1, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTextureOffset(int i, Float2 float2, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailTextureOffset = float2;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(8 + i * 160);
        mIOBuffer.addF32(float2);
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addF32(float2);
        mAllocation.setFromFieldPacker(i, 2, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTexturePosition(int i, Float2 afloat2[], boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailTexturePosition = afloat2;
        if (!flag)
            break MISSING_BLOCK_LABEL_175;
        mIOBuffer.reset(24 + i * 160);
        int j = 0;
_L2:
        if (j >= 2)
            break; /* Loop/switch isn't completed */
        mIOBuffer.addF32(afloat2[j]);
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        FieldPacker fieldpacker = new FieldPacker(16);
        int k = 0;
_L4:
        if (k >= 2)
            break; /* Loop/switch isn't completed */
        fieldpacker.addF32(afloat2[k]);
        k++;
        if (true) goto _L4; else goto _L3
_L3:
        mAllocation.setFromFieldPacker(i, 4, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTextureState(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailTextureState = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(112 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 8, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailTextureTimeStamp(int i, long l, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailTextureTimeStamp = l;
        if (!flag)
            break MISSING_BLOCK_LABEL_142;
        mIOBuffer.reset(144 + i * 160);
        mIOBuffer.addI64(l);
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI64(l);
        mAllocation.setFromFieldPacker(i, 15, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_detailVisible(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].detailVisible = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(124 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 11, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_geometry(int i, Mesh mesh, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].geometry = mesh;
        if (!flag)
            break MISSING_BLOCK_LABEL_138;
        mIOBuffer.reset(40 + i * 160);
        mIOBuffer.addObj(mesh);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addObj(mesh);
        mAllocation.setFromFieldPacker(i, 5, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_geometryState(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].geometryState = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(116 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 9, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_geometryTimeStamp(int i, long l, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].geometryTimeStamp = l;
        if (!flag)
            break MISSING_BLOCK_LABEL_142;
        mIOBuffer.reset(152 + i * 160);
        mIOBuffer.addI64(l);
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI64(l);
        mAllocation.setFromFieldPacker(i, 16, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_matrix(int i, Matrix4f matrix4f, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].matrix = matrix4f;
        if (!flag)
            break MISSING_BLOCK_LABEL_140;
        mIOBuffer.reset(44 + i * 160);
        mIOBuffer.addMatrix(matrix4f);
        FieldPacker fieldpacker = new FieldPacker(64);
        fieldpacker.addMatrix(matrix4f);
        mAllocation.setFromFieldPacker(i, 6, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_shouldPrefetch(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].shouldPrefetch = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_140;
        mIOBuffer.reset(128 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 12, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_texture(int i, Allocation allocation, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].texture = allocation;
        if (!flag)
            break MISSING_BLOCK_LABEL_135;
        mIOBuffer.reset(i * 160);
        mIOBuffer.addObj(allocation);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addObj(allocation);
        mAllocation.setFromFieldPacker(i, 0, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_textureState(int i, int j, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].textureState = j;
        if (!flag)
            break MISSING_BLOCK_LABEL_139;
        mIOBuffer.reset(108 + i * 160);
        mIOBuffer.addI32(j);
        FieldPacker fieldpacker = new FieldPacker(4);
        fieldpacker.addI32(j);
        mAllocation.setFromFieldPacker(i, 7, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void set_textureTimeStamp(int i, long l, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mIOBuffer == null)
            mIOBuffer = new FieldPacker(160 * getType().getX());
        if (mItemArray == null)
            mItemArray = new Item[getType().getX()];
        if (mItemArray[i] == null)
            mItemArray[i] = new Item();
        mItemArray[i].textureTimeStamp = l;
        if (!flag)
            break MISSING_BLOCK_LABEL_142;
        mIOBuffer.reset(136 + i * 160);
        mIOBuffer.addI64(l);
        FieldPacker fieldpacker = new FieldPacker(8);
        fieldpacker.addI64(l);
        mAllocation.setFromFieldPacker(i, 14, fieldpacker);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

}
