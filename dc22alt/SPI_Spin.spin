{{      
************************************************
* Propeller SPI Engine  ... Spin Version  v1.0 *
* Author: Beau Schwabe                         *
* Copyright (c) 2009 Parallax                  *
* See end of file for terms of use.            *
************************************************

Revision History:
         V1.0   - original program
         
}}
CON

    #0,MSBPRE,LSBPRE,MSBPOST,LSBPOST                    '' Used for SHIFTIN routines
''                           
''       =0      =1     =2      =3
''
'' MSBPRE   - Most Significant Bit first ; data is valid before the clock
'' LSBPRE   - Least Significant Bit first ; data is valid before the clock
'' MSBPOST  - Most Significant Bit first ; data is valid after the clock
'' LSBPOST  - Least Significant Bit first ; data is valid after the clock

    
    #4,LSBFIRST,MSBFIRST                                '' Used for SHIFTOUT routines
''              
''       =4      =5
''
'' LSBFIRST - Least Significant Bit first ; data is valid after the clock
'' MSBFIRST - Most Significant Bit first ; data is valid after the clock


VAR     long          ClockDelay,ClockState

PUB start(_ClockDelay, _ClockState)
    ClockState := _ClockState
    ClockDelay := ((clkfreq / 100000 * _ClockDelay) - 4296) #> 381
        
PUB SHIFTOUT(Dpin, Cpin, Mode, Bits, Value)
    dira[Dpin]~~                                         ' make Data pin output
    outa[Cpin] := ClockState                             ' set initial clock state
    dira[Cpin]~~                                         ' make Clock pin output
                       
    

    if Mode == 4                'LSBFIRST
       Value <-= 1                                       ' pre-align lsb
       repeat Bits
         outa[Dpin] := (Value ->= 1) & 1                 ' output data bit
         PostClock(Cpin)         

    if Mode == 5                'MSBFIRST
       Value <<= (32 - Bits)                             ' pre-align msb
       repeat Bits
         outa[Dpin] := (Value <-= 1) & 1                 ' output data bit
         PostClock(Cpin)

PUB SHIFTIN(Dpin, Cpin, Mode, Bits)|Value

    dira[Dpin]~                                           ' make dpin input
    outa[Cpin] := ClockState                              ' set initial clock state
    dira[Cpin]~~                                          ' make cpin output

    
    Value~                                               ' clear output 


    if Mode == 0                'MSBPRE
       repeat Bits
         value := (Value << 1) | ina[Dpin]
         PostClock(Cpin)
          
    if Mode == 1                'LSBPRE
       repeat Bits +1
         Value := (Value >> 1) | (ina[Dpin] << 31)
         PostClock(Cpin)
       value >>= (32 - Bits)

    if Mode == 2                'MSBPOST
       repeat Bits
         PreClock(Cpin)
         Value := (Value << 1) | ina[Dpin]
 
    if Mode == 3                'LSBPOST
      repeat Bits + 1
        PreClock(Cpin)
        Value := (Value >> 1) | (ina[Dpin] << 31) 
      Value >>= (32 - Bits)


    return Value


PUB PostClock(_Cpin)
    waitcnt(cnt+ClockDelay)
    !outa[_Cpin]
    waitcnt(cnt+ClockDelay)
    !outa[_Cpin]

PUB PreClock(_Cpin)
    !outa[_Cpin]
    waitcnt(cnt+ClockDelay)
    !outa[_Cpin]
    waitcnt(cnt+ClockDelay)
