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

- **Direkte Vorschau:** Für Branches im Hauptrepository wird die generierte PDF-Datei über
  GitHub Pages veröffentlicht. Der Link erscheint im Zusammenfassungsbereich des Workflows
  ("Summary" ➝ Abschnitt „Preview“) und führt direkt zur PDF bzw. einer Einbettungsseite.
- **Build-Artefakt:** Unabhängig davon steht weiterhin das Artefakt `hm-beamer-template`
  zur Verfügung. Bei Pull Requests aus Forks (bei denen GitHub Pages nicht deployt werden
  darf) ist dies der Fallback zum Herunterladen der PDF.
