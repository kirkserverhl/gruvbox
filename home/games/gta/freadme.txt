Grand Theft Auto - Problèmes d'installation

Version 24 Bits
--------------

Si les graphiques du jeu sont flous en version 24 bits, modifiez la résolution dans le menu accessible 
avec la touche F11. 
Le mode "High Colour" de GTA utilise une version intégrée du gestionnaire Univbe pour les résolutions 
en 15, 16 et 32 bits. Si votre carte vidéo n'est pas reconnue par le test Univbe, ou si vous avez 
changé de carte vidéo et que le test ne semble pas la reconnaître, lancez l'utilitaire uvconfig.exe 
dans le répertoire gtados. Si cela ne résout pas le problème, lancez la version 24-bits de GTA en 
entrant sous DOS la commande gta24 -nounivbe dans le répertoire gtados. De cette façon, le programme 
ignorera Univbe et utilisera les gestionnaires d'origine de votre carte vidéo. Une autre solution 
consiste à obtenir la dernière version d'Univbe par SciTech Software. Vous devrez lancer Univbe en 
mode résident (TSR), c'est-à-dire que le programme restera actif en tâche de fond, même si vous le 
quittez avant de jouer à GTA.

Gestionnaires Windows (Grand Theft Auto DirectX )
---------------
GTA Direct X ne fonctionnera que si vous possédez la dernière version officielle du gestionnaire 
Direct X Windows 95 de Microsoft pour votre carte vidéo. Le revendeur de votre carte vidéo devrait 
pouvoir vous fournir cette version.

Certains gestionnaires récents vous permettront d'utiliser les résolutions recommandées 
(Haute ou Basse). C'est le cas par exemple de la Matrox Millenium.

Gravis Ultrasound
-----------------

Si vous utilisez une carte sonore Ultrasound, la version DOS de GTA lancée sous Windows 95 ne 
reproduira pas les effets sonores si vous ne fermez pas les fenêtres en mode MS-DOS ou que vous 
n'avez pas modifié le fichier PIF pour passer d'une fenêtre DOS au mode MS-DOS direct.

CD audio et version DOS
----------------------
Pour écouter le CD audio sous DOS avec la version DOS de GTA, assurez-vous que le gestionnaire 
MSCDEX est bien chargé. Si vous jouez avec la version DOS sous Windows 95 ou dans une fenêtre 
DOS, le CD audio sera disponible.

Manette Sidewinder et version DOS
-----------------------------------
La manette Sidewinder de Microsoft n'est pas compatible avec la version DOS de GTA. Cette 
manette est toutefois utilisable avec la version Windows (DirectX) du jeu.

Utilisateurs de cartes vidéo Voodoo Graphics (3Dfx)
---------------------------------------------------

GTA reconnaît le gestionnaire vidéo 3Dfx Glide à partir de la version
2.42.  Si vous utilisez une carte Voodoo Graphics, vous devez installer
cette version sur votre système.  Pour installer la mise à jour de
Glide, lancez le programme GRTVGR.exe, qui se trouve dans le répertoire
3Dfx sur le CD-ROM de GTA.
Attention: vous devez disposer de 32 Mo de RAM pour pouvoir utiliser la version 3DFX de GTA.

EMM386 (DOS)
------------
Avec le DOS 6.22, si la ligne DEVICE=C:\DOS\EMM386.EXE est présente dans le fichier CONFIG.SYS,
lancez GTA et quittez le jeu, puis appuyez sur Ctrl-Alt-Suppr pour redémarrer l'ordinateur.
Il est possible que votre clavier ne réponde plus.

Pour résoudre ce problème, utilisez la commande DEVICE=C:\WINDOWS\EMM386.EXE.
