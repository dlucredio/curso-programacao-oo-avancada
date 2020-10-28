package br.ufscar.dc.pooa;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class FiltroRuido implements FiltroImagem {

    @Override
    public void processarImagem(File f) throws FileNotFoundException {
        FileReader fr = new FileReader(f);
    }
    
}
