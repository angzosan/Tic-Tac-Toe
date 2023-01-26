*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_FORMS
*&---------------------------------------------------------------------*
FORM action.
  PERFORM count.
  PERFORM find_max_point.
  PERFORM count_occurances.
  PERFORM make_move.
ENDFORM.



FORM make_move.

  PERFORM sort.

  DATA counter TYPE i.
  counter = 1.
  DO 7 TIMES.
    IF count_x > count_o.
      IF max <= col1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
          exit.
        ELSEIF p4 NE 'X' AND p4 NE 'O'.
          p4 = 'O'.
           exit.
        ELSEIF p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.
      ELSEIF max <= col2.
        IF  p2 NE 'X' AND p2 NE 'O'.
          p2 = 'O'.
           exit.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
           exit.
        ELSEIF p8 NE 'X' AND p8 NE 'O'.
          p8 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= col3.
        IF  p3 NE 'X' AND p3 NE 'O'.
          p3 = 'O'.
           exit.
        ELSEIF p6 NE 'X' AND p6 NE 'O'.
          p6 = 'O'.
           exit.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= row1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
           exit.
        ELSEIF p2 NE 'X' AND p2 NE 'O'.
          p2 = 'O'.
           exit.
        ELSEIF p3 NE 'X' AND p3 NE 'O'.
          p3 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= row2.
        IF  p4 NE 'X' AND p4 NE 'O'.
          p4 = 'O'.
           exit.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
           exit.
        ELSEIF p6 NE 'X' AND p6 NE 'O'.
          p6 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= row3.
        IF  p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
           exit.
        ELSEIF p8 NE 'X' AND p8 NE 'O'.
          p8 = 'O'.
           exit.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= dia1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
           exit.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
           exit.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max <= dia2.
        IF  p3 NE 'X' AND p3 NE 'O'.
          p1 = 'O'.
           exit.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
           exit.
        ELSEIF p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
           exit.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.
      ENDIF.
      COUNTER = COUNTER + 1.
    ENDIF.
  ENDDO.

ENDFORM.

FORM check_result.

  IF  p1 EQ p2 and p1 ne '' .
    IF p1 EQ p3.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p1 EQ p4 and p1 ne ''.
    IF p1 EQ p7.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p1 EQ p5 and p1 ne ''.
    IF p1 EQ p9.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p2 EQ p5 and p2 ne ''.
    IF p2 EQ p8.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p3 EQ p5 and p3 ne ''.
    IF p3 EQ p7.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p3 EQ p6 and p3 ne ''.
    IF p3 EQ p9.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p9 EQ p7 and p9 ne ''.
    IF p7 EQ p8.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p4 EQ p5 and p4 ne ''.
    IF p4 EQ p6.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.
ENDFORM.

FORM empty_cells.
  p1 = ''.
  p2 = ''.
  p3 = ''.
  p4 = ''.
  p5 = ''.
  p6 = ''.
  p7 = ''.
  p8 = ''.
  p9 = ''.

*  p_1 = 'l'.
*  p_2 = 'i'.
*  p_3 = 'u'.
*  p_4 = 'y'.
*  p_5 = 't'.
*  p_6 = 'r'.
*  p_7 = 'e'.
*  p_8 = 'w'.
*  p_9 = 'q'.

ENDFORM.

FORM count.
  IF p1 = 'X' OR p2 = 'X'.
    IF p1 = 'X'.
      row1 = row1 + 1.
      col1 = col1 + 1.
      dia1 = dia1 + 1.
    ENDIF.
    IF p2 = 'X'.
      row1 = row1 + 1.
      col2 = col2 + 1.
    ENDIF.
  ENDIF.
  IF p3 = 'X' OR p4 = 'X'.
    IF p3 = 'X'.
      row1 = row1 + 1.
      col3 = col3 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p4 = 'X'.
      row2 = row2 + 1.
      col1 = col1 + 1.
    ENDIF.
  ENDIF.
  IF p5 = 'X' OR p6 = 'X'.
    IF p5 = 'X'.
      row2 = row2 + 1.
      col2 = col2 + 1.
      dia1 = dia1 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p6 = 'X'.
      row2 = row2 + 1.
      col3 = col3 + 1.
    ENDIF.
  ENDIF.
  IF p7 = 'X' OR p8 = 'X'.
    IF p7 = 'X'.
      row3 = row3 + 1.
      col1 = col1 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p8 = 'X'.
      row3 = row3 + 1.
      col2 = col2 + 1.
    ENDIF.
  ENDIF.
  IF p9 = 'X'.
    row3 = row3 + 1.
    col3 = col3 + 1.
    dia1 = dia1 + 1.
  ENDIF.
ENDFORM.

FORM find_max_point.

  max = 0.

  IF col1 > max.
    max = col1.
  ENDIF.
  IF col2 > max.
    max = col2.
  ENDIF.
  IF col3 > max.
    max = col3.
  ENDIF.
  IF row1 > max.
    max = row1.
  ENDIF.
  IF row2 > max.
    max = row2.
  ENDIF.
  IF row3 > max.
    max = row3.
  ENDIF.
  IF dia1 > max.
    max = dia1.
  ENDIF.
  IF dia2 > max.
    max = dia2.
  ENDIF.
ENDFORM.

FORM count_occurances.

  count_x = 0.
  count_o = 0.

  IF p1 = 'X'.
    count_x = count_x + 1.
  ELSEIF p1 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p2 = 'X'.
    count_x = count_x + 1.
  ELSEIF p2 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p3 = 'X'.
    count_x = count_x + 1.
  ELSEIF p3 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p4 = 'X'.
    count_x = count_x + 1.
  ELSEIF p4 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p5 = 'X'.
    count_x = count_x + 1.
  ELSEIF p5 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p6 = 'X'.
    count_x = count_x + 1.
  ELSEIF p6 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p7 = 'X'.
    count_x = count_x + 1.
  ELSEIF p7 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p8 = 'X'.
    count_x = count_x + 1.
  ELSEIF p8 = 'O'.
    count_o = count_o + 1.
  ENDIF.
  IF p9 = 'X'.
    count_x = count_x + 1.
  ELSEIF p9 = 'O'.
    count_o = count_o + 1.
  ENDIF.
ENDFORM.

FORM find_next_max USING index .
  DATA: dif TYPE i.

  READ TABLE lt_max INDEX index INTO wa_max.

  IF wa_max-placement = 'col1'.
    max = col1.
  ELSEIF wa_max-placement = 'col2'.
    max = col2.
  ELSEIF wa_max-placement = 'col3'.
    max = col3.
  ELSEIF wa_max-placement = 'row1'.
    max = row1.
  ELSEIF wa_max-placement = 'row2'.
    max = row2.
  ELSEIF wa_max-placement = 'row3'.
    max = row3.
  ELSEIF wa_max-placement = 'dia1'.
    max = dia1.
  ELSEIF wa_max-placement = 'dia2'.
    max = dia2.
  ENDIF.

ENDFORM.

FORM sort.

CLEAR LT_MAX.
  data counter type i.
  counter = 1.
  wa_max-value = col1.
  wa_max-placement = 'col1' .

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = col2.
  wa_max-placement = 'col2'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = col3.
  wa_max-placement = 'col3'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = row1.
  wa_max-placement = 'row1'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = row2.
  wa_max-placement = 'row2'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = row3.
  wa_max-placement = 'row3'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = dia1.
  wa_max-placement = 'dia1'.

  INSERT wa_max INTO lt_max INDEX counter.

  counter = counter + 1.

  wa_max-value = dia2.
  wa_max-placement = 'dia2'.

  INSERT wa_max INTO lt_max INDEX counter.


  SORT lt_max BY value DESCENDING.
ENDFORM.
