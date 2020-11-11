package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;
import sample.model.BitArray;
import sample.model.DES;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Controller {
    @FXML
    TextArea dataField = new TextArea();
    @FXML
    TextField keyField1 = new TextField();
    @FXML
    TextField keyField2 = new TextField();
    @FXML
    TextField pathField = new TextField();
    @FXML
    TextArea resultField = new TextArea();
    @FXML
    Button encryptButtonText = new Button();
    @FXML
    Button decryptButtonText = new Button();
    @FXML
    Button encryptButtonFile = new Button();
    @FXML
    Button decryptButtonFile = new Button();
    @FXML
    Button directoryButton = new Button();
    @FXML
    Button saveFileButton = new Button();

    byte[] bytes;

    public void encryptText() {
        String result = "";
        String[] data =dataField.getText().split("(?<=\\G.{8})");
        DES tdes = new DES();

        for(String block :data){
           // result += tdes.tripleDES(block, keyField1.getText(), keyField2.getText(), true);
        }
        resultField.setText(result);
    }

    public void decryptText() {
        String result = "";
        String[] data =dataField.getText().split("(?<=\\G.{16})");
        DES tdes = new DES();

        for(String block : data){
           // result +=tdes.tripleDES(block, keyField1.getText(), keyField2.getText(), false);
        }
        resultField.setText(result);
    }

    public void encryptFile() {
        String result = "";
        String[] data =dataField.getText().split("(?<=\\G.{8})");
        DES tdes = new DES();

        for(String block :data){
            //result += tdes.tripleDES(block, keyField1.getText(), keyField2.getText(), true);
        }
        resultField.setText(result);
    }

    public void decryptFile() {
        String result = "";
        String[] data =dataField.getText().split("(?<=\\G.{16})");
        DES tdes = new DES();

        for(String block : data){
            //result +=tdes.tripleDES(block, keyField1.getText(), keyField2.getText(), false);
        }
        resultField.setText(result);
    }

    public void chooseFile() throws IOException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Wybierz plik");
            File selectedDirectory = fileChooser.showOpenDialog(pathField.getScene().getWindow());
            pathField.setText(selectedDirectory.getAbsolutePath());

            try {
                bytes = Files.readAllBytes(Paths.get(pathField.getText()));
            } catch (IOException e) {
                e.printStackTrace();
            }
    }


    public void saveFile(){
        BitArray bitArray2 = BitArray.bitStringToBitArray("1011001011");
        BitArray bitArray3 = BitArray.stringToBitArray("xkurwwifeod");
        System.out.println(bitArray3.bitArrayToString());
    }

}


