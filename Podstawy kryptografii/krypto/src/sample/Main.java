package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;


public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{

        Parent root = FXMLLoader.load(getClass().getResource("zadanie3.fxml"));
        root.getStylesheets().add(getClass().getResource("najmanito.css").toString());
        primaryStage.setTitle("DSA_Signature");
        primaryStage.getIcons().add(new Image("najmanitoDSA.png"));
        primaryStage.setScene(new Scene(root, 1300, 827));
        Scene scene = primaryStage.getScene();
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);

    }


}
