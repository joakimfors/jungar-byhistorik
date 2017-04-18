# Jungar byhistorik

## Bilder

Placera alla bilder i katalogen *bilder*. Bildernas filnamn får ej innehålla bokstäverna å, ä eller ö. Använd gärna beskrivande filnamn.

Bilderna bör ha så hög upplösning som möjligt för att det inte ska bli otydligt vid tryck. Vid behov kan mindre versioner av bilderna skapas automatiskt utgående ifrån originalfilerna.


## Skrivinstruktioner


### Kortkommandon

`\jhchapter{kapitelnamn}` - Skapar nytt kapitel

`\jhhouse{husnamn}{...}{...}` -

`\jhoccupant{efternamn}{förnamn}{årtal}` -

`\jhhousepic{filnamn}` - Infogar husbild från katalogen *bilder*

`\jhpic{filnamn}` - Infogar bild från katalogen *bilder*

`\jhperson{namn}{född}{död}` - Formaterar automatiskt datumen


### Listor och tabeller

Lista över barn skapas på följande sätt:

<pre>
\begin{jhchildren}
  \item \jhperson{Pelle Svanslös}{01.01.1901}{12.12.1912}, katt
  \item \jhperson{Mamma Mu}{01.02.2003}{}, ko
\end{jhchildren}</pre>

Tabeller skapas t.ex. som nedan:

<pre>
\begin{center}
  \begin{tabular}{l|c|r}
    \hline
    1 & 2 & 3 \\ \hline
    4 & 5 & 6 \\ \hline
    7 & 8 & 9 \\
    \hline
  \end{tabular}
\end{center}</pre>

Kommandot `\begin{center}` säger att hela tabellen ska centreras på sidan. Det andra fältet i `\begin{tabular}{l|c|r}` anger antalet kolumner samt hur text i kolumnerna ska justeras. Tecknet `|` betyder att kolumnerna separeras av en linje. Värden i tabellen separeras sedan med `&` och en rad i tabellen avslutas med `\\`. För att infoga horisontella linjer kan man använda kommandot `\hline`.


### Specialtecken

Tecknet *&* fås med `\&`.


## Atom handhavande

### Skapa PDF-fil

För att skapa en ny *historik.pdf* kan man antingen trycka `Cmd Alt B / Ctrl Alt B / F9` eller gå via **Packages -> Build -> Build project**. Uppstår något fel vid körning så visas det i ett fönster.

### Git versionshantering

Filerna i vänstra spalten har olika färger beroende på deraas status i versionshanteringen.

- Ljusgrå: Versionshanterade filer utan ändringar
- Orange: Versionshanterade filer med nya ändringar
- Grön: Filer som ej är versionshanterade
- Mörkgrå: Filer som är undantagna versionshanteringen

För att börja versionshantera en ny fil (grön): högerklicka på filen och välj **Git -> Git add**. Gå sedan via **Packages -> Git Plus -> Commit** för att slutföra. Det öppnas då ett nytt fönster med titeln *COMMIT_EDITMSG* Där man kan skriva ett kort meddelande som beskriver ändringen på första raden. T.ex. "*Lägg till fil med text om Krymboas*".

För att spara ändringar på filer som redan är versionshanterade (orange) så gör man på samma sätt. Har man ändringar i fler filer och vill lägga till alla ändringar så kan man gå via **Packages -> Git Plus -> Add All**.

När man vill ladda upp ändringarna till Github går man via **Packages -> Git Plus -> Push**.
