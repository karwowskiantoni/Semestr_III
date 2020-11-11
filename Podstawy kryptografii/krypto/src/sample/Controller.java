package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;
import sample.model.DES;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Controller {
    @FXML
    TextField dataField = new TextField();
    @FXML
    TextField keyField1 = new TextField();
    @FXML
    TextField keyField2 = new TextField();
    @FXML
    TextField pathField = new TextField();
    @FXML
    TextArea resultField = new TextArea();
    @FXML
    Button desStartButton = new Button();
    @FXML
    Button directoryButton = new Button();
    @FXML
    CheckBox checkbox = new CheckBox();

    byte[] bytes;

    public void encrypt() {
        DES tdes = new DES();
        desStartButton.setOnAction(ActionEvent -> {
            resultField.setText(tdes.tripleDES(dataField.getText(), keyField1.getText(),
                    keyField2.getText(), !checkbox.isSelected()));
        });
    }

    public void chooseFile() throws IOException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Wybierz plik");
        directoryButton.setOnAction(ActionEvent -> {
            File selectedDirectory = fileChooser.showOpenDialog(pathField.getScene().getWindow());
            pathField.setText(selectedDirectory.getAbsolutePath());
            try {
                bytes = Files.readAllBytes(Paths.get(pathField.getText()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

}


