# LumensWatch

<a href="https://www.youtube.com/watch?v=v2OUrstSwUc&t=2s" target="_blank"><img src="https://i.ytimg.com/vi/v2OUrstSwUc/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLC8TKx0Z2PhwmMvpRXdwM1ObqS7eQ" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>


## Background 
In order to connecting the fixture by mobile device, controlling terminal(Rasberry PI)  connect apple watch by bluetooth. LumensWatch will detect the devices
near servers and trying to pair bluetooth. Server will refresh paired status every five seconds. Also, to avoid automatic connection
with same device, server will forget this deviece after disconnection. More importantly, you can confirm successful pairing, monitor incoming raw data and see exactly what is transmitted from the Bluetooth device.

## Features
- remote switch within certain distance by mobile device 
- detect if the connection works well or not.
- Ask if you want to pair the server's bluetooth before you do every time to avoid automatic connection.

## Limitation
The app works only with certain types of Bluetooth devices:
- Devices that work in server mode. That is, devices that listen to and accept incoming Bluetooth connections.
- Devices that accept connections
- Devices that don't require a specific password during connection.
- Devices that can be paired.
All these conditions are required, at least for now. we plan to add in the next release the option to set the specific account for people who have connected server before to recognize who is connecting the sever currently.

## Future plan
- On and Off switch is the basic step for our to control lights, we will add more features like brightness control and electricity usage to the server. 
- Bluetooth connection will no longer limited between the Rasberry pI and iWatch, it will expand to each PC's bluetooth server in the classroom and our cellphone to make it much easier to control.

##API Reference
Link for the DigitalLumens gateway API: file://D:/Brandeis/Field%20project/api.html#header-important-notes

## Related
LumensNodeServer: https://github.com/Dewar0019/LumensNodeServer
Field Project Intro: http://csfp.s3-website-us-west-2.amazonaws.com/content/projects/digitallumens.md/
DigitalLumens:https://www.digitallumens.com/products/led-linear-lighting/

Author: Dewar Tan, Mingze Li, Bo Wen and ArionBold - Abu

## License
LumensNodeServer is released under the MIT License
