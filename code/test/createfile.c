#include "syscall.h"
#include "copyright.h"

int main()
{
    char str[512];
    Write("Nhap ten file: ",256,0);
    Read(str,512,0);
    CreateFile(str);
    return 0;
}