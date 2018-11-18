# tools
###### everyday tools bat, bash, python...

###### get-ext-ip.sh :
is a simple tool to validate if the given ddns domain has the same ip with the system running.  
this is usefull to troubleshoot often changes in your ip address


###### get-ip-info.sh: 
can help you aquire info about domain, ip and MAC addresses  
this tool is usefull if you need to find info about connections initiating from you computer to the internet  
added functionality to retrieve the vendor name of a MAC address 

###### get-winpc-hw-info.bat:
gather basic hardware information from the running windows machine.  
requires access to registry  
creates temporary folders in %userprofile%\appdata\local\info  
creates a report and offers the possibility to save to your desktop

###### get-winpc-net-info.bat:
print basic network indormation from the running windows machine  
ipconfig, netsh, mac address, route table, hosts file  

###### RESET-winpc-net-settings.bat:
USE WITH CAUTION  
this script RESETS - DELETES network settings  
requires administrative rights  
restart after computer after running the script  

###### get-winpc-cpu-arch:
this tool features 2 different ways to define the architecture of the running system  
1st way by reading the system variable  
2nd way by querying a registry valuee  
