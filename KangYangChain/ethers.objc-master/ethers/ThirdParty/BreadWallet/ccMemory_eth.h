//
//  ccMemory_eth.h
//  ethers
//
//  Created by furao on 2018/10/23.
//  Copyright © 2018年 Ethers. All rights reserved.
//

#ifndef ccMemory_eth_h
#define ccMemory_eth_h
#ifdef KERNEL
#define    CC_XMALLOC(s)  OSMalloc((s), CC_OSMallocTag)
#define    CC_XFREE(p, s) OSFree((p), (s), CC_OSMallocTag)
#else /* KERNEL */
#include <stdlib.h>
#include <string.h>

#define CC_XMALLOC(s)  malloc(s)
#define CC_XCALLOC(c, s) calloc((c), (s))
#define CC_XREALLOC(p, s) realloc((p), (s))
#define CC_XFREE(p, s)    free(p)
#define CC_XMEMCPY(s1, s2, n) memcpy((s1), (s2), (n))
#define CC_XMEMCMP(s1, s2, n) memcmp((s1), (s2), (n))
#define CC_XMEMSET(s1, s2, n) memset((s1), (s2), (n))
#define CC_XZEROMEM(p, n)    memset((p), 0, (n))
#define CC_XSTRCMP(s1, s2) strcmp((s1), (s2))
#define CC_XSTORE32H(x, y) do {                        \
(y)[0] = (unsigned char)(((x)>>24)&255);            \
(y)[1] = (unsigned char)(((x)>>16)&255);            \
(y)[2] = (unsigned char)(((x)>>8)&255);                \
(y)[3] = (unsigned char)((x)&255);                \
} while(0)
#define CC_XSTORE64H(x, y)                                                                     \
{ (y)[0] = (unsigned char)(((x)>>56)&255); (y)[1] = (unsigned char)(((x)>>48)&255);     \
(y)[2] = (unsigned char)(((x)>>40)&255); (y)[3] = (unsigned char)(((x)>>32)&255);     \
(y)[4] = (unsigned char)(((x)>>24)&255); (y)[5] = (unsigned char)(((x)>>16)&255);     \
(y)[6] = (unsigned char)(((x)>>8)&255); (y)[7] = (unsigned char)((x)&255); }



#define CC_XQSORT(base, nelement, width, comparfunc) qsort((base), (nelement), (width), (comparfunc))

#define CC_XALIGNED(PTR,NBYTE) (!(((size_t)(PTR))%(NBYTE)))

#define CC_XMIN(X,Y) (((X) < (Y)) ? (X): (Y))
#endif



#endif /* ccMemory_eth_h */
