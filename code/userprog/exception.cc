// exception.cc 
//	Entry point into the Nachos kernel from user programs.
//	There are two kinds of things that can cause control to
//	transfer back to here from user code:
//
//	syscall -- The user code explicitly requests to call a procedure
//	in the Nachos kernel.  Right now, the only function we support is
//	"Halt".
//
//	exceptions -- The user code does something that the CPU can't handle.
//	For instance, accessing memory that doesn't exist, arithmetic errors,
//	etc.  
//
//	Interrupts (which can also cause control to transfer from user
//	code into the Nachos kernel) are handled elsewhere.
//
// For now, this only handles the Halt() system call.
// Everything else core dumps.
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "copyright.h"
#include "system.h"
#include "syscall.h"

//----------------------------------------------------------------------
// ExceptionHandler
// 	Entry point into the Nachos kernel.  Called when a user program
//	is executing, and either does a syscall, or generates an addressing
//	or arithmetic exception.
//
// 	For system calls, the following is the calling convention:
//
// 	system call code -- r2
//		arg1 -- r4
//		arg2 -- r5
//		arg3 -- r6
//		arg4 -- r7
//
//	The result of the system call, if any, must be put back into r2. 
//
// And don't forget to increment the pc before returning. (Or else you'll
// loop making the same system call forever!
//
//	"which" is the kind of exception.  The list of possible exceptions 
//	are in machine.h.
//----------------------------------------------------------------------

void
ExceptionHandler(ExceptionType which)
{
    int type = machine->ReadRegister(2);
    //-----------------------------NEW CODE------------------------------------
    printf("Call to ExceptionHandler() %d %d\n", which, type);
    switch(which)
    {
        case NoException:
            return;
        case PageFaultException:    // No valid translation found
            printf("Error: No valid translation found.\n");
            interrupt->Halt();
            break;
        case ReadOnlyException:   // Write attempted to page marked  "read-only"
            printf("Error: Write attempted to page marked \"read-only\".\n");
            interrupt->Halt();
            break;
                  
        case BusErrorException:     // Translation resulted in an invalid physical address
            printf("Error: Translation resulted in an invalid physical address.\n");
            interrupt->Halt();
            break;
        case AddressErrorException: // Unaligned reference or one that was beyond the end of the address space
            printf("Error: Unaligned reference or one that was beyond the end of the address space.\n");
            interrupt->Halt();
            break;
        case OverflowException:     // Integer overflow in add or sub.
            printf("Error: Integer overflow in add or sub.\n");
            interrupt->Halt();
            break;
        case IllegalInstrException: // Unimplemented or reserved instr.
            printf("Error: Unimplemented or reserved instr.\n");
            interrupt->Halt();
            break;
        case SyscallException:
            switch(type)
            {
                case SC_Halt:
                    DEBUG('a', "Shutdown, initiated by user program.\n");
                    interrupt->Halt();
                    break;
                case SC_Create:
                {
                    int virtAddr;
                    char* filename;
                    DEBUG('a',"\n SC_Create call ...");
                    DEBUG('a',"\n Reading virtual address of filename");
                    // Lấy tham số tên tập tin từ thanh ghi r4
                    virtAddr = machine->ReadRegister(4);
                    DEBUG ('a',"\n Reading filename.");
                    int  MaxFileLength = 32;
                    filename = machine->User2System(virtAddr,MaxFileLength+1);
                    if (filename == NULL)
                    {
                        printf("\n Not enough memory in system");
                        DEBUG('a',"\n Not enough memory in system");
                        machine->WriteRegister(2,-1); // trả về lỗi cho chương
                        // trình người dùng
                        delete filename;
                        return;
                    }
                    DEBUG('a',"\n Finish reading filename.");
                    //DEBUG('a',"\n File name : '"<<filename<<"'");
                    // Create file with size = 0
                    // Dùng đối tượng fileSystem của lớp OpenFile để tạo file,
                    // việc tạo file này là sử dụng các thủ tục tạo file của hệ điều
                    // hành Linux, chúng ta không quản ly trực tiếp các block trên
                    // đĩa cứng cấp phát cho file, việc quản ly các block của file
                    // trên ổ đĩa là một đồ án khác
                    if (!fileSystem->Create(filename,10))
                    {
                        printf("\n Error create file '%s'",filename);
                        machine->WriteRegister(2,-1);
                        delete filename;
                        return;
                    }
                    machine->WriteRegister(2,0); // trả về cho chương trình
                    // người dùng thành công
                    delete filename;
                    break;
                }
                case SC_Read:
                {
                    int virtAddr;
                    virtAddr = machine->ReadRegister(4);
                    int maxchar = machine->ReadRegister(5);
                    int ID = machine->ReadRegister(6);
                    if(ID==0||ID==1)
                    {
                        char* sysBuffer = new char[maxchar+1];
                        int nChar = gSynchConsole->Read(sysBuffer,maxchar);
                        machine->System2User(virtAddr,nChar,sysBuffer);
                        machine->WriteRegister(2,nChar);
                        delete [] sysBuffer;
                    }
                    break;
                }
                case SC_Write:
                {
                    int virtAddr;
                    virtAddr = machine->ReadRegister(4);
                    int maxchar = machine->ReadRegister(5);
                    int ID = machine->ReadRegister(6);
                    if(ID==0||ID==1)
                    {
                        char* sysBuffer = machine->User2System(virtAddr,maxchar);
                        int nChar = gSynchConsole->Write(sysBuffer,maxchar);
                        machine->WriteRegister(2,nChar);
                        delete[] sysBuffer;
                    }
                    break;
                }
                    
            }
            //int aaa = machine->registers[NextPCReg]+4;
            machine->registers[PrevPCReg] = machine->registers[PCReg];	// for debugging, in case we
            // are jumping into lala-land
            machine->registers[PCReg] = machine->registers[NextPCReg];
            machine->registers[NextPCReg] = machine->registers[PCReg]+4;
            break;
        default:
        printf("Unexpected user mode exception %d %d\n", which, type);
        interrupt->Halt();
        break;
    }
    
    /*
    if ((which == SyscallException) && (type == SC_Halt)) {
	DEBUG('a', "Shutdown, initiated by user program.\n");
   	interrupt->Halt();
    } else {
	printf("Unexpected user mode exception %d %d\n", which, type);
	ASSERT(FALSE);
    }*/

}
