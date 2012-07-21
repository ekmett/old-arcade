#define IN_STG_CODE 0
#include "Rts.h"
#include "Stg.h"
#ifdef __cplusplus
extern "C" {
#endif
 
extern StgClosure HSMain_zdfhszuMainzuatN_closure;
void hs_Main(void)
{
Capability *cap;
HaskellObj ret;
cap = rts_lock();
cap=rts_evalIO(cap,rts_apply(cap,(HaskellObj)runIO_closure,&HSMain_zdfhszuMainzuatN_closure) ,&ret);
rts_checkSchedStatus("hs_Main",cap);
rts_unlock(cap);
}
static void stginit_export_HSMain_zdfhszuMainzuatN() __attribute__((constructor));
static void stginit_export_HSMain_zdfhszuMainzuatN()
{getStablePtr((StgPtr) &HSMain_zdfhszuMainzuatN_closure);}
#ifdef __cplusplus
}
#endif

