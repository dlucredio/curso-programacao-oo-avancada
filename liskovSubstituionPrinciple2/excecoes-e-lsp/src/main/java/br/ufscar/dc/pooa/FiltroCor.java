package br.ufscar.dc.pooa;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class FiltroCor implements FiltroImagem {

    @Override
    public void processarImagem(File f) throws FileNotFoundException,
            FormatoDeImagemInesperadoException {
        FileReader fr = new FileReader(f);

        // Testar se a imagem é colorida
        throw new FormatoDeImagemInesperadoException("Imagem não pode ser preto e branco para o filtro escolhido");
    }
    
}
