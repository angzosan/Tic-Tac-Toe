*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_MULTI_PLAYER_DEM
*&---------------------------------------------------------------------*


FORM multiplayer_ondemand.

  PERFORM count_occurances.

  PERFORM check_result.
  IF done EQ abap_true.
    PERFORM empty_cells.
    EXIT.
  ENDIF.

  IF count_x NE count_o.
*  CALL FUNCTION 'SO_DOCUMENT_SEND_API1'
  ENDIF.



ENDFORM.
