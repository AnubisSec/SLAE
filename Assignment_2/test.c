#include <stdio.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <arpa/inet.h>
#include <unistd.h>



int main() {



	const char* ip = "127.1.1.1";
        struct sockaddr_in addr;

	printf("%d\n", sizeof(addr));
	return 0;




}
