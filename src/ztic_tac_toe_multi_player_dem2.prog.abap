*&---------------------------------------------------------------------*
*& Include          ZTIC_TAC_TOE_MULTI_PLAYER_DEM
*&---------------------------------------------------------------------*

FORM count_total.
  total = 0.
  IF p1 EQ 'X' OR p1 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p2 EQ 'X' OR p2 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p3 EQ 'X' OR p3 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p4 EQ 'X' OR p4 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p5 EQ 'X' OR p5 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p6 EQ 'X' OR p6 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p7 EQ 'X' OR p7 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p8 EQ 'X' OR p8 EQ 'O'.
    total = total + 1.
  ENDIF.

  IF p9 EQ 'X' OR p9 EQ 'O'.
    total = total + 1.
  ENDIF.

ENDFORM.

FORM multiplayer_ondemand.

  IF retrieve = abap_false.
    SELECT SINGLE * FROM ztic_tac_toe_agz INTO  @DATA(wa_data) WHERE ( zplayer1 = @sy-uname OR zplayer2 = @sy-uname ).
    IF sy-subrc = 0.

      player1 = wa_data-zplayer1.
      player2 = wa_data-zplayer2.
      p1 = wa_data-zp1.
      p2 = wa_data-zp2.
      p3 = wa_data-zp3.
      p4 = wa_data-zp4.
      p5 = wa_data-zp5.
      p6 = wa_data-zp6.
      p7 = wa_data-zp7.
      p8 = wa_data-zp8.
      p9 = wa_data-zp9.
      retrieve = abap_true.
      PERFORM count_occurances.
      IF ( player1 = sy-uname AND count_x > count_o ) OR ( player2 = sy-uname AND count_o > count_x ).
        MESSAGE 'Not your turn yet.' TYPE 'I'.
        PERFORM empty_cells.
        EXIT.
      ENDIF.
      DELETE FROM ztic_tac_toe_agz WHERE zplayer1 = player1.

      PERFORM count_total.
      total_prev = total.
    ENDIF.
  ENDIF.



  PERFORM multiplayer_demand.

  PERFORM count_total.
  IF ( total > total_prev ).
    wa_data-zplayer1 = player1.
    wa_data-zplayer2 = player2.
    wa_data-zp1 = p1.
    wa_data-zp2 = p2.
    wa_data-zp3 = p3.
    wa_data-zp4 = p4.
    wa_data-zp5 = p5.
    wa_data-zp6 = p6.
    wa_data-zp7 = p7.
    wa_data-zp8 = p8.
    wa_data-zp9 = p9.

    INSERT ztic_tac_toe_agz FROM wa_data.

    PERFORM send_email.
    MESSAGE 'You made your move.' TYPE 'I'.
    PERFORM empty_cells.
  ENDIF.

*  IF mode = abap_false.
*    SELECT * FROM ztic_tac_toe_agz INTO  @DATA(wa_data) WHERE zplayer1 = @sy-uname.
*    ENDSELECT.
*    IF sy-subrc = 0.
*      p1 = wa_data-zp1.
*      p2 = wa_data-zp2.
*      p3 = wa_data-zp3.
*      p4 = wa_data-zp4.
*      p5 = wa_data-zp5.
*      p6 = wa_data-zp6.
*      p7 = wa_data-zp7.
*      p8 = wa_data-zp8.
*      p9 = wa_data-zp9.
*
*
*
*      CASE  p1.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p2.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p3.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p4.
*            PERFORM multiplayer.
*      ENDCASE.
*      CASE  p5.
*            PERFORM multiplayer.
*      ENDCASE.
*      CASE  p6.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p7.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p8.
*             PERFORM multiplayer.
*      ENDCASE.
*      CASE  p9.
*            PERFORM multiplayer.
*      ENDCASE.
*
*      PERFORM count_occurances.
*      IF count_x <> count_o.
*        mode = abap_false.
** SEND EMAIL/NOTIFICATION TO THE OTHER PLAYER.
*        MESSAGE 'It is gonna be quiet for a bit. I will let you knowwhen you can play again.' TYPE 'I'.
*        done = abap_true.
*
*      ENDIF.
*
*      PERFORM check_result.
*      IF done EQ abap_true.
*        PERFORM empty_cells.
*        EXIT.
*      ENDIF.
*
*      IF count_x NE count_o.
**  CALL FUNCTION 'SO_DOCUMENT_SEND_API1'
*      ENDIF.
**  ELSE.
*
** MESSAGE 'There is no saved information.' TYPE 'I'.
*
*    ENDIF.
*  ENDIF.

ENDFORM.

FORM send_email.

  DATA : lo_mime_helper TYPE REF TO cl_gbt_multirelated_service,
         lo_bcs         TYPE REF TO cl_bcs,
         lo_doc_bcs     TYPE REF TO cl_document_bcs,
         lo_recipient   TYPE REF TO if_recipient_bcs,
         lt_soli        TYPE TABLE OF soli,
         ls_soli        TYPE soli,
         lv_status      TYPE bcs_rqst.

*&---------------------------------------------------------------------*
*& Creation of the mail
*&---------------------------------------------------------------------*

  " Create the main object of the mail.
  CREATE OBJECT lo_mime_helper.

  DATA(string) = '<!DOCTYPE html PUBLIC “-//IETF//DTD HTML 5.0//EN">'
              && '<HTML><BODY>Hi Dear,<P>Content Section!</P></BODY></HTML>'.

  lt_soli = cl_document_bcs=>string_to_soli( string ).

  " Set the HTML body of the mail
  CALL METHOD lo_mime_helper->set_main_html
    EXPORTING
      content     = lt_soli
      description = 'Test Email'.

* Set the subject of the mail.
  lo_doc_bcs = cl_document_bcs=>create_from_multirelated(
                  i_subject          = 'Subject of our email'
                  i_importance       = '9'                " 1~High Priority  5~Average priority 9~Low priority
                  i_multirel_service = lo_mime_helper ).

  lo_bcs = cl_bcs=>create_persistent( ).

  lo_bcs->set_document( i_document = lo_doc_bcs ).

* Set the email address
  lo_recipient = cl_cam_address_bcs=>create_internet_address(
                    i_address_string =  'angkika@deloitte.gr' ).

  lo_bcs->add_recipient( i_recipient = lo_recipient ).

* Change the status.
  lv_status = 'N'.
  CALL METHOD lo_bcs->set_status_attributes
    EXPORTING
      i_requested_status = lv_status.

*&---------------------------------------------------------------------*
*& Send the email
*&---------------------------------------------------------------------*
  TRY.
      lo_bcs->send( ).
      COMMIT WORK.
    CATCH cx_bcs INTO DATA(lx_bcs).
      ROLLBACK WORK.
  ENDTRY.
ENDFORM.
