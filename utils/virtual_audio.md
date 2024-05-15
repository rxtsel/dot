# Virtual Audio

A virtual audio output is a way to combine all the audio outputs of your computer into a single one. This is useful when you have multiple speakers and you want to use them all at the same time.

> [!NOTE]
> This work with **pipewire** and **pavucontrol**.

You need to have all your Bluetooth speakers already connected.

1. This will create a virtual output by summing all the speakers you have:

```bash
pactl load-module module-combine-sink
```

2. If you want to reset everything, just restart the service:

```bash
systemctl --user restart pipewire.service
```
