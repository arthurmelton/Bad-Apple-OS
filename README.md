# Bad-Apple-OS
First time os (I am going to die)

just learning from youtube. (I have like not written anything I just copied from others and tweaked what I understood)

# Dependencies
- `git`
- `nasm`
- `qemu`

# Run
```
git clone https://github.com/AMTitan/Bad-Apple-OS
cd Bad-Apple-OS
nasm -f bin stage2.asm -o stage2.bin
nasm -f bin boot.asm -o boot.bin
qemu-system-x86_64 boot.bin
```

# To Make A Iso
```
git clone https://github.com/AMTitan/Bad-Apple-OS
cd Bad-Apple-OS
nasm -f bin stage2.asm -o stage2.bin
nasm -f bin boot.asm -o boot.iso
```