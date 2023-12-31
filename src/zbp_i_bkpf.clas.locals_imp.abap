CLASS lhc_BKPF DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR bkpf RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE bkpf.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE bkpf.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE bkpf.

    METHODS read FOR READ
      IMPORTING keys FOR READ bkpf RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK bkpf.

    METHODS onupdateheader FOR MODIFY
      IMPORTING keys FOR ACTION bkpf~onupdateheader RESULT result.

ENDCLASS.

CLASS lhc_BKPF IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
*    TYPES : BEGIN OF KEY,
*      BELNR     TYPE ZAPT0002-BELNR,
*      BUKRS     TYPE ZAPT0002-BUKRS,
*      GJAHR  TYPE ZAPT0002-GJAHR,
*    END OF KEY.
*
*    DATA : LT_CREATE TYPE TABLE OF ZAPT0002,
*           LT_KEYS TYPE TABLE OF KEY.

*
*    LT_KEYS = VALUE #( FOR LS_ENTITY IN ENTITIES (
*        BELNR = LS_ENTITY-Belnr
*        BUKRS = LS_ENTITY-BUKRS
*        GJAHR = LS_ENTITY-GJAHR
*    ) ).
*
*    READ ENTITIES OF Z_I_BKPF IN LOCAL MODE
*        ENTITY BKPF
*        ALL FIELDS WITH CORRESPONDING #( LT_KEYS )
*        RESULT DATA(LT_RESULT)
*        FAILED DATA(LT_FAILED)
*        REPORTED DATA(LT_REPORTED).

    DATA : LT_CREATE TYPE TABLE OF ZAPT0002.
    get time stamp field data(lv_timestamp).

    LT_CREATE = CORRESPONDING #( ENTITIES ).

    LOOP AT LT_CREATE ASSIGNING FIELD-SYMBOL(<WA_CREATE>).
        <WA_CREATE>-createdby = SY-UNAME.
        <WA_CREATE>-lastchangedat = LV_TIMESTAMP.
        <WA_CREATE>-locallastchangedat = LV_TIMESTAMP.
    ENDLOOP.

    INSERT ZAPT0002 FROM TABLE @LT_CREATE.
  ENDMETHOD.

  METHOD update.
    DATA : LT_UPDATE TYPE TABLE OF ZAPT0002.

    LT_UPDATE = CORRESPONDING #( ENTITIES ).
    UPDATE ZAPT0002 FROM TABLE @LT_UPDATE.
  ENDMETHOD.

  METHOD delete.
    LOOP AT KEYS ASSIGNING FIELD-SYMBOL(<WA_DELETE>).
        DELETE FROM ZAPT0002 WHERE BELNR = @<WA_DELETE>-Belnr AND BUKRS = @<WA_DELETE>-BUKRS AND GJAHR = @<WA_DELETE>-GJAHR.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
    DATA : LT_RESULT TYPE TABLE OF ZAPT0002.

    CHECK KEYS IS NOT INITIAL.

    SELECT * FROM ZAPT0002
        FOR ALL ENTRIES IN @KEYS
        WHERE BELNR = @KEYS-Belnr AND BUKRS = @KEYS-Bukrs AND GJAHR = @KEYS-Gjahr
        INTO CORRESPONDING FIELDS OF TABLE @LT_RESULT.

    IF SY-SUBRC = 0.
        RESULT = CORRESPONDING #( LT_RESULT ).
    ENDIF.
  ENDMETHOD.

  METHOD lock.
    LOOP AT KEYS ASSIGNING FIELD-SYMBOL(<WA_DELETE>).

    ENDLOOP.
  ENDMETHOD.

  METHOD onUpdateHeader.
        READ ENTITIES OF Z_I_BKPF IN LOCAL MODE
            ENTITY BKPF
            ALL FIELDS WITH CORRESPONDING #( KEYS )
            RESULT DATA(LT_RESULT)
            FAILED DATA(LT_FAILED)
            REPORTED DATA(LT_REPORTED).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_BKPF DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_BKPF IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
