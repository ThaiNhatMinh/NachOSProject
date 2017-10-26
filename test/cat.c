#include "syscall.h"
#include "copyright.h"

int main()
{
    int id;
    char filename[256];
    char c;
    int nchar;
    int check;
    Write("Nhap ten file: ",1024,0);
    nchar = Read(filename,1024,0);

    id = OpenFile(filename,1);
    check = 0;
    while(check!=-2)
    {
        check = Read(&c,1,id);
        Write(&c,1,0);
    }

    CloseFile(id);
    return 0;
}