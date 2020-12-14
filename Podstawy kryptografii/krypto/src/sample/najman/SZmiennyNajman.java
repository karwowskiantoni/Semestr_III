package sample.najman;


class SZmiennyNajman extends ZmiennyNajman {

    int sign = 1;


    SZmiennyNajman() {
        super();
    }


    SZmiennyNajman(int val) {
        super(val);
    }


    SZmiennyNajman(ZmiennyNajman val) {
        super(val);
    }


    void signedAdd(SZmiennyNajman addend) {
        if (sign == addend.sign)
            add(addend);
        else
            sign = sign * subtract(addend);

    }


    void signedAdd(ZmiennyNajman addend) {
        if (sign == 1)
            add(addend);
        else
            sign = sign * subtract(addend);

    }


    void signedSubtract(SZmiennyNajman addend) {
        if (sign == addend.sign)
            sign = sign * subtract(addend);
        else
            add(addend);

    }


    void signedSubtract(ZmiennyNajman addend) {
        if (sign == 1)
            sign = sign * subtract(addend);
        else
            add(addend);
        if (intLen == 0)
             sign = 1;
    }

    /**
     * Print out the first intLen ints of this MutMatma's value
     * array starting at offset.
     */
    public String toString() {
        return this.toMatma(sign).toString();
    }

}
