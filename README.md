# Jungar byhistorik

## Allmänna instruktioner

### Bilder

Placera alla bilder i katalogen *bilder*. Bildernas filnamn får ej innehålla bokstäverna å, ä eller ö och helst inte mellanslag heller. Använd gärna beskrivande filnamn.

Bilderna bör ha så hög upplösning som möjligt för att det inte ska bli otydligt vid tryck. Vid behov kan mindre versioner av bilderna skapas automatiskt utgående ifrån originalfilerna.


### Textfiler

Text som ska ingå i dokumentet ska sparas i filer i grundkatalogen. Filnamnen bör bara innehålla bokstäver från a-z ej innehålla mellanslag och sluta med ändelsen *.tex*.

### Index

Ordningen på hur textfiler ska inkluderas i det slutgiltiga dokumentet anges i filen *index.txt*. Ange ett filnamn per rad i den ordning som de önskas inkluderas.


## Skrivinstruktioner


### Kortkommandon

`\jhchapter{kapitelnamn}` - Skapar nytt kapitel.

`\jhsection{sektionsnamn}` - …

`\jhsubsection{undersektionsnamn}` - …

`\jhhouse{husnamn}{registernummer}{hemman}{kartblad}{husnummer}` - Påbörjar ett avsnitt om en gård.

`\jhoccupant{efternamn}{förnamn}{årtal}` - Boende på gården under ett tidsintervall.

`\jhnooccupant{}` - Används efter ett `\jhhouse` som inte har någon innevånare för att få korrekt utseende i innehållsförteckningen

`\jhhousepic[]{filnamn}{bildtext}` - Infogar husbild från katalogen *bilder*. [] kan lämnas bort; används för att ange referens ex `\jhhousepic[pic:kvarnen]{kv.jpg}{Kvarnen}`. Kan senare refereras till med `\ref{pic:kvarnen}` och/eller `\pageref{pic:kvarnen}`.

`\jhpic[]{filnamn}{bildtext}{bredd}` - Infogar bild från katalogen *bilder*. - " -. Bredden anges som en andel av textbredden där 1 är lika bred som texten (standardläget). Ex: 0.8

`\jhperson[]{namn}{född}{död}` - Formaterar automatiskt datumen.

`\jhname[]{}` - Används för att lägga till namn till registret. Sätt fullständiga namnet i {}-fältet. Fältet [] kan lämnas bort men används annars för att skriva ut ett annat namn i texten än det som sätts in i registret. Ex: `\jhname[Alfons]{Alfons Åberg}` gör att "Alfons" kommer att stå i texten medan det i registret står "Alfons Åberg". Ex2: `\jhname{Alfons Åberg}` gör att det står "Alfons Åberg" både i texten och registret.

`\jhbold{text}` -  Fet stil

`\ref{}`, `\pageref{}` - Används för att referera till en viss bild.


### Listor och tabeller

Lista över barn skapas på följande sätt:

<pre>
\begin{jhchildren}
  \item \jhperson{Pelle Svanslös}{01.01.1901}{12.12.1912}, katt
  \item \jhperson{Mamma Mu}{01.02.2003}{}, ko
\end{jhchildren}</pre>

Texten *Barn:* sätts automatiskt in före listan.

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

Kommandot `\begin{center}` säger att hela tabellen ska centreras på sidan. Det andra fältet i `\begin{tabular}{l|c|r}` anger antalet kolumner, i det här fallet 3 st, samt hur text i kolumnerna ska justeras. Tecknet `|` betyder att kolumnerna separeras av en linje. Lämna bort om linjenseparator ej önskas. Värden i tabellen separeras sedan med `&` och en rad i tabellen avslutas med `\\`. För att infoga horisontella linjer kan man använda kommandot `\hline`. För att få in text med radbrytningar i en tabell kan kolumntypen `p{}` användas där bredden sätts inom vågparentesarna, t.ex. `0.7\textwidth`. Om tabellen är lång kan man använda `longtable` i stället för `tabular` så den kan sidbrytas.

Listor:

Punkterade

<pre>
\begin{itemize}
  \item hejsan
\end{itemize}</pre>

Numrerade

<pre>
\begin{enumerate}
  \item hejsan
  \item svejsan
\end{enumerate}</pre>



### Specialtecken

Tecknet *&* fås med `\&`. Citat görs genom att börja citatet med två \`  (grav accent) och avsluta med två `'` (enkel citattecken).

## Atom handhavande

### Skapa ny fil

Antingen genom **File -> New File**, vilket skapar en tom icke namngiven fil som man sedan sparar som vanligt med **File -> Save As** (där man anger namn och i vilken katalog den ska vara [jungar-byhistorik]), eller genom att högerklicka på något tomt område i vänstra spalten och välja **New File**. Det kommer då upp en ruta där man får ange filnamnet direkt.

### Skapa PDF-fil

För att skapa en ny *historik.pdf* kan man antingen trycka `Cmd Alt B / Ctrl Alt B / F9` eller gå via **Packages -> Build -> Build project**. Uppstår något fel vid körning så visas det i ett fönster.

### Git versionshantering

Filerna i vänstra spalten har olika färger beroende på deras status i versionshanteringen.

- Ljusgrå: Versionshanterade filer utan ändringar
- Orange: Versionshanterade filer med nya ändringar
- Grön: Filer som ej är versionshanterade
- Mörkgrå: Filer som är undantagna versionshanteringen

För att börja versionshantera en ny fil (grön): högerklicka på filen och välj **Git -> Git add**. Gå sedan via **Packages -> Git Plus -> Commit** för att slutföra. Det öppnas då ett nytt fönster med titeln *COMMIT_EDITMSG* Där man kan skriva ett kort meddelande som beskriver ändringen på första raden. T.ex. "*Lägg till fil med text om Krymboas*".

För att spara ändringar på filer som redan är versionshanterade (orange) så gör man på samma sätt. Har man ändringar i fler filer och vill lägga till alla ändringar så kan man gå via **Packages -> Git Plus -> Add All**.

När man vill ladda upp ändringarna till Github går man via **Packages -> Git Plus -> Push**.
