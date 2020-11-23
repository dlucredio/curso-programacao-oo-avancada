package br.ufscar.dc.pooa.ocp4;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class App {
    public static void main(String[] args) throws IOException {
        String strNow = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss").format(LocalDateTime.now());
        try (PrintWriter pw = new PrintWriter(new FileWriter(new File(String.format("dump-%s.csv", strNow))))) {
            pw.println("Tipo;Notícia;Link");
            Document doc = Jsoup.connect("https://www.globo.com").get();
            Elements titles = doc.select("p.hui-premium__title");
            for (Element t : titles) {
                pw.print(String.format("Principal;%s;", t.text()));
                Element parent = t.parent();
                while (parent != null && !parent.tagName().equals("a")) {
                    parent = parent.parent();
                }
                if (parent != null && parent.tagName().equals("a")) {
                    pw.print(String.format("\"%s\"", parent.attr("href")));
                }
                pw.print("\n");
            }

            titles = doc.select("p.hui-highlight-title");
            for (Element t : titles) {
                pw.print(String.format("Secundário;%s;", t.text()));
                Element parent = t.parent();
                while (parent != null && !parent.tagName().equals("a")) {
                    parent = parent.parent();
                }
                if (parent != null && parent.tagName().equals("a")) {
                    pw.print(String.format("\"%s\"", parent.attr("href")));
                }
                pw.print("\n");
            }

        }
    }
}
