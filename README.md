# notifyReceive
This docker is used to receive authenticated muticast messages and say the contents of the message using text to speech

Note: This is for ARM based processors.

## 3 Environmental Variables should be defined:
- notify_multicast=[ Multicast IP ]
- notify_port=[ Integer 1024-65535 ]
- notify_totp_seed=[ 16 Char Base32 String ]

Notifications are received via the multicast address on the port specified.  Multiple senders and receivers are compatible on the same multicast address.  The TOTP seed will generate a one time code to authenticate the message to create a "domain" of senders and receivers.  Multiple domains may exist on the same multicast address, but functionality may be degraded if traffic is greater than that of the sender or receiver connections.  An internet connection is not used with this process on either the sender or receiver end, and may require special configuration of network switches and routers to enable multicast traversal.

## Example Environmental Variables File
```
notify_multicast=239.0.0.1
notify_port=10000
notify_totp_seed=base32secret3232

```

## Example Run Command
```
docker run -e notify_multicast=239.0.0.1 -e notify_port=10000 -e notify_totp_seed=base32secret3232 --device /dev/snd:/dev/snd gpocali/notifyreceive:latest
```

This docker is currently in Alpha, meaning that this docker is still under development. There is no warranty or guarantees expressed or implied with the use of this docker or its constituent code.