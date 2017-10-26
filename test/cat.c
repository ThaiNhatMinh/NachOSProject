#include "syscall.h"
#include "copyright.h"

int main()
{
    int id;
    CreateFile("demo1.txt");
    id = OpenFile("demo1.txt",0);
    Write("TEST TEST THAI NHAT MINH",25,id);
    CloseFile(id);
    return 0;
}