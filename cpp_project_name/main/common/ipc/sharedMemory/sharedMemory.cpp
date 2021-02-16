#include "sharedMemory.h"

int	SharedMemory::initSharedMemory(shmem_t **shm_addr, char* shMemName, int createF){
	int shm_fd;
	int flag;
	int value;

	if (createF == 1)
	{
		flag = O_CREAT;
	}	
	else
	{
		flag = O_EXCL;
	}	
	
	errno = 0;
	shm_fd = shm_open( shMemName, O_RDWR | flag, 0777);
	if (shm_fd == -1) 
	{
		fprintf(stderr, "shm_open failed for %s", shMemName);
		return RETURN_FAILURE;
	}
	
	if( ftruncate( shm_fd, sizeof( **shm_addr ) ) == -1 ) {
		fprintf(stderr, "ftruncate for %s", shMemName);
		return RETURN_FAILURE;
	}
	
	errno = 0;
	*shm_addr = (shmem_t *)mmap( 0, sizeof( **shm_addr ), PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0 );
	if( (void*)*shm_addr == MAP_FAILED )
	{
		fprintf(stderr, "mmap failed for %s", shMemName);
		return RETURN_FAILURE;
	}
	
	if (createF == 1)
	{
/*		int ret = sem_init( &((*shm_addr)->semaphore), 1, 1) ;
		printf("%d Sem init return\n", ret);*/
	}	
/*	sem_getvalue(&((*shm_addr)->semaphore), &value);
	sem_post( &((*shm_addr)->semaphore) );*/
	return RETURN_SUCCESS;	
}
int SharedMemory::deinitSharedMemory(char* shMemName, shmem_t*){
	int ret = RETURN_SUCCESS;

	errno = 0;
/*	ret = sem_destroy(&shmPtr->semaphore);*/
	if(ret == -1)
	{
		fprintf(stderr, "semaphore destruction failed for %s\n", shMemName);
		return RETURN_FAILURE;
	}
	
	errno = 0;
	ret = shm_unlink(shMemName);
	if(ret == -1)
	{
		fprintf(stderr, "shm unlink failed for %s\n", shMemName);
		return RETURN_FAILURE;		
	}
	
	return ret;
}