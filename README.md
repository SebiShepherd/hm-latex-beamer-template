# HM Beamer Template (Overleaf-ready)

Weißer Hintergrund, schwarze Schrift, Akzentfarbe HM-Rot (#fb5454).
Coverfolie mit zweispaltigem Kopf (Institution links, Titel rechts) und großem HM-Logo unten links.
Inhaltsfolien mit Überschrift, Unterüberschrift, roter Highlight-Box und Fußzeile mit Logo, Dokumenttitel, Autor:in und Seitenzahl.

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
2. In `main.tex` Meta-Daten anpassen (`\title`, `\subtitle`, `\author`, `\institute`, `\date`).
3. Optional: Linke Cover-Spalte mit `\sethmcoverleft{...}` überschreiben (Standard: Institut + Autor:in).
4. Optional: Rote Highlight-Leiste pro Slide via `\hmhighlight{...}` verwenden.
5. Eigenes Logo einbinden – Datei ins Projekt laden und in `main.tex` `\sethmlogo{<dein_logo>}` setzen.
6. Zusatzinfo in der Fußzeile per `\sethmfooter{...}` ergänzen (erscheint nach Titel und Autor:in).

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
