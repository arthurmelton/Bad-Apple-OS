# Bad-Apple-OS
First time os (I am going to die)

just learning from https://www.youtube.com/channel/UCuWLGQB4WRBKvW1C26zA2og

# Dependencies
- `git`
- `nasm`
- `qemu`

# Run
```
git clone https://github.com/AMTitan/Bad-Apple-OS
cd Bad-Apple-OS
nasm -f bin boot.asm -o boot.bin
qemu-system-x86_64 boot.bin
```