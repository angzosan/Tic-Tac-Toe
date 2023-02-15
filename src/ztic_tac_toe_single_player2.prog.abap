*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_SINGLE_PLAYER
*&---------------------------------------------------------------------*

FORM singleplayer.

  if mode ne abap_true.
    perform empty_cells.
    ENDIF.
  CASE p1.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.

  CASE p2.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p3.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p4.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p5.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p6.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p7.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p8.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  CASE p9.
    WHEN 'X'.
      PERFORM action.
      moves = moves + 1.
      screen-input = '0'.
  ENDCASE.


  PERFORM check_result.
  IF done EQ abap_true.
    PERFORM empty_cells.
    done = abap_false.
  ENDIF.

ENDFORM.
