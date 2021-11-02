#config your windbg path and COM PIPE

$windbg86="C:\Program Files (x86)\Windows Kits\10\Debuggers\x86\windbg.exe"
$windbg64="C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\windbg.exe"
$pipename="\\.\pipe\kerneldbg"
##############################################################################3

function run($windbg){
    if($windbg -eq "86"){
        Start-Process -Verb RunAs $windbg86     
    }elseif($windbg -eq "64"){
        Start-Process -Verb RunAs $windbg64
    }else{
        Write-Host "Check Usage!"
        exit
    }

    Start-Sleep -s 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('WinDbg')

    Sleep 1
    $wshell.SendKeys('^k')

    Sleep 1
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys('{TAB}')

    sleep 1
    $wshell.SendKeys('{RIGHT}')
    $wshell.SendKeys('{RIGHT}')
    $wshell.SendKeys('{RIGHT}')
    $wshell.SendKeys('{RIGHT}')

    sleep 1
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys('{TAB}')

    sleep 1
    $wshell.SendKeys($pipename)

    sleep 1
    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys(' ')

    $wshell.SendKeys('{TAB}')
    $wshell.SendKeys(' ')

    sleep 1
    $wshell.SendKeys('{ENTER}')
}

function banner{
write-host @'

 /$$      /$$ /$$           /$$$$$$$  /$$                
| $$  /$ | $$|__/          | $$__  $$| $$                
| $$ /$$$| $$ /$$ /$$$$$$$ | $$  \ $$| $$$$$$$   /$$$$$$ 
| $$/$$ $$ $$| $$| $$__  $$| $$  | $$| $$__  $$ /$$__  $$
| $$$$_  $$$$| $$| $$  \ $$| $$  | $$| $$  \ $$| $$  \ $$
| $$$/ \  $$$| $$| $$  | $$| $$  | $$| $$  | $$| $$  | $$
| $$/   \  $$| $$| $$  | $$| $$$$$$$/| $$$$$$$/|  $$$$$$$
|__/     \__/|__/|__/  |__/|_______/ |_______/  \____  $$
                                                /$$  \ $$
                                               |  $$$$$$/
                                                \______/ 
                                                 For Lazy
*********************************************************
* Twitter: @creamychickens1                             *
* Github: https://github.com/Creamy-Chicken-Soup        *
*********************************************************
USAGE : LazyKernelWindbg 86  #for x86
        LazyKernelWindbg 64  #for x64
'@
}

banner
$windbg=$args[0]
run $windbg
