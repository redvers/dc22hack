'' **********************************************************************************
'' Registers used in driver definition for HopeRF RFM69W/RFM69HW, Semtech SX1231/1231H
'' **********************************************************************************
'' Creative Commons Attrib Share-Alike License
'' You are free to use/extend this library but please abide with the CCSA license:
'' http:''creativecommons.org/licenses/by-sa/3.0/
'' 2013-06-14 (C) felix@lowpowerlab.com
'' **********************************************************************************

''**************************************************
'' RFM69/SX1231 Internal registers addresses
''**************************************************
#define REG_FIFO			    $00
#define REG_OPMODE			  $01
#define REG_DATAMODUL	  	$02
#define REG_BITRATEMSB		$03
#define REG_BITRATELSB		$04
#define REG_FDEVMSB			  $05
#define REG_FDEVLSB		  	$06
#define REG_FRFMSB	  		$07
#define REG_FRFMID			  $08
#define REG_FRFLSB		  	$09
#define REG_OSC1		  	  $0A
#define REG_AFCCTRL   		$0B
#define REG_LOWBAT			  $0C
#define REG_LISTEN1			  $0D
#define REG_LISTEN2			  $0E
#define REG_LISTEN3			  $0F
#define REG_VERSION			  $10
#define REG_PALEVEL			  $11
#define REG_PARAMP			  $12
#define REG_OCP				    $13
#define REG_AGCREF			  $14
#define REG_AGCTHRESH1		$15
#define REG_AGCTHRESH2		$16
#define REG_AGCTHRESH3		$17
#define REG_LNA			  	  $18
#define REG_RXBW		    	$19
#define REG_AFCBW		    	$1A
#define REG_OOKPEAK	  		$1B
#define REG_OOKAVG  			$1C
#define REG_OOKFIX	  		$1D
#define REG_AFCFEI		  	$1E
#define REG_AFCMSB			  $1F
#define REG_AFCLSB			  $20
#define REG_FEIMSB			  $21
#define REG_FEILSB			  $22
#define REG_RSSICONFIG		$23
#define REG_RSSIVALUE		  $24
#define REG_DIOMAPPING1		$25
#define REG_DIOMAPPING2		$26
#define REG_IRQFLAGS1		  $27
#define REG_IRQFLAGS2		  $28
#define REG_RSSITHRESH		$29
#define REG_RXTIMEOUT1		$2A
#define REG_RXTIMEOUT2		$2B
#define REG_PREAMBLEMSB		$2C
#define REG_PREAMBLELSB		$2D
#define REG_SYNCCONFIG		$2E
#define REG_SYNCVALUE1		$2F
#define REG_SYNCVALUE2		$30
#define REG_SYNCVALUE3		$31
#define REG_SYNCVALUE4		$32
#define REG_SYNCVALUE5		$33
#define REG_SYNCVALUE6		$34
#define REG_SYNCVALUE7		$35
#define REG_SYNCVALUE8		$36
#define REG_PACKETCONFIG1	$37
#define REG_PAYLOADLENGTH	$38
#define REG_NODEADRS		  $39
#define REG_BROADCASTADRS	$3A
#define REG_AUTOMODES		  $3B
#define REG_FIFOTHRESH		$3C
#define REG_PACKETCONFIG2	$3D
#define REG_AESKEY1			  $3E
#define REG_AESKEY2 			$3F
#define REG_AESKEY3	  		$40
#define REG_AESKEY4		  	$41
#define REG_AESKEY5			  $42
#define REG_AESKEY6 			$43
#define REG_AESKEY7	  		$44
#define REG_AESKEY8		  	$45
#define REG_AESKEY9			  $46
#define REG_AESKEY10  		$47
#define REG_AESKEY11	  	$48
#define REG_AESKEY12		  $49
#define REG_AESKEY13  		$4A
#define REG_AESKEY14	  	$4B
#define REG_AESKEY15		  $4C
#define REG_AESKEY16		  $4D
#define REG_TEMP1			    $4E
#define REG_TEMP2			    $4F
#define REG_TESTPA1       $5A
#define REG_TESTPA2       $5C
#define REG_TESTDAGC      $6F
#define REG_TESTAFC       $71

''******************************************************
'' RF69/SX1231 bit control definition
''******************************************************
'' RegOpMode
#define RF_OPMODE_SEQUENCER_OFF				$80
#define RF_OPMODE_SEQUENCER_ON				$00

#define RF_OPMODE_LISTEN_ON						$40
#define RF_OPMODE_LISTEN_OFF					$00

#define RF_OPMODE_LISTENABORT					$20

#define RF_OPMODE_SLEEP							  $00
#define RF_OPMODE_STANDBY						  $04 
#define RF_OPMODE_SYNTHESIZER					$08
#define RF_OPMODE_TRANSMITTER					$0C
#define RF_OPMODE_RECEIVER						$10

'' RegDataModul
#define RF_DATAMODUL_DATAMODE_PACKET			      $00 
#define RF_DATAMODUL_DATAMODE_CONTINUOUS		    $40
#define RF_DATAMODUL_DATAMODE_CONTINUOUSNOBSYNC	$60

#define RF_DATAMODUL_MODULATIONTYPE_FSK			    $00 
#define RF_DATAMODUL_MODULATIONTYPE_OOK			    $08

#define RF_DATAMODUL_MODULATIONSHAPING_00		    $00 
#define RF_DATAMODUL_MODULATIONSHAPING_01		    $01
#define RF_DATAMODUL_MODULATIONSHAPING_10		    $02
#define RF_DATAMODUL_MODULATIONSHAPING_11		    $03

'' RegBitRate (bits/sec) example bit rates
#define RF_BITRATEMSB_1200						$68
#define RF_BITRATELSB_1200						$2B
#define RF_BITRATEMSB_2400						$34
#define RF_BITRATELSB_2400						$15
#define RF_BITRATEMSB_4800						$1A 
#define RF_BITRATELSB_4800						$0B 
#define RF_BITRATEMSB_9600						$0D
#define RF_BITRATELSB_9600						$05
#define RF_BITRATEMSB_19200						$06
#define RF_BITRATELSB_19200						$83
#define RF_BITRATEMSB_38400						$03
#define RF_BITRATELSB_38400						$41

#define RF_BITRATEMSB_38323						$03
#define RF_BITRATELSB_38323						$43

#define RF_BITRATEMSB_34482						$03
#define RF_BITRATELSB_34482						$A0

#define RF_BITRATEMSB_76800						$01
#define RF_BITRATELSB_76800						$A1
#define RF_BITRATEMSB_153600					$00
#define RF_BITRATELSB_153600					$D0
#define RF_BITRATEMSB_57600						$02
#define RF_BITRATELSB_57600						$2C
#define RF_BITRATEMSB_115200					$01
#define RF_BITRATELSB_115200					$16
#define RF_BITRATEMSB_12500						$0A
#define RF_BITRATELSB_12500						$00
#define RF_BITRATEMSB_25000						$05
#define RF_BITRATELSB_25000						$00
#define RF_BITRATEMSB_50000						$02
#define RF_BITRATELSB_50000						$80
#define RF_BITRATEMSB_100000					$01
#define RF_BITRATELSB_100000					$40
#define RF_BITRATEMSB_150000					$00
#define RF_BITRATELSB_150000					$D5
#define RF_BITRATEMSB_200000					$00
#define RF_BITRATELSB_200000					$A0
#define RF_BITRATEMSB_250000					$00
#define RF_BITRATELSB_250000					$80
#define RF_BITRATEMSB_300000					$00
#define RF_BITRATELSB_300000					$6B
#define RF_BITRATEMSB_32768						$03
#define RF_BITRATELSB_32768						$D1
''custom bit rates
#define RF_BITRATEMSB_55555     $02
#define RF_BITRATELSB_55555     $40
#define RF_BITRATEMSB_200KBPS      $00
#define RF_BITRATELSB_200KBPS      $a0

'' RegFdev - frequency deviation (Hz)
#define RF_FDEVMSB_2000							$00
#define RF_FDEVLSB_2000							$21
#define RF_FDEVMSB_4800							$00
#define RF_FDEVLSB_4800							$4e
#define RF_FDEVMSB_5000							$00 
#define RF_FDEVLSB_5000							$52 
#define RF_FDEVMSB_7500							$00
#define RF_FDEVLSB_7500							$7B
#define RF_FDEVMSB_10000						$00
#define RF_FDEVLSB_10000						$A4
#define RF_FDEVMSB_15000						$00
#define RF_FDEVLSB_15000						$F6
#define RF_FDEVMSB_20000						$01
#define RF_FDEVLSB_20000						$48
#define RF_FDEVMSB_25000						$01
#define RF_FDEVLSB_25000						$9A
#define RF_FDEVMSB_30000						$01
#define RF_FDEVLSB_30000						$EC
#define RF_FDEVMSB_35000						$02
#define RF_FDEVLSB_35000						$3D
#define RF_FDEVMSB_40000						$02
#define RF_FDEVLSB_40000						$8F
#define RF_FDEVMSB_45000						$02
#define RF_FDEVLSB_45000						$E1
#define RF_FDEVMSB_50000						$03
#define RF_FDEVLSB_50000						$33
#define RF_FDEVMSB_55000						$03
#define RF_FDEVLSB_55000						$85
#define RF_FDEVMSB_60000						$03
#define RF_FDEVLSB_60000						$D7
#define RF_FDEVMSB_65000						$04
#define RF_FDEVLSB_65000						$29
#define RF_FDEVMSB_70000						$04
#define RF_FDEVLSB_70000						$7B
#define RF_FDEVMSB_75000						$04
#define RF_FDEVLSB_75000						$CD
#define RF_FDEVMSB_80000						$05
#define RF_FDEVLSB_80000						$1F
#define RF_FDEVMSB_85000						$05
#define RF_FDEVLSB_85000						$71
#define RF_FDEVMSB_90000						$05
#define RF_FDEVLSB_90000						$C3
#define RF_FDEVMSB_95000						$06
#define RF_FDEVLSB_95000						$14
#define RF_FDEVMSB_100000						$06
#define RF_FDEVLSB_100000						$66
#define RF_FDEVMSB_110000						$07
#define RF_FDEVLSB_110000						$0A
#define RF_FDEVMSB_120000						$07
#define RF_FDEVLSB_120000						$AE
#define RF_FDEVMSB_130000						$08
#define RF_FDEVLSB_130000						$52
#define RF_FDEVMSB_140000						$08
#define RF_FDEVLSB_140000						$F6
#define RF_FDEVMSB_150000						$09
#define RF_FDEVLSB_150000						$9A
#define RF_FDEVMSB_160000						$0A
#define RF_FDEVLSB_160000						$3D
#define RF_FDEVMSB_170000						$0A
#define RF_FDEVLSB_170000						$E1
#define RF_FDEVMSB_180000						$0B
#define RF_FDEVLSB_180000						$85
#define RF_FDEVMSB_190000						$0C
#define RF_FDEVLSB_190000						$29
#define RF_FDEVMSB_200000						$0C
#define RF_FDEVLSB_200000						$CD
#define RF_FDEVMSB_210000						$0D
#define RF_FDEVLSB_210000						$71
#define RF_FDEVMSB_220000						$0E
#define RF_FDEVLSB_220000						$14
#define RF_FDEVMSB_230000						$0E
#define RF_FDEVLSB_230000						$B8
#define RF_FDEVMSB_240000						$0F
#define RF_FDEVLSB_240000						$5C
#define RF_FDEVMSB_250000						$10
#define RF_FDEVLSB_250000						$00
#define RF_FDEVMSB_260000						$10
#define RF_FDEVLSB_260000						$A4
#define RF_FDEVMSB_270000						$11
#define RF_FDEVLSB_270000						$48
#define RF_FDEVMSB_280000						$11
#define RF_FDEVLSB_280000						$EC
#define RF_FDEVMSB_290000						$12
#define RF_FDEVLSB_290000						$8F
#define RF_FDEVMSB_300000						$13
#define RF_FDEVLSB_300000						$33

'' RegFrf (MHz) - carrier frequency
'' 315Mhz band
#define RF_FRFMSB_314							$4E
#define RF_FRFMID_314							$80
#define RF_FRFLSB_314							$00
#define RF_FRFMSB_315							$4E
#define RF_FRFMID_315							$C0
#define RF_FRFLSB_315							$00
#define RF_FRFMSB_316							$4F
#define RF_FRFMID_316							$00
#define RF_FRFLSB_316							$00
'' 433mhz band
#define RF_FRFMSB_433							$6C
#define RF_FRFMID_433							$40
#define RF_FRFLSB_433							$00
#define RF_FRFMSB_434							$6C
#define RF_FRFMID_434							$80
#define RF_FRFLSB_434							$00
#define RF_FRFMSB_435							$6C
#define RF_FRFMID_435							$C0
#define RF_FRFLSB_435							$00
'' 868Mhz band
#define RF_FRFMSB_863							$D7
#define RF_FRFMID_863							$C0
#define RF_FRFLSB_863							$00
#define RF_FRFMSB_864							$D8
#define RF_FRFMID_864							$00
#define RF_FRFLSB_864							$00
#define RF_FRFMSB_865							$D8
#define RF_FRFMID_865							$40
#define RF_FRFLSB_865							$00
#define RF_FRFMSB_866							$D8
#define RF_FRFMID_866							$80
#define RF_FRFLSB_866							$00
#define RF_FRFMSB_867							$D8
#define RF_FRFMID_867							$C0
#define RF_FRFLSB_867							$00
#define RF_FRFMSB_868							$D9
#define RF_FRFMID_868							$00
#define RF_FRFLSB_868							$00
#define RF_FRFMSB_869							$D9
#define RF_FRFMID_869							$40
#define RF_FRFLSB_869							$00
#define RF_FRFMSB_870							$D9
#define RF_FRFMID_870							$80
#define RF_FRFLSB_870							$00
'' 915Mhz band
#define RF_FRFMSB_902							$E1
#define RF_FRFMID_902							$80
#define RF_FRFLSB_902							$00
#define RF_FRFMSB_903							$E1
#define RF_FRFMID_903							$C0
#define RF_FRFLSB_903							$00
#define RF_FRFMSB_904							$E2
#define RF_FRFMID_904							$00
#define RF_FRFLSB_904							$00
#define RF_FRFMSB_905							$E2
#define RF_FRFMID_905							$40
#define RF_FRFLSB_905							$00
#define RF_FRFMSB_906							$E2
#define RF_FRFMID_906							$80
#define RF_FRFLSB_906							$00
#define RF_FRFMSB_907							$E2
#define RF_FRFMID_907							$C0
#define RF_FRFLSB_907							$00
#define RF_FRFMSB_908							$E3
#define RF_FRFMID_908							$00
#define RF_FRFLSB_908							$00
#define RF_FRFMSB_909							$E3
#define RF_FRFMID_909							$40
#define RF_FRFLSB_909							$00
#define RF_FRFMSB_910							$E3
#define RF_FRFMID_910							$80
#define RF_FRFLSB_910							$00
#define RF_FRFMSB_911							$E3
#define RF_FRFMID_911							$C0
#define RF_FRFLSB_911							$00
#define RF_FRFMSB_912							$E4
#define RF_FRFMID_912							$00
#define RF_FRFLSB_912							$00
#define RF_FRFMSB_913							$E4
#define RF_FRFMID_913							$40
#define RF_FRFLSB_913							$00
#define RF_FRFMSB_914							$E4
#define RF_FRFMID_914							$80
#define RF_FRFLSB_914							$00
#define RF_FRFMSB_915							$E4 
#define RF_FRFMID_915							$C0 
#define RF_FRFLSB_915							$00 
#define RF_FRFMSB_916							$E5
#define RF_FRFMID_916							$00
#define RF_FRFLSB_916							$00
#define RF_FRFMSB_917							$E5
#define RF_FRFMID_917							$40
#define RF_FRFLSB_917							$00
#define RF_FRFMSB_918							$E5
#define RF_FRFMID_918							$80
#define RF_FRFLSB_918							$00
#define RF_FRFMSB_919							$E5
#define RF_FRFMID_919							$C0
#define RF_FRFLSB_919							$00
#define RF_FRFMSB_920							$E6
#define RF_FRFMID_920							$00
#define RF_FRFLSB_920							$00
#define RF_FRFMSB_921							$E6
#define RF_FRFMID_921							$40
#define RF_FRFLSB_921							$00
#define RF_FRFMSB_922							$E6
#define RF_FRFMID_922							$80
#define RF_FRFLSB_922							$00
#define RF_FRFMSB_923							$E6
#define RF_FRFMID_923							$C0
#define RF_FRFLSB_923							$00
#define RF_FRFMSB_924							$E7
#define RF_FRFMID_924							$00
#define RF_FRFLSB_924							$00
#define RF_FRFMSB_925							$E7
#define RF_FRFMID_925							$40
#define RF_FRFLSB_925							$00
#define RF_FRFMSB_926							$E7
#define RF_FRFMID_926							$80
#define RF_FRFLSB_926							$00
#define RF_FRFMSB_927							$E7
#define RF_FRFMID_927							$C0
#define RF_FRFLSB_927							$00
#define RF_FRFMSB_928							$E8
#define RF_FRFMID_928							$00
#define RF_FRFLSB_928							$00

'' RegOsc1
#define RF_OSC1_RCCAL_START				$80
#define RF_OSC1_RCCAL_DONE				$40

'' RegAfcCtrl
#define RF_AFCLOWBETA_ON					$20
#define RF_AFCLOWBETA_OFF					$00

'' RegLowBat
#define RF_LOWBAT_MONITOR					$10
#define RF_LOWBAT_ON							$08
#define RF_LOWBAT_OFF							$00 

#define RF_LOWBAT_TRIM_1695				$00
#define RF_LOWBAT_TRIM_1764				$01
#define RF_LOWBAT_TRIM_1835				$02 
#define RF_LOWBAT_TRIM_1905				$03
#define RF_LOWBAT_TRIM_1976				$04
#define RF_LOWBAT_TRIM_2045				$05
#define RF_LOWBAT_TRIM_2116				$06
#define RF_LOWBAT_TRIM_2185				$07


'' RegListen1
#define RF_LISTEN1_RESOL_64				$50
#define RF_LISTEN1_RESOL_4100			$A0 
#define RF_LISTEN1_RESOL_262000		$F0

#define RF_LISTEN1_CRITERIA_RSSI				  $00 
#define RF_LISTEN1_CRITERIA_RSSIANDSYNC	  $08

#define RF_LISTEN1_END_00						      $00
#define RF_LISTEN1_END_01						      $02 
#define RF_LISTEN1_END_10						      $04


'' RegListen2
#define RF_LISTEN2_COEFIDLE_VALUE				$F5

'' RegListen3
#define RF_LISTEN3_COEFRX_VALUE					$20

'' RegPaLevel
#define RF_PALEVEL_PA0_ON		  $80 
#define RF_PALEVEL_PA0_OFF		$00
#define RF_PALEVEL_PA1_ON			$40
#define RF_PALEVEL_PA1_OFF		$00 
#define RF_PALEVEL_PA2_ON			$20
#define RF_PALEVEL_PA2_OFF		$00 

#define RF_PALEVEL_OUTPUTPOWER_00000			$00
#define RF_PALEVEL_OUTPUTPOWER_00001			$01
#define RF_PALEVEL_OUTPUTPOWER_00010			$02
#define RF_PALEVEL_OUTPUTPOWER_00011			$03
#define RF_PALEVEL_OUTPUTPOWER_00100			$04
#define RF_PALEVEL_OUTPUTPOWER_00101			$05
#define RF_PALEVEL_OUTPUTPOWER_00110			$06
#define RF_PALEVEL_OUTPUTPOWER_00111			$07
#define RF_PALEVEL_OUTPUTPOWER_01000			$08
#define RF_PALEVEL_OUTPUTPOWER_01001			$09
#define RF_PALEVEL_OUTPUTPOWER_01010			$0A
#define RF_PALEVEL_OUTPUTPOWER_01011			$0B
#define RF_PALEVEL_OUTPUTPOWER_01100			$0C
#define RF_PALEVEL_OUTPUTPOWER_01101			$0D
#define RF_PALEVEL_OUTPUTPOWER_01110			$0E
#define RF_PALEVEL_OUTPUTPOWER_01111			$0F
#define RF_PALEVEL_OUTPUTPOWER_10000			$10
#define RF_PALEVEL_OUTPUTPOWER_10001			$11
#define RF_PALEVEL_OUTPUTPOWER_10010			$12
#define RF_PALEVEL_OUTPUTPOWER_10011			$13
#define RF_PALEVEL_OUTPUTPOWER_10100			$14
#define RF_PALEVEL_OUTPUTPOWER_10101			$15
#define RF_PALEVEL_OUTPUTPOWER_10110			$16
#define RF_PALEVEL_OUTPUTPOWER_10111			$17
#define RF_PALEVEL_OUTPUTPOWER_11000			$18
#define RF_PALEVEL_OUTPUTPOWER_11001			$19
#define RF_PALEVEL_OUTPUTPOWER_11010			$1A
#define RF_PALEVEL_OUTPUTPOWER_11011			$1B
#define RF_PALEVEL_OUTPUTPOWER_11100			$1C
#define RF_PALEVEL_OUTPUTPOWER_11101			$1D
#define RF_PALEVEL_OUTPUTPOWER_11110			$1E
#define RF_PALEVEL_OUTPUTPOWER_11111			$1F 


'' RegPaRamp
#define RF_PARAMP_3400						$00
#define RF_PARAMP_2000						$01
#define RF_PARAMP_1000						$02
#define RF_PARAMP_500							$03
#define RF_PARAMP_250							$04
#define RF_PARAMP_125							$05
#define RF_PARAMP_100							$06
#define RF_PARAMP_62							$07
#define RF_PARAMP_50							$08
#define RF_PARAMP_40							$09 
#define RF_PARAMP_31							$0A
#define RF_PARAMP_25							$0B
#define RF_PARAMP_20							$0C
#define RF_PARAMP_15							$0D
#define RF_PARAMP_12							$0E
#define RF_PARAMP_10							$0F


'' RegOcp
#define RF_OCP_OFF								$0F
#define RF_OCP_ON								  $1A 

#define RF_OCP_TRIM_45						$00
#define RF_OCP_TRIM_50						$01
#define RF_OCP_TRIM_55						$02
#define RF_OCP_TRIM_60						$03
#define RF_OCP_TRIM_65						$04
#define RF_OCP_TRIM_70						$05
#define RF_OCP_TRIM_75						$06
#define RF_OCP_TRIM_80						$07
#define RF_OCP_TRIM_85						$08
#define RF_OCP_TRIM_90						$09
#define RF_OCP_TRIM_95						$0A
#define RF_OCP_TRIM_100						$0B 
#define RF_OCP_TRIM_105						$0C
#define RF_OCP_TRIM_110						$0D
#define RF_OCP_TRIM_115						$0E
#define RF_OCP_TRIM_120						$0F


'' RegAgcRef
#define RF_AGCREF_AUTO_ON					$40 
#define RF_AGCREF_AUTO_OFF				$00

#define RF_AGCREF_LEVEL_MINUS80		$00 
#define RF_AGCREF_LEVEL_MINUS81		$01
#define RF_AGCREF_LEVEL_MINUS82		$02
#define RF_AGCREF_LEVEL_MINUS83		$03
#define RF_AGCREF_LEVEL_MINUS84		$04
#define RF_AGCREF_LEVEL_MINUS85		$05
#define RF_AGCREF_LEVEL_MINUS86		$06
#define RF_AGCREF_LEVEL_MINUS87		$07
#define RF_AGCREF_LEVEL_MINUS88		$08
#define RF_AGCREF_LEVEL_MINUS89		$09
#define RF_AGCREF_LEVEL_MINUS90		$0A
#define RF_AGCREF_LEVEL_MINUS91		$0B
#define RF_AGCREF_LEVEL_MINUS92		$0C
#define RF_AGCREF_LEVEL_MINUS93		$0D
#define RF_AGCREF_LEVEL_MINUS94		$0E
#define RF_AGCREF_LEVEL_MINUS95		$0F
#define RF_AGCREF_LEVEL_MINUS96		$10
#define RF_AGCREF_LEVEL_MINUS97		$11
#define RF_AGCREF_LEVEL_MINUS98		$12
#define RF_AGCREF_LEVEL_MINUS99		$13
#define RF_AGCREF_LEVEL_MINUS100	$14
#define RF_AGCREF_LEVEL_MINUS101	$15
#define RF_AGCREF_LEVEL_MINUS102	$16
#define RF_AGCREF_LEVEL_MINUS103	$17
#define RF_AGCREF_LEVEL_MINUS104	$18
#define RF_AGCREF_LEVEL_MINUS105	$19
#define RF_AGCREF_LEVEL_MINUS106	$1A
#define RF_AGCREF_LEVEL_MINUS107	$1B
#define RF_AGCREF_LEVEL_MINUS108	$1C
#define RF_AGCREF_LEVEL_MINUS109	$1D
#define RF_AGCREF_LEVEL_MINUS110	$1E
#define RF_AGCREF_LEVEL_MINUS111	$1F
#define RF_AGCREF_LEVEL_MINUS112	$20
#define RF_AGCREF_LEVEL_MINUS113	$21
#define RF_AGCREF_LEVEL_MINUS114	$22
#define RF_AGCREF_LEVEL_MINUS115	$23
#define RF_AGCREF_LEVEL_MINUS116	$24
#define RF_AGCREF_LEVEL_MINUS117	$25
#define RF_AGCREF_LEVEL_MINUS118	$26
#define RF_AGCREF_LEVEL_MINUS119	$27
#define RF_AGCREF_LEVEL_MINUS120	$28
#define RF_AGCREF_LEVEL_MINUS121	$29
#define RF_AGCREF_LEVEL_MINUS122	$2A
#define RF_AGCREF_LEVEL_MINUS123	$2B
#define RF_AGCREF_LEVEL_MINUS124	$2C
#define RF_AGCREF_LEVEL_MINUS125	$2D
#define RF_AGCREF_LEVEL_MINUS126	$2E
#define RF_AGCREF_LEVEL_MINUS127	$2F
#define RF_AGCREF_LEVEL_MINUS128	$30
#define RF_AGCREF_LEVEL_MINUS129	$31
#define RF_AGCREF_LEVEL_MINUS130	$32
#define RF_AGCREF_LEVEL_MINUS131	$33
#define RF_AGCREF_LEVEL_MINUS132	$34
#define RF_AGCREF_LEVEL_MINUS133	$35
#define RF_AGCREF_LEVEL_MINUS134	$36
#define RF_AGCREF_LEVEL_MINUS135	$37
#define RF_AGCREF_LEVEL_MINUS136	$38
#define RF_AGCREF_LEVEL_MINUS137	$39
#define RF_AGCREF_LEVEL_MINUS138	$3A
#define RF_AGCREF_LEVEL_MINUS139	$3B
#define RF_AGCREF_LEVEL_MINUS140	$3C
#define RF_AGCREF_LEVEL_MINUS141	$3D
#define RF_AGCREF_LEVEL_MINUS142	$3E
#define RF_AGCREF_LEVEL_MINUS143	$3F


'' RegAgcThresh1
#define RF_AGCTHRESH1_SNRMARGIN_000		$00
#define RF_AGCTHRESH1_SNRMARGIN_001		$20
#define RF_AGCTHRESH1_SNRMARGIN_010		$40
#define RF_AGCTHRESH1_SNRMARGIN_011		$60
#define RF_AGCTHRESH1_SNRMARGIN_100		$80
#define RF_AGCTHRESH1_SNRMARGIN_101		$A0 
#define RF_AGCTHRESH1_SNRMARGIN_110		$C0
#define RF_AGCTHRESH1_SNRMARGIN_111		$E0

#define RF_AGCTHRESH1_STEP1_0					$00
#define RF_AGCTHRESH1_STEP1_1					$01
#define RF_AGCTHRESH1_STEP1_2					$02
#define RF_AGCTHRESH1_STEP1_3					$03
#define RF_AGCTHRESH1_STEP1_4					$04
#define RF_AGCTHRESH1_STEP1_5					$05
#define RF_AGCTHRESH1_STEP1_6					$06
#define RF_AGCTHRESH1_STEP1_7					$07
#define RF_AGCTHRESH1_STEP1_8					$08
#define RF_AGCTHRESH1_STEP1_9					$09
#define RF_AGCTHRESH1_STEP1_10				$0A
#define RF_AGCTHRESH1_STEP1_11				$0B
#define RF_AGCTHRESH1_STEP1_12				$0C
#define RF_AGCTHRESH1_STEP1_13				$0D
#define RF_AGCTHRESH1_STEP1_14				$0E
#define RF_AGCTHRESH1_STEP1_15				$0F
#define RF_AGCTHRESH1_STEP1_16				$10 
#define RF_AGCTHRESH1_STEP1_17				$11
#define RF_AGCTHRESH1_STEP1_18				$12
#define RF_AGCTHRESH1_STEP1_19				$13
#define RF_AGCTHRESH1_STEP1_20				$14
#define RF_AGCTHRESH1_STEP1_21				$15
#define RF_AGCTHRESH1_STEP1_22				$16
#define RF_AGCTHRESH1_STEP1_23				$17
#define RF_AGCTHRESH1_STEP1_24				$18
#define RF_AGCTHRESH1_STEP1_25				$19
#define RF_AGCTHRESH1_STEP1_26				$1A
#define RF_AGCTHRESH1_STEP1_27				$1B
#define RF_AGCTHRESH1_STEP1_28				$1C
#define RF_AGCTHRESH1_STEP1_29				$1D
#define RF_AGCTHRESH1_STEP1_30				$1E
#define RF_AGCTHRESH1_STEP1_31				$1F


'' RegAgcThresh2
#define RF_AGCTHRESH2_STEP2_0					$00
#define RF_AGCTHRESH2_STEP2_1					$10
#define RF_AGCTHRESH2_STEP2_2					$20
#define RF_AGCTHRESH2_STEP2_3					$30 
#define RF_AGCTHRESH2_STEP2_4					$40
#define RF_AGCTHRESH2_STEP2_5					$50
#define RF_AGCTHRESH2_STEP2_6					$60
#define RF_AGCTHRESH2_STEP2_7					$70	'' default
#define RF_AGCTHRESH2_STEP2_8					$80
#define RF_AGCTHRESH2_STEP2_9					$90
#define RF_AGCTHRESH2_STEP2_10				$A0
#define RF_AGCTHRESH2_STEP2_11				$B0
#define RF_AGCTHRESH2_STEP2_12				$C0
#define RF_AGCTHRESH2_STEP2_13				$D0
#define RF_AGCTHRESH2_STEP2_14				$E0
#define RF_AGCTHRESH2_STEP2_15				$F0

#define RF_AGCTHRESH2_STEP3_0					$00
#define RF_AGCTHRESH2_STEP3_1					$01
#define RF_AGCTHRESH2_STEP3_2					$02
#define RF_AGCTHRESH2_STEP3_3					$03
#define RF_AGCTHRESH2_STEP3_4					$04
#define RF_AGCTHRESH2_STEP3_5					$05
#define RF_AGCTHRESH2_STEP3_6					$06
#define RF_AGCTHRESH2_STEP3_7					$07
#define RF_AGCTHRESH2_STEP3_8					$08
#define RF_AGCTHRESH2_STEP3_9					$09
#define RF_AGCTHRESH2_STEP3_10				$0A
#define RF_AGCTHRESH2_STEP3_11				$0B 
#define RF_AGCTHRESH2_STEP3_12				$0C
#define RF_AGCTHRESH2_STEP3_13				$0D
#define RF_AGCTHRESH2_STEP3_14				$0E
#define RF_AGCTHRESH2_STEP3_15				$0F


'' RegAgcThresh3
#define RF_AGCTHRESH3_STEP4_0					$00
#define RF_AGCTHRESH3_STEP4_1					$10
#define RF_AGCTHRESH3_STEP4_2					$20
#define RF_AGCTHRESH3_STEP4_3					$30
#define RF_AGCTHRESH3_STEP4_4					$40
#define RF_AGCTHRESH3_STEP4_5					$50
#define RF_AGCTHRESH3_STEP4_6					$60
#define RF_AGCTHRESH3_STEP4_7					$70
#define RF_AGCTHRESH3_STEP4_8					$80
#define RF_AGCTHRESH3_STEP4_9					$90 
#define RF_AGCTHRESH3_STEP4_10				$A0
#define RF_AGCTHRESH3_STEP4_11				$B0
#define RF_AGCTHRESH3_STEP4_12				$C0
#define RF_AGCTHRESH3_STEP4_13				$D0
#define RF_AGCTHRESH3_STEP4_14				$E0
#define RF_AGCTHRESH3_STEP4_15				$F0

#define RF_AGCTHRESH3_STEP5_0					$00
#define RF_AGCTHRESH3_STEP5_1					$01
#define RF_AGCTHRESH3_STEP5_2					$02
#define RF_AGCTHRESH3_STEP5_3					$03
#define RF_AGCTHRESH3_STEP5_4					$04
#define RF_AGCTHRESH3_STEP5_5					$05
#define RF_AGCTHRESH3_STEP5_6					$06
#define RF_AGCTHRESH3_STEP5_7					$07
#define RF_AGCTHRES33_STEP5_8					$08
#define RF_AGCTHRESH3_STEP5_9					$09
#define RF_AGCTHRESH3_STEP5_10				$0A
#define RF_AGCTHRESH3_STEP5_11				$0B 
#define RF_AGCTHRESH3_STEP5_12				$0C
#define RF_AGCTHRESH3_STEP5_13				$0D
#define RF_AGCTHRESH3_STEP5_14				$0E
#define RF_AGCTHRESH3_STEP5_15				$0F


'' RegLna
#define RF_LNA_ZIN_50							    $00
#define RF_LNA_ZIN_200							  $80 

#define RF_LNA_LOWPOWER_OFF						$00 
#define RF_LNA_LOWPOWER_ON						$40

#define RF_LNA_CURRENTGAIN						$38

#define RF_LNA_GAINSELECT_AUTO				$00 
#define RF_LNA_GAINSELECT_MAX					$01
#define RF_LNA_GAINSELECT_MAXMINUS6		$02
#define RF_LNA_GAINSELECT_MAXMINUS12	$03
#define RF_LNA_GAINSELECT_MAXMINUS24	$04
#define RF_LNA_GAINSELECT_MAXMINUS36	$05
#define RF_LNA_GAINSELECT_MAXMINUS48	$06


'' RegRxBw
#define RF_RXBW_DCCFREQ_000						$00
#define RF_RXBW_DCCFREQ_001						$20
#define RF_RXBW_DCCFREQ_010						$40 
#define RF_RXBW_DCCFREQ_011						$60
#define RF_RXBW_DCCFREQ_100						$80
#define RF_RXBW_DCCFREQ_101						$A0
#define RF_RXBW_DCCFREQ_110						$C0
#define RF_RXBW_DCCFREQ_111						$E0

#define RF_RXBW_MANT_16							  $00
#define RF_RXBW_MANT_20							  $08
#define RF_RXBW_MANT_24							  $10 

#define RF_RXBW_EXP_0							    $00
#define RF_RXBW_EXP_1		  			  		$01
#define RF_RXBW_EXP_2			  	  			$02
#define RF_RXBW_EXP_3				    			$03
#define RF_RXBW_EXP_4			  		  		$04
#define RF_RXBW_EXP_5		  				  	$05 
#define RF_RXBW_EXP_6	  						  $06
#define RF_RXBW_EXP_7						  	  $07


'' RegAfcBw
#define RF_AFCBW_DCCFREQAFC_000				$00
#define RF_AFCBW_DCCFREQAFC_001				$20
#define RF_AFCBW_DCCFREQAFC_010				$40
#define RF_AFCBW_DCCFREQAFC_011				$60
#define RF_AFCBW_DCCFREQAFC_100				$80 
#define RF_AFCBW_DCCFREQAFC_101				$A0
#define RF_AFCBW_DCCFREQAFC_110				$C0
#define RF_AFCBW_DCCFREQAFC_111				$E0

#define RF_AFCBW_MANTAFC_16						$00
#define RF_AFCBW_MANTAFC_20						$08 
#define RF_AFCBW_MANTAFC_24						$10

#define RF_AFCBW_EXPAFC_0						  $00
#define RF_AFCBW_EXPAFC_1	  					$01
#define RF_AFCBW_EXPAFC_2		  				$02
#define RF_AFCBW_EXPAFC_3			  			$03 
#define RF_AFCBW_EXPAFC_4				  		$04
#define RF_AFCBW_EXPAFC_5					  	$05
#define RF_AFCBW_EXPAFC_6						  $06
#define RF_AFCBW_EXPAFC_7					  	$07


'' RegOokPeak
#define RF_OOKPEAK_THRESHTYPE_FIXED				$00
#define RF_OOKPEAK_THRESHTYPE_PEAK				$40 
#define RF_OOKPEAK_THRESHTYPE_AVERAGE			$80

#define RF_OOKPEAK_PEAKTHRESHSTEP_000			$00 
#define RF_OOKPEAK_PEAKTHRESHSTEP_001			$08
#define RF_OOKPEAK_PEAKTHRESHSTEP_010			$10
#define RF_OOKPEAK_PEAKTHRESHSTEP_011			$18
#define RF_OOKPEAK_PEAKTHRESHSTEP_100			$20
#define RF_OOKPEAK_PEAKTHRESHSTEP_101			$28
#define RF_OOKPEAK_PEAKTHRESHSTEP_110			$30
#define RF_OOKPEAK_PEAKTHRESHSTEP_111			$38

#define RF_OOKPEAK_PEAKTHRESHDEC_000			$00 
#define RF_OOKPEAK_PEAKTHRESHDEC_001			$01
#define RF_OOKPEAK_PEAKTHRESHDEC_010			$02
#define RF_OOKPEAK_PEAKTHRESHDEC_011			$03
#define RF_OOKPEAK_PEAKTHRESHDEC_100			$04
#define RF_OOKPEAK_PEAKTHRESHDEC_101			$05
#define RF_OOKPEAK_PEAKTHRESHDEC_110			$06
#define RF_OOKPEAK_PEAKTHRESHDEC_111			$07


'' RegOokAvg
#define RF_OOKAVG_AVERAGETHRESHFILT_00		$00
#define RF_OOKAVG_AVERAGETHRESHFILT_01		$40
#define RF_OOKAVG_AVERAGETHRESHFILT_10		$80 
#define RF_OOKAVG_AVERAGETHRESHFILT_11		$C0


'' RegOokFix
#define RF_OOKFIX_FIXEDTHRESH_VALUE				$06 


'' RegAfcFei
#define RF_AFCFEI_FEI_DONE						    $40
#define RF_AFCFEI_FEI_START						    $20
#define RF_AFCFEI_AFC_DONE						    $10
#define RF_AFCFEI_AFCAUTOCLEAR_ON			  	$08
#define RF_AFCFEI_AFCAUTOCLEAR_OFF				$00 

#define RF_AFCFEI_AFCAUTO_ON					    $04
#define RF_AFCFEI_AFCAUTO_OFF					    $00 

#define RF_AFCFEI_AFC_CLEAR						    $02
#define RF_AFCFEI_AFC_START						    $01

'' RegRssiConfig
#define RF_RSSI_FASTRX_ON						      $08
#define RF_RSSI_FASTRX_OFF						    $00 
#define RF_RSSI_DONE							        $02
#define RF_RSSI_START							        $01


'' RegDioMapping1
#define RF_DIOMAPPING1_DIO0_00	  				$00 
#define RF_DIOMAPPING1_DIO0_01		  			$40
#define RF_DIOMAPPING1_DIO0_10			  		$80
#define RF_DIOMAPPING1_DIO0_11				  	$C0

#define RF_DIOMAPPING1_DIO1_00   					$00 
#define RF_DIOMAPPING1_DIO1_01		  			$10
#define RF_DIOMAPPING1_DIO1_10			  		$20
#define RF_DIOMAPPING1_DIO1_11				  	$30

#define RF_DIOMAPPING1_DIO2_00	  				$00 
#define RF_DIOMAPPING1_DIO2_01		  			$04
#define RF_DIOMAPPING1_DIO2_10			  		$08
#define RF_DIOMAPPING1_DIO2_11				  	$0C

#define RF_DIOMAPPING1_DIO3_00	  				$00 
#define RF_DIOMAPPING1_DIO3_01		  			$01
#define RF_DIOMAPPING1_DIO3_10			  		$02
#define RF_DIOMAPPING1_DIO3_11				  	$03


'' RegDioMapping2
#define RF_DIOMAPPING2_DIO4_00	  				$00 
#define RF_DIOMAPPING2_DIO4_01		  			$40
#define RF_DIOMAPPING2_DIO4_10			  		$80
#define RF_DIOMAPPING2_DIO4_11				  	$C0

#define RF_DIOMAPPING2_DIO5_00	  				$00 
#define RF_DIOMAPPING2_DIO5_01		  			$10
#define RF_DIOMAPPING2_DIO5_10			  		$20
#define RF_DIOMAPPING2_DIO5_11				  	$30

#define RF_DIOMAPPING2_CLKOUT_32	  			$00
#define RF_DIOMAPPING2_CLKOUT_16		  		$01
#define RF_DIOMAPPING2_CLKOUT_8				  	$02
#define RF_DIOMAPPING2_CLKOUT_4					  $03
#define RF_DIOMAPPING2_CLKOUT_2		  			$04
#define RF_DIOMAPPING2_CLKOUT_1			  		$05
#define RF_DIOMAPPING2_CLKOUT_RC			  	$06
#define RF_DIOMAPPING2_CLKOUT_OFF				  $07 


'' RegIrqFlags1
#define RF_IRQFLAGS1_MODEREADY					  $80
#define RF_IRQFLAGS1_RXREADY					    $40
#define RF_IRQFLAGS1_TXREADY					    $20
#define RF_IRQFLAGS1_PLLLOCK					    $10
#define RF_IRQFLAGS1_RSSI						      $08
#define RF_IRQFLAGS1_TIMEOUT					    $04
#define RF_IRQFLAGS1_AUTOMODE					    $02
#define RF_IRQFLAGS1_SYNCADDRESSMATCH			$01

'' RegIrqFlags2
#define RF_IRQFLAGS2_FIFOFULL					    $80
#define RF_IRQFLAGS2_FIFONOTEMPTY				  $40
#define RF_IRQFLAGS2_FIFOLEVEL					  $20
#define RF_IRQFLAGS2_FIFOOVERRUN				  $10
#define RF_IRQFLAGS2_PACKETSENT					  $08
#define RF_IRQFLAGS2_PAYLOADREADY				  $04
#define RF_IRQFLAGS2_CRCOK						    $02
#define RF_IRQFLAGS2_LOWBAT						    $01

'' RegRssiThresh
#define RF_RSSITHRESH_VALUE						    $E4 

'' RegRxTimeout1
#define RF_RXTIMEOUT1_RXSTART_VALUE				$00 

'' RegRxTimeout2
#define RF_RXTIMEOUT2_RSSITHRESH_VALUE		$00 

'' RegPreamble
#define RF_PREAMBLESIZE_MSB_VALUE				  $00 
#define RF_PREAMBLESIZE_LSB_VALUE				  $03 


'' RegSyncConfig
#define RF_SYNC_ON								$80 
#define RF_SYNC_OFF								$00

#define RF_SYNC_FIFOFILL_AUTO			$00 
#define RF_SYNC_FIFOFILL_MANUAL		$40

#define RF_SYNC_SIZE_1						$00
#define RF_SYNC_SIZE_2						$08
#define RF_SYNC_SIZE_3						$10
#define RF_SYNC_SIZE_4						$18 
#define RF_SYNC_SIZE_5						$20
#define RF_SYNC_SIZE_6						$28
#define RF_SYNC_SIZE_7						$30
#define RF_SYNC_SIZE_8						$38

#define RF_SYNC_TOL_0							$00 
#define RF_SYNC_TOL_1							$01
#define RF_SYNC_TOL_2							$02
#define RF_SYNC_TOL_3							$03
#define RF_SYNC_TOL_4							$04
#define RF_SYNC_TOL_5							$05
#define RF_SYNC_TOL_6							$06
#define RF_SYNC_TOL_7							$07


'' RegSyncValue1-8
#define RF_SYNC_BYTE1_VALUE				$00 
#define RF_SYNC_BYTE2_VALUE				$00 
#define RF_SYNC_BYTE3_VALUE				$00 
#define RF_SYNC_BYTE4_VALUE				$00 
#define RF_SYNC_BYTE5_VALUE				$00 
#define RF_SYNC_BYTE6_VALUE				$00 
#define RF_SYNC_BYTE7_VALUE				$00 
#define RF_SYNC_BYTE8_VALUE				$00 


'' RegPacketConfig1
#define RF_PACKET1_FORMAT_FIXED				$00 
#define RF_PACKET1_FORMAT_VARIABLE		$80

#define RF_PACKET1_DCFREE_OFF					$00 
#define RF_PACKET1_DCFREE_MANCHESTER	$20
#define RF_PACKET1_DCFREE_WHITENING		$40

#define RF_PACKET1_CRC_ON						  $10 
#define RF_PACKET1_CRC_OFF						$00

#define RF_PACKET1_CRCAUTOCLEAR_ON		$00 
#define RF_PACKET1_CRCAUTOCLEAR_OFF		$08

#define RF_PACKET1_ADRSFILTERING_OFF			      $00 
#define RF_PACKET1_ADRSFILTERING_NODE			      $02
#define RF_PACKET1_ADRSFILTERING_NODEBROADCAST	$04


'' RegPayloadLength
#define RF_PAYLOADLENGTH_VALUE					$40 

'' RegBroadcastAdrs
#define RF_BROADCASTADDRESS_VALUE				$00


'' RegAutoModes
#define RF_AUTOMODES_ENTER_OFF					      $00 
#define RF_AUTOMODES_ENTER_FIFONOTEMPTY			  $20
#define RF_AUTOMODES_ENTER_FIFOLEVEL			    $40
#define RF_AUTOMODES_ENTER_CRCOK				      $60
#define RF_AUTOMODES_ENTER_PAYLOADREADY			  $80
#define RF_AUTOMODES_ENTER_SYNCADRSMATCH		  $A0
#define RF_AUTOMODES_ENTER_PACKETSENT			    $C0
#define RF_AUTOMODES_ENTER_FIFOEMPTY			    $E0

#define RF_AUTOMODES_EXIT_OFF					        $00 
#define RF_AUTOMODES_EXIT_FIFOEMPTY		  		  $04
#define RF_AUTOMODES_EXIT_FIFOLEVEL	  			  $08
#define RF_AUTOMODES_EXIT_CRCOK					      $0C
#define RF_AUTOMODES_EXIT_PAYLOADREADY		  	$10
#define RF_AUTOMODES_EXIT_SYNCADRSMATCH			  $14
#define RF_AUTOMODES_EXIT_PACKETSENT		  	  $18
#define RF_AUTOMODES_EXIT_RXTIMEOUT				    $1C

#define RF_AUTOMODES_INTERMEDIATE_SLEEP			  $00 
#define RF_AUTOMODES_INTERMEDIATE_STANDBY		  $01
#define RF_AUTOMODES_INTERMEDIATE_RECEIVER		$02
#define RF_AUTOMODES_INTERMEDIATE_TRANSMITTER	$03


'' RegFifoThresh
#define RF_FIFOTHRESH_TXSTART_FIFOTHRESH		  $00
#define RF_FIFOTHRESH_TXSTART_FIFONOTEMPTY		$80 

#define RF_FIFOTHRESH_VALUE						        $0F 


'' RegPacketConfig2
#define RF_PACKET2_RXRESTARTDELAY_1BIT			  $00 
#define RF_PACKET2_RXRESTARTDELAY_2BITS			  $10
#define RF_PACKET2_RXRESTARTDELAY_4BITS	  		$20
#define RF_PACKET2_RXRESTARTDELAY_8BITS		  	$30
#define RF_PACKET2_RXRESTARTDELAY_16BITS		  $40
#define RF_PACKET2_RXRESTARTDELAY_32BITS  		$50
#define RF_PACKET2_RXRESTARTDELAY_64BITS	  	$60
#define RF_PACKET2_RXRESTARTDELAY_128BITS		  $70
#define RF_PACKET2_RXRESTARTDELAY_256BITS 		$80
#define RF_PACKET2_RXRESTARTDELAY_512BITS	  	$90
#define RF_PACKET2_RXRESTARTDELAY_1024BITS		$A0
#define RF_PACKET2_RXRESTARTDELAY_2048BITS		$B0
#define RF_PACKET2_RXRESTARTDELAY_NONE			  $C0
#define RF_PACKET2_RXRESTART					        $04

#define RF_PACKET2_AUTORXRESTART_ON				    $02 
#define RF_PACKET2_AUTORXRESTART_OFF			    $00

#define RF_PACKET2_AES_ON						          $01
#define RF_PACKET2_AES_OFF						        $00 


'' RegAesKey1-16
#define RF_AESKEY1_VALUE						$00 
#define RF_AESKEY2_VALUE						$00 
#define RF_AESKEY3_VALUE						$00 
#define RF_AESKEY4_VALUE						$00 
#define RF_AESKEY5_VALUE						$00 
#define RF_AESKEY6_VALUE						$00 
#define RF_AESKEY7_VALUE						$00 
#define RF_AESKEY8_VALUE						$00 
#define RF_AESKEY9_VALUE						$00 
#define RF_AESKEY10_VALUE						$00 
#define RF_AESKEY11_VALUE						$00 
#define RF_AESKEY12_VALUE						$00 
#define RF_AESKEY13_VALUE						$00 
#define RF_AESKEY14_VALUE						$00 
#define RF_AESKEY15_VALUE						$00 
#define RF_AESKEY16_VALUE						$00 


'' RegTemp1
#define RF_TEMP1_MEAS_START					$08
#define RF_TEMP1_MEAS_RUNNING				$04
#define RF_TEMP1_ADCLOWPOWER_ON			$01 
#define RF_TEMP1_ADCLOWPOWER_OFF		$00

'' RegTestDagc
#define RF_DAGC_NORMAL              $00 
#define RF_DAGC_IMPROVED_LOWBETA1   $20 
#define RF_DAGC_IMPROVED_LOWBETA0   $30 

