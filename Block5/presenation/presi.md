---
marp: true
theme: default
paginate: true
header: "Entwicklung eigener Cmdlets mit C#"
footer: "Flavio Kleiber"
---

# Entwicklung eigener Cmdlets mit C#

## Inhaltsverzeichnis
1. Grundkonzept
2. Erstellung eines Cmdlets mit Rückgabeobjekten
3. Verarbeitung von Pipeline-Eingaben
4. Integration von Hilfeinformationen
5. Einsatzbereich
6. Ablauf
7. Demo

---

# Grundkonzept

Cmdlets sind spezielle .NET-Klassen, die in PowerShell-Befehle integriert werden können. Sie erweitern die PowerShell-Funktionalität durch maßgeschneiderte Befehle.

---

# Erstellung eines Cmdlets mit Rückgabeobjekten

- Ein Cmdlet wird durch eine Klasse implementiert, die von `Cmdlet` oder `PSCmdlet` erbt.
- Rückgabeobjekte werden über die `WriteObject`-Methode ausgegeben.

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

---

# Verarbeitung von Pipeline-Eingaben

- Cmdlets können Eingaben aus der PowerShell-Pipeline verarbeiten.
- Parameter mit `[Parameter(ValueFromPipeline = true)]` markieren.

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

---

# Integration von Hilfeinformationen

- Hilfeinformationen sind essentiell für die Benutzerfreundlichkeit eines Cmdlets.
- Verwendung von `[CmdletBinding]`-Attribut und XML-Dokumentation.

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

---

# Einsatzbereich

### Konkrete Einsatzmöglichkeiten

- Automatisierung von Verwaltungsaufgaben
- Datenverarbeitung und -analyse
- Integration verschiedener Systeme und Dienste
- Skriptbasierte Anwendungserweiterungen

---

### Grafische Visualisierung

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

---

# Live Demo
```

