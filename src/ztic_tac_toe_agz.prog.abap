*&---------------------------------------------------------------------*
*& Report ZTIC_TAC_TOE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztic_tac_toe_agz.
TABLES: ztic_tac_toe_agz.


INCLUDE ztic_tac_toe_top2.
INCLUDE ztic_tac_toe_screen2.
INCLUDE ztic_tac_toe_forms2.
INCLUDE ztic_tac_toe_single_player2.
INCLUDE ztic_tac_toe_multi_player2.
INCLUDE ztic_tac_toe_multi_player_dem2.

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
