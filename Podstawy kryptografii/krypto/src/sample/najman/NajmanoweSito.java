

package sample.najman;



class NajmanoweSito {

    private long bits[];


    private int length;


    private static NajmanoweSito smallSieve = new NajmanoweSito();


    private NajmanoweSito() {
        length = 150 * 64;
        bits = new long[(unitIndex(length - 1) + 1)];

        set(0);
        int nextIndex = 1;
        int nextPrime = 3;

        do {
            sieveSingle(length, nextIndex + nextPrime, nextPrime);
            nextIndex = sieveSearch(length, nextIndex + 1);
            nextPrime = 2*nextIndex + 1;
        } while((nextIndex > 0) && (nextPrime < length));
    }

    NajmanoweSito(Najman base, int searchLen) {
        /*
         * Candidates are indicated by clear bits in the sieve. As a candidates
         * nonprimality is calculated, a bit is set in the sieve to eliminate
         * it. To reduce storage space and increase efficiency, no even numbers
         * are represented in the sieve (each bit in the sieve represents an
         * odd number).
         */
        bits = new long[(unitIndex(searchLen-1) + 1)];
        length = searchLen;
        int start = 0;

        int step = smallSieve.sieveSearch(smallSieve.length, start);
        int convertedStep = (step *2) + 1;

        // Construct the large sieve at an even offset specified by base
        ZmiennyNajman b = new ZmiennyNajman(base);
        ZmiennyNajman q = new ZmiennyNajman();
        do {
            // Calculate base mod convertedStep
            start = b.divideOneWord(convertedStep, q);

            // Take each multiple of step out of sieve
            start = convertedStep - start;
            if (start%2 == 0)
                start += convertedStep;
            sieveSingle(searchLen, (start-1)/2, convertedStep);

            // Find next prime from small sieve
            step = smallSieve.sieveSearch(smallSieve.length, step+1);
            convertedStep = (step *2) + 1;
        } while (step > 0);
    }

    /**
     * Given a bit index return unit index containing it.
     */
    private static int unitIndex(int bitIndex) {
        return bitIndex >>> 6;
    }

    /**
     * Return a unit that masks the specified bit in its unit.
     */
    private static long bit(int bitIndex) {
        return 1L << (bitIndex & ((1<<6) - 1));
    }

    /**
     * Get the value of the bit at the specified index.
     */
    private boolean get(int bitIndex) {
        int unitIndex = unitIndex(bitIndex);
        return ((bits[unitIndex] & bit(bitIndex)) != 0);
    }

    /**
     * Set the bit at the specified index.
     */
    private void set(int bitIndex) {
        int unitIndex = unitIndex(bitIndex);
        bits[unitIndex] |= bit(bitIndex);
    }

    /**
     * This method returns the index of the first clear bit in the search
     * array that occurs at or after start. It will not search past the
     * specified limit. It returns -1 if there is no such clear bit.
     */
    private int sieveSearch(int limit, int start) {
        if (start >= limit)
            return -1;

        int index = start;
        do {
            if (!get(index))
                return index;
            index++;
        } while(index < limit-1);
        return -1;
    }

    /**
     * Sieve a single set of multiples out of the sieve. Begin to remove
     * multiples of the specified step starting at the specified start index,
     * up to the specified limit.
     */
    private void sieveSingle(int limit, int start, int step) {
        while(start < limit) {
            set(start);
            start += step;
        }
    }

    /**
     * Test probable primes in the sieve and return successful candidates.
     */
    Najman retrieve(Najman initValue, int certainty, java.util.Random random) {
        // Examine the sieve one long at a time to find possible primes
        int offset = 1;
        for (int i=0; i<bits.length; i++) {
            long nextLong = ~bits[i];
            for (int j=0; j<64; j++) {
                if ((nextLong & 1) == 1) {
                    Najman candidate = initValue.add(
                            Najman.valueOf(offset));
                    if (candidate.primeToCertainty(certainty, random))
                        return candidate;
                }
                nextLong >>>= 1;
                offset+=2;
            }
        }
        return null;
    }
}
