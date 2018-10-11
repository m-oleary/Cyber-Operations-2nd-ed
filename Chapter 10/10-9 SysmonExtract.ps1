# PowerShell script to parse the Sysmon Operational log and examine the data from a 
#  process creation event by casting the data as XML.

$events = Get-WinEvent -FilterHashTable @{logname='Microsoft-Windows-Sysmon/Operational'; id =1}

foreach($event in $events) {
  
   $eventXML = [xml]$event.ToXml()

   $image = $eventXML.Event.EventData.Data[3].'#text'
   $commandline = $eventXML.Event.EventData.Data[4].'#text'
   $user = $eventXML.Event.EventData.Data[6].'#text'
   $integritylevel = $eventXML.Event.EventData.Data[10].'#text'
   $eventpid = $eventXML.Event.EventData.Data[2].'#text'
   $eventppid = $eventXML.Event.EventData.Data[13].'#text'
   $parent = $eventXML.Event.EventData.Data[14].'#text'

   $image, $commandline, $user, $integritylevel, $eventpid, $eventppid, $parent

   ""
}

