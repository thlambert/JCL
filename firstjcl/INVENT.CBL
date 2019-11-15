       IDENTIFICATION DIVISION.
       PROGRAM-ID. INVENT.
       AUTHOR. MOHAN GILL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANS-FILE ASSIGN TO UT-S-TFILE.
           SELECT MASTER-FILE ASSIGN TO UT-S-DFILE.
      *
       DATA DIVISION.
       FILE SECTION.
      *
       FD  MASTER-FILE
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 54 CHARACTERS
           RECORDING MODE IS F.
      *
       01  MASTER-RECORD.
      *
           05  MR-ITEM-NUM         PIC X(6).
           05  MR-ITEM-DESC        PIC X(28).
           05  MR-QOH              PIC 9(4).
           05  MR-QOO              PIC 9(4).
           05  MR-INV-AMOUNT       PIC 9(5)V99.
           05  MR-YTD-SOLD         PIC 9(5).
      *
       FD  TRANS-FILE
           LABEL RECORDS ARE STANDARD.
      *
       01  SALES-REC.
           05  TR-ITEM-NUM         PIC X(6).
           05  TR-ITEM-DESC        PIC X(28).
           05  TR-QOH              PIC 9(4).
           05  TR-QOO              PIC 9(4).
           05  TR-INV-AMOUNT       PIC 9(5)V99.
           05  TR-YTD-SOLD         PIC 9(5).
      *
       WORKING-STORAGE SECTION.
      *
       01  WS-SWITCHES.
           05  WS-EOF-SWITCH       PIC X(3)  VALUE 'NO'.
           88  EOF                 VALUE 'YES'.
      *
       PROCEDURE DIVISION.
      *
       100-MAINLINE.
           OPEN INPUT TRANS-FILE
                OUTPUT MASTER-FILE.
           PERFORM UNTIL EOF
               READ TRANS-FILE
                   AT END MOVE 'YES' TO WS-EOF-SWITCH
                   NOT AT END
                    PERFORM 200-MOVE-DATA THRU 200-MOVE-DATA-EXIT
               END-READ
           END-PERFORM
           CLOSE TRANS-FILE
           MASTER-FILE.
           STOP RUN.
      *
       200-MOVE-DATA.
      *
           MOVE TR-ITEM-NUM  TO MR-ITEM-NUM.
           MOVE TR-ITEM-DESC TO MR-ITEM-DESC.
           MOVE TR-QOH   TO MR-QOH.
           MOVE TR-QOO     TO MR-QOO.
           MOVE TR-INV-AMOUNT TO MR-INV-AMOUNT.
           MOVE TR-YTD-SOLD   TO MR-YTD-SOLD.
           WRITE MASTER-RECORD.
      *
       200-MOVE-DATA-EXIT. EXIT.
