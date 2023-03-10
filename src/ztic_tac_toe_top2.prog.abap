*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_TOP
*&---------------------------------------------------------------------*
DATA: moves TYPE i VALUE 0.
DATA: done TYPE boolean VALUE abap_false.
DATA: max TYPE i VALUE 0.
DATA: count_x TYPE i VALUE 0.
DATA: count_o TYPE i VALUE 0.

data: total type i.

data: player1 type char50.
data: player2 type char50.

data: total_prev type i.

data: mode type abap_bool VALUE abap_true.
data: retrieve type abap_bool value abap_false.


DATA: col1 TYPE i VALUE 0,
      col2 TYPE i VALUE 0,
      col3 TYPE i VALUE 0,
      row1 TYPE i VALUE 0,
      row2 TYPE i VALUE 0,
      row3 TYPE i VALUE 0,
      dia1 TYPE i VALUE 0,
      dia2 TYPE i VALUE 0.

TYPES: BEGIN OF max,   " DECLARE STRUCTURE
         value         TYPE i,
         placement(50) TYPE c,
       END OF max,
       tt_max TYPE STANDARD TABLE OF max.  " DATA TYPE
DATA: lt_max TYPE tt_max.

data: wa_max type max.
