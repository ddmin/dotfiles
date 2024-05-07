# Tabbed
[tabbed-flexipatch](https://github.com/bakkeby/tabbed-flexipatch)

## Run with XEmbed Application
```console
tabbed -c alacritty --embed
tabbed -c zathura -e
```

## Makefile
```console
# Uncomment this for the alpha patch / ALPHA_PATCH
LDFLAGS = -lXrender
```

```console
# make file doesn't work, copy patches manually
cp patches.def.h patches.h
```

## Building
```console
git clone https://github.com/bakkeby/tabbed-flexipatch
make
sudo make install
```

## Manually Patching
patch -p0 < patch.diff
