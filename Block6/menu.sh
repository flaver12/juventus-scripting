#!/bin/bash
#
# menu.sh
# Erstellt ein Skript Template, macht dieses ausführbar und
# ruft gleich einen Editor auf, um das Template zu editieren.
#
# Flavio Kleiber / 30.05.2024

# Funktion zum Anzeigen des Menüs
function show_menu() {
    echo "*************************************"
    echo "*            SKT Menu               *"
    echo "* 1 - Liste alle Shell Programme    *"
    echo "* 2 - Neues Shell Skript erstellen  *"
    echo "* e - Ende                          *"
    echo "*************************************"
}

# Funktion zum Auflisten aller Shell-Programme im aktuellen Verzeichnis
function list_shell_programs() {
    echo "Liste aller Shell Programme im aktuellen Verzeichnis:"
    # Findet alle Dateien im aktuellen Verzeichnis mit der Endung .sh
    for file in *.sh; do
        if [[ -f $file ]]; then
            echo "$file"
        fi
    done
}

# Funktion zum Erstellen eines neuen Shell-Skripts
function create_new_script() {
    read -p "Geben Sie den Namen des neuen Shell-Skripts ein: " script_name
    # Überprüfen, ob die Datei bereits existiert
    if [[ -f $script_name ]]; then
        echo "Datei existiert bereits!"
    else
        # Erstellt eine neue Datei mit einer Standard-Shebang-Zeile
        echo "#!/bin/bash" > "$script_name"
        # Macht die Datei ausführbar
        chmod +x "$script_name"
        echo "Shell-Skript $script_name erstellt und ausführbar gemacht."
        # Öffnet das neue Skript mit nvim und beendet das Hauptskript
        nvim "$script_name"
        exit 0
    fi
}

# Hauptschleife
while true; do
    show_menu
    read -p "Wählen Sie eine Option: " choice

    case $choice in
        1)
            list_shell_programs
            ;;
        2)
            create_new_script
            ;;
        e)
            echo "Programm beendet."
            break
            ;;
        *)
            echo "Ungültige Auswahl, bitte erneut versuchen."
            ;;
    esac
    echo # Leerzeile zur besseren Lesbarkeit
done

