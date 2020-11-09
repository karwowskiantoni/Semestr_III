package sample.model;

public class BitArray {
    boolean[] bits;

    public BitArray(boolean[] bits) {
        this.bits = bits;
    }

    public BitArray() {
        this.bits = new boolean[0];
    }

    public boolean[] getBits() {
        return bits;
    }

    static public BitArray bitStringToBitArray(String data){
        boolean[] bits = new boolean[data.length()];
        for (int i = 0; i < data.length(); i++) {
            bits[i] = data.toCharArray()[i] == '1';
        }
        return new BitArray(bits);
    }

    public String bitArrayToBitString() {
        String result = "";
        for(int i = 0; i < bits.length; i++){
            if(i%8 == 0){
                result += " ";
            }
            if(bits[i]){
                result+="1";
            }else{
                result+="0";
            }
        }
        return result;
    }

    static public BitArray stringToBitArray(String data) {

        String pom2 = "";

        boolean[] bits = new boolean[data.length() * 8];

        for (int i = 0; i < data.length(); i++) {
            String pom = "";
            int value = data.charAt(i);

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
        return new BitArray(bits);
    }

    public String bitArrayToString() {
        char[] characters = new char[bits.length/8];
        for(int i = 0; i < characters.length; i++){
            for(int j = 0; j < 8; j++){
                if(bits[i*8+j]){
                    characters[i] += Math.pow(2, 7-j);
                }
            }
        }

        String result = "";
        for(char c: characters){
            result += c;
        }
        return result;
    }

    static public BitArray byteToBitArray (int data){
        boolean[] array = new boolean[4];
        for (int i = 0; i < 4; i++){
            if (data%2 == 0){
                array[i] = false;
            }else{
                array[i] = true;
            }
            data = data/2;
        }
        for (int i = 0; i < array.length/2; i++){
            boolean pom = array[i];
            array[i] = array[array.length -1 - i];
            array[array.length -1 - i] = pom;
        }
        return new BitArray(array);
    }

    public byte bitArrayToByte (){
        byte result = 0;
        for (int i = 0; i < bits.length; i++){
            if (bits[i]){
                result += Math.pow(2,bits.length-1-i);
            }
        }
        return result;
    }

    public String bitArrayToHexString(){
        BitArray[] arrays = new BitArray[bits.length/4];
        String result = "";
        for(int i = arrays.length-1; i >= 0; i--){
            arrays[i] = this.divide( bits.length-4, 4);
        }

        for(BitArray array: arrays){
            result += Integer.toHexString(array.bitArrayToByte());
        }
        return result;
    }

    static public BitArray hexStringToBitArray(String data){
        BitArray array = new BitArray();
        String result = "";
        for(int i = 0 ; i < data.length(); i++){
            String pom = "" + data.toCharArray()[i];
            result += byteToBitArray(Integer.parseInt(pom, 16)).bitArrayToBitString() + " ";
            array = array.connect(byteToBitArray(Integer.parseInt(pom, 16)));
        }
        return array;
    }

    public BitArray permute(PermuteTable table) {
        boolean[] permutedBits = new boolean[table.getTable().length];

        for (int i = 0; i < permutedBits.length; i++) {
            permutedBits[i] = bits[table.getTable()[i]-1];
        }

        return new BitArray(permutedBits);
    }

    public BitArray divide(int left, int right) {
        boolean[] leftArray = new boolean[left];
        boolean[] rightArray = new boolean[right];

        for (int i = 0; i < left; i++) {
            leftArray[i] = bits[i];
        }

        for (int i = 0; i < right; i++) {
            rightArray[i] = bits[left+i];
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
