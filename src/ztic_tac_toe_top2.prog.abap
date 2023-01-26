*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_TOP
*&---------------------------------------------------------------------*
DATA: moves TYPE i VALUE 0.
DATA: done TYPE boolean VALUE abap_false.
DATA: max TYPE i VALUE 0.
DATA: count_x TYPE i VALUE 0.
DATA: count_o TYPE i VALUE 0.

  data mode type abap_bool VALUE abap_true.

" DECLARE STRUCTURE
*DATA: p_1(20) TYPE c VALUE 'l',
*      p_2(20) TYPE c VALUE 'i',
*      p_3(20) TYPE c VALUE 'u',
*      p_4(20) TYPE c VALUE 'y',
*      p_5(20) TYPE c VALUE 't',
*      p_6(20) TYPE c VALUE 'r',
*      p_7(20) TYPE c VALUE 'e',
*      p_8(20) TYPE c VALUE 'w',
*      p_9(20) TYPE c VALUE 'q'.

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
