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
