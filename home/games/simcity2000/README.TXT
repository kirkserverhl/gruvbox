SimCity 2000 CD-ROM COLLECTION (TM)      Last Minute Info v1.0 (12/16/94)

Congratulations and thank you for purchasing the SimCity 2000 CD-ROM 
Collection. This README file should answer any questions or problems that 
you are experiencing with SimCity 2000 and the SimCity Urban Renewal Kit 
(SCURK). This document is pretty long (about 24 pages or so), so it's 
worthwhile to print it out if you can. If you are experiencing problems 
and this file does not help fix them, please call the friendly folks in 
our Technical Support group. The number for Technical Support is located 
on the Maxis Maxims card in your SimCity 2000 box. There's also a list of 
different ways to contact Tech Support at the end of this file.
 
Here's a list of topics covered by this README file: 
------------------------------------------------------------------------- 
I. INSTALLATION 

 Express Install 
 Custom Install 
 Video Selection 
 Sound Selection 
------------------------------------------------------------------------- 
II. TROUBLESHOOTING 

 SimCity 2000 Locks Up
 If SCURK Locks Up
 SimCity 2000 Install Program Crashes 
 The Text In The Installer Looks Weird 
 I Have A Diamond Stealth/Viper And Get Funny Lines On My Display 
 I Get An "Error 35" Message 
 I Get a "Microsoft Compatible Mouse Not Found" Message
 Other Important Mouse Information
 I Get A "Professional Error (2001)" Message 
 I Get A "Stack Overflow" Message 
 I Get Random Crashes 
 I Tried Turning Off Sound And It Still Crashes
 SimCity 2000, SCURK and Windows
------------------------------------------------------------------------- 
III. VIDEO CARDS

 What Is A VESA Driver And How Do I Use It? 
 ATI Ultra Pro or Mach 32 Video Cards 
 Diamond Viper 
 Trident Video Cards 
 Packard Bell (Headland Technologies) 
------------------------------------------------------------------------- 
IV. SOUND CARDS

 What Are Miles Design Drivers And How Do I Use Them? 
 Sound Blaster Installation 
 Pro Audio Spectrum 
 Gravis Ultrasound 
 Aria Compatible Sound Cards 
 
------------------------------------------------------------------------- 
V. MISCELLANEOUS

 SCURK, Memory and Virtual Memory
 Memory Issues 
 Running with QEMM, EMM386 And Other Memory Managers 
 Running SimCity 2000 Under OS/2 
 Creating A Boot Disk With Stacker/DoubleSpace 
 Bootdisk Utility 
 
------------------------------------------------------------------------- 
VI. GAME PLAY ISSUES FOR SIMCITY 2000

 Saved Cities 
 Micro-Simulators 
 Terrain Editing 
 Airports 
 Newspapers 
 Importing Cities From SimCity Classic and SimCity 2000 Mac 
 Hot Keys 
-------------------------------------------------------------------------
VII. GAME PLAY ISSUES FOR SCURK

 
------------------------------------------------------------------------- 
VIII. CONTACTING MAXIS TECHNICAL SUPPORT

Handy Ways To Talk to Helpful People
-------------------------------------------------------------------------
IX. CD-ROM CONTRIBUTORS

 Handy Ways To Talk to Helpful People

=========================================================================
I. INSTALLATION 

-----------------------------
There are two types of installation: Express and Custom.
-----------------------------
Express Install 

Express Install will install SimCity 2000 and SCURK into the directory of 
your choice (we recommend the default directory of c:\sc2000), and 
configure it to work with a VESA compatible SVGA video card and Sound 
Blaster (or compatible) sound card. If there is a SET BLASTER line in 
your CONFIG.SYS file, the parameters will be used for the configuration. 
If you selected Express Install and do not have a Sound Blaster 
compatible or VESA SVGA card, you'll get a warning message about this. Go 
ahead and continue with installation. When you're done, you can run the 
program called INSTALL.EXE in your SimCity 2000 subdirectory. This will 
let you change sound and video selections. For more information on VESA 
and SVGA, see the sections below.

Express Install will perform a Full installation if you have 4 MB RAM 
(since you won't have enough RAM for both SimCity 2000 and your CD-ROM 
drivers, and won't be able to access files on the CD-ROM), or a Partial 
installation if you have more than 4 MB RAM (which saves some hard drive 
space).

-----------------------------
Custom Install

Custom Install still lets you choose the directory SimCity 2000 and SCURK 
will install to (and we still recommend the default directory of 
c:\sc2000). It will also let you pick the sound card you want for music 
and the sound card you want for sound. You can also select either Full or 
Partial installation. Remember, if you have 4 MB RAM, you will not have 
enough RAM for both SimCity 2000 and your CD-ROM drivers, so you might as 
well install the whole nine yards while you're at it.

-----------------------------
Video Selection

The SimCity 2000 installer will try to figure out what kind of video card 
you have in your machine. If it is not sure what kind of video card you 
have, or the installer detects a VESA driver in memory (or in BIOS), it 
will default to the VESA SUPER VGA driver. You can click the arrow on the 
right of the VESA SUPER VGA entry for a list of cards that the installer 
thinks you might have. If your card is on this list, you can select it 
instead of the default VESA driver. If the installer cannot figure out 
what kind of card you have and cannot detect a VESA driver, you'll get a 
warning message. If you wish to continue and try to run SimCity 2000 or 
SCURK anyway, you MUST load some type of VESA driver for your video card. 
See the section on VIDEO CARDS a little later in this file for some 
really helpful information about how to do this.

-----------------------------
Sound Selection

The SimCity 2000 installer cannot automatically detect what kind of sound 
card you have in your machine. You will need to pick your sound card(s) 
from the lists provided. The installer will then try to verify the 
presence of that sound card in your machine. Certain hardware settings on 
your card may be different from what SimCity 2000 or SCURK is expecting. 
To change these settings, select the Change Settings option from the 
sound card verification window (where it says "OK" or "Failed!"). 
Generally, you should use the following settings: PORT = 220, DMA = 1, 
and IRQ = 7 or 5. For more information on these hardware settings, see 
the manual that came with your sound card. If your sound card is not 
shown and is 100 percent Sound Blaster compatible, you should be able to 
install for Sound Blaster and hear sounds and music. See the section on 
Miles Design Drivers below for information on what to do if your sound 
card is not supported.
=========================================================================
II. TROUBLESHOOTING

-----------------------------
SimCity 2000 Locks Up

This is almost always the result of a conflict between SimCity 2000 and a 
memory-resident program (TSR) that is being loaded by your AUTOEXEC.BAT 
or CONFIG.SYS files. The best solution for this is to run the boot disk 
utility by typing BOOTDISK at the game directory. (Remember that the boot 
disk MUST go into Drive A:.) This utility will create a disk which loads 
your sound and video drivers, but it will NOT load your CD-ROM drivers.

If this does not help, try running the INSTALL program in the SimCity 
2000 directory and selecting No Sound Effects. If you're still locking 
up, call Maxis Technical Support at the numbers listed on the Maxis 
Maxims card included in your SimCity 2000 box and at the end of this 
document.

-----------------------------
If SCURK Locks Up or Crashes

SCURK uses free space on your hard drive to store information. You need 
at least 5 MB or so of free hard drive space AFTER INSTALLATION, 
especially if you plan to create new graphics sets or cities. If SCURK 
crashes, it may leave undeleted swap files. These files always have the 
extension .SWP, and should be deleted if found. 
----------------------------- 
SimCity 2000 Install Program Crashes

This is also probably a conflict with a loaded memory resident program. 
Try making a boot disk using the boot disk utility. To do this go to the 
game directory and type BOOTDISK. Ignore the "Bad Command or Filename" 
message that appears when using the boot disk for installation. Also try 
running the INSTALL program with no mouse driver loaded. See your mouse 
manual for information on disabling the mouse.

-----------------------------
The Text In The Installer Looks Weird

Some graphics cards (specifically, ones that use the Cirrus Logic GD543x 
chipset like the Spider Black Widow 64 and the Orchid Kelvin family) need 
to load TSR fonts so the installer program can display text correctly. In 
this case, you need to run the TSRFONT.COM program, which should have 
been included with the card. SimCity 2000 and SCURK do not require these 
TSR fonts, only the install program does. See your video card 
documentation for more information.

-----------------------------
I Have A Diamond Stealth/Viper And Get Funny Lines On My Display 

Some early versions of the Diamond drivers create a problem with SimCity 
2000. Fortunately, there are software patches available for both the 
Stealth and Viper to fix this problem. The Stealth patch is available as 
a software program called STLBIOS.EXE or as a hardware upgrade. The 
Diamond Viper patch is a software upgrade called VPRM202.EXE. All of 
these are available from Diamond. 
 
A few Diamond Viper PCI cards with 2 MB show a completely black screen 
when SimCity 2000 starts. This is due to defective cards, and you'll need 
to contact Diamond or your dealer for a replacement.

-----------------------------
I Get An "Error 35" Message

This message usually shows up if you have certain ATI cards and have not 
loaded the ATISET.EXE program. See the ATI entry in Section III below for 
more information.

-----------------------------
I Get A "Microsoft Compatible Mouse Not Found" Message

This message is usually the result of one of two problems.

1. Most likely, a mouse driver has not been loaded. SimCity 2000 needs a 
DOS mouse driver to run (as opposed to a Microsoft Windows mouse driver). 
This driver, along with instructions on how to load it should have come 
with your mouse. Our boot disk utility will scan your hard drive for a 
proper mouse driver. If one is found it will be put on the boot disk.

2. The other likely problem is that the mouse driver is being loaded 
correctly but is an older version that is not supported. You should be 
using the equivalent of Microsoft mouse driver version 8.2 or higher. 
This means that the mouse driver you're using should have been issued 
around August, 1993 or later. If your driver is older than that, you 
should contact the manufacturer (or dealer) of your mouse to get a more 
up-to-date mouse driver.

-----------------------------
Other Important Mouse Information

SimCity 2000 requires a Microsoft-compatible mouse to run. Most mice 
today (including Logitech, Mouse Systems, and Kensington) are 
Microsoft-compatible. In order for the mouse to work properly in SimCity 
2000, a mouse driver must be loaded before running SimCity 2000. The 
mouse driver must also be fairly current and VESA compatible. Contact the 
manufacturer of your mouse or the dealer who sold the mouse to you to see 
if your driver is the most current available. Again, the INFO program is 
a good way to sort out what's going on. 

The SC2000 INFO program in the SC2000 directory can usually identify your 
mouse driver (just type INFO [enter] at the directory where you installed 
SimCity 2000). About halfway down the screen is your mouse driver 
information. If there is no message and you see the SC2000 directory 
prompt, your mouse driver is REALLY old and probably should have been 
upgraded a long time ago. Time to do it now.

-----------------------------
I Get A "Professional Error 2001" Message 

This error occurs in one of two ways. The first will occur just as you 
start the program, and the second will occur at random locations during 
gameplay. To correct this error, disable the sound effects from the 
install screen (as outlined below). Then run the game without any sound 
effects.

-----------------------------
I Get A "Stack Overflow" Message

This error will be displayed as soon as the game begins. To correct this 
error, you will need to disable the sound effects in the install screen. 
Then run the game without any sound effects. 

In either of the above cases, type INSTALL at the SC2000 prompt and 
choose the Change Music and Change Sound Effects options. Select No Music 
and No Sound. Then use the command SC2000 NOSOUND to start the game.

-----------------------------
I Get Random Crashes 

If you are experiencing random crashes during gameplay, first disable the 
sound effects for the game. If this does not work disable the music and 
sound effects, and if both of those options do not seem to help, try 
deleting and reinstalling SC2000.

This can also happens on machines with the SmartDrive disk cache running 
with write cache enabled. (SmartDrive is one of those nasty TSRs we 
mentioned earlier). You should disable the SmartDrive (the boot disk 
utility will do this) or contact your dealer or Maxis for information on 
disabling this feature. 

-----------------------------
I Tried Turning Off Sound And It Still Crashes 

If you tried re-installing without sound and still crash, try running 
SimCity 2000 by typing NOSOUND instead of SC2000.

-----------------------------
SimCity 2000, SCURK and Windows

The DOS versions of SimCity 2000 and SCURK have their own particular 
requirements as to how drive cards should be configured and used. 
Therefore, we recommend that you reboot your machine after playing either 
if you plan to run Microsoft Windows.

========================================================================= 
III. VIDEO CARDS 

-----------------------------
What Is A VESA Driver And How Do I Use It? 

VESA stands for Video Electronics Standards Association. This standard 
allows software companies (like Maxis) to write programs that work with 
many video cards without having to know how each card works. The programs 
we write talk to the VESA driver, and the VESA driver talks to its 
specific video card. Almost every video card available today has its own 
unique VESA driver. These drivers may be stored in a chip on the video 
card, or they may be a program that the user must has to load by hand (or 
with a batch file). Some cards (such as the Diamond Viper) have the 
driver on the video card, but need the user to run a special program to 
activate the driver. Go figure.

During installation of SimCity 2000, the installer looks for a VESA 
driver in memory or on the card. If it finds one, it will list VESA SUPER 
VGA as the default. You might also be able to select specific video 
support for your card if it is supported (we recommend using specific 
video support if possible, for fastest operation). If the VESA driver is 
an external program, it will probably be found on the disks that came 
with your video card. If you don't have a VESA driver you should contact 
your video card manufacturer.

We have included VESA drivers for lots of popular cards. These drivers 
are in a directory called VESA on the CD-ROM. To find the particular 
driver for your system, look in the VESA directory for the subdirectory 
that is closest to your brand of video card. In that subdirectory should 
be the VESA driver. Using most 'external' (programs that you must run) 
VESA drivers is as easy as typing the name of the driver at the directory 
prompt where you find the driver. For instance, if the driver were called 
VVESA.COM, you would type: 
VVESA.COM [enter] 

There is also a generic VESA driver called UNIVBE.EXE. This driver is 
installed on your hard drive when you install SimCity 2000. It also sits 
in its own sub-directory (called UNIVBE) on the CD-ROM. This driver works 
for many of the cards on the market. You use it the same way you would 
use any other VESA driver: be at the directory prompt where UNIVBE is and 
type UNIVBE.EXE [enter]. If you can't find a driver specifically for your 
card (either on your disks or on the CD-ROM), check out UNIVBE. It just 
might be the answer to all your VESA driver problems, and you could 
become a SimMayor in no time.

-----------------------------
ATI Ultra Pro or Mach 32 Video Cards 

If you have an ATI Ultra Pro or some other card based on the Mach 32 
chip, you must run the included utility ATISET.EXE before playing 
SimCity. This program is on your CD-ROM in the ATI sub-directory of the 
VESA directory. To use your ATI card with SimCity 2000, get to the ATI 
sub-directory on your CD-ROM. Then type: ATISET [enter]. You'll be able 
to start SimCity 2000 as your normally would. If the ATISET.EXE program 
is not run, you may get an "ERROR 35" type message when trying to run 
SimCity 2000 or SCURK.

-----------------------------
Diamond Viper 

The Diamond Viper has its VESA driver on the card, but you need to run an
external program to activate it. This program is called VPRMODE.EXE. To 
use VPRMODE to activate the VESA driver, get to the VIPER sub directory 
of the VESA directory on the CD-ROM. Then type: VPRMODE VESA [enter]

The VPRMODE program is installed by the software that came with the 
Diamond Viper card.

-----------------------------
Trident Video Cards

Some older Trident video cards require a little tweaking to get them to 
work. If you are using a Trident video card and are having video 
problems, try running the INSTALL.EXE program in the SimCity 2000 
directory and selecting the VESA video driver, then install the proper 
VESA driver for the card before running SimCity 2000 or SCURK. 

-----------------------------
Packard Bell (Headland Technologies)

Some Packard Bell machines have a video chip pre-installed on the 
motherboard. This chip is called the Headland Technologies onboard video 
chip. You may notice your mouse leaving a trail of dots on the screen 
while playing SimCity 2000. This is due to a timing problem on the 512K 
Headland Technology (HT) video chipset. Please call Packard Bell 
Technical Support for assistance with this problem.
=========================================================================
IV. SOUND CARDS

-----------------------------
What Are Miles Design Drivers And How Do I Use Them? 

SimCity 2000 sound support is accomplished through the use of the John 
Miles Design AIL audio driver libraries. Like VESA drivers, these help 
software companies support many different sound cards without having to 
know how each card works. The Miles Design Drivers are automatically 
installed when you select which sound card you wish to use for sound and 
music in SimCity 2000. If your sound card is not mentioned specifically 
in the installer, you may be able to get drivers from the manufacturer 
for full SimCity 2000 sound. As a matter of reference, SimCity 2000 
requires "32-bit flat mode" Miles Design drivers. Non-32-bit drivers will 
not work. 

-----------------------------
Sound Blaster Installation

The SimCity 2000 Installer expects to find the Sound Blaster at IRQ 7. 
However, some Sound Blasters are shipped with the default IRQ set to 5. 
If you have a Sound Blaster and the installer says "Sound Card Detection: 
FAILED!", click on the Change Settings button and enter 5 in the IRQ 
entry. The DMA setting of 1 and ADDR (or port) setting of 220 should be 
fine.

-----------------------------
Pro Audio Spectrum

MUSIC: The Music Driver for the Pro Audio Spectrum requires the Media 
Vision driver MVSOUND.SYS to be loaded into memory by your CONFIG.SYS 
file. If this driver is not loaded, you will receive a verification 
failure during installation, and you will NOT hear music during the game. 
For more information about MVSOUND.SYS, please refer to your Pro Audio 
Spectrum user's manual, or call Media Vision Technical Support.

SOUND EFFECTS: If you choose Pro Audio Spectrum as your Sound Effects 
sound card, you may experience some sound effects "dropouts," or even no 
sound at all. This will only happen on some Pro Audio Spectrum sound 
cards. If this does happen, you can re-run the INSTALL program and choose 
Sound Blaster for the Sound Effects, instead of Pro Audio Spectrum. 
CAUTION: This may or may not work depending on your Pro Audio Spectrum. 
Please call Media Vision Technical Support if you have more problems. 

-----------------------------
Gravis Ultrasound

You will want to contact Gravis for details on their driver package for 
the GUS. You will need to obtain from them the file GAIL3214.ZIP (The 
numbers 3214 refer to the most recent driver version number and are 
subject to change.) and use those drivers in place of one of those 
included with SimCity 2000. Instructions are included with the file. 
Gravis' BBS can be reached at (604) 431-5927. 

-----------------------------
ARIA Compatible Sound Cards

We now have Miles Design Drivers for all sound cards based on the 
ARIA Sound Synth by Sierra Semiconductor. These include: 
 
Viva Maestro 16 
VR Alpha Systems 
Cyber Audio 
Add Tech Sound 2000 
Sound Tower 
Cardinal Technologies Sound Pilot 
Diamond Computer Systems Sonic Sound 
Sonic Sound Pro 
Genoa Systems AudioBahn 
AudioBahn Listener 
Kingston Technologies Omnivox 
Zoltrix TESS 
and others... 

=========================================================================
V. MISCELLANEOUS 

-----------------------------
SCURK, Memory and Virtual Memory

SCURK has been built with the Rational Systems Virtual Memory Manager 
enabled. This allows SCURK to run on machines with 4 MB of RAM (or even a 
little less!) despite the fact SCURK often works with potentially large 
amounts of graphics in memory.

Virtual Memory accomplishes this by "swapping" sections of RAM which are 
not being used at the moment, writing them to the hard drive whenever 
SCURK needs that memory. These "swapped" sections can later be brought 
when needed. These operations will be slower than if everything could be 
kept in RAM, because disk access is slower than RAM access. 

How much swapping actually happens and the size of the file created on 
your hard drive depends on how much RAM you have, how your DOS memory 
manager is configured, and what you are doing with SCURK. On machines 
with 4 MB RAM or less, a swap file will almost certainly be required. 
Machines with 8 MB RAM could have some EMS memory manager configurations 
which will not allow SCURK to access the full amount of RAM. In this case 
swapping will occur and SCURK performance will suffer a bit. The swap 
file is created be default in the SimCity 2000 main directory an ends 
with the extension ".SWP"

The size of the swap file itself will probably not exceed 4-5 MB on the 
hard drive. However, SCURK often uses its own temp files, which may get 
fairly large. To avoid potential problems, you should ensure that you 
have about 4-6 MB of free disk space available when running SCURK.

If you have 8 MB RAM or more and SCURK seems to be running very slowly 
with a lot of disk access, it is likely that your EMS memory manager is 
not allowing SCURK to use all your RAM. Check out your CONFIG.SYS file to 
see if your EMS manager line has a number for amount of memory devoted to 
EMS. For example, your line for the EMM386 memory manager might look 
something like this:

DEVICE=C:\DOS\EMM386.SYS 2048

This means that SCURK will only be able to use 2 MB RAM, even if your 
computer has 16 MB! You'll get lots of swapping.

If all else fails, try making a boot disk or disable your EMS manager. 
SCURK runs best without any other memory managers running anyway.

If you're feeling ambitious, you can configure the DOS4GW Virtual Memory 
Manager with the environment variable: DOS4GVM. You shouldn't need to 
make any adjustments with this environment variable, but in case you want 
to, the format is as follows:

set DOS4GVM = [ option[#value] ] [ option[#value] ] ....

(a "#" is used with options that take values since the DOS command 
doesn't accept "=")

The options you can use are:

MINMEM Minimum RAM managed by Virtual Memory.

MAXMEM Maximum RAM managed by Virtual Memory.

SWAPMIN Minimum initial swap file size.

SWAPINC The size by which the swap file will grow.

SWAPNAME Swap file name.

DELETESWAP or NODELETESWAP. Swap file deletion after program exits.

VIRTUALSIZE Size of virtual memory space.

Perhaps the most useful setting would be to put your swap file on a drive 
which has more free disk space. For example, if you wanted to put the 
swap file in a directory called TMP on your E: drive, you could do this 
by setting your environment:

set DOS4GVM = SWAPNAME#E:\TMP\SCURK.SWP

This will put the swapfile on drive E:, in a directory named TMP and the
swap file will be called SCURK.SWP.

-----------------------------
Memory Issues 

SimCity 2000 is very picky about its operating environment, and requires 
a lot of memory to run--4 MB total. We aren't kidding! What's more, even 
if you have the required 4 MB, SimCity 2000 may report that you do not 
have enough free extended or conventional memory, especially if you are 
using some of your RAM for TSRs. If this is the case, your best 
alternative is to create a boot disk as outlined in the SimCity 2000 DOS 
Addendum/Quick Start Guide.

Another solution that may help is to install SimCity 2000 with No Sound 
and No Music selected. If you have already installed SimCity 2000, you 
can change your current sound, music, and video settings by running the 
INSTALL.EXE program in the SimCity 2000 directory. 

-----------------------------
Running With QEMM, EMM386, 386MAX And Other Memory Managers

We recommend that you not load any memory managers or disk cache 
utilities while running SimCity 2000, especially if you are using DOS 6 
on a machine with only 4 MB RAM. If you are using a memory manager, you 
MUST NOT have it set in auto mode--this will cause a conflict with 
SimCity 2000. If you are using MS-DOS 6 and absolutely must load 
EMM386.EXE, you will need to either have the EMS size set to 'noems' or 
larger than 4096. See your DOS manual for information on how to do this. 
The section on Virtual Memory in this document may also provide some 
helpful information.

If you are running QEMM in Stealth mode, SimCity 2000 may fail to 
recognize the VESA drivers that are built into the video card BIOS. You 
will need to run QEMM in Frame Mode as opposed to Page Mode. To do this, 
change the "ST:M" parameter in your QEMM statement to "ST:F". See your 
QEMM manual for more information on how to do this.

-----------------------------
Running SimCity 2000 and SCURK Under OS/2 

We have successfully run SimCity 2000 under a DOS full-screen session in 
OS/2. However, we have not been able to run it as a migrated application.

Installation must ALWAYS be in the foreground until installation is 
complete. You MUST NOT swap the installer to the background. If you have 
OS/2 and are able to run SimCity 2000 under MS-DOS but not under OS/2, 
please call IBM Technical Support. 
 
Use the command SC2000 NOMEM to start the game. 

SCURK was mostly developed under OS/2 and runs quite nicely in a 
full-screen DOS session. You should make sure that your DOS session 
settings has DPMI ENABLED, HW_TIMER ON, RETRACE_EMULATION OFF. Give it 
between 8 - 16 MB of DPMI memory. The DOS4GW Virtual Memory manager does 
not operate in OS/2, but OS/2 handles all that for you as long as you 
configure the DOS setting with plenty of DPMI memory.

Use the "NO_MEM_CHK" command line option when starting SCURK since OS/2 
doesn't report the correct amount of memory available when SCURK checks 
at startup.

----------------------------
Creating A Boot Disk With Stacker/DoubleSpace

Stacker version 3.0 and earlier require certain drivers to be loaded in 
the CONFIG.SYS file in order to mount the compressed hard drive. When 
creating a boot disk with Stacker 3.0 or earlier, you must include two 
lines in the CONFIG.SYS file. The two lines you need to add (assuming you 
used the default installation of Stacker) are:

DEVICE=C:\STACKER\STACKER.COM C:\STACVOL.DSK 
DEVICE=C:\STACKER\SSWAP.COM C:\STACVOL.DSK

The exact path statement could be different if you did not perform a 
default installation of Stacker and put it somewhere else on your hard 
drive.

These lines will load Stacker and mount your compressed drive when 
booting from the boot disk. 
 
DoubleSpace/DriveSpace and Stacker 3.1 and higher do not require that 
lines be added in the CONFIG.SYS file as they copy hidden files to the 
boot disk when using the "SYS A:" or "FORMAT A: /S" command. Make a boot 
disk according to the normal instructions regarding creating a boot disk 
in your SimCity 2000 addendum. If you do not feel comfortable creating a 
boot disk under Stacker or DoubleSpace, contact STAC Electronics or 
Microsoft for technical support. 
----------------------------
Bootdisk Utility

Version 1.10 of SimCity 2000 includes a utility which will create a boot 
disk for you, with the correct VESA and sound drivers needed to run 
SimCity 2000. To run the Boot disk utility, go to the game directory 
(e.g., C:\SC2000) and type BOOTDISK. This will run an executable that 
will set up the boot disk for your particular system. Remember, this disk 
MUST be in Drive A: when you boot your machine. Follow the on-screen 
prompts and let the program walk you through the process. Once the boot 
disk has been made, the game should run without any memory problems. NOTE 
- Some sound cards require that a device driver be loaded and certain 
environment variables be present in order to run properly . The BOOTDISK 
utility cannot accurately re-create those values in the files for the 
boot disk, so you will have to enter them by hand. For more information 
on these device drivers and environment variables, see the manual that 
came with your sound card. 
=========================================================================

VI. GAME PLAY ISSUES FOR SIMCITY 2000
-----------------------------
Saved Cities
 
For your simulating pleasure, we have included several saved cities 
created by various Maxis employees and other Maxoids, as well as M.
Brent Sleeper and Kevin Endo. They are located in your SimCity 2000 
directory (after full installation) or on the CD-ROM (after partial 
installation).

-----------------------------
Micro-Simulators

When querying some structures, you'll get local statistics, or 
"micro-simulators" about that structure. For instance, querying on a 
Police Station will tell you how many crimes and arrests were handled by 
that station. Querying on a school will tell you how many teachers and 
students are attending that school as well as the average grade of the 
students. Most structures that you can place (such as police, fire, 
schools, colleges, power plants, the Mayor's House, arcologies, etc.) 
have these micro-simulators. Some structures have their own 
micro-simulator. Others, like the bus system, railroad depots and 
libraries among others have one micro-simulator for each category (one 
micro-simulator for all the bus stations, one for all the railroad 
depots, etc.).

What's the big deal with all this, you ask? Well, each city can only have 
150 micro simulators in it. Any more than that and you won't be able to 
see any local information about those structures. Don't worry though. The 
structures you place will still have an effect on your city. Additional 
police stations will still stop crime, more bus stations will carry more 
passengers, arcologies will still hold people, and so on. The information 
you get about these structures will be for the entire city, not an 
individual building. Your Sims will go on about their business without 
missing a beat. We're telling you this because it's easy to run out of 
micro-simulators in a large city and we don't want you thinking 
something's wrong.

-----------------------------
Terrain Editing

If you are building a city and go into the terrain edit mode, your city 
will disappear, but any trees or water that you have placed in the city 
will show up in terrain edit mode. Also, if you have placed a bridge or 
other structure that automatically builds landfill, the landfill will 
also show up in terrain edit mode. These can be removed with the Lower 
Terrain tool.

-----------------------------
Airports

An airport needs space for a runway, or it can not develop. The minimum 
usable airport space is 2 x 6 tiles. Your best bet is to build the 
airport in 4 x 6 tile increments. And make sure no tall buildings are 
nearby; SimCity 2000 pilots are not known for their building-avoidance 
skills! In addition, make sure that your airport is blanketed with power 
lines. Airports may not initially build unless they are receiving power 
to certain tiles. As with the rest of the city, each tile must have power 
or be touching one that has power on it.

-----------------------------
Newspapers

If you are running low on hard drive space, you may experience a problem 
where multiple newspaper stories are open at one time. You will need at 
least 300KB free hard drive space (on the drive that SimCity 2000 is 
installed to) before starting the game, and this will fix the problem. If 
you do get multiple stories, you can clear them by pressing 'ENTER'. If 
you are running into low memory situations, the Newspaper menu item may 
gray out. Don't be alarmed; it won't hurt anything.

-----------------------------
Importing Cities From SimCity Classic and SimCity 2000 Macintosh

You can load saved cities from both SimCity Classic and SimCity 2000 
Macintosh into SimCity 2000 DOS. For importing purposes, SimCity Windows 
and SimCity DOS files are identical. To import cities from SimCity 
Classic DOS and SimCity 2000 Macintosh, rename the file so that the 
extension is ".SC2". If the file is from SimCity Classic DOS, SimCity 
2000 will ask you if you wish to convert the file to SimCity 2000 format. 
The conversion will not change the original file unless you save it over 
the original file.

To convert SimCity 2000 DOS files for use in SimCity 2000 Macintosh you 
must give the file a Filetype and Creator for the Macintosh. The Filetype 
should be "CITY" and the Creator should be "SCDH". This can be done with 
ResEdit, Access PC, or one of several other PC to Mac conversion 
utilities. SimCity Classic Mac cities must be imported into SimCity 2000 
Macintosh before they can be loaded into SimCity 2000 DOS. Not doing so 
will result in a "Not an IFF file" error message.

-----------------------------
Hot Keys 

SHIFT KEY- 
1. While placing items, pressing the Shift key before releasing the mouse 
button will cancel placement of the item. 
2. Holding down the Shift key while clicking on an item in the city 
window will open the Query window for that specific item. 
3. Holding down the Shift key while clicking on a button or entry in a 
window will open a help description for that item. 
 
CTRL - temporarily turns the current cursor into the Bulldoze Tool. 
HOME - zooms in one level on your city 
END - zooms out one level on your city 
DEL - rotates your city view to the left by 90 degrees 
PAGE DOWN - rotates your city view to the right by 90 degrees 
Cursor Keys - scroll around your city 
=========================================================================

VII. GAME PLAY ISSUES FOR SCURK
-----------------------------
Disclaimer

The SimCity 2000 Urban Renewal Kit does many things that the designers of 
SimCity 2000 did not anticipate (but maybe should have). As a result, 
lots of changes you can make to your graphics or saved cities in SCURK 
may have unpredictable effects when actually loaded into SimCity 2000. We 
have taken every feasible precaution to protect against serious 
complications, such as crashing SimCity 2000 or confusing the simulator. 
Even so, we can't guarantee that everything you do will work perfectly or 
even at all. Therefore, it is up to you, the responsible SimMayor, to be 
gentle with your Sims.

Miscellaneous Things to Think About

The base size of all objects in SimCity 2000 are fixed. If the artwork 
you create for a specific object does not completely fill the base of the 
tile, the exposed area will appear brown when used in Place & Print or in 
SimCity 2000.

SimCity 2000 "clips" the edges of moving objects to make sure they are 
erased properly as the object travels through the city. Artwork you 
design for Airplanes, Ships, Tornadoes and such may leave "trails" behind 
as the objects move around your city. Trial and error is the best tool 
for learning what will leave a mess and what won't.

Some of the color cycling colors in SimCity 2000 for DOS do not cycle 
correctly. The colors that seem to work properly are the blue sets, the 
Red/Black, Yellow/Black, Green/Black, and Brown sets. The color cycles
that don't work properly will show up as non-color cycling artwork when
imported into SimCity 2000 for DOS. This only occurs in the SimCity 2000 
for DOS version.

SimCity 2000 creates airport runways in a specific manner. All runways in 
SimCity 2000 are 1 x 5 and do not cross. SCURK lets you to place runways 
in lots of different configurations. Some of these configurations may 
confuse SimCity 2000 enough to cause it to crash, especially if you 
create a really "interesting" airport in SCURK, import the city into 
SimCity 2000, and destroy some of the runways. We recommend sticking with 
the 1 x 5 configuration and not crossing runways unless absolutely 
necessary. There's no point in subjecting your Sims to dangerous landing 
conditions.

If you use the eyedropper on a clear portion of the background, you are 
telling the paint program that you want the foreground color to be 
transparent background. This is perfectly "legal", although it turns your 
paint tool into an erase tool.

Abandoned buildings and construction area used in the Place & Print 
utility follow these rules for what type of zone they are:

If you do not place the building on an existing zone, it will place with 
the last zone type you had selected (High Density Residential, Low 
Density Commercial, etc.).
If any part of the building is on and existing zone, the entire building 
will be placed as that zone.
If you place a building not on an existing zone with no zone ever having 
been chosen, it will default to High Density Residential.

If you are editing an object and select Save or Save as, the work you 
have done to that object will be saved. Normally, this work is not 
updated until you click on another object.

When importing a PCX file, you may not cut an area of the PCX larger than 
80 percent of the screen. Sorry. However, this should not be a factor, as 
no single object in SCURK is that large anyway.

-----------------------------
Printing from SCURK

Canceling print job may take a few moments after you tell it you wish to 
stop. Remember, there's lots of information in the print file, and it 
takes a while for the buffer to clear.

When printing, the pages are ordered in a column (top to bottom) rather 
than by rows (left to right).

For example, a 3 x 3 page print would be printed in this order:
     _____________
     I 1 I 4 I 7 I
     I___I___I___I
     I 2 I 5 I 8 I
     I___I___I___I
     I 3 I 6 I 9 I
     I___I___I___I


When printing to a file, the resulting file can be up to 16 MB. Really. 
To print the file to a printer, type:

COPY /B <filename> LPT1

where <filename> is the name of the file you wish to print. LPT1 is the 
usual port a printer is plugged into. Your system may have the printer on 
LPT2, consult with your manual if you're not sure.

This is a list of printers that should support the drivers we include in 
the Urban Renewal Kit. The printers that have been tested have a * next 
to them.



Postscript Driver:

PostScript (1200 dpi)                *Apple Laserwriter
HP LaserJetIVLM (PostScript)         *HP LaserJetIVM  (PostScript)
PostScript, color ( 300 dpi)          Tektronix Phaser III PXi

Epson 9 or 24 pin Drivers

Alps ASP1000/1600                     Alps P2000+/2100
Apex T-1000 (by Epson)                Brother M-1109/M-1209/M-1309
C Itoh C-310 XP                       C Tech C240/245/310/315
Canon BJ10e (Epson mode)              Citizen 120D/180D
Citizen 5200/5800                     Citizen MSP 10/20/40
Citizen GSX140                        Citizen GSX200/GSX230
Epson Action L-750                    Epson Action T-1000
Epson FX 80/85/86e/850                Epson LX 80/86/90/800
Epson MX 80 Graftrax                  Epson RX 80
Laser 190E                            Mannesmann Tally 130-9
Mannesmann Tally 81                   Mannesmann Tally 85/87/90
Okidata ML 180/182/+ (IBM mode)       Okidata ML 320
Okidata ML 92/192 (IBM mode)         *Panasonic KX-P1080/1080i/1180
Panasonic KX-P1081/1081i              Panasonic KX-P1090/1090i
Panasonic KX-P1091/1091i/1191i        Panasonic KX-P1092/1092i
Panasonic 1123/1124                   Panasonic 2123/2124
Seikosha SP-2000                      Star NX10/ND10/NR10/NX1001
Star XR1000                          *Panasonic KXP2124
Epson LQ500                           Epson LQ850
Epson LQ1000/LQ1500                   Epson LQ2500

HP Laserjet:

Brother HL 4/8 (300 dpi)              C Tech T-6B (300 dpi)
Epson EPL Series (300 dpi)            Fujitsu RX7300/7400 (300 dpi)
HP LaserJet w/1.5MB  (300 dpi)        HP LaserJet+ w/1.5MB  (300 dpi)
HP LaserJetII w/1.5MB  (300 dpi)      IBM Laser 4019 (HP mode 300 dpi)
IBM Laserprinter/E (300 dpi)          Mannesmann Tally 905/6 (300 dpi)
Mannesmann Tally 910/11 (300 dpi)     NEC Silentwriter/2 (300 dpi)
Okidata Okilaser (300 dpi)            Panasonic Laser Partner (300 dpi)
Sharp JX-9500 (300 dpi)               Star Laser 4/8 II (300 dpi)
Tandy LP Series (300 dpi)             TI MicroLaser (300 dpi)
Toshiba PageLaser (300 dpi)           HP LaserJet+ 1/2 page (300 dpi)
HP LaserJetII 1/2 page (300 dpi)     *HP LaserJetIII          (150 dpi)
HP LaserJetIIP          (150 dpi)     HP LaserJetIV /L       (150 dpi)
HP LaserJetIII w/1.5MB  (300 dpi)     HP LaserJetIIP w/1.5MB  (300 dpi)
HP LaserJetIV /L       (300 dpi)      HP LaserJetIII 1/2 page (300 dpi)
HP LaserJetIIP 1/2 page (300 dpi)    *HP LaserJetIV w/4MB    (600 dpi)
HP LaserJetIV 1/2 page (600 dpi)     *HP LaserJet IIIsi

Color HP/PCL Printers:

*HP DeskJet 550c                     *HP DeskJet 560c
HP DeskJet 1200C (300 dpi)            HP DeskJet 540c (B&W only)


-----------------------------
SCURK Command Line Options

There are some command line options available to you when you are using 
SCURK. You would type them in when starting SCURK from the DOS prompt, 
right after you type "SCURK" as follows:

SCURK <options ...>

There is at least one blank space between "SCURK" and the option(s), and 
between options. All options can be either upper-case or lower-case. 
These options are:


NO_MEM_CHK: disable startup memory checking by SCURK. SCURK will not 
start if there is not enough memory available on your system. However, 
some systems do not report the correct amount of memory available. This 
option will prevent checking completely.

-Z: Disables internal "ZoomBlit" function. You can free up about 40K of 
memory usage with this flag. However, if you are using the VESA SVGA 
driver, the refresh of the Edit Window will be extremely slow and 
virtually unusable if this option is used. Any other SVGA driver should 
work just fine with this option, but will likely be just a little bit 
slower.

-T: Title graphics option. This option will store some of the graphics on 
the Main Screen on disk rather than in memory. This frees up memory for 
other uses, but will result in slightly slower redraws of the Main Screen.

-TD: Title Detail option. Reduces the amount of graphics detail on the 
Main Screen. Can be used to speed up redraws on slower machines.

-S: Serialize Sound Option. If you are experiencing occasional hangs, 
using this option may help on some machines. This seems to be dependent 
on type of sound card and amount of memory. This has a side-effect that 
there may be delays after clicking buttons.(Another method to avoid these 
hangs is to
disable sound entirely (from the SCURK Main Screen) and see if this 
clears up the problem.)

Example Usage:

C:> SCURK no_mem_check -t
C:> SCURK -t -td -z
=========================================================================

VIII. CONTACTING MAXIS TECHNICAL SUPPORT
-----------------------------
Handy Ways to Talk to Helpful People

By Telephone (Monday through Friday 8am-6pm Pacific time) 
1-510-253-3755 
 
By Fax (Anytime) 
1-510-253-3736 (Be sure to indicate the Fax is for Technical Support, and 
make sure we can read your return number.) 
 
By Modem (Anytime. Up to 14.4k baud. A BBS filled with all kinds of 
groovy Maxis stuff) 
1-510-254-3869 
 
By US Mail 
Maxis Technical Support 
2 Theater Square, Suite 230 
Orinda, CA 94563-3346 
 
By Electronic Mail/Online Service 
America Online - keyword "Maxis" or EMail to "Maxis" 
CompuServe - Go "gamepub" and select "Maxis" (section 8) 
Genie - Scorpia's Roundtable, Maxis Area or Email "Maxis" 
AppleLink - EMail "D4459" 
Prodigy - Email "MAXI99A" 
Internet - Email "support(at)maxis.com" 
=========================================================================

IX. CD-ROM CONTRIBUTERS
-----------------------------
Not only did we have to make sure we thanked everyone who wrote SimCity
2000 and the Urban Renewal Kit, we also have a bunch more new people who
worked on the CD-ROM collection. It just wouldn't be fair to not mention
them.

Additional Producing/Programming: Chris Weiss
Additionally writing/editing: Bob Sombrio & Chris Weiss
Additional Marketing: Larry Lee
Additional Graphic Artwork (including the killer CD artwork!): Vera Jaye
Kristine Brogno and Amy Melker
Lead Testing: Scott Shicoff
Additional Scenario Cities Created By M. Brent Sleeper and Kevin Endo
Scenarios Created by Chris Weiss & Heather Mace
Check the file README.TXT in the CITIES directory for excellent 
descriptions and the names of all the great people who contributed
award-winning cities.

=========================================================================
Thanks for buying the SimCity 2000 CD-ROM Collection.
We hope you enjoy playing it as much as we enjoyed creating it! 


