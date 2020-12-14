package sample.model;
import sample.najman.*;


public class BlumMicali {
    public static BitArray generateArray(BitArray seed, int length){
        int seedValue = 0;
        for(byte b: seed.getBytes()){
            seedValue += b;
        }
        BitArray result = new BitArray(length);
        Najman a = new Najman("2");

        Najman p = new Najman("3089014570559104071319006923413060128665200110584708220833159771123973154612557115837845252375278767");
        System.out.println(p.isProbablePrime(64));
        Najman previous = new Najman(Integer.toString(seedValue));

        for(int i = 0; i < length; i++){
            if(previous.compareTo(p.subtract(new Najman("1")).divide(new Najman("2"))) == 1){
                result.setBit(0, i);
            } else {
                result.setBit(1, i);
            }
            previous = a.modPow(previous, p);
        }
        return result;
    }
}
