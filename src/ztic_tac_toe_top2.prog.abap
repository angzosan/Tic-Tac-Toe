*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_TOP
*&---------------------------------------------------------------------*
*DATA: moves TYPE i VALUE 0.
*DATA: max TYPE i VALUE 0.
*DATA: count_x TYPE i VALUE 0.
*DATA: count_o TYPE i VALUE 0.


DATA(moves) = 0.
DATA(max) = 0.
DATA(count_x) = 0.
DATA(count_o) = 0.


DATA: total TYPE i.
DATA: total_prev TYPE i.

DATA: player1 TYPE char50.
DATA: player2 TYPE char50.



DATA: done TYPE boolean VALUE abap_false.
DATA: mode TYPE abap_bool VALUE abap_true.
DATA: retrieve TYPE abap_bool VALUE abap_false.


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

DATA: wa_max TYPE max.
