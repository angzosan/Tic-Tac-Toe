*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_SINGLE_PLAYER
*&---------------------------------------------------------------------*

FORM singleplayer.
  DATA(input) = abap_true.
  IF input EQ abap_true.
    PERFORM check_input CHANGING input.
    PERFORM check_result.
    IF done EQ abap_true.
      PERFORM empty_cells.
      done = abap_false.
      EXIT.
    ENDIF.


    IF mode NE abap_true.
      PERFORM empty_cells.
    ENDIF.

    PERFORM count_occurances.

    IF count_x > count_o.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
    ENDIF.


    PERFORM check_result.
    IF done EQ abap_true.
      PERFORM empty_cells.
      done = abap_false.
    ELSEIF count_x = count_o AND count_x = 4.
      MESSAGE 'Looks like a tie.' TYPE 'I'.
      PERFORM empty_cells.
    ENDIF.
  ENDIF.

ENDFORM.
