package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sample.model.BitArray;
import sample.model.Key;
import sample.model.PermuteTable;
import sample.model.Sbox;
import sample.model.DES;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("TripleDES");
        primaryStage.setScene(new Scene(root, 1168, 827));

        Scene scene = primaryStage.getScene();

        TextField dataField = (TextField ) scene.lookup("#dataField");
        TextField keyField1 = (TextField ) scene.lookup("#keyField1");
        TextField keyField2 = (TextField ) scene.lookup("#keyField2");
        TextArea resultField = (TextArea ) scene.lookup("#resultField");
        Button button = (Button) scene.lookup("#button");
        CheckBox checkBox = (CheckBox) scene.lookup("#checkbox");
        DES tdes = new DES();
        button.setOnAction(actionEvent ->  {
            resultField.setText(tdes.tripleDES(dataField.getCharacters().toString(), keyField1.getCharacters().toString(),
                    keyField2.getCharacters().toString(), !checkBox.isSelected()));
        });




        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);


    }

}
