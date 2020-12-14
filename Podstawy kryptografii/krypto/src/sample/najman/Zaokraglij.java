
package sample.najman;

;

public enum Zaokraglij {

    UP(DNajman.ROUND_UP),


    DOWN(DNajman.ROUND_DOWN),

    CEILING(DNajman.ROUND_CEILING),


    FLOOR(DNajman.ROUND_FLOOR),

    HALF_UP(DNajman.ROUND_HALF_UP),


    HALF_DOWN(DNajman.ROUND_HALF_DOWN),


    HALF_EVEN(DNajman.ROUND_HALF_EVEN),

    UNNECESSARY(DNajman.ROUND_UNNECESSARY);

    final int oldMode;

    private Zaokraglij(int oldMode) {
        this.oldMode = oldMode;
    }


    public static Zaokraglij valueOf(int rm) {
        switch(rm) {

        case DNajman.ROUND_UP:
            return UP;

        case DNajman.ROUND_DOWN:
            return DOWN;

        case DNajman.ROUND_CEILING:
            return CEILING;

        case DNajman.ROUND_FLOOR:
            return FLOOR;

        case DNajman.ROUND_HALF_UP:
            return HALF_UP;

        case DNajman.ROUND_HALF_DOWN:
            return HALF_DOWN;

        case DNajman.ROUND_HALF_EVEN:
            return HALF_EVEN;

        case DNajman.ROUND_UNNECESSARY:
            return UNNECESSARY;

        default:
            throw new IllegalArgumentException("argument out of range");
        }
    }
}
