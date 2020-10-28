package br.ufscar.dc.pooa;

import java.util.HashMap;
import java.util.Map;

public class Config {
    public static Map<String, FiltroImagem> carregarFiltros() {
        Map<String, FiltroImagem> ret = new HashMap<>();

        ret.put("mediana", new FiltroMediana());
        ret.put("ruido", new FiltroRuido());
        ret.put("media", new FiltroMedia());
        ret.put("cor", new FiltroCor());

        return ret;
    }
}
