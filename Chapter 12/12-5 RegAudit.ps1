# PowerShell to search for event 4657, which indicates a change in a registry value. Note that 
# auditing of registry elements must also be enabled; this can be done e.g. via group policy.

foreach($system in Get-AdComputer -Filter *){
  $computername = $system.name
  $computername
  $currenttime =  Get-Date
  $threehoursago = $currenttime.AddHours(-3)
  Get-WinEvent -Computer $computername -FilterHashtable @{`
          logname='Security'; `
          id=4657; `
          StartTime=$threehoursago} -ErrorAction SilentlyContinue `
      | Format-List
  }
