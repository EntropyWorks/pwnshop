#! fish

sysctl -w kernel.randomize_va_space=0

cd /src
echo ". . . . . rm all .bin from /src"
rm (ls /src | grep .bin)
echo ". . . . . generating new binaries from source"
for file in (ls /src)
    echo compilling $file...
    gcc \
        -w \
        -g -m32 \
        -no-pie  \
        -fno-stack-protector   \
        -fno-asynchronous-unwind-tables   \
        -mpreferred-stack-boundary=2   \
        -z execstack  \
        $file \
        -o (echo $file | cut -d"." -f1).bin \
        2>/dev/null
end