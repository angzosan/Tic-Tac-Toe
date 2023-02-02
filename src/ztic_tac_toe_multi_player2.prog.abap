*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_MULTI_PLAYER
*&---------------------------------------------------------------------*
FORM multiplayer.
  IF mode EQ abap_true.
    perform empty_cells.
    mode = abap_false.
  ENDIF.

  PERFORM check_result.
  IF done EQ abap_true.
    PERFORM empty_cells.
    mode = abap_true.
    EXIT.
  ENDIF.
ENDFORM.
