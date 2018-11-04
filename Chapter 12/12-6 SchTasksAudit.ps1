# PowerShell to search for event 4698, which indicates a change in scheduled tasks value. Note that 
# auditing of object access must also be enabled; this can be done e.g. via group policy.

foreach($system in Get-AdComputer -Filter *){
  $computername = $system.name
  $computername
  $currenttime =  Get-Date
  $threehoursago = $currenttime.AddHours(-3)
  Get-WinEvent -Computer $computername -FilterHashtable @{`
          logname='Security'; `
          id=4698; `
          StartTime=$threehoursago} -ErrorAction SilentlyContinue `
      | Format-List
  }
