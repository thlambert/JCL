//TOM      JOB   'TEST JCL',LAMBERT,CLASS=B
//DOSTUFF  EXEC  PGM=INVENT
//TFILE    DD    DSNAME=TRANS.FILE,DISP=SHR
//DFILE    DD    DSNAME=MASTER.FILE,DISP=(NEW,KEEP,DELETE),
//        DCB=(DSORG=PS,RECFM=FB,LRECL=54),
//        UNIT=SYSDA,SPACE=(TRK,(2,1))
//SYSOUT   DD SYSOUT=A
//