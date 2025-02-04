#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// Déclaration des fonctions ASM
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

int main() {
    // Test ft_strlen
    printf("Testing ft_strlen:\n");
    printf("Length of \"Hello\": %zu (expected: %zu)\n", ft_strlen("Hellooo"), strlen("Hellooo"));

    // Test ft_strcpy
    printf("\nTesting ft_strcpy:\n");
    char dest[6];
    printf("Copy \"Hello\" into dest: %s (expected: Hello)\n", ft_strcpy(dest, "Hello"));
    
    // Test ft_strcmp
    printf("\nTesting ft_strcmp:\n");
    printf("Compare \"Hello\" and \"Hello\": %d (expected: %d)\n", ft_strcmp("Hello", "Hello"), strcmp("Hello", "Hello"));
    printf("Compare \"Hello\" and \"World\": %d (expected: %d)\n", ft_strcmp("Hello", "World"), strcmp("Hello", "World"));

    // Test ft_write
    printf("\nTesting ft_write:\n");
    ft_write(1, "This is ft_write\n", 17);

    // Test ft_read
    printf("\n\nTesting ft_read:\n");
    char buffer[100];
    ssize_t bytes_read = ft_read(0, buffer, 99); // Lecture depuis stdin
    if (bytes_read > 0) {
        buffer[bytes_read] = '\0';
        printf("Read %zd bytes: %s\n", bytes_read, buffer);
    } else {
        perror("ft_read");
    }

    //Test ft_strdup
    printf("\nTesting ft_strdup:\n");
    char *dup = ft_strdup("Hello, world!");
    printf("Duplicate of \"Hello, world!\": %s\n", dup);
    free(dup);

    return 0;
}
