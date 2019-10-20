# macOS Bootstrap
Everything I need after installing a fresh macOS.<br>
<br>
**Warning:** If you want to give these script a try, you should first **fork this repository, review and understand the code**.<br>
Don’t blindly use it unless you know what that entails.<br>

## Prerequisites
Install Command Line Tools (~200MB) from the Apple before running the script. Otherwise, Homebrew can't access the some libraries as the agreement hasn't been accepted yet. Download link: https://developer.apple.com/download/more/ 

## Installation
``` 
bash <(curl -L https://raw.github.com/MauricioBalderrama/macOS-Bootstrap/master/install.sh)
```
## Other software installation (manual)
Use this command before installing anything from Homebrew to target the local volumne: Installers
<br>
``` 
export HOMEBREW_CACHE=/Volumes/Installers
``` 
Some apps I want to install by hand. For personal reasons.<br>
<br>
**Adobe Creative Cloud** https://adobe.com/<br>
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Photoshop<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Illustrator<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Acrobat Reader<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Acrobat<br>*
**Microsoft Office** https://www.office.com/<br>
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Word<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Excel<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Power Point<br>*
**TextFinderX** https://sw.ixoft.com/texfinderx/<br>

## Credits

### Author
**Mauricio from Pull** - [http://pull.studio/](http://pull.studio/)

### License
This project is licensed under the MIT License.
