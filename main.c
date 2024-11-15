#include <stdio.h>
#include <string.h>
size_t ft_strlen(char *str);

int main(int argc, char **argv) {
    char *str = "Hello world";
    if (argc > 1)
        str = argv[1];
    printf("str: \"%s\"\n", str);
    size_t ret = strlen(str);
    printf("   strlen: %lu\n", ret);
    size_t ft_ret = ft_strlen(str);
    printf("ft_strlen: %lu\n", ft_ret);
    return 0;
}