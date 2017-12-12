function Lock-Workstation {
    <#
    .SYNOPSIS
    Lock the current workstation
    
    .DESCRIPTION
    Lock the current workstation, useful for locking machines after running a script.
        
    .EXAMPLE
    Lock-Workstation
    Locks the workstation, nice and simple.

    #>
    $Member_Definition  = @"  
    [DllImport("user32.dll", SetLastError = true)]  
    public static extern bool LockWorkStation();  
"@  
    $LockWorkStation = Add-Type -memberDefinition $Member_Definition -name "Win32LockWorkStation" -namespace Win32Functions -passthru  

    $LockWorkStation::LockWorkStation() | Out-Null
}