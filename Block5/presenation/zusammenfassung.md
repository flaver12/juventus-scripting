# Entwicklung eigener Cmdlets mit C#

## Inhaltsverzeichnis
1. [Grundkonzept](#grundkonzept)
2. [Erstellung eines Cmdlets mit Rückgabeobjekten](#erstellung-eines-cmdlets-mit-rückgabeobjekten)
3. [Verarbeitung von Pipeline-Eingaben](#verarbeitung-von-pipeline-eingaben)
4. [Integration von Hilfeinformationen](#integration-von-hilfeinformationen)
5. [Einsatzbereich](#einsatzbereich)
6. [Beispielprojekt](#beispielprojekt)

## Grundkonzept

Cmdlets sind spezielle .NET-Klassen, die in PowerShell-Befehle integriert werden können. Sie ermöglichen die Erweiterung der PowerShell-Funktionalität durch maßgeschneiderte Befehle. Cmdlets bieten eine einfache Möglichkeit, komplexe Aufgaben zu automatisieren und zu vereinfachen.

## Erstellung eines Cmdlets mit Rückgabeobjekten

Ein Cmdlet wird durch Erstellen einer Klasse implementiert, die von `Cmdlet` oder `PSCmdlet` erbt und die `ProcessRecord`-Methode überschreibt. Rückgabeobjekte werden über die `WriteObject`-Methode ausgegeben.

### Technische Erläuterungen

Die Klasse muss mit dem `[Cmdlet]`-Attribut versehen werden, das die Verben und Nomen des Cmdlets angibt. In der `ProcessRecord`-Methode wird die Hauptlogik des Cmdlets implementiert.

**Beispiel:**

```csharp
using System.Management.Automation;

[Cmdlet(VerbsCommon.Get, "CustomObject")]
public class GetCustomObjectCmdlet : Cmdlet
{
    protected override void ProcessRecord()
    {
        var customObject = new { Name = "Test", Value = 42 };
        WriteObject(customObject);
    }
}
```

## Verarbeitung von Pipeline-Eingaben

Cmdlets können Eingaben aus der PowerShell-Pipeline verarbeiten. Parameter, die Pipeline-Eingaben akzeptieren, werden mit dem Attribut `[Parameter(ValueFromPipeline = true)]` markiert. Die Methode `ProcessRecord` wird für jede Eingabe aus der Pipeline aufgerufen.

### Technische Erläuterungen

Der Parameter muss eine öffentliche Eigenschaft der Klasse sein und das `ProcessRecord`-Attribut nutzen, um die Eingaben zu verarbeiten.

**Beispiel:**

```csharp
using System.Management.Automation;

[Cmdlet(VerbsCommon.Get, "ProcessedInput")]
public class GetProcessedInputCmdlet : Cmdlet
{
    [Parameter(ValueFromPipeline = true)]
    public string Input { get; set; }

    protected override void ProcessRecord()
    {
        string processedInput = Input.ToUpper();
        WriteObject(processedInput);
    }
}
```

## Integration von Hilfeinformationen

Hilfeinformationen sind essentiell für die Benutzerfreundlichkeit eines Cmdlets. Diese Informationen können durch XML-Dokumentation und das `[CmdletBinding]`-Attribut integriert werden.

### Technische Erläuterungen

Die XML-Dokumentation sollte die Funktion des Cmdlets, die Parameter und die Rückgabewerte beschreiben. Zudem können ausführlichere Hilfeinformationen in einer separaten XML-Datei bereitgestellt werden.

**Beispiel:**

```csharp
using System.Management.Automation;

[Cmdlet(VerbsCommon.Get, "HelpExample")]
[OutputType(typeof(string))]
public class GetHelpExampleCmdlet : Cmdlet
{
    /// <summary>
    /// Dies ist eine Beschreibung des Cmdlets.
    /// </summary>
    protected override void ProcessRecord()
    {
        WriteObject("Dies ist ein Beispiel für ein Cmdlet mit Hilfeinformationen.");
    }
}
```

## Einsatzbereich

### Konkrete Einsatzmöglichkeiten

Cmdlets sind vielseitig einsetzbar und eignen sich besonders für:
- Automatisierung von Verwaltungsaufgaben
- Datenverarbeitung und -analyse
- Integration verschiedener Systeme und Dienste
- Skriptbasierte Anwendungserweiterungen

## Beispielprojekt

### Voraussetzungen

Um ein Cmdlet zu erstellen, sind folgende Voraussetzungen nötig:
- Visual Studio oder ein ähnlicher C#-Entwicklungseditor
- Grundkenntnisse in C# und .NET
- Installierte PowerShell-SDK

### Belehrend und nachvollziehbar

Das folgende Beispielprojekt zeigt, wie ein einfaches Cmdlet erstellt wird, das die Namen von Dateien in einem Verzeichnis auflistet und deren Größe anzeigt.

**Projektstruktur:**

1. Erstellen eines neuen C#-Projekts in Visual Studio
2. Hinzufügen der notwendigen Referenzen zu `System.Management.Automation`
3. Implementieren des Cmdlets

**Schritt-für-Schritt-Anleitung:**

1. Neues Projekt erstellen:
   - Öffne Visual Studio und erstelle ein neues "Class Library"-Projekt.

2. Referenz hinzufügen:
   - Füge eine Referenz zu `System.Management.Automation` hinzu.

3. Cmdlet implementieren:

**Beispiel:**

```csharp
using System;
using System.IO;
using System.Management.Automation;

[Cmdlet(VerbsCommon.Get, "FileDetails")]
public class GetFileDetailsCmdlet : Cmdlet
{
    [Parameter(Position = 0, Mandatory = true)]
    public string Path { get; set; }

    protected override void ProcessRecord()
    {
        if (Directory.Exists(Path))
        {
            var files = Directory.GetFiles(Path);
            foreach (var file in files)
            {
                var fileInfo = new FileInfo(file);
                var output = new
                {
                    FileName = fileInfo.Name,
                    Size = fileInfo.Length
                };
                WriteObject(output);
            }
        }
        else
        {
            WriteError(new ErrorRecord(
                new DirectoryNotFoundException($"The directory '{Path}' does not exist."),
                "DirectoryNotFound",
                ErrorCategory.ObjectNotFound,
                Path));
        }
    }
}
```

4. Build und Test:
   - Baue das Projekt und teste das Cmdlet in der PowerShell, indem du das Assembly importierst und das Cmdlet ausführst:

```powershell
Import-Module "Pfad\zu\deinem\Build\Projekt.dll"
Get-FileDetails -Path "C:\DeinVerzeichnis"
```

### Grafische Visualisierung

Eine schematische Darstellung der Klassenstruktur und des Datenflusses kann die Funktionalität verdeutlichen.

**Diagramm:**

```
┌────────────────────────┐
│      GetFileDetails    │
│       (Cmdlet)         │
├────────────────────────┤
│ + Path: string         │
├────────────────────────┤
│ + ProcessRecord()      │
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│       Directory        │
│       (System.IO)      │
├────────────────────────┤
│ + GetFiles(path)       │
└───────────┬────────────┘
            │
            ▼
┌────────────────────────┐
│       FileInfo         │
│       (System.IO)      │
├────────────────────────┤
│ + Name: string         │
│ + Length: long         │
└────────────────────────┘
```

## Zusammenfassung

Das Erstellen eigener Cmdlets in C# bietet eine leistungsstarke Möglichkeit, die Funktionalität von PowerShell zu erweitern. Die wichtigsten Schritte umfassen das Erstellen von Rückgabeobjekten, die Verarbeitung von Pipeline-Eingaben und die Integration von Hilfeinformationen. Konkrete Einsatzmöglichkeiten sind die Automatisierung von Aufgaben und die Integration verschiedener Systeme. Ein Beispielprojekt zeigt, wie diese Elemente in der Praxis umgesetzt werden können.
