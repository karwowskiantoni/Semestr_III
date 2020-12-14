package sample.najman;


public class PodwojnyZmiennoprzecinkowyNajman {


    private PodwojnyZmiennoprzecinkowyNajman() {}


    public static final double POSITIVE_INFINITY = java.lang.Double.POSITIVE_INFINITY;

    public static final double NEGATIVE_INFINITY = java.lang.Double.NEGATIVE_INFINITY;

    public static final double NaN = java.lang.Double.NaN;

    public static final double MAX_VALUE = java.lang.Double.MAX_VALUE;

    public static final double MIN_VALUE = java.lang.Double.MIN_VALUE;



    public static final double  MIN_NORMAL      = 2.2250738585072014E-308;


    public static final int SIGNIFICAND_WIDTH   = 53;




    public static final int     MAX_EXPONENT    = 1023;




    public static final int     MIN_EXPONENT    = -1022;


    /**

     * The exponent the smallest positive <code>double</code>

     * subnormal value would have if it could be normalized.  It is

     * equal to the value returned by

     * <code>FpUtils.ilogb(Double.MIN_VALUE)</code>.

     */

    public static final int     MIN_SUB_EXPONENT = MIN_EXPONENT -

            (SIGNIFICAND_WIDTH - 1);


    /**

     * Bias used in representing a <code>double</code> exponent.

     */

    public static final int     EXP_BIAS        = 1023;


    /**

     * Bit mask to isolate the sign bit of a <code>double</code>.

     */

    public static final long    SIGN_BIT_MASK   = 0x8000000000000000L;


    /**

     * Bit mask to isolate the exponent field of a

     * <code>double</code>.

     */

    public static final long    EXP_BIT_MASK    = 0x7FF0000000000000L;


    /**

     * Bit mask to isolate the significand field of a

     * <code>double</code>.

     */

    public static final long    SIGNIF_BIT_MASK = 0x000FFFFFFFFFFFFFL;


    static {

        // verify bit masks cover all bit positions and that the bit

        // masks are non-overlapping

        assert(((SIGN_BIT_MASK | EXP_BIT_MASK | SIGNIF_BIT_MASK) == ~0L) &&

                (((SIGN_BIT_MASK & EXP_BIT_MASK) == 0L) &&

                        ((SIGN_BIT_MASK & SIGNIF_BIT_MASK) == 0L) &&

                        ((EXP_BIT_MASK & SIGNIF_BIT_MASK) == 0L)));

    }

}


