




        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        ZMULE_S_KNA1
          Short description:MULESOFT: Enhanced structure for customer data
          Structure
          Active version


        Field Structure
          Number of fields: 164
          Total of field lengths: 1922

        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        MANDT             CLNT      3 MANDT
         Client
        KUNNR             CHAR     10 KUNNR
         Customer Number
        LAND1             CHAR      3 LAND1_GP
         Country Key
        NAME1             CHAR     35 NAME1_GP
         Name 1
        NAME2             CHAR     35 NAME2_GP
         Name 2
        ORT01             CHAR     35 ORT01_GP
         City
        PSTLZ             CHAR     10 PSTLZ
         Postal Code
        REGIO             CHAR      3 REGIO
         Region (State, Province, County)
        SORTL             CHAR     10 SORTL
         Sort field
        STRAS             CHAR     35 STRAS_GP
         House number and street
        TELF1             CHAR     16 TELF1
         First telephone number
        TELFX             CHAR     31 TELFX
         Fax Number
        XCPDK             CHAR      1 XCPDK
         Indicator: Is the account a one-time account?
        ADRNR             CHAR     10 ADRNR
         Address
        MCOD1             CHAR     25 MCDD1
         Search term for matchcode search
        MCOD2             CHAR     25 MCDD2
         Search Term for Matchcode Search
        MCOD3             CHAR     25 MCDD3
         Search term for matchcode search
        ANRED             CHAR     15 ANRED
         Title
        AUFSD             CHAR      2 AUFSD_X
         Central order block for customer
        BAHNE             CHAR     25 BAHNE
         Express train station
        BAHNS             CHAR     25 BAHNS
         Train station
        ______________________________________________________________________
        SAP AG                         31.07.2014                            1






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        BBBNR             NUMC      7 BBBNR
         International location number  (part 1)
        BBSNR             NUMC      5 BBSNR
         International location number (Part 2)
        BEGRU             CHAR      4 BRGRU
         Authorization Group
        BRSCH             CHAR      4 BRSCH
         Industry key
        BUBKZ             NUMC      1 BUBKZ
         Check digit for the international location number
        DATLT             CHAR     14 DATLT
         Data communication line no.
        ERDAT             DATS      8 ERDAT_RF
         Date on which the Record Was Created
        ERNAM             CHAR     12 ERNAM_RF
         Name of Person who Created the Object
        EXABL             CHAR      1 EXABL
         Indicator: Unloading points exist
        FAKSD             CHAR      2 FAKSD_X
         Central billing block for customer
        FISKN             CHAR     10 FISKN_D
         Account number of the master record with the fiscal address
        KNAZK             CHAR      2 KNAZK
         Working Time Calendar
        KNRZA             CHAR     10 KNRZA
         Account number of an alternative payer
        KONZS             CHAR     10 KONZS
         Group key
        KTOKD             CHAR      4 KTOKD
         Customer Account Group
        KUKLA             CHAR      4 KTOKD
         Customer Account Group
        LIFNR             CHAR      2 KUKLA
         Customer classification
        LIFSD             CHAR     10 LIFNR
         Account Number of Vendor or Creditor
        LOCCO             CHAR      2 LIFSD_X
         Central delivery block for the customer
        LOEVM             CHAR     10 LOCCO
         City Coordinates
        NAME3             CHAR      1 LOEVM_X
         Central Deletion Flag for Master Record
        NAME4             CHAR     35 NAME3_GP
         Name 3
        NIELS             CHAR     35 NAME4_GP
         Name 4
        ORT02             CHAR      2 NIELS
         Nielsen ID
        PFACH             CHAR     35 ORT02_GP
         District
        PSTL2             CHAR     10 PFACH
         PO Box
        ______________________________________________________________________
        SAP AG                         31.07.2014                            2






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        COUNC             CHAR     10 PSTL2
         P.O. Box Postal Code
        CITYC             CHAR      3 COUNC
         County Code
        RPMKR             CHAR      4 CITYC
         City Code
        SPERR             CHAR      5 RPMKR
         Regional Market
        SPRAS             CHAR      1 SPERB_X
         Central posting block
        STCD1             LANG      1 SPRAS
         Language Key
        STCD2             CHAR     16 STCD1
         Tax Number 1
        STKZA             CHAR     11 STCD2
         Tax Number 2
        STKZU             CHAR      1 STKZA
         Indicator: Business Partner Subject to Equalization Tax?
        TELBX             CHAR      1 STKZU
         Liable for VAT
        TELF2             CHAR     15 TELBX
         Telebox number
        TELTX             CHAR     16 TELF2
         Second telephone number
        TELX1             CHAR     30 TELTX
         Teletex number
        LZONE             CHAR     30 TELX1
         Telex number
        XZEMP             CHAR     10 LZONE
         Transportation zone to or from which the goods are delivered
        VBUND             CHAR      1 XREGU
         Indicator: Is an alternative payer allowed in document?
        STCEG             CHAR     20 STCEG
         VAT Registration Number
        DEAR1             CHAR      1 DEAR1
         Indicator: Competitor
        DEAR2             CHAR      1 DEAR2
         Indicator: Sales partner
        DEAR3             CHAR      1 DEAR3
         Indicator: Sales prospect
        DEAR4             CHAR      1 DEAR4
         Indicator for customer type 4
        DEAR5             CHAR      1 DEAR5
         ID for default sold-to party
        GFORM             CHAR      2 GFORM
         Legal status
        BRAN1             CHAR     10 BRAN1_D
         Industry Code 1
        BRAN2             CHAR     10 BRAN2
         Industry code 2
        BRAN3             CHAR     10 BRAN3
         Industry code 3
        ______________________________________________________________________
        SAP AG                         31.07.2014                            3






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        BRAN4             CHAR     10 BRAN4
         Industry code 4
        BRAN5             CHAR     10 BRAN5
         Industry code 5
        EKONT             CHAR     10 EKONT
         Initial contact
        UMSAT             CURR      8 UMSAT
         Annual sales
        UMJAH             NUMC      4 UMJAH
         Year For Which Sales are Given
        UWAER             CUKY      5 UWAER
         Currency of sales figure
        JMZAH             NUMC      6 JMZAH
         Yearly number of employees
        JMJAH             NUMC      4 JMJAH
         Year for which the number of employees is given
        KATR1             CHAR      2 KATR1
         Attribute 1
        KATR2             CHAR      2 KATR2
         Attribute 2
        KATR3             CHAR      2 KATR3
         Attribute 3
        KATR4             CHAR      2 KATR4
         Attribute 4
        KATR5             CHAR      2 KATR5
         Attribute 5
        KATR6             CHAR      3 KATR6
         Attribute 6
        KATR7             CHAR      3 KATR7
         Attribute 7
        KATR8             CHAR      3 KATR8
         Attribute 8
        KATR9             CHAR      3 KATR9
         Attribute 9
        KATR10            CHAR      3 KATR10
         Attribute 10
        STKZN             CHAR      1 STKZN
         Natural Person
        UMSA1             CURR     15 UMSA1
         Annual sales
        TXJCD             CHAR     15 TXJCD
         Tax Jurisdiction
        PERIV             CHAR      2 PERIV
         Fiscal Year Variant
        ABRVW             CHAR      3 ABRVW
         Usage Indicator
        INSPBYDEBI        CHAR      1 QINSPBYDEB
         Inspection Carried Out By Customer (No Inspection Lot)
        INSPATDEBI        CHAR      1 QINSPATDEB
         Inspection for a Delivery Note After Outbound Delivery
        KTOCD             CHAR      4 KTOCD
         Reference Account Group for One-Time Account (Customer)
        ______________________________________________________________________
        SAP AG                         31.07.2014                            4






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        PFORT             CHAR     35 PFORT_GP
         PO Box city
        WERKS             CHAR      4 WERKS_D
         Plant
        DTAMS             CHAR      1 DTAMS
         Indicator for Data Medium Exchange
        DTAWS             CHAR      2 DTAWS
         Instruction key for data medium exchange
        DUEFL             CHAR      1 DUEFL_BKPF
         Status of Data Transfer into Subsequent Release
        HZUOR             NUMC      2 HZUOR
         Assignment to Hierarchy
        SPERZ             CHAR      1 SPERZ
         Payment Block
        ETIKG             CHAR     10 ETIKG
         IS-R Labeling: customer/plant group
        CIVVE             CHAR      1 CIVVE
         ID for mainly non-military use
        MILVE             CHAR      1 MILVE
         ID for mainly military use
        KDKG1             CHAR      2 KDKG1
         Customer condition group 1
        KDKG2             CHAR      2 KDKG2
         Customer condition group 2
        KDKG3             CHAR      2 KDKG3
         Customer condition group 3
        KDKG4             CHAR      2 KDKG4
         Customer condition group 4
        KDKG5             CHAR      2 KDKG5
         Customer condition group 5
        XKNZA             CHAR      1 XKNZA
         Indicator: Alternative payer using account number
        FITYP             CHAR      2 J_1AFITP_D
         Tax type
        STCDT             CHAR      2 J_1ATOID
         Tax Number Type
        STCD3             CHAR     18 STCD3
         Tax Number 3
        STCD4             CHAR     18 STCD4
         Tax Number 4
        STCD5             CHAR     60 STCD5
         Tax Number 5
        XICMS             CHAR      1 J_1BTCICMS
         Customer is ICMS-exempt
        XXIPI             CHAR      1 J_1BTCIPI
         Customer is IPI-exempt
        XSUBT             CHAR      3 J_1BTCST
         Customer group for Substituiçao Tributária calculation
        CFOPC             CHAR      2 J_1BINDUS1
         Customer's CFOP category
        TXLW1             CHAR      3 J_1BTAXLW1
         Tax law: ICMS
        ______________________________________________________________________
        SAP AG                         31.07.2014                            5






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        TXLW2             CHAR      3 J_1BTAXLW2
         Tax law: IPI
        CCC01             CHAR      1 CCC01
         Indicator for biochemical warfare for legal control
        CCC02             CHAR      1 CCC02
         Indicator for nuclear nonproliferation for legal control
        CCC03             CHAR      1 CCC03
         Indicator for national security for legal control
        CCC04             CHAR      1 CCC04
         Indicator for missile technology for legal control
        CASSD             CHAR      2 CASSD_X
         Central sales block for customer
        KNURL             CHAR    132 URL
         Uniform Resource Locator
        J_1KFREPRE        CHAR     10 REPRES
         Name of Representative
        J_1KFTBUS         CHAR     30 GESTYP
         Type of Business
        J_1KFTIND         CHAR     30 INDTYP
         Type of Industry
        CONFS             CHAR      1 CONFS_X
         Status of Change Authorization (Central)
        UPDAT             DATS      8 UPDAT_RF
         Date on Which the Changes Were Confirmed
        UPTIM             TIMS      6 UPTIM_RF
         Time of Last Change Confirmation
        NODEL             CHAR      1 NODEL_X
         Central deletion block for master record
        DEAR6             CHAR      1 DEAR6
         Indicator: Consumer
        ALC               CHAR      8 FMFG_ALC
         Agency Location Code
        PMT_OFFICE        CHAR      5 FMFG_PMT_OFF
         Payment Office
        FEE_SCHEDULE      CHAR      4 FM_FEE_SCHED
         Fee schedule
        DUNS              CHAR      9 FMCCRDUNS
         DUNS Number
        DUNS4             CHAR      4 FMCCRDUNS4
         DUNS+4
        PSOFG             CHAR     10 PSOFG
         Processor group
        PSOIS             CHAR     20 PSOIS
         Subledger acct preprocessing procedure
        PSON1             CHAR     35 NAME1_GP
         Name 1
        PSON2             CHAR     35 NAME2_GP
         Name 2
        PSON3             CHAR     35 NAME3_GP
         Name 3
        PSOVN             CHAR     35 PSOVN
         First Name
        ______________________________________________________________________
        SAP AG                         31.07.2014                            6






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Component       K Type Length TypName
        Short Text
        ____________________________________________________________
        PSOTL             CHAR     20 PSOTL
         Title
        PSOHS             CHAR      6 PSOHS
         House number: is no longer used from Release 4.6B
        PSOST             CHAR     28 PSOST
         Street: No longer used from Release 4.6B
        PSOO1             CHAR     50 PSOO1
         Description
        PSOO2             CHAR     50 PSOO1
         Description
        PSOO3             CHAR     50 PSOO1
         Description
        PSOO4             CHAR     50 PSOO1
         Description
        PSOO5             CHAR     50 PSOO1
         Description
        LAEDA             DATS      8 LAEDA
         Date of Last Change
        AENAM             CHAR     12 AENAM
         Name of Person Who Changed Object
        UTIME             TIMS      6 CDUZEIT
         Time changed
        CTIME             TIMS      6 CTME
         Time of creation
        LAST_MODIF_DATE   CHAR     24 MSSCONNDATE
         Character representation of datetime YYYY-MM-DD HH:MM:SS:SSS
        ____________________________________________________________
          Fields with reference fields:
            Field name      Reference field
            UMSAT           KNA1-UWAER
            UMSA1           KNA1-UWAER

          Fields with conversion routines:
            Field name      Conversion routine
            KUNNR           ALPHA
            ADRNR           ALPHA
            FISKN           ALPHA
            KNRZA           ALPHA
            LIFSD           ALPHA
            STCD1           ISOLA
            EKONT           ALPHA
            CFOPC           ALPHA
            TXLW1           ALPHA
            TXLW2           ALPHA








        ______________________________________________________________________
        SAP AG                         31.07.2014                            7






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________


        Input Checks (Foreign Keys, Fixed Values)

          XCPDK checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          EXABL checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          NAME3 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          SPRAS checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          STKZU checked against fixed values from domain STKZA
          Fixed values:
                    Not subject to equalization tax
            X       Subject to equalization tax

          TELBX checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          VBUND checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          DEAR1 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          DEAR2 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          DEAR3 checked against fixed values from domain DEAR3
          Fixed values:
                    No
            X       yes




        ______________________________________________________________________
        SAP AG                         31.07.2014                            8






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________



          DEAR4 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          DEAR5 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          STKZN checked against fixed values from domain STKZN
          Fixed values:
                    Legal person
            X       Natural person

          INSPBYDEBI checked against fixed values from domain QKZ
          Fixed values:
                    Indicator is not set
            X       Indicator is set

          INSPATDEBI checked against fixed values from domain QKZ
          Fixed values:
                    Indicator is not set
            X       Indicator is set

          DTAMS checked against fixed values from domain DTAMS
          Fixed values:
                    Use house bank default value
            0       Single data record can be forwarded to the Bundesbank
            1       Single data record not to be forwarded to the Bundesbank

          DUEFL checked against fixed values from domain DUEFL_BKPF
          Fixed values:
                    Not transferred yet
            A       Transfer taken place, document changed later
            X       Transfer taken place, document unchanged

          SPERZ checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          CIVVE checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          MILVE checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes



        ______________________________________________________________________
        SAP AG                         31.07.2014                            9






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________



          XKNZA checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          XICMS checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          XXIPI checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          CFOPC checked against fixed values from domain J_1BINDUS1
          Fixed values:
            00      industry (cooperative)
            01      electric co.
            02      communication co.
            03      transport co.
            04      service co.
            05      consumer industry (cooperative)
            06      non-contributing customer
            07      agricultural customer
            08      trading company
            09      producer establishment

          CCC01 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          CCC02 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          CCC03 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          CCC04 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes

          NODEL checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes


        ______________________________________________________________________
        SAP AG                         31.07.2014                           10






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





        ABAP Dictionary                 Rel. 731                   ZMULE_S_KNA1
        ______________________________________________________________________



          DEAR6 checked against fixed values from domain XFELD
          Fixed values:
                    No
            X       Yes


















































        ______________________________________________________________________
        SAP AG                         31.07.2014                           11






~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
