package sample.model;

public class Key  extends BitArray {

    PermuteTable initialPermuteLeft = new PermuteTable(new byte[]{57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26,18
                                                                ,10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36});

    PermuteTable initialPermuteRight = new PermuteTable(new byte[]{63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22
                                                                 ,14, 6,61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4});

    PermuteTable finalPermute = new PermuteTable(new byte[]{14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26
                                                          ,8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51
                                                          ,45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32});

    byte[] shiftTable = new byte[]{1, 1, 2 ,2, 2, 2, 2, 2 ,1 ,2 ,2 ,2 ,2 ,2 ,2 ,1};


    public Key(int length) {
        super(length);
    }

    public Key(byte[] bytes) {
        super(bytes);
    }

    public BitArray[] generateIterableKeys(){
        BitArray[] bitArrays = new BitArray[16];
        BitArray pom1;
        BitArray pom2;

        for(int i = 0; i < bitArrays.length; i++){
            initialPermuteLeft.shiftTable(shiftTable[i]);
            initialPermuteRight.shiftTable(shiftTable[i]);

            pom1 = this.permute(initialPermuteLeft);
            pom2 = this.permute(initialPermuteRight);

            bitArrays[i] = pom1.connect(pom2).permute(finalPermute);
        }
        return bitArrays;
    }
}
