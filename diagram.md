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

Mirai hosts the netbootxyz instance as a docker container
Sasuke is the opnsense system that provides the pxe values via dhcp
Garageswitch lives as the name implies in my garage, this links to my Loftswitch, which again downlinks to my home office

In my home office I have currently 3x Zimablades on my desk, that are connected to a "800W" USB hub on my desk, which is in turn connected to a tasmota controlled power outlet, so I can remote power cycle them as needed.
