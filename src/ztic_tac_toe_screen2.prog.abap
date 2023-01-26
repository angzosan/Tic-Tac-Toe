*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_SCREEN
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK bl1.
  PARAMETERS: P_radio1 RADIOBUTTON GROUP RAD1 DEFAULT 'X',
              P_radio2 RADIOBUTTON GROUP RAD1,
              P_radio3 RADIOBUTTON GROUP RAD1.

SELECTION-SCREEN END OF block bl1.

SELECTION-SCREEN BEGIN OF LINE.
  PARAMETERS: p1(20) TYPE c DEFAULT '',
              p2(20) TYPE c DEFAULT '',
              p3(20) TYPE c DEFAULT ''.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
  PARAMETERS: p4(20) TYPE c DEFAULT '',
              p5(20) TYPE c DEFAULT '',
              p6(20) TYPE c DEFAULT ''.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
  PARAMETERS: p7(20) TYPE c DEFAULT '',
              p8(20) TYPE c DEFAULT '',
              p9(20) TYPE c DEFAULT ''.
SELECTION-SCREEN END OF LINE.
