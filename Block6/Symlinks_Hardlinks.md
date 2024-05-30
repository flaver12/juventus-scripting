### Symlinks und Hardlinks: Kurzübersicht

#### Was sind Symlinks und Hardlinks?
- **Symlinks (Symbolische Links)**: Verweisen auf eine andere Datei oder ein Verzeichnis. Sie sind wie Verknüpfungen und können auf Dateien oder Verzeichnisse verweisen, auch wenn diese sich auf unterschiedlichen Dateisystemen befinden.
- **Hardlinks**: Verweisen direkt auf die Daten im Dateisystem und teilen denselben Inode wie das Original. Sie sind auf dasselbe Dateisystem beschränkt.

#### Wichtige Befehle

##### Symlinks
- **Erstellen eines Symlinks**:
  ```bash
  ln -s [Zieldatei/-verzeichnis] [Linkname]
  ```
  Beispiel:
  ```bash
  ln -s /home/user/original.txt /home/user/link.txt
  ```

- **Symlinks anzeigen**:
  ```bash
  ls -l [Linkname]
  ```
  Beispiel:
  ```bash
  ls -l /home/user/link.txt
  ```

- **Symlinks entfernen**:
  ```bash
  rm [Linkname]
  ```
  Beispiel:
  ```bash
  rm /home/user/link.txt
  ```

##### Hardlinks
- **Erstellen eines Hardlinks**:
  ```bash
  ln [Zieldatei] [Linkname]
  ```
  Beispiel:
  ```bash
  ln /home/user/original.txt /home/user/hardlink.txt
  ```

- **Hardlinks anzeigen**:
  ```bash
  ls -l [Linkname]
  ```
  Beispiel:
  ```bash
  ls -l /home/user/hardlink.txt
  ```

- **Hardlinks entfernen**:
  ```bash
  rm [Linkname]
  ```
  Beispiel:
  ```bash
  rm /home/user/hardlink.txt
  ```

#### Unterschiede
- **Symlinks** können über Dateisystemgrenzen hinweg erstellt werden und verweisen auf den Pfad einer Datei oder eines Verzeichnisses.
- **Hardlinks** können nur innerhalb desselben Dateisystems erstellt werden und teilen denselben Inode wie die Originaldatei, was bedeutet, dass sie denselben Speicherplatz nutzen.

#### Fazit
- **Symlinks** sind flexibler und eignen sich gut für Verweise auf Dateien oder Verzeichnisse über verschiedene Dateisysteme hinweg.
- **Hardlinks** sind effizienter in Bezug auf Speicherplatz, da sie denselben Inode verwenden, aber auf dasselbe Dateisystem beschränkt sind.

