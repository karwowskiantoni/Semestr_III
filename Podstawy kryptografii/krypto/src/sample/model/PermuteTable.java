package sample.model;

public class PermuteTable {
    byte[] table;
    public byte[] getTable(){
        return table;
    }

    public PermuteTable(byte[] table) {
        this.table = table;
    }

    public void shiftTable(byte number){
        byte[] memory = new byte[number];
        for(int i = 0; i < number; i++){
            memory[i] = table[i];
        }

        for(int i = 0; i < table.length-number; i++){
            table[i] = table[i+number];
        }

        for(int i = 0; i < number; i++){
            table[ i + table.length-number] = memory[i];
        }
    }
}
