if (Test-Connection 192.168.1.10 -Quiet)
{
}
else
{
	kasa --host 192.168.1.11 --plug off
	Start-Sleep -Seconds 5
	kasa --host 192.168.1.11 --plug on
}
exit