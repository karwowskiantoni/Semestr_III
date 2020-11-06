package sample.model;

public class BitArray {
    boolean[] bits;
    String pom;

    public String getPom() {
        return pom;
    }

    public BitArray(boolean[] bits) {
        this.bits = bits;
    }

    public BitArray(String s) {
        String pom2 = "";

        boolean[] bits = new boolean[8 * s.length()];

        for (int i = 0; i < s.length(); i++) {
            String pom = "";
            int value = s.charAt(i);

            while (value > 0) {
                if (value % 2 == 1) {
                    pom += "1";
                } else
                    pom += "0";
                value /= 2;
            }
            pom2 += "0";
            for(int j = 0; j < pom.length(); j++){
                pom2 += pom.toCharArray()[pom.length()-1-j];
            }
        }

        for (int i = 0; i < pom2.length(); i++) {
            bits[i] = pom2.toCharArray()[i] == '1';
        }
        this.bits = bits;
    }

    public boolean[] getBits() {
        return bits;
    }

    @Override
    public String toString() {
        String result = "";
        for (boolean b : bits) {
            if (!b) {
                result += "0";
            } else {
                result += "1";
            }
        }
        return result;
    }

    public BitArray permute(PermuteTable table) {
        boolean[] permutedBits = new boolean[table.getTable().length];

        for (int i = 0; i < permutedBits.length; i++) {
            permutedBits[i] = bits[table.getTable()[i]];
        }

        return new BitArray(permutedBits);
    }

    public BitArray divide(int left, int right) {
        boolean[] leftArray = new boolean[left];
        boolean[] rightArray = new boolean[right];

        for (int i = 0; i < left; i++) {
            leftArray[i] = bits[i];
        }

        for (int i = left; i < right; i++) {
            rightArray[i] = bits[i];
        }

        bits = leftArray;
        return new BitArray(rightArray);
    }

    public BitArray XOR(BitArray bitArray) {
        boolean[] bits2 = new boolean[bits.length];

        for (int i = 0; i < bits.length; i++) {
            bits2[i] = bits[i] != bitArray.getBits()[i];
        }
        return new BitArray(bits2);
    }

    public BitArray connect(BitArray array){
        boolean[] bits2 = new boolean[bits.length + array.getBits().length];
        for(int i = 0; i < bits.length; i++){
            bits2[i] = bits[i];
        }

        for(int i = bits.length; i < bits2.length; i++){
            bits2[i] = array.getBits()[i-bits.length];
        }
        return new BitArray(bits2);
    }
}