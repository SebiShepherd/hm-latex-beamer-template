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

- **Direkte Vorschau:** Falls GitHub Pages aktiviert ist (siehe unten), erscheint im
  Zusammenfassungsbereich des Workflows ("Summary" ➝ Abschnitt „Preview“) ein Link zur
  gerenderten PDF bzw. einer Einbettungsseite.
- **Build-Artefakt:** Unabhängig davon wird das Artefakt `hm-beamer-template` erzeugt.
  Der Download liefert eine ZIP-Datei mit der `main.pdf` im Inneren und dient als Fallback –
  z. B. für Pull Requests aus Forks oder wenn GitHub Pages deaktiviert ist.

### GitHub-Pages-Preview aktivieren
1. Repository-Variable `ENABLE_PAGES_PREVIEW` mit dem Wert `true` anlegen
   (Repository → *Settings* → *Secrets and variables* → *Actions* → *Variables*).
2. GitHub Pages einschalten und als Quelle **GitHub Actions** auswählen
   (Repository → *Settings* → *Pages*).

Erst wenn beide Schritte erledigt sind, wird die Workflow-Job-Ausgabe automatisch auf
GitHub Pages veröffentlicht. Bis dahin erscheint im Workflow-Zusammenfassungstab ein Hinweis,
dass stattdessen das Artefakt verwendet werden soll.
