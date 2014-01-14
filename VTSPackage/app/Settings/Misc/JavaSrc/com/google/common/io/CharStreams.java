// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.*;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.*;

// Referenced classes of package com.google.common.io:
//            AppendableWriter, InputSupplier, OutputSupplier, Closeables, 
//            LineReader, LineProcessor, MultiReader

public final class CharStreams
{

    private static final int BUF_SIZE = 2048;

    private CharStreams()
    {
    }

    public static Writer asWriter(Appendable appendable)
    {
        if (appendable instanceof Writer)
            return (Writer)appendable;
        else
            return new AppendableWriter(appendable);
    }

    public static long copy(InputSupplier inputsupplier, OutputSupplier outputsupplier)
        throws IOException
    {
        boolean flag;
        int i;
        Readable readable;
        flag = true;
        i = 0;
        readable = (Readable)inputsupplier.getInput();
        Appendable appendable = (Appendable)outputsupplier.getOutput();
        long l = copy(readable, appendable);
        i = 0 + 1;
        Closeable closeable2 = (Closeable)appendable;
        boolean flag2;
        if (i < flag)
            flag2 = flag;
        else
            flag2 = false;
        Closeables.close(closeable2, flag2);
        int j = i + 1;
        Closeable closeable3 = (Closeable)readable;
        if (j >= 2)
            flag = false;
        Closeables.close(closeable3, flag);
        return l;
        Exception exception1;
        exception1;
        Closeable closeable1 = (Closeable)appendable;
        flag;
        JVM INSTR ifge 152;
           goto _L1 _L2
_L1:
        boolean flag1 = flag;
_L4:
        Closeables.close(closeable1, flag1);
        i = 0 + 1;
        throw exception1;
        Exception exception;
        exception;
        Closeable closeable = (Closeable)readable;
        if (i >= 2)
            flag = false;
        Closeables.close(closeable, flag);
        throw exception;
_L2:
        flag1 = false;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static long copy(InputSupplier inputsupplier, Appendable appendable)
        throws IOException
    {
        Readable readable = (Readable)inputsupplier.getInput();
        long l = copy(readable, appendable);
        Closeables.close((Closeable)readable, false);
        return l;
        Exception exception;
        exception;
        Closeables.close((Closeable)readable, true);
        throw exception;
    }

    public static long copy(Readable readable, Appendable appendable)
        throws IOException
    {
        CharBuffer charbuffer = CharBuffer.allocate(2048);
        long l = 0L;
        do
        {
            int i = readable.read(charbuffer);
            if (i == -1)
                return l;
            charbuffer.flip();
            appendable.append(charbuffer, 0, i);
            l += i;
        } while (true);
    }

    public static InputSupplier join(Iterable iterable)
    {
        return new InputSupplier(iterable) {

            final Iterable val$suppliers;

            public Reader getInput()
                throws IOException
            {
                return new MultiReader(suppliers.iterator());
            }

            public volatile Object getInput()
                throws IOException
            {
                return getInput();
            }

            
            {
                suppliers = iterable;
                super();
            }
        }
;
    }

    public static transient InputSupplier join(InputSupplier ainputsupplier[])
    {
        return join(((Iterable) (Arrays.asList(ainputsupplier))));
    }

    public static InputSupplier newReaderSupplier(InputSupplier inputsupplier, Charset charset)
    {
        Preconditions.checkNotNull(inputsupplier);
        Preconditions.checkNotNull(charset);
        return new InputSupplier(inputsupplier, charset) {

            final Charset val$charset;
            final InputSupplier val$in;

            public InputStreamReader getInput()
                throws IOException
            {
                return new InputStreamReader((InputStream)in.getInput(), charset);
            }

            public volatile Object getInput()
                throws IOException
            {
                return getInput();
            }

            
            {
                in = inputsupplier;
                charset = charset1;
                super();
            }
        }
;
    }

    public static InputSupplier newReaderSupplier(String s)
    {
        Preconditions.checkNotNull(s);
        return new InputSupplier(s) {

            final String val$value;

            public StringReader getInput()
            {
                return new StringReader(value);
            }

            public volatile Object getInput()
                throws IOException
            {
                return getInput();
            }

            
            {
                value = s;
                super();
            }
        }
;
    }

    public static OutputSupplier newWriterSupplier(OutputSupplier outputsupplier, Charset charset)
    {
        Preconditions.checkNotNull(outputsupplier);
        Preconditions.checkNotNull(charset);
        return new OutputSupplier(outputsupplier, charset) {

            final Charset val$charset;
            final OutputSupplier val$out;

            public OutputStreamWriter getOutput()
                throws IOException
            {
                return new OutputStreamWriter((OutputStream)out.getOutput(), charset);
            }

            public volatile Object getOutput()
                throws IOException
            {
                return getOutput();
            }

            
            {
                out = outputsupplier;
                charset = charset1;
                super();
            }
        }
;
    }

    public static String readFirstLine(InputSupplier inputsupplier)
        throws IOException
    {
        Readable readable = (Readable)inputsupplier.getInput();
        String s = (new LineReader(readable)).readLine();
        Closeables.close((Closeable)readable, false);
        return s;
        Exception exception;
        exception;
        Closeables.close((Closeable)readable, true);
        throw exception;
    }

    public static Object readLines(InputSupplier inputsupplier, LineProcessor lineprocessor)
        throws IOException
    {
        Readable readable = (Readable)inputsupplier.getInput();
        LineReader linereader = new LineReader(readable);
_L2:
        String s = linereader.readLine();
        if (s == null)
            break; /* Loop/switch isn't completed */
        boolean flag = lineprocessor.processLine(s);
        if (flag) goto _L2; else goto _L1
_L1:
        Closeables.close((Closeable)readable, false);
        return lineprocessor.getResult();
        Exception exception;
        exception;
        Closeables.close((Closeable)readable, true);
        throw exception;
    }

    public static List readLines(InputSupplier inputsupplier)
        throws IOException
    {
        Readable readable = (Readable)inputsupplier.getInput();
        List list = readLines(readable);
        Closeables.close((Closeable)readable, false);
        return list;
        Exception exception;
        exception;
        Closeables.close((Closeable)readable, true);
        throw exception;
    }

    public static List readLines(Readable readable)
        throws IOException
    {
        ArrayList arraylist = new ArrayList();
        LineReader linereader = new LineReader(readable);
        do
        {
            String s = linereader.readLine();
            if (s != null)
                arraylist.add(s);
            else
                return arraylist;
        } while (true);
    }

    public static void skipFully(Reader reader, long l)
        throws IOException
    {
        while (l > 0L) 
        {
            long l1 = reader.skip(l);
            if (l1 == 0L)
            {
                if (reader.read() == -1)
                    throw new EOFException();
                l--;
            } else
            {
                l -= l1;
            }
        }
    }

    public static String toString(InputSupplier inputsupplier)
        throws IOException
    {
        return toStringBuilder(inputsupplier).toString();
    }

    public static String toString(Readable readable)
        throws IOException
    {
        return toStringBuilder(readable).toString();
    }

    private static StringBuilder toStringBuilder(InputSupplier inputsupplier)
        throws IOException
    {
        Readable readable = (Readable)inputsupplier.getInput();
        StringBuilder stringbuilder = toStringBuilder(readable);
        Closeables.close((Closeable)readable, false);
        return stringbuilder;
        Exception exception;
        exception;
        Closeables.close((Closeable)readable, true);
        throw exception;
    }

    private static StringBuilder toStringBuilder(Readable readable)
        throws IOException
    {
        StringBuilder stringbuilder = new StringBuilder();
        copy(readable, stringbuilder);
        return stringbuilder;
    }

    public static void write(CharSequence charsequence, OutputSupplier outputsupplier)
        throws IOException
    {
        Appendable appendable;
        Preconditions.checkNotNull(charsequence);
        appendable = (Appendable)outputsupplier.getOutput();
        appendable.append(charsequence);
        Closeables.close((Closeable)appendable, false);
        return;
        Exception exception;
        exception;
        Closeables.close((Closeable)appendable, true);
        throw exception;
    }
}
