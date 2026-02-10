![usbhub](https://github.com/user-attachments/assets/6c8fec5e-133f-4aad-8cce-1b40f317e81a)
![zimas](https://github.com/user-attachments/assets/16e6fd87-3905-4da1-a254-7bd6aab7e34b)
![zima](https://github.com/user-attachments/assets/379b8ba4-7ed8-48c8-858d-12e91649ec97)
![display](https://github.com/user-attachments/assets/8c7c96a8-d871-4175-a02d-5c46116eb944)
```

[ Mirai ]      [ sasuke ]
     \             /
      \           /
       +----------------+
       |  Garageswitch  |
       +----------------+
                 |
          +-------------+
          |  Loftswitch |
          +-------------+
                 |
          +----------------+
          | Officeswitch  |
          +----------------+
            |      |      |
        [ zima1 ][ zima2 ][ zima3 ]

```

Shows the layout of my setup

- Mirai hosts the netbootxyz instance as a docker container
- Sasuke is the opnsense system that provides the pxe values via dhcp
- Garageswitch lives as the name implies in my garage, this links to my Loftswitch, which again downlinks to my home office

- In my home office I have currently 3x Zimablades on my desk, that are connected to a "800W" USB hub on my desk, which is in turn connected to a tasmota controlled power outlet, so I can remote power cycle them as needed.
