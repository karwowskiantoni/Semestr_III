package sample.model;
import java.lang.Math;
import java.math.BigInteger;

public class BlumMicali {
    public static BitArray generateArray(BitArray seed, int length){

        BitArray result = new BitArray(length);
        BigInteger a = new BigInteger(Integer.toString(seed.getByte(0)+2));

        BigInteger p = new BigInteger(Integer.toString(seed.getByte(0)+3));
        BigInteger previous = new BigInteger(Integer.toString(seed.getByte(0)));
        for(int i = 0; i < length; i++){
            System.out.println(previous);
            if(previous.compareTo(p.subtract(new BigInteger("1")).divide(new BigInteger("2"))) == 0){
                result.setBit(0, i);
            } else {
                result.setBit(1, i);
            }

            BigInteger next = previous.modPow();
            previous = next.mod(p);
        }

        return result;
    }
}
