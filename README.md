# HM Beamer Template (Overleaf-ready)

Weißer Hintergrund, schwarze Schrift, Akzentfarbe HM-Rot (#fb5454).
Logo unten links, Copyright zentriert, Seitenzahl rechts.

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

## Automatisierte Vorschau
Für jeden Push und Pull Request kompiliert GitHub Actions automatisch die Datei `main.tex`.
Das Ergebnis steht auf zwei Wegen bereit:

- **Direkte Vorschau:** Falls GitHub Pages aktiviert ist (siehe unten) und der Branch in den
  Pages-Bereich fällt, erscheint im Zusammenfassungsbereich des Workflows ("Summary" ➝
  Abschnitt „Preview“) ein Link zur gerenderten PDF bzw. einer Einbettungsseite.
- **Build-Artefakt:** Unabhängig davon wird das Artefakt `hm-beamer-template` erzeugt.
  Der Download liefert eine ZIP-Datei mit der `main.pdf` im Inneren und dient als Fallback –
  z. B. für Pull Requests aus Forks oder wenn GitHub Pages deaktiviert ist.

### GitHub-Pages-Preview aktivieren
1. GitHub Pages einschalten und als Quelle **GitHub Actions** auswählen
   (Repository → *Settings* → *Pages*).
2. Optional: Repository-Variable `PAGES_PREVIEW_BRANCH` setzen (Repository → *Settings* →
   *Secrets and variables* → *Actions* → *Variables*), um zu steuern, welche Branches deployen
   dürfen (Standard: Default-Branch des Repos). Der Wert `*` erlaubt alle Branches – dann
   müssen im Environment **github-pages** allerdings auch die entsprechenden Branch-Regeln
   freigegeben werden.

Sobald GitHub Pages aktiviert ist, veröffentlicht der Workflow erfolgreiche Branch-Builds aus
dem gewählten Scope automatisch. Für alle anderen Fälle zeigt die Workflow-Zusammenfassung an,
dass das Artefakt heruntergeladen werden kann.
