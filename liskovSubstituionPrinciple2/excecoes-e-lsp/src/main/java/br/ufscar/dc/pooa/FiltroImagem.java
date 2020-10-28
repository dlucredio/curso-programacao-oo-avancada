package br.ufscar.dc.pooa;

import java.io.File;
import java.io.FileNotFoundException;

public interface FiltroImagem {
    // Esse método deve processar a imagem 
    // e salvar no mesmo arquivo
    void processarImagem(File f) throws FileNotFoundException, FormatoDeImagemInesperadoException;
}
