��    K      t  e   �      `  o   a  ?   �  �     .   �  #   �     �  '        >     L     g     {  (   �     �  K   �     	     	  -   #	     Q	     `	     i	  R   q	     �	     �	  8   �	  M   "
  k   p
  8   �
  (        >  �   C       u   =     �     �  X   �  @        W     m  ;   �     �  6   �  7     �   P  /   �  4   	  =   >  Y   |  �  �  )   �  7   �     �  1     '   M  .   u  C   �    �       �     \   �     �       n   $     �  @   �     �  &   
     1     4  '   F     n  !   �     �  a   �     '  :  +  {   f  @   �  �   #  6   �  -        =  /   \     �     �     �     �  0   �  #   	  \   -     �     �  C   �     �  
   �     �  j        l     {  E   �  ^   �  }   0  R   �  %        '    -  (   /  �   X     �     �  i   �  G   _      �       �   9   �   !   !  Q   7!  ;   �!  �   �!  =   n"  >   �"  C   �"  n   /#  :  �#  4   �%  ?   &  &   N&  :   u&  -   �&  .   �&  B   '  9  P'     �(  �   �(  k   7)     �)  $   �)  }   �)  )   M*  F   w*  &   �*  5   �*     +      +  >   2+     q+  )   �+  #   �+  z   �+     V,     8   /      C          I      7   "   G   -             >      (   @      9       
          !      .   	          F                    +           #   D           H                 '              ,       5   4                            :         ?   ;          0       J   1       &      B      2      )   K       *      $              =   E   6   <   3   %          A    
        --outdated		Merge in even outdated translations.
	--drop-old-templates	Drop entire outdated templates. 
  -o,  --owner=package		Set the package that owns the command.   -f,  --frontend		Specify debconf frontend to use.
  -p,  --priority		Specify minimum priority question to show.
       --terse			Enable terse mode.
 %s failed to preconfigure, with exit status %s %s is broken or not fully installed %s is fuzzy at byte %s: %s %s is fuzzy at byte %s: %s; dropping it %s is missing %s is missing; dropping %s %s is not installed %s is outdated %s is outdated; dropping whole template! %s must be run as root (Enter zero or more items separated by a comma followed by a space (', ').) Back Choices Config database not specified in config file. Configuring %s Continue Debconf Debconf is not confident this error message was displayed, so it mailed it to you. Debconf on %s Debconf, running at %s Dialog frontend is incompatible with emacs shell buffers Dialog frontend requires a screen at least 13 lines tall and 31 columns wide. Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal. Enter the items you want to select, separated by spaces. Extracting templates from packages: %d%% Help If you quit this configuration dialog, then the package being configured will probably fail to install, and you may have to fix it manually. This may be especially difficult if you are in the middle of a large upgrade. Ignoring invalid priority "%s" Input value, "%s" not found in C choices! This should never happen. Perhaps the templates were incorrectly localized. More Next No usable dialog-like program is installed, so the dialog based frontend cannot be used. Note: Debconf is running in web mode. Go to http://localhost:%i/ Package configuration Preconfiguring packages ...
 Problem setting up the database defined by stanza %s of %s. Really quit configuration? TERM is not set, so the dialog frontend is not usable. Template #%s in %s does not contain a 'Template:' line
 Template #%s in %s has a duplicate field "%s" with new value "%s". Probably two templates are not properly separated by a lone newline.
 Template database not specified in config file. Template parse error near `%s', in stanza #%s of %s
 Term::ReadLine::GNU is incompatable with emacs shell buffers. The Sigils and Smileys options in the config file are no longer used. Please remove them. The editor-based debconf frontend presents you with one or more text files to edit. This is one such text file. If you are familiar with standard unix configuration files, this file will look familiar to you -- it contains comments interspersed with configuration items. Edit the file, changing any items as necessary, and then save it and exit. At that point, debconf will read the edited file, and use the values you entered to configure the system. This frontend requires a controlling tty. Unable to load Debconf::Element::%s. Failed because: %s Unable to start a frontend: %s Unknown template field '%s', in stanza #%s of %s
 Usage: debconf [options] command [args] Usage: debconf-communicate [options] [package] Usage: debconf-mergetemplate [options] [templates.ll ...] templates Usage: dpkg-reconfigure [options] packages
  -u,  --unseen-only		Show only not yet seen questions.
       --default-priority	Use default priority instead of low.
       --force			Force reconfiguration of broken packages.
       --no-reload		Do not reload templates. (Use with caution.) Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. You may need to quit anyway if you are stuck in a configuration loop due to a buggy package. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf 1.5.63
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2017-07-12 13:47+0200
Last-Translator: Helge Kreutzmann <debian@helgefjell.de>
Language-Team: de <debian-l10n-german@lists.debian.org>
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
        --outdated		Selbst veraltete Übersetzungen einbeziehen.
	--drop-old-templates	Veraltete Vorlagen ganz ignorieren. 
  -o,  --owner=Paket		Das Paket setzen, dem der Befehl gehört.   -f,  --frontend		Zu benutzende Debconf-Oberfläche angeben.
  -p,  --priority		Minimale anzuzeigende Priorität für Fragen angeben.
       --terse			Kompakten Modus aktivieren.
 %s konnte nicht vorkonfiguriert werden, Exit-Status %s %s ist kaputt oder nicht komplett installiert %s ist unscharf in Byte %s: %s %s ist unscharf in Byte %s: %s; lasse es fallen %s fehlt %s fehlt; lasse %s fallen %s ist nicht installiert %s ist veraltet %s ist veraltet; lasse die ganze Vorlage fallen! %s muss als Root ausgeführt werden (Geben Sie keinen oder mehr Begriffe durch ein Komma und ein Leerzeichen (, ) getrennt ein.) Zurück Auswahl Konfigurationsdatenbank in der Konfigurationsdatei nicht angegeben. Konfiguriere %s Fortfahren Debconf Debconf war sich nicht sicher, dass diese Fehlermeldung angezeigt wurde, daher wurde sie Ihnen zugesendet. Debconf auf %s Debconf, auf %s Die Dialog-Oberfläche ist mit dem Emacs-Shellbuffer nicht kompatibel Für die Dialog-Oberfläche muss das Bild mindestens 13 Zeilen hoch und 31 Spalten breit sein. Die Dialog-Oberfläche funktioniert nicht auf einem Dumb-Terminal, einem Emacs-Shellbuffer oder ohne ein steuerndes Terminal. Geben Sie die Elemente, die Sie auswählen wollen, durch Leerzeichen getrennt ein. Extrahiere Vorlagen aus Paketen: %d%% Hilfe Falls Sie diesen Konfigurationsdialog abbrechen, dann wird das zu konfigurierende Paket wahrscheinlich nicht erfolgreich installiert und Sie müssen das manuell beheben. Dies kann besonders problematisch sein, falls Sie mitten in einem großen Upgrade sind. Ignoriere ungültige Priorität „%s“ Eingabewert „%s“ nicht in der C-Auswahl gefunden! Das sollte nie passieren. Vielleicht wurde die Vorlage unvorschriftsmäßig lokalisiert. Weiter Weiter Kein passendes Dialog-Programm ist installiert, daher kann die Dialog-Oberfläche nicht verwendet werden. Achtung: Debconf läuft im Web-Modus. Gehen Sie zu http://localhost:%i/ Paketkonfiguration Vorkonfiguration der Pakete ...
 Problem beim Anlegen der Datenbank nach Absatz %s von %s. Konfiguration wirklich abbrechen? TERM ist nicht gesetzt, die Dialog-Oberfläche kann daher nicht verwendet werden. Vorlage Nr. %s in %s enthält keine „Template:“-Zeile.
 Vorlage Nr. %s in %s hat ein doppeltes Feld „%s“ mit dem neuen Wert „%s“. Wahrscheinlich sind zwei Vorlagen nicht ordentlich durch eine leere Zeile abgetrennt.
 Vorlagendatenbank in der Konfigurationsdatei nicht angegeben. Auswertfehler in Vorlage bei „%s“ in Absatz Nr. %s von %s
 Term::ReadLine::GNU ist mit dem Emacs-Shellbuffer nicht kompatibel. Die Optionen Sigils und Smileys in der Konfigurationsdatei werden nicht mehr benutzt. Bitte entfernen Sie sie. Die Editor-basierte Debconf-Oberfläche legt Ihnen eine oder mehrere Textdateien zur Bearbeitung vor. Dieses ist eine solche Textdatei. Falls Sie mit gewöhnlichen Unix-Konfigurationsdateien vertraut sind, wird ihnen diese Datei vertraut erscheinen –- sie beinhaltet Erläuterungen und eingestreute Konfigurationselemente. Bearbeiten Sie die Datei, ändern Sie nach Bedarf Elemente, speichern Sie sie anschließend und beenden Sie den Editor. Dann wird Debconf die bearbeitete Datei lesen und die von Ihnen eingegebenen Werte verwenden, um das System zu konfigurieren. Diese Oberfläche bedarf eines steuernden Terminals. Kann Debconf::Element::%s nicht laden. Fehlgeschlagen wegen: %s Kann die Oberfläche nicht starten: %s Unbekanntes Vorlagenfeld „%s“ in Absatz Nr. %s von %s
 Aufruf: debconf [Optionen] Befehl [Argumente] Aufruf: debconf-communicate [Optionen] [Paket] Aufruf: debconf-mergetemplate [Optionen] [Vorlage.ll ...] Vorlagen Aufruf: dpkg-reconfigure [Optionen] Pakete
  -u,  --unseen-only		Nur noch nicht gestellte Fragen zeigen.
       --default-priority	Voreingestellte Priorität benutzen (statt niedrig).
       --force			Neukonfiguration kaputter Pakete erzwingen.
       --no-reload		Vorlagen nicht neu laden. (Vorsichtig verwenden) Gültige Prioritäten sind: %s Sie benutzen die Editor-basierte Debconf-Oberfläche, um Ihr System zu konfigurieren. Siehe Ende dieser Unterlagen für genauere Anweisungen. Sie müssen dennoch abbrechen, falls Sie in einer Konfigurationsschleife eines defekten Pakets feststecken. _Hilfe apt-extracttemplates schlug fehl: %s debconf-mergetemplate: Dieses Werkzeug ist veraltet. Sie sollten stattdessen das Programm po2debconf aus po-debconf benutzen. debconf: kann kein chmod durchführen: %s Schiebe die Paketkonfiguration auf, da apt-utils nicht installiert ist greife zurück auf die Oberfläche: %s es müssen debs zum Vorkonfigurieren angegeben werden nein keines der Obigen bitte geben Sie ein Paket an, das Sie neu konfigurieren wollen Vorlagen-Auswertefehler: %s kann Oberfläche nicht initialisieren: %s kann Stdin nicht wieder öffnen: %s Warnung: mögliche Datenbankfehler. Versuche, sie durch erneutes Hinzufügen der Fragen zu reparieren. Fehlende Frage: %s. ja 