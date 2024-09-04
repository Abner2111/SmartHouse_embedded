#include <config.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include "gpio.h"
// Macros para configurar los pines como entrada o salida
// INPUT  0
// OUTPUT 1

// Función para exportar un pin y hacerlo accesible desde el sistema de archivos
void exportPin(int pin) {
    // Abre el archivo de exportación del sistema GPIO
    int fd = open("/sys/class/gpio/export", O_WRONLY);
    if (fd == -1) {
        perror("No se pudo abrir /sys/class/gpio/export");
        exit(1);
    }


    // Convierte el número de pin a una cadena y lo escribe en el archivo de exportación
    char pin_str[4];
    snprintf(pin_str, 4, "%d", pin);
    write(fd, pin_str, strlen(pin_str));

    // Cierra el archivo de exportación
    close(fd);
}

// Función para desexportar un pin y liberar su acceso
void unexportPin(int pin) {
    pin = pin+GPIO_OFFSET;
    // Abre el archivo de desexportación del sistema GPIO
    int fd = open("/sys/class/gpio/unexport", O_WRONLY);
    if (fd == -1) {
        perror("No se pudo abrir /sys/class/gpio/unexport");
        exit(1);
    }

    // Convierte el número de pin a una cadena y lo escribe en el archivo de desexportación
    char pin_str[4];
    snprintf(pin_str, 4, "%d", pin);
    write(fd, pin_str, strlen(pin_str));

    // Cierra el archivo de desexportación
    close(fd);
}

// Función para configurar el modo de un pin (entrada o salida)
void pinMode(int pin, int mode) {
    //add offset to gpio
    pin = pin+GPIO_OFFSET;
    // Exporta el pin si es necesario
    exportPin(pin);
    
    // Construye la ruta al archivo de dirección del pin
    char path[35];
    snprintf(path, 35, "/sys/class/gpio/gpio%d/direction", pin);

    // Abre el archivo de dirección del pin
    int fd = open(path, O_WRONLY);
    if (fd == -1) {
        perror("No se pudo abrir el archivo direction");
        exit(1);
    }

    // Escribe "in" o "out" dependiendo del modo seleccionado
    if (mode == 0) {
        write(fd, "in", 2);
    } else {
        write(fd, "out", 3);
    }

    // Cierra el archivo de dirección
    close(fd);
}

// Función para escribir un valor lógico en un pin de salida
void digitalWrite(int pin, int value) {
    //add offset to gpio
    pin = pin+GPIO_OFFSET;
    // Construye la ruta al archivo de valor del pin
    char path[30];
    snprintf(path, 30, "/sys/class/gpio/gpio%d/value", pin);

    // Abre el archivo de valor del pin
    int fd = open(path, O_WRONLY);
    if (fd == -1) {
        perror("No se pudo abrir el archivo value");
        exit(1);
    }

    // Escribe "0" o "1" dependiendo del valor seleccionado
    if (value == 0) {
        write(fd, "0", 1);
    } else {
        write(fd, "1", 1);
    }

    // Cierra el archivo de valor
    close(fd);
}

// Función para leer el valor lógico de un pin de entrada
int digitalRead(int pin) {
    //add offset to gpio
    pin = pin+GPIO_OFFSET;
    // Construye la ruta al archivo de valor del pin
    char path[30];
    snprintf(path, 30, "/sys/class/gpio/gpio%d/value", pin);

    // Abre el archivo de valor del pin
    int fd = open(path, O_RDONLY);
    if (fd == -1) {
        perror("No se pudo abrir el archivo value");
        exit(1);
    }

    // Lee el valor del pin ("0" o "1")
    char value_str[2];
    read(fd, value_str, 1);

    // Cierra el archivo de valor
    close(fd);

    // Retorna el valor leído como un entero
    return (value_str[0] == '0') ? 0 : 1;
}

// Función para generar un patrón de parpadeo en un pin
void blink(int pin, int delay_ms, int times) {
    // Configura el pin como salida
    pinMode(pin, 1);

    // Realiza el parpadeo la cantidad de veces especificada
    for (int i = 0; i < times; i++) {
        digitalWrite(pin, 1);  // Enciende el pin
        usleep(delay_ms * 1000);  // Espera el tiempo especificado
        digitalWrite(pin, 0);   // Apaga el pin
        usleep(delay_ms * 1000);  // Espera el tiempo especificado
    }
}
