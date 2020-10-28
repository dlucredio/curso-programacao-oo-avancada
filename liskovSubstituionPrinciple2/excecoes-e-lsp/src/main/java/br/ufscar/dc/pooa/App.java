package br.ufscar.dc.pooa;

import static br.ufscar.dc.pooa.Config.carregarFiltros;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Map;

public class App {
    public static void main(String[] args) {
        String file = args[0];
        String nomeFiltro = args[1];

        Map<String, FiltroImagem> filtros = carregarFiltros();

        FiltroImagem filtro = filtros.get(nomeFiltro);
        try {
            filtro.processarImagem(new File(file));
        } catch (FileNotFoundException e) {
            System.err.println("Arquivo especificado não foi encontrado");
        } catch (FormatoDeImagemInesperadoException e) {
            System.err.println("Formato da imagem inesperado:" + e.getMessage());
        }
    }
}
