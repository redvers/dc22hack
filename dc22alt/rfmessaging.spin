
#define DEBUG

VAR
  byte  rfstate ' 0 - RX mode, 1 - Request TX, 2 - TX mode

#include "RFM69registers.spin"

#ifdef MINIBADGE
#define RFNSS   17 
#define RFMOSI  15
#define RFMISO  14
#define RFSCK   16
#define RFRESET 18
#define RFDIO5  19
#define RFDIO4    23
#define RFDIO3    8
#define RFDIO2    20
#define RFDIO1    21
#define RFDIO0    22

' NSS was 22
' MOSI was 20
' MISO was 19
' SCK was 21
' RESET was 23
' DIO0 was 16

#else
#define RFNSS    2
#define RFMOSI   4
#define RFMISO   5
#define RFSCK    3
#define RFRESET  6
#define RFDIO5  
#define RFDIO4    
#define RFDIO3    
#define RFDIO2    
#define RFDIO1    
#define RFDIO0   0
#endif

#define networkID 1
#define nodeID    2

#define serialCR        13

VAR

  long  cog
  long  message[32]
  long  stack[200]

OBJ
#ifdef DEBUG
  fds:  "FullDuplexSerial"
#endif
  spi:  "SPI_Spin"
  'st :  "ASCII0_STREngine_1"
    

PUB configure | i,readval,tmp
#ifdef DEBUG
  fds.start(31, 30, 0, 115200)
  fds.str(string("Initializing configuration...", serialCR))
#endif
  spi.start(20,0)
'  strip.start(0, 7)

  high(RFRESET)
  pause(100)
  low(RFRESET)
  dira[RFRESET]~

  ' Eat our way through the configuration...
  repeat i from 0 TO 26
    wrregister(byte[@CONFIG][i*2], byte[@CONFIG][(i*2)+1])
    readval := rdregister(byte[@CONFIG][i*2])

  ' setMode(RF_OPMODE_STANDBY, REG_IRQFLAGS1, RF_IRQFLAGS1_MODEREADY)

'  wrregister(REG_OSC1, RF_OSC1_RCCAL_START)
'  repeat until ((rdregister(REG_OSC1) & RF_OSC1_RCCAL_DONE) <> 0)
'    pause(1000)   




  rfstate := 0
  wrregister(REG_OPMODE, (rdregister(REG_OPMODE) & $E3) | RF_OPMODE_RECEIVER)
  wrregister(REG_DIOMAPPING1, RF_DIOMAPPING1_DIO0_01)

  repeat tmp FROM 0 to 113
    readval := rdregister(tmp)

  tmp := rdregister(REG_OPMODE)

#ifdef DEBUG
  fds.str(string("Exitting configure method...", serialCR))
#endif


PUB setMode(mode, irqreg, modemask)
  wrregister(REG_OPMODE, (rdregister(REG_OPMODE) & $E3) | modemask)
  
  repeat while ((rdregister(irqreg) & modemask) == 0)
#ifdef DEBUG
    fds.str(string("Waiting for system to be ready...", serialCR))
#endif
    pause(100)


PUB sendMessage(xmessage) | i,j
  rfstate := 2
'  strip.set_all(strip.colorx(255,0,0,255))
  setMode(RF_OPMODE_STANDBY, REG_IRQFLAGS1, RF_IRQFLAGS1_MODEREADY)

  wrregister(REG_DIOMAPPING1, RF_DIOMAPPING1_DIO0_00)
  high(RFNSS)
  low(RFSCK)
  low(RFNSS)

  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, (REG_FIFO | $80))
  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, (StrSize(xmessage) + 3))
  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, 255)
  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, 1)
  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, 0)

#ifdef DEBUG
  fds.Str(string("Sending: "))
  fds.dec(StrSize(xmessage))
  fds.Str(string(serialCR))
#endif

  repeat i from 0 TO (StrSize(xmessage) - 1)
#ifdef DEBUG
    fds.tx(byte[xmessage][i])
#endif
    spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, byte[xmessage][i])

  high(RFNSS)

  wrregister(REG_OPMODE, (rdregister(REG_OPMODE) & $E3) | RF_OPMODE_TRANSMITTER)

  repeat while (ina[RFDIO0] == 0)
#ifdef DEBUG
    fds.Str(string("Waiting for TX to complete", serialCR))
#endif

'  strip.set_all(strip.colorx(0,0,0,0))


PUB messageWaiting
  high(RFNSS)
  low(RFSCK)
  low(RFNSS)

  if ina[RFDIO0] == 0
'    high(RFNSS)
#ifdef DEBUG
    fds.Str(string("Nope", serialCR))
#endif
    return 0
#ifdef DEBUG
'  high(RFNSS)
  fds.Str(string("Yup", serialCR))
#endif  

  return 1

PUB recvMessage | i, packetlen, tmpval
{{  
  if (rdregister(REG_IRQFLAGS2) & RF_IRQFLAGS2_PAYLOADREADY)
    wrregister(REG_PACKETCONFIG2, (rdregister(REG_PACKETCONFIG2) & $FB) | RF_PACKET2_RXRESTART)
#ifdef DEBUG
    fds.Str(string("I was deadlocked, huh..."))
#endif

  wrregister(REG_OPMODE, (rdregister(REG_OPMODE) & $E3) | RF_OPMODE_RECEIVER)
  wrregister(REG_DIOMAPPING1, RF_DIOMAPPING1_DIO0_01)
'  pause(200)
#ifdef DEBUG
  fds.Str(string("checking for active listening irq...", serialCR))
#endif

'  waitpeq(|< RFDIO0, |< RFDIO0, 0)
'  if (rfstate == 1)
'    sendMessage(string("Eat Me!"))
}}
  tmpval := rdregister(REG_RSSIVALUE)
'   strip.set_all(strip.colorx(0,255,0,((255 - tmpval)/4)))
  
#ifdef DEBUG
  fds.Str(string("Packet received!", serialCR))
#endif
'    pause(50)

#ifdef DEBUG
  fds.str(string("Packet length: "))
#endif

  packetlen := rdregister(REG_FIFO)
#ifdef DEBUG
  fds.dec(packetlen)

  fds.str(string("TargetID: "))
#endif

  tmpval := rdregister(REG_FIFO)

#ifdef DEBUG
  fds.dec(tmpval)
  fds.str(string("SenderID: "))
#endif
  
  tmpval := rdregister(REG_FIFO)
  

#ifdef DEBUG
  fds.dec(tmpval)

  fds.str(string("CTLbyte: "))
#endif

  tmpval := rdregister(REG_FIFO)

#ifdef DEBUG
  fds.dec(tmpval)
  fds.str(string(serialCR))
#endif

  low(RFNSS)
  repeat i FROM 0 TO (packetlen - 3)
    byte[message][i] := spi.SHIFTIN(RFMISO, RFSCK, spi#MSBPRE, 8)
#ifdef DEBUG
    fds.tx(byte[message][i])
#endif
    byte[message][i+1] := 0

  high(RFNSS)

#ifdef DEBUG
  fds.str(string(serialCR,"Got message: "))
  fds.str(message)
  fds.str(string(serialCR))
#endif

'  tmpval := rdregister(REG_RSSIVALUE)

'  strip.set_all(strip.colorx(0,0,0,0))
  

#ifdef DEBUG
  fds.dec(tmpval)
  fds.dec(byte[message][0])
  fds.str(string("<<< ---- This", serialCR))
#endif

  if (byte[message][0] == 76)
#ifdef DEBUG
    fds.str(string(serialCR,"Going LEFT", serialCR)) 
#endif   
    return 1


  if (byte[message][0] == 82)
#ifdef DEBUG
    fds.str(string(serialCR,"Going RIGHT", serialCR)) 
#endif   
    return 2

  if (byte[message][0] == 77)
#ifdef DEBUG
    fds.str(string(serialCR,"Going Neo", serialCR)) 
#endif   
    return 3


  return 0
  
  

PUB wrregister(register, value)
  high(RFNSS)
  low(RFSCK)
  low(RFNSS)

#ifdef DEBUG
  fds.str(string("Writing to register 0x"))
  fds.hex(register, 2)
  fds.str(string(": "))
  fds.bin(value, 8)
  fds.str(string(serialCR))
#endif

  register |= 128  

  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, register)
  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, value)

  high(RFNSS)



PUB rdregister(register) | regval
  high(RFNSS)
  low(RFSCK)
  low(RFNSS)

  spi.SHIFTOUT(RFMOSI, RFSCK, spi#MSBFIRST, 8, register)
  regval := spi.SHIFTIN(RFMISO, RFSCK, spi#MSBPRE, 8)
  high(RFNSS)

#ifdef DEBUG
  fds.str(string("Read register       0x"))
  fds.hex(register, 2)
  fds.str(string(": "))
  fds.bin(regval, 8)
  fds.str(string(serialCR))
#endif

  return regval


PRI pause(ms)
  waitcnt(clkfreq/1000*ms + cnt)

PUB high(Pin)
    dira[Pin]~~
    outa[Pin]~~

PUB low(Pin)
    dira[Pin]~~
    outa[Pin]~


DAT
'  CONFIG  byte REG_OPMODE, RF_OPMODE_SEQUENCER_ON | RF_OPMODE_LISTEN_OFF | RF_OPMODE_STANDBY
  CONFIG  byte REG_OPMODE, RF_OPMODE_SEQUENCER_ON | RF_OPMODE_LISTEN_OFF | RF_OPMODE_RECEIVER
          byte REG_DATAMODUL, RF_DATAMODUL_DATAMODE_PACKET | RF_DATAMODUL_MODULATIONTYPE_FSK | RF_DATAMODUL_MODULATIONSHAPING_00
          byte REG_BITRATEMSB, RF_BITRATEMSB_55555
          byte REG_BITRATELSB, RF_BITRATELSB_55555
          byte REG_FDEVMSB, RF_FDEVMSB_50000
          byte REG_FDEVLSB, RF_FDEVLSB_50000
          byte REG_FRFMSB, RF_FRFMSB_915
          byte REG_FRFMID, RF_FRFMID_915
          byte REG_FRFLSB, RF_FRFLSB_915
          byte REG_PALEVEL, RF_PALEVEL_PA0_ON | RF_PALEVEL_PA1_ON | RF_PALEVEL_PA2_ON | RF_PALEVEL_OUTPUTPOWER_11111
          byte REG_OCP, RF_OCP_ON | RF_OCP_TRIM_95
          byte REG_LNA,  RF_LNA_ZIN_200 | RF_LNA_CURRENTGAIN
          byte REG_RXBW, RF_RXBW_DCCFREQ_010 | RF_RXBW_MANT_24 | RF_RXBW_EXP_5
          byte REG_RXBW, RF_RXBW_DCCFREQ_010 | RF_RXBW_MANT_16 | RF_RXBW_EXP_2
          byte REG_DIOMAPPING1, RF_DIOMAPPING1_DIO0_01
          byte REG_RSSITHRESH, 220
          byte REG_PREAMBLELSB, RF_PREAMBLESIZE_LSB_VALUE
          byte REG_SYNCCONFIG, RF_SYNC_ON | RF_SYNC_FIFOFILL_AUTO | RF_SYNC_SIZE_2 | RF_SYNC_TOL_0
          byte REG_SYNCVALUE1, $AA
          byte REG_SYNCVALUE2, networkID
          byte REG_PACKETCONFIG1, RF_PACKET1_FORMAT_VARIABLE | RF_PACKET1_DCFREE_OFF | RF_PACKET1_CRC_ON | RF_PACKET1_CRCAUTOCLEAR_ON | RF_PACKET1_ADRSFILTERING_OFF
          byte REG_PAYLOADLENGTH, 66
          byte REG_NODEADRS, nodeID
          byte REG_FIFOTHRESH, RF_FIFOTHRESH_TXSTART_FIFONOTEMPTY | RF_FIFOTHRESH_VALUE
          byte REG_PACKETCONFIG2, RF_PACKET2_RXRESTARTDELAY_2BITS | RF_PACKET2_AUTORXRESTART_ON | RF_PACKET2_AES_OFF
          byte REG_TESTDAGC, RF_DAGC_IMPROVED_LOWBETA0
          byte REG_OCP, RF_OCP_OFF
