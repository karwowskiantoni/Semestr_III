package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sample.model.BitArray;
import sample.model.Key;
import sample.model.PermuteTable;

public class Main extends Application {


    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("Hello World");
        primaryStage.setScene(new Scene(root, 600, 400));

        Scene scene = primaryStage.getScene();

        TextField dataField = (TextField ) scene.lookup("#dataField");
        TextField keyField = (TextField ) scene.lookup("#keyField");
        TextField resultField = (TextField ) scene.lookup("#resultField");
        Button button = (Button) scene.lookup("#button");



        button.setOnAction(actionEvent ->  {
            resultField.setText(krypto(dataField.getCharacters().toString(), keyField.getCharacters().toString()));
        });



        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

    private String krypto(String dataString, String keyString) {
        BitArray data = new BitArray(dataString);
        Key key = new Key(keyString);
        BitArray[] keys = key.generateIterableKeys();
        String result = "";
        for (BitArray array : keys) {
            result = array.toString()+System.lineSeparator();
        }
        return key.toString();
    }
}
