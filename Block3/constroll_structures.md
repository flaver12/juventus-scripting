## Verzweigungen

### If

```powershell
if ($variable -eq $wert) {
    # Code, der ausgeführt wird, wenn die Bedingung wahr ist
}
```

### If Not Equals

```powershell
if ($variable -ne $andererWert) {
    # Code, der ausgeführt wird, wenn die Variable nicht dem anderen Wert entspricht
}
```

### If Else

```powershell
if ($variable -eq $wert) {
    # Code, der ausgeführt wird, wenn die Bedingung wahr ist
} else {
    # Code, der ausgeführt wird, wenn die Bedingung falsch ist
}
```

## Fallunterscheidung (Switch)

```powershell
switch ($variable) {
    'Wert1' {
        # Code für den Fall, dass $variable 'Wert1' ist
        break
    }
    'Wert2' {
        # Code für den Fall, dass $variable 'Wert2' ist
        break
    }
    default {
        # Code, der ausgeführt wird, wenn keine Übereinstimmung gefunden wird
    }
}
```

## Schleifen

### While

```powershell
while ($variable -lt 10) {
    # Code, der wiederholt ausgeführt wird, solange die Bedingung wahr ist
    $variable++
}
```

### Do While

```powershell
do {
    # Code, der mindestens einmal ausgeführt und dann wiederholt wird, solange die Bedingung wahr ist
    $variable++
} while ($variable -lt 10)
```

### For

```powershell
for ($i = 0; $i -lt 10; $i++) {
    # Code, der für jeden Durchlauf der Schleife ausgeführt wird
}
```

### Foreach

```powershell
foreach ($element in $sammlung) {
    # Code, der für jedes Element in der Sammlung ausgeführt wird
}
```

## Break / Continue

### Break

Wird innerhalb einer Schleife verwendet, um die Ausführung der Schleife sofort zu beenden.

```powershell
for ($i = 0; $i -lt 10; $i++) {
    if ($i -eq 5) {
        break
    }
    # Dieser Code wird für Werte von $i von 0 bis 4 ausgeführt
}
```

### Continue

Wird innerhalb einer Schleife verwendet, um den aktuellen Durchlauf der Schleife sofort zu beenden und mit dem nächsten Durchlauf fortzufahren.

```powershell
for ($i = 0; $i -lt 10; $i++) {
    if ($i -eq 5) {
        continue
    }
    # Dieser Code wird für Werte von $i außer 5 ausgeführt
}
```
