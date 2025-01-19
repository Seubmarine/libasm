#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

// #define printf(x, ...) ;
size_t ft_strlen(char *str);

int test_strlen(int argc, char **argv)
{
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
int test_strcpy()
{
    char *src = "Bonjour je suis moi meme";
    char dst[64];

    ft_strcpy(dst, src);
    printf("src\"%s\"\n", src);
    printf("dst\"%s\"\n", dst);
    return 1;
}

int ft_strcmp(const char *s1, const char *s2);
int test_strcmp(char *s1, char *s2)
{

    int ft = ft_strcmp(s1, s2);
    printf("ft_strcmp(\"%s\", \"%s\") = 0x%x %i\n", s1, s2, ft, ft);
    int std = strcmp(s1, s2);
    printf("strcmp(\"%s\", \"%s\") = 0x%x %i\n", s1, s2, std, std);
    return ft == std;
}

ssize_t ft_write(int fd, void *buf, size_t count);
int test_write(char *str)
{
    size_t len = ft_strlen(str);
    return ft_write(STDOUT_FILENO, str, len) == write(STDOUT_FILENO, str, len);
}

ssize_t ft_read(int fd, void *buf, size_t count);
int test_read()
{
    char buf[256];
    ssize_t len = ft_read(STDIN_FILENO, buf, 255);
    ft_write(STDOUT_FILENO, buf, len);
    ft_write(STDOUT_FILENO, "\n", 1);
    return len;
}

char *ft_strdup(const char *s);
int test_strdup(const char *s) {
    char *new_str = ft_strdup(s);
    if (new_str == NULL) {
        printf("strdup malloc error\n");
        return -1;
    }
    
    printf("string: %s %p\n", new_str, new_str);
    printf("string: %s %p\n", s, s);
    int result = ft_strcmp(s, new_str);
    free(new_str);
    return result == 0;
}

int main(int argc, char **argv)
{
    (void)argc;
    (void)argv;
    test_strlen(argc, argv);
    test_strcpy();
    if (
        test_strcmp("abc", "abc") &&
        test_strcmp("abc", "def") &&
        test_strcmp("def", "abc") &&
        test_strcmp(" def", "abc"))
    {
        printf("\nSUCESS: strcmp\n\n");
    } else {
        printf("\nERROR: strcmp\n\n");

    };
    ;
    test_strcmp("COul ", "42");
    test_write("Hello world\n");
    test_write("42\n");
    test_strdup("A");
    errno = 0;
    void *tmp = NULL;
    int b = write(0, tmp, 1);
    int b_error = errno;
    errno = 0;
    int a = ft_write(0, tmp, 1);
    int a_error = errno;
    printf("a: %i a_err: %i\nb: %i b_err: %i\n", a, a_error, b , b_error);
    if (a_error == EINVAL)
        printf("errno == EINVAL\n");
    else
        printf("errno != EINVAL\n");
    // test_read();
    return 0;
}