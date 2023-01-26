*&---------------------------------------------------------------------*
*& Report ZTIC_TAC_TOE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztic_tac_toe_agz.
INCLUDE ZTIC_TAC_TOE_TOP2.
*INCLUDE ztic_tac_toe_top.
INCLUDE ZTIC_TAC_TOE_SCREEN2.
*INCLUDE ztic_tac_toe_screen.
INCLUDE ZTIC_TAC_TOE_FORMS2.
*INCLUDE ztic_tac_toe_forms.
INCLUDE ZTIC_TAC_TOE_SINGLE_PLAYER2.
*INCLUDE ztic_tac_toe_single_player.
INCLUDE ZTIC_TAC_TOE_MULTI_PLAYER2.
*INCLUDE ztic_tac_toe_multi_player.
INCLUDE ZTIC_TAC_TOE_MULTI_PLAYER_DEM2.
*INCLUDE ztic_tac_toe_multi_player_dem.

AT SELECTION-SCREEN.

  LOOP AT SCREEN.

    CASE 'X'.
      WHEN P_radio1.
        PERFORM singleplayer.
      WHEN P_radio2.
        PERFORM multiplayer.
      WHEN p_radio3.
        PERFORM multiplayer_ondemand.
    ENDCASE.

    MODIFY SCREEN.

  ENDLOOP.
