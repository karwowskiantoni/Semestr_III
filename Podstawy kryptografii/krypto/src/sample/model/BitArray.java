package sample.model;

public class BitArray {
    byte[] bytes;
    int length;

    public BitArray(int length) {
        this.length = length;
        this.bytes = new byte[(int) Math.ceil(length/8.0)];
    }

    public BitArray(byte[] bytes){
        this.bytes = bytes;
        length = bytes.length*8-1;
    }

    public int getLength(){
        return length;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBit(int value, int index) {
        int position = index + 1;
        byte insertion = (byte) value;
        byte chosenByte = bytes[(index) / 8];
        byte shiftedInsertion = (byte) (insertion << (position%8));
        if (insertion == 1) {
            chosenByte = (byte) (shiftedInsertion | chosenByte);
        } else {
            chosenByte = (byte) (chosenByte & ~(1 << (position%8)));
        }
        bytes[index / 8] = chosenByte;
    }

    public byte getBit(int index) {
        int position = index + 1;
        if(position > length){
            return 2;
        }
        byte chosenByte = bytes[index / 8];

        return (byte) (chosenByte >> (position%8) & 1);
    }

    static public BitArray bitStringToBitArray(String data){
        BitArray array = new BitArray(data.length());
        for (int i = 0; i < array.getLength(); i++) {
            if(data.split("")[i].equals("1")){
                array.setBit(1,i);
            }if(data.split("")[i].equals("0")) {
                array.setBit(0, i);
            }
        }
        return array;
    }

    public String bitArrayToBitString() {
        String result = "";
        System.out.println(this.getLength());

        for(int i = 0; i < this.getBytes().length*8; i++){
            if(i%8 == 0){
                result += " ";
            }
            if(this.getBit(i) == 2){
                result += "2";
            }
            if(this.getBit(i) == 1){
                result += "1";
            }
            if(this.getBit(i) == 0){
                result += "0";
            }
        }
        return result;
    }

    static public BitArray stringToBitArray(String data) {
        return new BitArray(data.getBytes());
    }

    public String bitArrayToString() {
        return new String(bytes);
    }

    public String bitArrayToHexString(){
        for(int i = 0; i < getBytes().length; i++){
             //1 2 3 4 5 6 7 8 -> /16 -> 0 0 0 0 1 2 3 4
             //1 2 3 4 5 6 7 8 -> *16/16 -> 0 0 0 0 5 6 7 8


        }
    }

    static public BitArray hexStringToBitArray(String data){
        BitArray array = new BitArray(data.length()*4);
        for(int i = 0 ; i < data.length(); i++){
            String pom = "" + data.toCharArray()[i];
            Integer.parseInt(pom, 16);
        }
        return array;
    }


    public BitArray permute(PermuteTable table) {
        BitArray array = new BitArray(table.getTable().length);
        for (int i = 0; i < array.getLength(); i++) {
            array.setBit(this.getBit(table.getTable()[i]-1), i);
        }
        return array;
    }

    public BitArray divide(int left, int right) {
        BitArray leftArray = new BitArray(left);
        BitArray rightArray = new BitArray(right);

        for (int i = 0; i < left; i++) {
            leftArray.setBit(this.getBit(i), i);
        }

        for (int i = 0; i < right; i++) {
            rightArray.setBit(this.getBit(left+i), i);
        }
        length = leftArray.getLength();
        bytes = leftArray.getBytes();
        return rightArray;
    }

    public BitArray XOR(BitArray bitArray) {
        BitArray result = new BitArray(bitArray.getLength());

        for (int i = 0; i < this.getLength(); i++) {
            if(this.getBit(i) == bitArray.getBit(i)){
                result.setBit(0, i);
            }else{
                result.setBit(1, i);
            }
        }
        return result;
    }

    public BitArray connect(BitArray array){
        BitArray result = new BitArray(array.getLength() + this.getLength());
        for(int i = 0; i < this.getLength(); i++){
            result.setBit(this.getBit(i), i);
        }

        for(int i = this.getLength(); i < result.getLength(); i++){
            result.setBit(array.getBit(i-this.getLength()) ,i);
        }
        return result;
    }

}
