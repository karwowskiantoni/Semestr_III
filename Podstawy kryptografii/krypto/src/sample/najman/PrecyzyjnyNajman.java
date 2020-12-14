
package sample.najman;

//import RoundingMode;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.io.StreamCorruptedException;


public final class PrecyzyjnyNajman implements Serializable {


    private static final int DEFAULT_DIGITS = 9;
    private static final Zaokraglij DEFAULT_ROUNDINGMODE = Zaokraglij.HALF_UP;

    private static final int MIN_DIGITS = 0;


    private static final long serialVersionUID = 5579720004786848255L;


    public static final PrecyzyjnyNajman UNLIMITED =
        new PrecyzyjnyNajman(0, Zaokraglij.HALF_UP);

    public static final PrecyzyjnyNajman DECIMAL32 =
        new PrecyzyjnyNajman(7, Zaokraglij.HALF_EVEN);


    public static final PrecyzyjnyNajman DECIMAL64 =
        new PrecyzyjnyNajman(16, Zaokraglij.HALF_EVEN);

    public static final PrecyzyjnyNajman DECIMAL128 =
        new PrecyzyjnyNajman(34, Zaokraglij.HALF_EVEN);


    final int precision;


    final Zaokraglij zaokraglij;


    public PrecyzyjnyNajman(int setPrecision) {
        this(setPrecision, DEFAULT_ROUNDINGMODE);
        return;
    }

    /**
     * Constructs a new {@code MathContext} with a specified
     * precision and rounding mode.
     *
     * @param setPrecision The non-negative {@code int} precision setting.
     * @param setZaokraglij The rounding mode to use.
     * @throws IllegalArgumentException if the {@code setPrecision} parameter is less
     *         than zero.
     * @throws NullPointerException if the rounding mode argument is {@code null}
     */
    public PrecyzyjnyNajman(int setPrecision,
                            Zaokraglij setZaokraglij) {
        if (setPrecision < MIN_DIGITS)
            throw new IllegalArgumentException("Digits < 0");
        if (setZaokraglij == null)
            throw new NullPointerException("null RoundingMode");

        precision = setPrecision;
        zaokraglij = setZaokraglij;
        return;
    }

    /**
     * Constructs a new {@code MathContext} from a string.
     *
     * The string must be in the same format as that produced by the
     * {@link #toString} method.
     *
     * <p>An {@code IllegalArgumentException} is thrown if the precision
     * section of the string is out of range ({@code < 0}) or the string is
     * not in the format created by the {@link #toString} method.
     *
     * @param val The string to be parsed
     * @throws IllegalArgumentException if the precision section is out of range
     * or of incorrect format
     * @throws NullPointerException if the argument is {@code null}
     */
    public PrecyzyjnyNajman(String val) {
        boolean bad = false;
        int setPrecision;
        if (val == null)
            throw new NullPointerException("null String");
        try { // any error here is a string format problem
            if (!val.startsWith("precision=")) throw new RuntimeException();
            int fence = val.indexOf(' ');    // could be -1
            int off = 10;                     // where value starts
            setPrecision = Integer.parseInt(val.substring(10, fence));

            if (!val.startsWith("roundingMode=", fence+1))
                throw new RuntimeException();
            off = fence + 1 + 13;
            String str = val.substring(off, val.length());
            zaokraglij = Zaokraglij.valueOf(str);
        } catch (RuntimeException re) {
            throw new IllegalArgumentException("bad string format");
        }

        if (setPrecision < MIN_DIGITS)
            throw new IllegalArgumentException("Digits < 0");
        // the other parameters cannot be invalid if we got here
        precision = setPrecision;
    }

    /**
     * Returns the {@code precision} setting.
     * This value is always non-negative.
     *
     * @return an {@code int} which is the value of the {@code precision}
     *         setting
     */
    public int getPrecision() {
        return precision;
    }

    /**
     * Returns the roundingMode setting.
     * This will be one of
     * {@link  Zaokraglij#CEILING},
     * {@link  Zaokraglij#DOWN},
     * {@link  Zaokraglij#FLOOR},
     * {@link  Zaokraglij#HALF_DOWN},
     * {@link  Zaokraglij#HALF_EVEN},
     * {@link  Zaokraglij#HALF_UP},
     * {@link  Zaokraglij#UNNECESSARY}, or
     * {@link  Zaokraglij#UP}.
     *
     * @return a {@code RoundingMode} object which is the value of the
     *         {@code roundingMode} setting
     */

    public Zaokraglij getRoundingMode() {
        return zaokraglij;
    }

    /**
     * Compares this {@code MathContext} with the specified
     * {@code Object} for equality.
     *
     * @param  x {@code Object} to which this {@code MathContext} is to
     *         be compared.
     * @return {@code true} if and only if the specified {@code Object} is
     *         a {@code MathContext} object which has exactly the same
     *         settings as this object
     */
    public boolean equals(Object x){
        PrecyzyjnyNajman mc;
        if (!(x instanceof PrecyzyjnyNajman))
            return false;
        mc = (PrecyzyjnyNajman) x;
        return mc.precision == this.precision
            && mc.zaokraglij == this.zaokraglij; // no need for .equals()
    }

    /**
     * Returns the hash code for this {@code MathContext}.
     *
     * @return hash code for this {@code MathContext}
     */
    public int hashCode() {
        return this.precision + zaokraglij.hashCode() * 59;
    }

    /**
     * Returns the string representation of this {@code MathContext}.
     * The {@code String} returned represents the settings of the
     * {@code MathContext} object as two space-delimited words
     * (separated by a single space character, <tt>'&#92;u0020'</tt>,
     * and with no leading or trailing white space), as follows:
     * <ol>
     * <li>
     * The string {@code "precision="}, immediately followed
     * by the value of the precision setting as a numeric string as if
     * generated by the {@link Integer#toString(int) Integer.toString}
     * method.
     *
     * <li>
     * The string {@code "roundingMode="}, immediately
     * followed by the value of the {@code roundingMode} setting as a
     * word.  This word will be the same as the name of the
     * corresponding public constant in the {@link Zaokraglij}
     * enum.
     * </ol>
     * <p>
     * For example:
     * <pre>
     * precision=9 roundingMode=HALF_UP
     * </pre>
     *
     * Additional words may be appended to the result of
     * {@code toString} in the future if more properties are added to
     * this class.
     *
     * @return a {@code String} representing the context settings
     */
    public String toString() {
        return "precision=" +           precision + " " +
               "roundingMode=" +        zaokraglij.toString();
    }

    // Private methods

    /**
     * Reconstitute the {@code MathContext} instance from a stream (that is,
     * deserialize it).
     *
     * @param s the stream being read.
     */
    private void readObject(ObjectInputStream s)
        throws IOException, ClassNotFoundException {
        s.defaultReadObject();     // read in all fields
        // validate possibly bad fields
        if (precision < MIN_DIGITS) {
            String message = "MathContext: invalid digits in stream";
            throw new StreamCorruptedException(message);
        }
        if (zaokraglij == null) {
            String message = "MathContext: null roundingMode in stream";
            throw new StreamCorruptedException(message);
        }
    }

}
