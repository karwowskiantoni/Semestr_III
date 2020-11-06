package sample.model;

public class Key extends BitArray {

    public Key(boolean[] bits) {
        super(bits);
        boolean[] result = new boolean[bits.length - 8];
        for(int i = 0; i < result.length; i++){
            result[i] = bits[i+8];
        }
        bits = result;
    }
    public Key(String s) {
        super(s);
        boolean[] result = new boolean[bits.length - 8];
        for(int i = 0; i < result.length; i++){
            result[i] = bits[i+8];
        }
        bits = result;
    }

    public BitArray[] generateIterableKeys(PermuteTable[] tables){

        BitArray[] bitArrays = new BitArray[16];
        for(int i = 0; i < bitArrays.length; i++){
            bitArrays[i] = new BitArray(bits);
            bitArrays[i].permute(tables[i]);
        }
        return bitArrays;
    }
}
