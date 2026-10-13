#include <stddef.h>
long long fib(int num) {
    if(num == 0) return 0;
    int a = 0,b = 1;
    for (size_t i = 2; i <= num; ++i) {
        int temp = a;
        a = b;
        b += temp;
    }
    return b;
}