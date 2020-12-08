package sample.model;

public class BlumMicali {
    public static BitArray generateArray(BitArray seed, int length){
        int a = 0;
        int p = 0;
        int[] table = new int[length];
        //table[0] = seed.;

        BitArray result = new BitArray(length);
        for(int i = 0; i < length; i++){
            if(table[i] <(p-1)/2){
                result.setBit(i, 1);
            } else {
                result.setBit(i, 0);
            }
        }
        return result;
    }
}
