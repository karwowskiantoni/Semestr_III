package sample.model;

public class PermuteTable {
    int[] table;
    public int[] getTable(){
        return table;
    }

    public PermuteTable(int[] table) {
        this.table = table;
    }

    public void shiftTable(int number){
        int[] memory = new int[number];
        for(int i = 0; i < number; i++){
            memory[i] = table[i];
        }

        for(int i = number; i < table.length-number; i++){
            table[i] = table[i+1];
        }

        for(int i = 0; i < number; i++){
            table[ i + table.length-number] = memory[i];
        }
    }
}
