*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_MULTI_PLAYER_DEM
*&---------------------------------------------------------------------*


FORM multiplayer_ondemand.

  if mode = abap_true.
  SELECT * FROM ztic_tac_toe_agz INTO  @DATA(wa_data) WHERE zplayer1 = @sy-uname.
  ENDSELECT.
  IF sy-subrc = 0.
    p1 = wa_data-zp1.
    p2 = wa_data-zp2.
    p3 = wa_data-zp3.
    p4 = wa_data-zp4.
    p5 = wa_data-zp5.
    p6 = wa_data-zp6.
    p7 = wa_data-zp7.
    p8 = wa_data-zp8.
    p9 = wa_data-zp9.

    CASE  p1.
      PERFORM actions.
    CASE  p2.
       PERFORM actions.
    CASE  p3.
       PERFORM actions.
    CASE  p4.
       PERFORM actions.
    CASE  p5.
       PERFORM actions.
    CASE  p6.
       PERFORM actions.
    CASE  p7.
       PERFORM actions.
    CASE  p8.
      PERFORM actions.
    CASE  p9.
       PERFORM actions.

    PERFORM count_occurances.
    IF count_x <> count_o.
      mode = abap_false.
* SEND EMAIL/NOTIFICATION TO THE OTHER PLAYER.
      MESSAGE 'It is gonna be quiet for a bit. I will let you knowwhen you can play again.' TYPE 'I'.
      done = abap_true.

    ENDIF.

    PERFORM check_result.
    IF done EQ abap_true.
      PERFORM empty_cells.
      EXIT.
    ENDIF.

    IF count_x NE count_o.
*  CALL FUNCTION 'SO_DOCUMENT_SEND_API1'
    ENDIF.
  ELSE.

* MESSAGE 'There is no saved information.' TYPE 'I'.

  ENDIF.
  ENDIF.

ENDFORM.
