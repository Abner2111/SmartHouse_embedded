#ifndef GPIO_H
#define GPIO_H

// Macros para configurar los pines como entrada o salida
#define INPUT  0
#define OUTPUT 1
#define GPIO_OFFSET 512

// Función para exportar un pin y hacerlo accesible desde el sistema de archivos
void exportPin(int pin);

// Función para desexportar un pin y liberar su acceso
void unexportPin(int pin);

// Función para configurar el modo de un pin (entrada o salida)
void pinMode(int pin, int mode);

// Función para escribir un valor lógico en un pin de salida
void digitalWrite(int pin, int value);

// Función para leer el valor lógico de un pin de entrada
int digitalRead(int pin);

// Función para generar un patrón de parpadeo en un pin
void blink(int pin, int delay_ms, int times);

#endif // GPIO_H