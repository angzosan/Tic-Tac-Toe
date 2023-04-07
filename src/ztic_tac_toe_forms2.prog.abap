*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_FORMS
*&---------------------------------------------------------------------*
FORM action.
  PERFORM check_winning.
  PERFORM count USING 'X'.
  PERFORM find_max_point.
  PERFORM count_occurances.
  PERFORM make_move.
ENDFORM.

FORM check_winning.

  IF  p1 EQ 'O'.
    IF p4 EQ 'O' AND p7 NE 'X'.
      p7 = 'O'.
      EXIT.
    ELSEIF p7 EQ 'O' AND p4 NE 'X'.
      p4 = 'O'.
      EXIT.


    ELSEIF p5 EQ 'O' AND p9 NE 'X'.
      p9 = 'O'.
      EXIT.
    ELSEIF p9 EQ 'O' AND p5 NE 'X'.
      p5 = 'O'.
      EXIT.


    ELSEIF p2 EQ 'O' AND p3 NE 'X' .
      p3 = 'O'.
      EXIT.
    ELSEIF p3 EQ 'O' AND p2 NE 'X'.
      p2 = 'O'.
      EXIT.
    ENDIF.

  ELSEIF p9 EQ 'O'.
    IF p3 EQ 'O' AND p6 NE 'X'.
      p6 = 'O'.
      EXIT.
    ELSEIF p6 EQ 'O' AND p3 NE 'X'.
      p3 = 'O'.
      EXIT.


    ELSEIF p7 EQ 'O' AND p8 NE 'X'.
      p8 = 'O'.
      EXIT.
    ELSEIF p8 EQ 'O' AND p7 NE 'X'.
      p7 = 'O'.
      EXIT.
*    ELSEIF p1 EQ 'O' AND p5 NE 'X' .
*      p5= 'O'.
*      EXIT.
    ELSEIF p5 EQ 'O' AND p1 NE 'X'.
      p2 = 'O'.
      EXIT.
    ENDIF.


  ELSEIF p3 EQ 'O'.
*    IF p9 EQ 'O' AND p6 NE 'X'.
*      p6 = 'O'.
*      EXIT.
*    ELSE
    IF p2 EQ 'O' AND p1 NE 'X'.
      p1 = 'O'.
      EXIT.
    ELSEIF p7 EQ 'O' AND p5 NE 'X'.
      p5 = 'O'.
      EXIT.
    ELSEIF p5 EQ 'O' AND p7 NE 'X'.
      p7 = 'O'.
      EXIT.
*    ELSEIF p1 EQ 'O' AND p5 NE 'X' .
*      p5= 'O'.
*      EXIT.
*    ELSEIF p5 EQ 'O' AND p1 NE 'X'.
*      p2 = 'O'.
*      EXIT.
    ENDIF.


  ELSEIF p7 EQ 'O'.
*    IF p9 EQ 'O' AND p6 NE 'X'.
*      p6 = 'O'.
*      EXIT.
*    ELSE
    IF p4 EQ 'O' AND p1 NE 'X'.
      p1 = 'O'.
      EXIT.
    ELSEIF p8 EQ 'O' AND p9 NE 'X'.
      p9 = 'O'.
      EXIT.
    ELSEIF p5 EQ 'O' AND p3 NE 'X'.
      p3 = 'O'.
      EXIT.
*    ELSEIF p1 EQ 'O' AND p5 NE 'X' .
*      p5= 'O'.
*      EXIT.
*    ELSEIF p5 EQ 'O' AND p1 NE 'X'.
*      p2 = 'O'.
*      EXIT.
    ENDIF.

  ENDIF.

ENDFORM.

FORM make_move.

  PERFORM sort.

  DATA counter TYPE i.
  counter = 1.
  DO 7 TIMES.
    IF count_x > count_o.
      IF max = col1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
          EXIT.
        ELSEIF p4 NE 'X' AND p4 NE 'O'.
          p4 = 'O'.
          EXIT.
        ELSEIF p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.
      ELSEIF max = col2.
        IF  p2 NE 'X' AND p2 NE 'O'.
          p2 = 'O'.
          EXIT.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
          EXIT.
        ELSEIF p8 NE 'X' AND p8 NE 'O'.
          p8 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = col3.
        IF  p3 NE 'X' AND p3 NE 'O'.
          p3 = 'O'.
          EXIT.
        ELSEIF p6 NE 'X' AND p6 NE 'O'.
          p6 = 'O'.
          EXIT.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = row1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
          EXIT.
        ELSEIF p2 NE 'X' AND p2 NE 'O'.
          p2 = 'O'.
          EXIT.
        ELSEIF p3 NE 'X' AND p3 NE 'O'.
          p3 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = row2.
        IF  p4 NE 'X' AND p4 NE 'O'.
          p4 = 'O'.
          EXIT.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
          EXIT.
        ELSEIF p6 NE 'X' AND p6 NE 'O'.
          p6 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = row3.
        IF  p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
          EXIT.
        ELSEIF p8 NE 'X' AND p8 NE 'O'.
          p8 = 'O'.
          EXIT.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = dia1.
        IF  p1 NE 'X' AND p1 NE 'O'.
          p1 = 'O'.
          EXIT.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
          EXIT.
        ELSEIF p9 NE 'X' AND p9 NE 'O'.
          p9 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.

      ELSEIF max = dia2.
        IF  p3 NE 'X' AND p3 NE 'O'.
          p3 = 'O'.
          EXIT.
        ELSEIF p5 NE 'X' AND p5 NE 'O'.
          p5 = 'O'.
          EXIT.
        ELSEIF p7 NE 'X' AND p7 NE 'O'.
          p7 = 'O'.
          EXIT.
        ELSE .
          PERFORM find_next_max USING counter.
        ENDIF.
      ENDIF.
      counter = counter + 1.
    ENDIF.
  ENDDO.

ENDFORM.

FORM check_result.

  IF  p1 EQ p2 AND p1 NE '' .
    IF p1 EQ p3.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p1 EQ p4 AND p1 NE ''.
    IF p1 EQ p7.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p1 EQ p5 AND p1 NE ''.
    IF p1 EQ p9.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p2 EQ p5 AND p2 NE ''.
    IF p2 EQ p8.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p3 EQ p5 AND p3 NE ''.
    IF p3 EQ p7.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p3 EQ p6 AND p3 NE ''.
    IF p3 EQ p9.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p9 EQ p7 AND p9 NE ''.
    IF p7 EQ p8.
      MESSAGE 'We have a winner' TYPE 'I'.
      done = abap_true.
    ENDIF.
  ENDIF.

  IF p4 EQ p5 AND p4 NE ''.
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
ENDFORM.

FORM count USING move.
  row1 = 0.
  row2 = 0.
  row3 = 0.
  col1 = 0.
  col2 = 0.
  col3 = 0.
  dia1 = 0.
  dia2 = 0.
  IF p1 = move OR p2 = move.
    IF p1 = move.
      row1 = row1 + 1.
      col1 = col1 + 1.
      dia1 = dia1 + 1.
    ENDIF.
    IF p2 = move.
      row1 = row1 + 1.
      col2 = col2 + 1.
    ENDIF.
  ENDIF.
  IF p3 = move OR p4 = move.
    IF p3 = move.
      row1 = row1 + 1.
      col3 = col3 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p4 = move.
      row2 = row2 + 1.
      col1 = col1 + 1.
    ENDIF.
  ENDIF.
  IF p5 = move OR p6 = move.
    IF p5 = move.
      row2 = row2 + 1.
      col2 = col2 + 1.
      dia1 = dia1 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p6 = move.
      row2 = row2 + 1.
      col3 = col3 + 1.
    ENDIF.
  ENDIF.
  IF p7 = move OR p8 = move.
    IF p7 = move.
      row3 = row3 + 1.
      col1 = col1 + 1.
      dia2 = dia2 + 1.
    ENDIF.
    IF p8 = move.
      row3 = row3 + 1.
      col2 = col2 + 1.
    ENDIF.
  ENDIF.
  IF p9 = move.
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

  CLEAR lt_max.
  DATA counter TYPE i.
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

FORM check_input CHANGING input.
  IF p1 NE 'X' AND p1 NE 'O' AND p1 NE ''.
    input = abap_false.
    p1 = ''.
    RETURN.
  ENDIF.

  IF p2 NE 'X' AND p2 NE 'O' AND p2 NE ''.
    input = abap_false.
     p2 = ''.
    RETURN.
  ENDIF.

  IF p3 NE 'X' AND p3 NE 'O' AND p3 NE ''.
    input = abap_false.
     p3 = ''.
    RETURN.
  ENDIF.

  IF p4 NE 'X' AND p4 NE 'O' AND p4 NE ''.
    input = abap_false.
     p4 = ''.
    RETURN.
  ENDIF.

  IF p5 NE 'X' AND p5 NE 'O' AND p5 NE ''.
    input = abap_false.
     p5 = ''.
    RETURN.
  ENDIF.

  IF p6 NE 'X' AND p6 NE 'O' AND p6 NE ''.
    input = abap_false.
     p6 = ''.
    RETURN.
  ENDIF.

  IF p7 NE 'X' AND p7 NE 'O' AND p7 NE ''.
    input = abap_false.
     p7 = ''.
    RETURN.
  ENDIF.

  IF p8 NE 'X' AND p8 NE 'O' AND p8 NE ''.
    input = abap_false.
     p8 = ''.
    RETURN.
  ENDIF.

  IF p9 NE 'X' AND p9 NE 'O' AND p9 NE ''.
    input = abap_false.
     p9 = ''.
    RETURN.
  ENDIF.
ENDFORM.
