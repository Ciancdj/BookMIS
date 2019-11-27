package model.encryption;

import Control.controller.PathReader;
import com.KR;
import com.KU;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

public class EncryKey {
    private static KR kr;
    private static KU ku;

    private static void setKr() {
        try{
            String path = PathReader.class.getClassLoader().getResource("KR.tem").getPath();
            ObjectInputStream oi = new ObjectInputStream(
                    new FileInputStream(path)
            );
            kr = (KR)oi.readObject();
            oi.close();
        } catch (FileNotFoundException e){
            e.printStackTrace();
        } catch (IOException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    private static void setKu() {
        try{
            String path = PathReader.class.getClassLoader().getResource("KU.tem").getPath();
            ObjectInputStream oi = new ObjectInputStream(
                    new FileInputStream(path)
            );
            ku = (KU)oi.readObject();
            oi.close();
        } catch (FileNotFoundException e){
            e.printStackTrace();
        } catch (IOException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    private EncryKey(){
        if(kr == null){
            setKr();
        }
        if(ku == null){
            setKu();
        }
    }

    public static KR getKr() {
        if(kr == null){
            setKr();
        }
        return kr;
    }

    public static KU getKu() {
        if(ku == null){
            setKu();
        }
        return ku;
    }

}
