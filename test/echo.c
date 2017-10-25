#include "syscall.h"
#include "copyright.h"

void main()
{
    char buffer[1024];
    while(1)
    {
        int nchar;
        nchar = Read(buffer,1024,0);
        buffer[nchar] = '\0';
        if(buffer[0]=='e'&&buffer[1]=='x'&&buffer[2]=='i'&&buffer[3]=='t') break;
        Write(buffer,1024,0);
    }
}