      DOUBLE PRECISION FUNCTION DLUM()
      IMPLICIT NONE
      INCLUDE 'timing_variables.inc'
      INTEGER NFKSPROCESS
      COMMON/C_NFKSPROCESS/NFKSPROCESS
      CALL CPU_TIME(TBEFORE)
      CALL DLUM_0(DLUM)
      CALL CPU_TIME(TAFTER)
      TPDF = TPDF + (TAFTER-TBEFORE)
      RETURN
      END

