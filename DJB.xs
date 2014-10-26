#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define UCHAR unsigned char

size_t
do_hash(const UCHAR* message)
{
    size_t hash = 5381;
    UCHAR c;

    while (c = *message++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
}

MODULE = Digest::DJB		PACKAGE = Digest::DJB		

size_t
djb(msg)
        SV* msg
    PROTOTYPE: $
    CODE:
        RETVAL = do_hash(SvPV_nolen(msg));
    OUTPUT:
        RETVAL
