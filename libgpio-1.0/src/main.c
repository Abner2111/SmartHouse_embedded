#include <gpio.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {

    if (argc < 3 | atoi(argv[2])==0){
        fprintf(stderr, "Usage: %s <write | read> <pinNumber> [value]\n", argv[0]);
        return 1;
    }
    int pinNum = atoi(argv[2]);
    if (pinNum>27){
        fprintf(stderr, "Only 26 GPIO are general purpose\n");
        return 1;
    }
    if(strcmp(argv[1],"write") == 0){
        int value = atoi(argv[3]);
        if (value<0 | value>1){
            fprintf(stderr, "Write 1 for high, 0 for low");
            return 1;
        }
        pinMode(pinNum, 1);
        digitalWrite(pinNum,value);
    }
    if(strcmp(argv[1],"read") == 0){
        
        pinMode(pinNum, 0);
        int readValue = digitalRead(pinNum);
        printf("%d\n", readValue);
    }
    unexportPin(pinNum);

    return 0;
}