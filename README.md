# HM Beamer Template (Overleaf-ready)

Weißer Hintergrund, schwarze Schrift, Akzentfarbe HM-Rot (#fb5454).
Logo unten links, Copyright zentriert, Seitenzahl rechts.

<p align="center">
  <a href="https://sebishepherd.github.io/hm-latex-beamer-template/" target="_blank" rel="noopener noreferrer"><img alt="🚀 Live-Preview öffnen" src="https://img.shields.io/badge/%F0%9F%9A%80%20Live--Preview%20%C3%B6ffnen-fb5454?style=for-the-badge&logo=github&logoColor=white" /></a>
  &#160;
  <a href="https://sebishepherd.github.io/hm-latex-beamer-template/main.pdf" target="_blank" rel="noopener noreferrer"><img alt="📄 Direkter PDF-Link" src="https://img.shields.io/badge/%F0%9F%93%84%20Direkter%20PDF--Link-444444?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" /></a>
</p>
<p align="center"><small>Die Links zeigen stets auf das neueste Deployment von GitHub Pages.</small></p>

## Dateien
- `main.tex` – Beispielpräsentation
- `beamerthemeHM.sty` – Theme (Farben, Fußzeile, Titelfolie)
- `hm_logo.png` – Platzhalterlogo (ersetzen durch echtes HM-Logo)

## Nutzung
1. Projekt in Overleaf anlegen → Upload dieses ZIPs.
2. In `main.tex` Meta-Daten anpassen (`\title`, `\author`, `\date`).
3. Optional: Eigenes Logo einbinden – Datei ins Projekt laden
   und in `main.tex` `\sethmlogo{<dein_logo>}` setzen.
4. Fußzeilentext per `\sethmfooter{...}` ändern.
5. Vertikalen Versatz nur für den Fußzeilen-Text (Titel + Copyright) feinjustieren:
  `\sethmfootertextvshift{0.5ex}` (positiver Wert = höher, negativer Wert = tiefer).

### Separates Footer-Logo (optional)
- **Standard:** Titelfolie und Footer verwenden das gleiche Hauptlogo (`hm_logo.png` bzw. was per `\sethmlogo{...}` gesetzt wird).
- **Anderes Footer-Logo setzen** (empfohlen in `main.tex`):

  ```tex
  \sethmfooterlogo{hm_footer_logo.png}
  ```

- **Footer-Logo ausblenden:**

  ```tex
  \sethmfooterlogo{}
  ```
  
  → Logo und Abstand zum Text werden komplett entfernt.

- **Fallback:** Wenn `\sethmfooterlogo{...}` nicht aufgerufen wird, nutzt der Footer automatisch das Hauptlogo.
- **Hinweis:** Die Titelfolie verwendet immer das Hauptlogo (gesetzt per `\sethmlogo{...}`).

### Inhaltsverzeichnis: Nummern, Bullets oder nichts
- Standard: nummeriert (1, 1.1, ...).
- Umstellen per Präambel in `main.tex`:

  ```tex
  % Nummeriert (Standard)
  % \sethmtocstyle{numbers}

  % Klassische Bullet Points
  \sethmtocstyle{bullets}

  % Keine Marker
  % \sethmtocstyle{none}
  ```

- Gilt für `\tableofcontents` (Abschnitts- und Unterabschnittseinträge).
- Fallback: Unbekannte Werte werden automatisch als `numbers` behandelt.

### Häufige Anpassungen
- Logo-Größe in der Fußzeile: `\sethmfooterlogoheight{3ex}`
- Abstand zwischen Logo und Text: `\sethmfooterlogotextsep{0.75em}`
- Textbreite im Fußbereich: `\sethmfootertextwidth{0.60\paperwidth}`
- Vertikale Feinjustierung NUR für den Textblock: `\sethmfootertextvshift{0.25ex}`
- Vertikale Feinjustierung NUR für das Logo: `\sethmfooterlogovshift{0.5ex}`

## Automatisierte Vorschau
Für jeden Push kompiliert GitHub Actions automatisch die Datei `main.tex`.
Bei Pull-Requests aus Forks wird derselbe Build zusätzlich vom PR-Event ausgelöst, damit auch
externe Beiträge ein Ergebnis erhalten. Die Ausgabe erscheint auf zwei Wegen:

- **Direkte Vorschau:** Falls GitHub Pages aktiviert ist (siehe unten) und der Branch im
  Hauptrepository liegt, erzeugt der Push-Lauf eine Vorschauseite samt PDF-Link im
  Workflow-"Summary" (Abschnitt „Preview“) **und** hinterlässt in offenen Pull Requests einen
  Kommentar mit den direkten Links. GitHub Pages muss Deployments aus dem jeweiligen Branch
  erlauben.
- **Build-Artefakt:** Jeder Lauf lädt das Artefakt `hm-beamer-template` hoch. Der Download
  enthält die `main.pdf` als Fallback – etwa für Pull Requests aus Forks oder wenn GitHub Pages
  deaktiviert ist.

### GitHub-Pages-Preview aktivieren
1. GitHub Pages einschalten und als Quelle **GitHub Actions** auswählen
   (Repository → *Settings* → *Pages*).
2. Falls das Environment **github-pages** geschützt ist, dort die Branch-Regeln so anpassen,
   dass auch Feature-Branches deployen dürfen (Repository → *Settings* → *Environments* →
   *github-pages*).

Sobald GitHub Pages aktiviert ist, veröffentlicht der Workflow erfolgreiche Branch-Builds
automatisch. Für alle anderen Fälle zeigt die Workflow-Zusammenfassung an, dass das Artefakt
heruntergeladen werden kann.

## Kurze Referenz: Abstände & Farb-Setter
Die Theme stellt einige kleine Helfer zur Verfügung, die du in `main.tex` (nach `\usetheme{HM}`)
einfach einkommentieren kannst.

- Frametitels-Abstände (Standard: oben = Footer-Bottom-Padding, links = oben):

```tex
% \sethmframetitletop{6mm}   % Abstand oberhalb des Frame-Titels
% \sethmframetitleleft{6mm}  % Abstand links vor dem Frame-Titel
```

- Farb-Setter (Beispiele):

```tex
% \sethmprimarycolor[HTML]{0077CC}                % setzt HM-Rot (HMRed)
% \sethmexampleblockcolors[HTML]{00AA66}{F0FFF0}  % example title fg, body bg
% \sethmalertblockcolors[HTML]{FF0000}{FFF0F0}   % alert title fg, body bg
```

Die Makros sind absichtlich knapp gehalten; die Setter ändern alle relevanten beamercolor-Keys
intern, sodass Überschriften in `exampleblock` und `alertblock` konsistent erscheinen.

### Listen: Marker für verschachtelte Ebenen (itemize)

Standardmäßig verwendet das Theme den runden Marker (`circle`) für die oberste
Aufzählungsebene. Beamer unterstützt jedoch getrennte Templates für mehrere
verschachtelte Ebenen: `itemize item` (1. Ebene), `itemize subitem` (2. Ebene)
und `itemize subsubitem` (3. Ebene). Du kannst diese entweder global in der
Theme-Datei (`beamerthemeHM.sty`) ändern oder lokal in `main.tex` für einzelne Slides.

Einige Beispiele, die du in `main.tex` nach `\usetheme{HM}` verwenden kannst:

```tex
% Globale Änderung (für das ganze Dokument)
\setbeamertemplate{itemize item}[circle]      % Hauptpunkte: gefüllter Kreis
\setbeamertemplate{itemize subitem}[triangle] % Unterpunkte: kleines Dreieck
\setbeamertemplate{itemize subsubitem}[dash]  % Unter-Unterpunkte: kurzer Strich

% Lokale Änderung nur für einen Frame (nur innerhalb der Gruppe wirksam)
\begin{frame}{Verschachtelte Listen (andere Marker)}
  \begingroup % Änderungen gelten nur innerhalb dieser Gruppe
  \setbeamertemplate{itemize item}[circle]
  \setbeamertemplate{itemize subitem}{\raisebox{0.12ex}{\scriptsize$\circ$}}
  \setbeamertemplate{itemize subsubitem}{\raisebox{0.0ex}{\scriptsize$\rightarrow$}}
  \begin{itemize}
    \item Hauptpunkt A
      \begin{itemize}
        \item Unterpunkt A.1
        \item Unterpunkt A.2
          \begin{itemize}
            \item Detaillierter Punkt
          \end{itemize}
      \end{itemize}
  \end{itemize}
  \endgroup
\end{frame}
```

Hinweis: Für komplett eigene Symbole (z. B. Pfeile) setze die Template-Inhalte
auf eine kleine Formel/Box, wie im Beispiel gezeigt (`\scriptsize$\rightarrow$`).
Diese Methode ist kompatibel mit Overleaf und lokalen TeX-Installationen.

### Literatur (biblatex)
- Das Template nutzt `biblatex` mit `biber` als Backend. Beispiele stehen in `main.tex` (Sektion "Literatur (biblatex)") und in `references.bib`.
- DOIs werden im Literaturverzeichnis ausgegeben (Option `doi=true`).
- Lokal kompilieren: `pdflatex main`, `biber main`, anschließend zweimal `pdflatex main`.
- Overleaf: Project Settings → Compiler: LaTeX, Bibliography tool: Biber.
- Zitieren im Text: `\textcite{mueller2024}`, `\parencite{schmidt2023}`, als Fußnote: `\footfullcite{mueller2024}`.

### DOIs automatisch in BibTeX umwandeln
- Script: `tools/doi2bib.ps1` (PowerShell, nutzt DOI Content Negotiation).
- Beispiele:
  - Ein DOI: `powershell -ExecutionPolicy Bypass -File tools/doi2bib.ps1 10.1038/nphys1170`
  - Mehrere DOIs aus Datei: `powershell -ExecutionPolicy Bypass -File tools/doi2bib.ps1 -FromFile dois.txt`
  - Ziel-Datei (optional): `-BibPath myrefs.bib` (Default: `references.bib`)
- Das Script holt `application/x-bibtex` von `https://doi.org/<DOI>`, prüft grob auf Duplikate und hängt neue Einträge an.

### Literatur (biblatex)
- Das Template nutzt `biblatex` mit `biber` als Backend. Beispiele stehen in `main.tex` (Sektion "Literatur (biblatex)") und in `references.bib`.
- Lokal kompilieren: `pdflatex main`, `biber main`, anschließend zweimal `pdflatex main`.
- Overleaf: Project Settings → Compiler: LaTeX, Bibliography tool: Biber.
- Zitieren im Text: `\textcite{mueller2024}`, `\parencite{schmidt2023}`, als Fußnote: `\footfullcite{mueller2024}`.
## Zitierstil (APA 7)
- Dieses Template verwendet APA 7 in `main.tex` via `biblatex`.
- Stil festlegen/anpassen in `main.tex` an der Paketzeile und dem Sprach‑Mapping:

```tex
\usepackage[
  backend=biber,
  style=apa,
  sorting=nyt,
  giveninits=true,
  doi=true,
  isbn=false,
  url=true
]{biblatex}
% Deutsche Bezeichner im APA-Stil:
\DeclareLanguageMapping{ngerman}{ngerman-apa}
```

- Stilwechsel möglich: `style=ieee`, `style=numeric`, `style=authoryear` etc.

## Overleaf: DOIs via doi2bib.org (ohne lokale Tools)
- In Overleaf `references.bib` öffnen/anlegen.
- Auf https://doi2bib.org den DOI (z. B. `10.1002/job.2735`) einfügen, den BibTeX‑Eintrag kopieren.
- In `references.bib` einfügen und speichern. Overleaf: Project Settings → Bibliography tool: Biber.
- In `main.tex` mit dem Schlüssel zitieren: `\textcite{<key>}`, `\parencite{<key>}`.

## Langes Literaturverzeichnis (Beamer)
- Der Literatur‑Frame nutzt `allowframebreaks` und bricht automatisch auf Folgefolien um.
- In `main.tex` gesetzt als: `\begin{frame}[allowframebreaks]{Literaturverzeichnis}` mit `\printbibliography[heading=none]`.
