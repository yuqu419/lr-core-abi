#include <stddef.h>
long long fib(int num) {
    if(num == 0) return 0;
    long long a = 0,b = 1;
    for (int i = 2; i <= num; ++i) {
        long long temp = a;
        a = b;
        b += temp;
    }
    return b;
}