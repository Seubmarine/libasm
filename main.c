#include <stdio.h>
#include <string.h>
size_t ft_strlen(char *str);

int test_strlen(int argc, char **argv) {
    char *str = "Hello world";
    if (argc > 1)
        str = argv[1];
    printf("str: \"%s\"\n", str);
    size_t ret = strlen(str);
    printf("   strlen: %lu\n", ret);
    size_t ft_ret = ft_strlen(str);
    printf("ft_strlen: %lu\n", ft_ret);
    return ret == ft_ret;
}

char *ft_strcpy(char *dest, const char *src);
int test_strcpy() {
    char *src = "Bonjour je suis moi meme";
    char dst[64];

    ft_strcpy(dst, src);
    printf("src\"%s\"\n", src);
    printf("dst\"%s\"\n", dst);
    return 1;
}

int main(int argc, char **argv) {
    (void) argc;
    (void) argv;
    // test_strlen(argc, argv);
    test_strcpy();
    return 0;
}