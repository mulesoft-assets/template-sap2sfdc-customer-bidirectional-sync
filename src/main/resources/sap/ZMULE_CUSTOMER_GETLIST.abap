FUNCTION ZMULE_CUSTOMER_GETLIST.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(I_FROM_DATE) TYPE  MSSCONNDATE OPTIONAL
*"     VALUE(I_CUST_ID) TYPE  KUNNR OPTIONAL
*"  EXPORTING
*"     VALUE(E_RETURN) TYPE  BAPIRET2
*"  TABLES
*"      T_KNA1 TYPE  ZMULE_TT_KNA1
*"  EXCEPTIONS
*"      INPUT_NOT_PROVIDED
*"      INPUT_WRONG
*"----------------------------------------------------------------------
*----------------------------------------------------------------------*
* Function Module           ZMULE_CUSTOMER_GETLIST                     *
*----------------------------------------------------------------------*
*                                                                      *
* ID-Reference:             MuleSoft templates                         *
*                                                                      *
* This BAPI aims to return list of customers by either given creation  *
* or last change date/time OR by customers ID. Only customers that are *
* not marked for deletion are returned.                                *
*----------------------------------------------------------------------*
* Change Log:                                                          *
*                                                                      *
* Who       Date       Text                                            *
* MMARUSKIN 22.07.2014 Init creation.                                  *
*----------------------------------------------------------------------*
CONSTANTS: lc_msg_cls TYPE sy-msgid VALUE 'ZMULESOFTINTEGRATION',
           lc_tz_utc  TYPE tznzone  VALUE 'UTC'.
DATA: ls_kna1         TYPE zmule_s_kna1,
      ls_chgdoc       TYPE cdred,
      lt_chgdoc       TYPE TABLE OF cdred,
      lt_chgdoc_tmp   TYPE TABLE OF cdred,
      lv_sel(1)       TYPE c,
      lv_date         TYPE sy-datum,
      lv_date_tmp(10) TYPE c,
      lv_time         TYPE cduzeit,
      lv_time_tmp(8)  TYPE c,
      lv_cdhdrobj     TYPE cdhdr-objectid,
      lv_msg_p1       TYPE sy-msgv1,
      lv_msg_ty       TYPE sy-msgty,
      lv_msg_no       TYPE sy-msgno,
      lv_systz        TYPE timezone,
      lv_tmst         TYPE tzonref-tstamps.

*- Input parameter check
IF i_from_date IS INITIAL AND i_cust_id IS INITIAL.
  RAISE INPUT_NOT_PROVIDED.	"input data for selection is not provided "#EC RAISE_OK
ELSEIF i_from_date IS NOT INITIAL AND i_cust_id IS NOT INITIAL.
  RAISE INPUT_WRONG.        "input data for selection provided both "#EC RAISE_OK
ELSE.
  IF NOT i_from_date IS INITIAL.
    lv_sel = 'D'. "by date
  ELSE.
    TRANSLATE i_cust_id TO UPPER CASE.
    lv_sel = 'I'. "by ID
  ENDIF.
*- Get time zone of SAP server, later used for convertion to UTC
  CALL FUNCTION 'GET_SYSTEM_TIMEZONE'  ##FM_SUBRC_OK
    IMPORTING
      TIMEZONE            = lv_systz
    EXCEPTIONS
      CUSTOMIZING_MISSING = 1
      OTHERS              = 2.
ENDIF.

*- Main processing
CASE lv_sel.
  WHEN 'D'. "mode for materials selected by parameter i_from_date
*- Derive date/time from YYYY-MM-DDTHH:MM:SS:SSSZ
    lv_date_tmp = i_from_date(10).
    REPLACE ALL OCCURRENCES OF '-' IN lv_date_tmp WITH ''.
    lv_date = lv_date_tmp.
    lv_time_tmp = i_from_date+11(8).
    REPLACE ALL OCCURRENCES OF ':' IN lv_time_tmp WITH ''.
    lv_time = lv_time_tmp.
*- Convert given UTC format of time to server time zone
    CONVERT DATE lv_date TIME lv_time INTO TIME STAMP lv_tmst TIME ZONE lc_tz_utc.
    CONVERT TIME STAMP lv_tmst TIME ZONE lv_systz INTO DATE lv_date TIME lv_time.
*- Select initial list of customers
    IF lv_date IS NOT INITIAL.
      CLEAR: t_kna1, t_kna1[].
*- Get customers by Created On date
      SELECT * FROM kna1 APPENDING CORRESPONDING FIELDS OF TABLE t_kna1 WHERE erdat GE lv_date.
      SORT t_kna1 ASCENDING BY kunnr.
      DELETE ADJACENT DUPLICATES FROM t_kna1.
*- Get customers by Changed On date
      CALL FUNCTION 'CHANGEDOCUMENT_READ' ##FM_SUBRC_OK
        EXPORTING
          objectclass                = 'DEBI'
          objectid                   = lv_cdhdrobj
          date_of_change             = lv_date
          time_of_change             = lv_time "already in server time
        TABLES
          editpos                    = lt_chgdoc_tmp
        EXCEPTIONS
          no_position_found          = 1
          wrong_access_to_archive    = 2
          time_zone_conversion_error = 3
          others                     = 4.
*- Aggregate change doc - keep only last change of customer
      SORT lt_chgdoc_tmp BY objectid changenr DESCENDING.
      DELETE ADJACENT DUPLICATES FROM lt_chgdoc_tmp COMPARING objectid changenr.
*- Merge both customers tables
      LOOP AT lt_chgdoc_tmp INTO ls_chgdoc WHERE objectid IS NOT INITIAL.
        READ TABLE t_kna1 WITH KEY kunnr = ls_chgdoc-objectid INTO ls_kna1. "#EC WARNOK
        IF sy-subrc NE 0.
          SELECT * FROM kna1 APPENDING CORRESPONDING FIELDS OF TABLE t_kna1 WHERE kunnr EQ ls_chgdoc-objectid.
        ENDIF.
      ENDLOOP.
    ENDIF.
*- Get changes for list of materials
    CLEAR: lt_chgdoc_tmp, lt_chgdoc_tmp[].
    LOOP AT t_kna1 INTO ls_kna1 WHERE kunnr IS NOT INITIAL.
      lv_cdhdrobj = ls_kna1-kunnr.
      CLEAR: lt_chgdoc_tmp.
      CALL FUNCTION 'CHANGEDOCUMENT_READ' ##FM_SUBRC_OK
        EXPORTING
          objectclass                = 'DEBI'
          objectid                   = lv_cdhdrobj
          date_of_change             = lv_date
          time_of_change             = lv_time "already in server time
        TABLES
          editpos                    = lt_chgdoc_tmp
        EXCEPTIONS
          no_position_found          = 1
          wrong_access_to_archive    = 2
          time_zone_conversion_error = 3
          others                     = 4.
      IF lt_chgdoc_tmp IS NOT INITIAL.
        APPEND LINES OF lt_chgdoc_tmp TO lt_chgdoc.
      ENDIF.
    ENDLOOP.
*- Get rid of entries do not match given time (all times in UTC)
    DELETE lt_chgdoc WHERE utime EQ lv_time.
*- Convert date/time of creation/change to UTC from whatever SAP server time zone is
    LOOP AT lt_chgdoc INTO ls_chgdoc.
      CONVERT DATE ls_chgdoc-udate TIME ls_chgdoc-utime INTO TIME STAMP lv_tmst TIME ZONE lv_systz.
      CONVERT TIME STAMP lv_tmst TIME ZONE lc_tz_utc INTO DATE ls_chgdoc-udate TIME ls_chgdoc-utime.
      MODIFY lt_chgdoc FROM ls_chgdoc.
    ENDLOOP.
*- Return data
    LOOP AT t_kna1.
      SORT lt_chgdoc DESCENDING BY changenr.
      READ TABLE lt_chgdoc INTO ls_chgdoc WITH KEY objectid = t_kna1-kunnr.
      IF sy-subrc NE 0.
        DELETE TABLE t_kna1.
      ELSE.
*- Create date of last modification into format YYYY-MM-DDTHH:MM:SS:SSSZ
        IF t_kna1-laeda IS INITIAL. "by Creation
          t_kna1-ctime = ls_chgdoc-utime. "creation
          CONCATENATE t_kna1-erdat(4) '-' t_kna1-erdat+4(2) '-' t_kna1-erdat+6(2) 'T'
                      t_kna1-ctime(2) ':' t_kna1-ctime+2(2) ':' t_kna1-ctime+4(2) 'Z'
                      INTO t_kna1-last_modif_date.
        ElSE. "by change
          t_kna1-utime = ls_chgdoc-utime. "change
          CONCATENATE t_kna1-laeda(4) '-' t_kna1-laeda+4(2) '-' t_kna1-laeda+6(2) 'T'
                      t_kna1-utime(2) ':' t_kna1-utime+2(2) ':' t_kna1-utime+4(2) 'Z'
                      INTO t_kna1-last_modif_date.
        ENDIF.
        MODIFY t_kna1.
      ENDIF.
    ENDLOOP.

  WHEN 'I'. "mode for particular material
*- Select material by its ID
    SELECT * FROM kna1 INTO CORRESPONDING FIELDS OF TABLE t_kna1 WHERE kunnr EQ i_cust_id.
    IF sy-subrc EQ 0.
*- Get changes for list of materials
      lv_cdhdrobj = i_cust_id.
      CALL FUNCTION 'CHANGEDOCUMENT_READ' ##FM_SUBRC_OK
        EXPORTING
          objectclass                = 'DEBI'
          objectid                   = lv_cdhdrobj
        TABLES
          editpos                    = lt_chgdoc
        EXCEPTIONS
          no_position_found          = 1
          wrong_access_to_archive    = 2
          time_zone_conversion_error = 3
          others                     = 4.
*- Get last change
      SORT lt_chgdoc DESCENDING BY changenr.
*- Convert date/time of creation/change to UTC from whatever SAP server time zone is
      LOOP AT lt_chgdoc INTO ls_chgdoc.
        CONVERT DATE ls_chgdoc-udate TIME ls_chgdoc-utime INTO TIME STAMP lv_tmst TIME ZONE lv_systz.
        CONVERT TIME STAMP lv_tmst TIME ZONE lc_tz_utc INTO DATE ls_chgdoc-udate TIME ls_chgdoc-utime.
        MODIFY lt_chgdoc FROM ls_chgdoc.
      ENDLOOP.
      READ TABLE lt_chgdoc INTO ls_chgdoc INDEX 1.
      READ TABLE t_kna1    INTO ls_kna1   INDEX 1.
      ls_kna1-utime = ls_chgdoc-utime.
      IF ls_kna1-laeda IS INITIAL. "in case customer wasn't changed yet
        ls_kna1-laeda = ls_kna1-erdat.
      ENDIF.
      CONCATENATE ls_kna1-laeda(4) '-' ls_kna1-laeda+4(2) '-' ls_kna1-laeda+6(2) 'T'
                  ls_kna1-utime(2) ':' ls_kna1-utime+2(2) ':' ls_kna1-utime+4(2) 'Z'
                  INTO ls_kna1-last_modif_date.
      MODIFY t_kna1 FROM ls_kna1 INDEX 1.
    ENDIF.
  WHEN OTHERS.
ENDCASE.

*- Filter out records having "Central Deletion Flag for Master Record" set
DELETE t_kna1 WHERE loevm EQ 'X'.
*- Error handling
IF t_kna1 IS NOT INITIAL. "ok: materials found
  DESCRIBE TABLE t_kna1 LINES lv_msg_p1.
  lv_msg_ty = 'I'.
  lv_msg_no = '102'.
ELSE.                     "problem: nothing found!
  IF NOT lv_msg_p1 IS INITIAL.
    lv_msg_p1 = i_from_date.
  ELSEIF NOT i_cust_id IS INITIAL.
    lv_msg_p1 = i_cust_id.
  ENDIF.
  lv_msg_ty = 'E'.
  lv_msg_no = '103'.
ENDIF.
CALL FUNCTION 'BALW_BAPIRETURN_GET2'
  EXPORTING
    type      = lv_msg_ty
    cl        = lc_msg_cls
    number    = lv_msg_no
    par1      = lv_msg_p1
    parameter = ''
    field     = ''
  IMPORTING
    return = e_return.

ENDFUNCTION.