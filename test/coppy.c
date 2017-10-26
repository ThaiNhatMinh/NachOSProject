#include "syscall.h"
#include "copyright.h"


int main()
{
    int id_S,id_D;
    char c;
    char name_S[128],name_D[128];
    int check;
    Write("Nhap ten file nguon: ",1024,0);
    Read(name_S,1024,0);
    id_S = OpenFile(name_S,1);
    if(id_S==-1)
    {
        Write("Khong the mo file!!!\n",1024,0);
        return 0;
    }
    Write("Nhap ten file dich: ",1024,0);
    Read(name_D,1024,0);
    CreateFile(name_D);
    id_D = OpenFile(name_D,0);

    check = 0;
    while(check!=-2)
    {
        check = Read(&c,1,id_S);
        Write(&c,1,id_D);
    }

    CloseFile(id_S);
    CloseFile(id_D);
    return 0;
}