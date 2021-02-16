#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/types.h> 		 
#include <fcntl.h>	  		
#include <sys/mman.h> 		// Map a memory region into a process's address space
#include <semaphore.h>		
#include <stdint.h>				

#define RETURN_SUCCESS 0
#define RETURN_FAILURE 1

typedef struct shData_struct{	
	int testVal;
} shData_t;

typedef struct shmemStruct{
	sem_t 				semaphore;
	shData_t			data;
} shmem_t;

class SharedMemory{
	public:

	int	initSharedMemory(shmem_t **shm_addr, char* shMemName, int createF);
	int deinitSharedMemory(char* shMemName, shmem_t*);
};