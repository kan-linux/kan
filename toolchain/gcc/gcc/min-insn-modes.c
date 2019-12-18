/* Generated automatically from machmode.def and config/i386/i386-modes.def
   by genmodes.  */

#include "bconfig.h"
#include "system.h"
#include "machmode.h"

const char *const mode_name[NUM_MACHINE_MODES] =
{
  "VOID",
  "BLK",
  "CC",
  "CCGC",
  "CCGOC",
  "CCNO",
  "CCA",
  "CCC",
  "CCO",
  "CCP",
  "CCS",
  "CCZ",
  "CCFP",
  "CCFPU",
  "BI",
  "QI",
  "HI",
  "SI",
  "DI",
  "TI",
  "OI",
  "XI",
  "BND32",
  "BND64",
  "QQ",
  "HQ",
  "SQ",
  "DQ",
  "TQ",
  "UQQ",
  "UHQ",
  "USQ",
  "UDQ",
  "UTQ",
  "HA",
  "SA",
  "DA",
  "TA",
  "UHA",
  "USA",
  "UDA",
  "UTA",
  "SF",
  "DF",
  "XF",
  "TF",
  "SD",
  "DD",
  "TD",
  "CQI",
  "CHI",
  "CSI",
  "CDI",
  "CTI",
  "COI",
  "CXI",
  "SC",
  "DC",
  "XC",
  "TC",
  "V2QI",
  "V4QI",
  "V2HI",
  "V1SI",
  "V8QI",
  "V4HI",
  "V2SI",
  "V1DI",
  "V12QI",
  "V6HI",
  "V14QI",
  "V16QI",
  "V8HI",
  "V4SI",
  "V2DI",
  "V1TI",
  "V32QI",
  "V16HI",
  "V8SI",
  "V4DI",
  "V2TI",
  "V64QI",
  "V32HI",
  "V16SI",
  "V8DI",
  "V4TI",
  "V128QI",
  "V64HI",
  "V32SI",
  "V16DI",
  "V8TI",
  "V2SF",
  "V4SF",
  "V2DF",
  "V8SF",
  "V4DF",
  "V2TF",
  "V16SF",
  "V8DF",
  "V4TF",
  "V32SF",
  "V16DF",
  "V8TF",
};

const unsigned char mode_class[NUM_MACHINE_MODES] =
{
  MODE_RANDOM,             /* VOID */
  MODE_RANDOM,             /* BLK */
  MODE_CC,                 /* CC */
  MODE_CC,                 /* CCGC */
  MODE_CC,                 /* CCGOC */
  MODE_CC,                 /* CCNO */
  MODE_CC,                 /* CCA */
  MODE_CC,                 /* CCC */
  MODE_CC,                 /* CCO */
  MODE_CC,                 /* CCP */
  MODE_CC,                 /* CCS */
  MODE_CC,                 /* CCZ */
  MODE_CC,                 /* CCFP */
  MODE_CC,                 /* CCFPU */
  MODE_INT,                /* BI */
  MODE_INT,                /* QI */
  MODE_INT,                /* HI */
  MODE_INT,                /* SI */
  MODE_INT,                /* DI */
  MODE_INT,                /* TI */
  MODE_INT,                /* OI */
  MODE_INT,                /* XI */
  MODE_POINTER_BOUNDS,     /* BND32 */
  MODE_POINTER_BOUNDS,     /* BND64 */
  MODE_FRACT,              /* QQ */
  MODE_FRACT,              /* HQ */
  MODE_FRACT,              /* SQ */
  MODE_FRACT,              /* DQ */
  MODE_FRACT,              /* TQ */
  MODE_UFRACT,             /* UQQ */
  MODE_UFRACT,             /* UHQ */
  MODE_UFRACT,             /* USQ */
  MODE_UFRACT,             /* UDQ */
  MODE_UFRACT,             /* UTQ */
  MODE_ACCUM,              /* HA */
  MODE_ACCUM,              /* SA */
  MODE_ACCUM,              /* DA */
  MODE_ACCUM,              /* TA */
  MODE_UACCUM,             /* UHA */
  MODE_UACCUM,             /* USA */
  MODE_UACCUM,             /* UDA */
  MODE_UACCUM,             /* UTA */
  MODE_FLOAT,              /* SF */
  MODE_FLOAT,              /* DF */
  MODE_FLOAT,              /* XF */
  MODE_FLOAT,              /* TF */
  MODE_DECIMAL_FLOAT,      /* SD */
  MODE_DECIMAL_FLOAT,      /* DD */
  MODE_DECIMAL_FLOAT,      /* TD */
  MODE_COMPLEX_INT,        /* CQI */
  MODE_COMPLEX_INT,        /* CHI */
  MODE_COMPLEX_INT,        /* CSI */
  MODE_COMPLEX_INT,        /* CDI */
  MODE_COMPLEX_INT,        /* CTI */
  MODE_COMPLEX_INT,        /* COI */
  MODE_COMPLEX_INT,        /* CXI */
  MODE_COMPLEX_FLOAT,      /* SC */
  MODE_COMPLEX_FLOAT,      /* DC */
  MODE_COMPLEX_FLOAT,      /* XC */
  MODE_COMPLEX_FLOAT,      /* TC */
  MODE_VECTOR_INT,         /* V2QI */
  MODE_VECTOR_INT,         /* V4QI */
  MODE_VECTOR_INT,         /* V2HI */
  MODE_VECTOR_INT,         /* V1SI */
  MODE_VECTOR_INT,         /* V8QI */
  MODE_VECTOR_INT,         /* V4HI */
  MODE_VECTOR_INT,         /* V2SI */
  MODE_VECTOR_INT,         /* V1DI */
  MODE_VECTOR_INT,         /* V12QI */
  MODE_VECTOR_INT,         /* V6HI */
  MODE_VECTOR_INT,         /* V14QI */
  MODE_VECTOR_INT,         /* V16QI */
  MODE_VECTOR_INT,         /* V8HI */
  MODE_VECTOR_INT,         /* V4SI */
  MODE_VECTOR_INT,         /* V2DI */
  MODE_VECTOR_INT,         /* V1TI */
  MODE_VECTOR_INT,         /* V32QI */
  MODE_VECTOR_INT,         /* V16HI */
  MODE_VECTOR_INT,         /* V8SI */
  MODE_VECTOR_INT,         /* V4DI */
  MODE_VECTOR_INT,         /* V2TI */
  MODE_VECTOR_INT,         /* V64QI */
  MODE_VECTOR_INT,         /* V32HI */
  MODE_VECTOR_INT,         /* V16SI */
  MODE_VECTOR_INT,         /* V8DI */
  MODE_VECTOR_INT,         /* V4TI */
  MODE_VECTOR_INT,         /* V128QI */
  MODE_VECTOR_INT,         /* V64HI */
  MODE_VECTOR_INT,         /* V32SI */
  MODE_VECTOR_INT,         /* V16DI */
  MODE_VECTOR_INT,         /* V8TI */
  MODE_VECTOR_FLOAT,       /* V2SF */
  MODE_VECTOR_FLOAT,       /* V4SF */
  MODE_VECTOR_FLOAT,       /* V2DF */
  MODE_VECTOR_FLOAT,       /* V8SF */
  MODE_VECTOR_FLOAT,       /* V4DF */
  MODE_VECTOR_FLOAT,       /* V2TF */
  MODE_VECTOR_FLOAT,       /* V16SF */
  MODE_VECTOR_FLOAT,       /* V8DF */
  MODE_VECTOR_FLOAT,       /* V4TF */
  MODE_VECTOR_FLOAT,       /* V32SF */
  MODE_VECTOR_FLOAT,       /* V16DF */
  MODE_VECTOR_FLOAT,       /* V8TF */
};

const unsigned char mode_wider[NUM_MACHINE_MODES] =
{
  VOIDmode,                /* VOID */
  VOIDmode,                /* BLK */
  VOIDmode,                /* CC */
  VOIDmode,                /* CCGC */
  VOIDmode,                /* CCGOC */
  VOIDmode,                /* CCNO */
  VOIDmode,                /* CCA */
  VOIDmode,                /* CCC */
  VOIDmode,                /* CCO */
  VOIDmode,                /* CCP */
  VOIDmode,                /* CCS */
  VOIDmode,                /* CCZ */
  VOIDmode,                /* CCFP */
  VOIDmode,                /* CCFPU */
  QImode,                  /* BI */
  HImode,                  /* QI */
  SImode,                  /* HI */
  DImode,                  /* SI */
  TImode,                  /* DI */
  OImode,                  /* TI */
  XImode,                  /* OI */
  VOIDmode,                /* XI */
  BND64mode,               /* BND32 */
  VOIDmode,                /* BND64 */
  HQmode,                  /* QQ */
  SQmode,                  /* HQ */
  DQmode,                  /* SQ */
  TQmode,                  /* DQ */
  VOIDmode,                /* TQ */
  UHQmode,                 /* UQQ */
  USQmode,                 /* UHQ */
  UDQmode,                 /* USQ */
  UTQmode,                 /* UDQ */
  VOIDmode,                /* UTQ */
  SAmode,                  /* HA */
  DAmode,                  /* SA */
  TAmode,                  /* DA */
  VOIDmode,                /* TA */
  USAmode,                 /* UHA */
  UDAmode,                 /* USA */
  UTAmode,                 /* UDA */
  VOIDmode,                /* UTA */
  DFmode,                  /* SF */
  XFmode,                  /* DF */
  TFmode,                  /* XF */
  VOIDmode,                /* TF */
  DDmode,                  /* SD */
  TDmode,                  /* DD */
  VOIDmode,                /* TD */
  CHImode,                 /* CQI */
  CSImode,                 /* CHI */
  CDImode,                 /* CSI */
  CTImode,                 /* CDI */
  COImode,                 /* CTI */
  CXImode,                 /* COI */
  VOIDmode,                /* CXI */
  DCmode,                  /* SC */
  XCmode,                  /* DC */
  TCmode,                  /* XC */
  VOIDmode,                /* TC */
  V4QImode,                /* V2QI */
  V2HImode,                /* V4QI */
  V1SImode,                /* V2HI */
  V8QImode,                /* V1SI */
  V4HImode,                /* V8QI */
  V2SImode,                /* V4HI */
  V1DImode,                /* V2SI */
  V12QImode,               /* V1DI */
  V6HImode,                /* V12QI */
  V14QImode,               /* V6HI */
  V16QImode,               /* V14QI */
  V8HImode,                /* V16QI */
  V4SImode,                /* V8HI */
  V2DImode,                /* V4SI */
  V1TImode,                /* V2DI */
  V32QImode,               /* V1TI */
  V16HImode,               /* V32QI */
  V8SImode,                /* V16HI */
  V4DImode,                /* V8SI */
  V2TImode,                /* V4DI */
  V64QImode,               /* V2TI */
  V32HImode,               /* V64QI */
  V16SImode,               /* V32HI */
  V8DImode,                /* V16SI */
  V4TImode,                /* V8DI */
  V128QImode,              /* V4TI */
  V64HImode,               /* V128QI */
  V32SImode,               /* V64HI */
  V16DImode,               /* V32SI */
  V8TImode,                /* V16DI */
  VOIDmode,                /* V8TI */
  V4SFmode,                /* V2SF */
  V2DFmode,                /* V4SF */
  V8SFmode,                /* V2DF */
  V4DFmode,                /* V8SF */
  V2TFmode,                /* V4DF */
  V16SFmode,               /* V2TF */
  V8DFmode,                /* V16SF */
  V4TFmode,                /* V8DF */
  V32SFmode,               /* V4TF */
  V16DFmode,               /* V32SF */
  V8TFmode,                /* V16DF */
  VOIDmode,                /* V8TF */
};

const unsigned char mode_2xwider[NUM_MACHINE_MODES] =
{
  VOIDmode,                /* VOID */
  BLKmode,                 /* BLK */
  VOIDmode,                /* CC */
  VOIDmode,                /* CCGC */
  VOIDmode,                /* CCGOC */
  VOIDmode,                /* CCNO */
  VOIDmode,                /* CCA */
  VOIDmode,                /* CCC */
  VOIDmode,                /* CCO */
  VOIDmode,                /* CCP */
  VOIDmode,                /* CCS */
  VOIDmode,                /* CCZ */
  VOIDmode,                /* CCFP */
  VOIDmode,                /* CCFPU */
  VOIDmode,                /* BI */
  HImode,                  /* QI */
  SImode,                  /* HI */
  DImode,                  /* SI */
  TImode,                  /* DI */
  OImode,                  /* TI */
  XImode,                  /* OI */
  VOIDmode,                /* XI */
  BND64mode,               /* BND32 */
  VOIDmode,                /* BND64 */
  HQmode,                  /* QQ */
  SQmode,                  /* HQ */
  DQmode,                  /* SQ */
  TQmode,                  /* DQ */
  VOIDmode,                /* TQ */
  UHQmode,                 /* UQQ */
  USQmode,                 /* UHQ */
  UDQmode,                 /* USQ */
  UTQmode,                 /* UDQ */
  VOIDmode,                /* UTQ */
  SAmode,                  /* HA */
  DAmode,                  /* SA */
  TAmode,                  /* DA */
  VOIDmode,                /* TA */
  USAmode,                 /* UHA */
  UDAmode,                 /* USA */
  UTAmode,                 /* UDA */
  VOIDmode,                /* UTA */
  DFmode,                  /* SF */
  TFmode,                  /* DF */
  VOIDmode,                /* XF */
  VOIDmode,                /* TF */
  DDmode,                  /* SD */
  TDmode,                  /* DD */
  VOIDmode,                /* TD */
  CHImode,                 /* CQI */
  CSImode,                 /* CHI */
  CDImode,                 /* CSI */
  CTImode,                 /* CDI */
  COImode,                 /* CTI */
  CXImode,                 /* COI */
  VOIDmode,                /* CXI */
  DCmode,                  /* SC */
  TCmode,                  /* DC */
  VOIDmode,                /* XC */
  VOIDmode,                /* TC */
  V4QImode,                /* V2QI */
  V8QImode,                /* V4QI */
  V4HImode,                /* V2HI */
  V2SImode,                /* V1SI */
  V16QImode,               /* V8QI */
  V8HImode,                /* V4HI */
  V4SImode,                /* V2SI */
  V2DImode,                /* V1DI */
  VOIDmode,                /* V12QI */
  VOIDmode,                /* V6HI */
  VOIDmode,                /* V14QI */
  V32QImode,               /* V16QI */
  V16HImode,               /* V8HI */
  V8SImode,                /* V4SI */
  V4DImode,                /* V2DI */
  V2TImode,                /* V1TI */
  V64QImode,               /* V32QI */
  V32HImode,               /* V16HI */
  V16SImode,               /* V8SI */
  V8DImode,                /* V4DI */
  V4TImode,                /* V2TI */
  V128QImode,              /* V64QI */
  V64HImode,               /* V32HI */
  V32SImode,               /* V16SI */
  V16DImode,               /* V8DI */
  V8TImode,                /* V4TI */
  VOIDmode,                /* V128QI */
  VOIDmode,                /* V64HI */
  VOIDmode,                /* V32SI */
  VOIDmode,                /* V16DI */
  VOIDmode,                /* V8TI */
  V4SFmode,                /* V2SF */
  V8SFmode,                /* V4SF */
  V4DFmode,                /* V2DF */
  V16SFmode,               /* V8SF */
  V8DFmode,                /* V4DF */
  V4TFmode,                /* V2TF */
  V32SFmode,               /* V16SF */
  V16DFmode,               /* V8DF */
  V8TFmode,                /* V4TF */
  VOIDmode,                /* V32SF */
  VOIDmode,                /* V16DF */
  VOIDmode,                /* V8TF */
};

const unsigned char class_narrowest_mode[MAX_MODE_CLASS] =
{
  MIN_MODE_RANDOM,         /* VOID */
  MIN_MODE_CC,             /* CC */
  MIN_MODE_INT,            /* QI */
  MIN_MODE_PARTIAL_INT,    /* VOID */
  MIN_MODE_POINTER_BOUNDS, /* BND32 */
  MIN_MODE_FRACT,          /* QQ */
  MIN_MODE_UFRACT,         /* UQQ */
  MIN_MODE_ACCUM,          /* HA */
  MIN_MODE_UACCUM,         /* UHA */
  MIN_MODE_FLOAT,          /* SF */
  MIN_MODE_DECIMAL_FLOAT,  /* SD */
  MIN_MODE_COMPLEX_INT,    /* CQI */
  MIN_MODE_COMPLEX_FLOAT,  /* SC */
  MIN_MODE_VECTOR_INT,     /* V2QI */
  MIN_MODE_VECTOR_FRACT,   /* VOID */
  MIN_MODE_VECTOR_UFRACT,  /* VOID */
  MIN_MODE_VECTOR_ACCUM,   /* VOID */
  MIN_MODE_VECTOR_UACCUM,  /* VOID */
  MIN_MODE_VECTOR_FLOAT,   /* V2SF */
};
