'' =================================================================================================
''
''   File....... jm_ws2812.spin
''   Purpose.... 800kHz driver for WS2812 LEDs
''   Author..... Jon "JonnyMac" McPhalen
''               Copyright (c) 2013 Jon McPhalen
''               -- see below for terms of use
''   E-mail..... jon@jonmcphalen.com
''   Started.... 
''   Updated.... 08 SEP 2013
''               -- corrected constant value for WHITE (thanks, Skylight!)
''               -- corrected typo in .color() method (thanks, Duane!)
''
'' =================================================================================================

{ -------------------------------------- }
{  NOTE: Requires system clock >= 80MHz  }
{ -------------------------------------- }


con

  RX1 = 31                                                      ' programming / terminal
  TX1 = 30
  
  SDA = 29                                                      ' eeprom / i2c
  SCL = 28


con

  MAX_LEDS = 151                                                 ' adjust as required
  LAST_CH  = MAX_LEDS - 1
  

con

  ' borrowed from Gavin Garner's TM1804 LED driver
  ' -- additional colors by Lachlan   
  ' -- some alterations by JM

  '             RR GG BB
  OFF        = $00_00_00
  BLACK      = $00_00_00
  RED        = $FF_00_00
  GREEN      = $00_FF_00
  BLUE       = $00_00_FF
  WHITE      = $FF_FF_FF
  CYAN       = $00_FF_FF
  MAGENTA    = $FF_00_FF
  YELLOW     = $FF_FF_00
  CHARTREUSE = $7F_FF_00
  ORANGE     = $FF_60_00
  AQUAMARINE = $7F_FF_D4
  PINK       = $FF_5F_5F
  TURQUOISE  = $3F_E0_C0
  REALWHITE  = $C8_FF_FF
  INDIGO     = $3F_00_7F
  VIOLET     = $BF_7F_BF
  MAROON     = $32_00_10
  BROWN      = $0E_06_00
  CRIMSON    = $DC_28_3C
  PURPLE     = $8C_00_FF
  
  
var

  long  cog

  long  txp                                                     ' tx output pin
  long  striplen                                                ' # leds in strip
  long  resetticks                                              ' ticks in reset period
  long  t0h                                                     ' bit0 high time (ticks)      
  long  t0l                                                     ' bit0 low time
  long  t1h                                                     ' bit1 high time
  long  t1l                                                     ' bit1 low time
  long  bufaddr                                                 ' hub address of color buf

  long  rgbbuf[MAX_LEDS]                                        ' rgb buffer
  
    
pub start(pin, leds) | ustix

'' Start WS2812 LED driver
'' -- pin is serial output to WS2812 string
'' -- leds is # of RGB LEDs in strip

  stop                                                          ' stop if running
  dira[pin] := 0                                                ' clear tx pin in this cog

  if (clkfreq < 80_000_000)                                     ' requires 80MHz clock
    return 0

  ustix := clkfreq / 1_000_000                                  ' ticks in 1us

  ' set cog parameters

  txp        := pin                                           
  striplen   := 1 #> leds <# MAX_LEDS                           ' limit led count
  resetticks := ustix * 50                                      ' 50.00us min reset timing
  t0h        := ustix * 35 / 100                                '  0.35us
  t0l        := ustix * 80 / 100                                '  0.80us
  t1h        := ustix * 70 / 100                                '  0.70us
  t1l        := ustix * 60 / 100                                '  0.60us  
  bufaddr    := @rgbbuf

  set_all(OFF)
  cog := cognew(@ws2812, @txp) + 1                              ' start the cog

  return cog


pub stop

'' Stops WS2812 cog (if running)

  if (cog)
    cogstop(cog - 1)
    cog := 0


pub num_pixels

'' Returns number of RGB pixels in string

  return striplen
  
  
pub color(r, g, b)

'' Packs r-g-b bytes into long

  result.byte[2] := r                                           ' r << 16
  result.byte[1] := g                                           ' g << 8
  result.byte[0] := b                                           ' b << 0


pub colorx(r, g, b, level)

'' Packs r-g-b bytes into long
'' -- level (0 to 255) used to adjust brightness (0 to 100%)

  if (level =< 0)
    return $00_00_00
    
  elseif (level => 255)
    return color(r, g, b)
    
  else
    r := r * level / 255                                        ' apply level to rgb   
    g := g * level / 255        
    b := b * level / 255        
    return color(r, g, b) 

  
pub set(ch, rgb)

'' Writes rgb value to channel ch in buffer
'' -- rgb is packed long in form $RR_GG_BB

  if ((ch => 0) and (ch < striplen))
    rgbbuf[ch] := rgb


pub set_rgb(ch, r, g, b)

'' Writes rgb elements to channel ch in buffer
'' -- r, g, and b are byte values, 0 to 255

  set(ch, color(r, g, b))   

    
pub set_all(rgb)

'' Sets all channels to rgb
'' -- rgb is packed long in form $RR_GG_BB

  longfill(@rgbbuf, rgb, striplen)  

    
pub fill(first, last, rgb)

'' Fills first through last channels with rgb
'' -- rgb is packed long in form $RR_GG_BB

  if ((first < 0) or (first > last))                            ' 
    return 0

  last <#= striplen-1
  
  longfill(@rgbbuf[first], rgb, last-first+1)


pub address

'' Returns hub address of rgbbuf

  return @rgbbuf


dat

                        org     0

ws2812                  mov     t1, par                         ' hub address of parameters -> t1
                        movd    :read, #txpin                   ' location of cog parameters -> :read(dest)
                        mov     t2, #8                          ' get 8 parameters
:read                   rdlong  0-0, t1                         ' copy parameter from hub to cog
                        add     t1, #4                          ' next hub element
                        add     :read, INC_DEST                 ' next cog element                         
                        djnz    t2, #:read                      ' done?
                        
                        mov     txmask, #1                      ' create mask for tx
                        shl     txmask, txpin
                        andn    outa, txmask                    ' set to output low
                        or      dira, txmask
                        
rgbmain                 mov     bittimer, resettix              ' set reset timing  
                        add     bittimer, cnt                   ' sync timer 
                        waitcnt bittimer, #0                    ' let timer expire                             
                        
                        mov     addr, hubpntr                   ' point to rgbbuf[0]
                        mov     nleds, ledcount                 ' set # active leds

frameloop               rdlong  colorbits, addr                 ' read a channel
                        add     addr, #4                        ' point to next

' Shifts long in colorbits to WS2812 chain
'
'  WS2812 Timing (slot is 1.25us for 800kHz)
'
'  0      0.35us / 0.80us
'  1      0.70us / 0.60us
'
'  At least 50us (reset) between frames
'
'  This routine manipulates the value in colorbits so that elements are
'  transmitted GRB as required by the WS2812. Rearrange-on-the-fly code
'  trick by TonyP12 in the Propeller forum.  
'
'  Entry      $00_RR_GG_BB
'  Step 1     $BB_00_RR_GG
'  Step 2-24  $GG_BB_00_RR - when nbits == 24
'             $BB_00_RR_GG - after sending GG
'  Step 2-16  $RR_GG_BB_00 - when nbits == 16
'             $GG_BB_00_RR - after sending RR
'  Step 2-8   $BB_00_RR_GG - when nbits == 8

shiftout                ror     colorbits, #8                   ' {1} to offset the rol 24 below
                        mov     nbits, #24                      ' shift 24 bits (3 x 8) 
                        
:loop                   test    nbits, #%111            wz      ' {2} nbits at 24, 16 or 8?
        if_z            rol     colorbits, nbits                ' if yes, modify colorbits 
                        rol     colorbits, #1           wc      ' msb --> C
        if_c            mov     bittimer, bit1hi                ' set bit timing  
        if_nc           mov     bittimer, bit0hi                
                        or      outa, txmask                    ' tx line 1  
                        add     bittimer, cnt                   ' sync bit timer  
        if_c            waitcnt bittimer, bit1lo                
        if_nc           waitcnt bittimer, bit0lo 
                        andn    outa, txmask                    ' tx line 0             
                        waitcnt bittimer, #0                    ' hold while low
                        djnz    nbits, #:loop                   ' next bit

                        djnz    nleds, #frameloop               ' done with all leds?

                        jmp     #rgbmain                        ' back to top

' --------------------------------------------------------------------------------------------------

INC_DEST                long    1 << 9                          ' to increment D field 

txpin                   res     1                               ' tx pin #
ledcount                res     1                               ' # of rgb leds in chain
resettix                res     1                               ' frame reset timing
bit0hi                  res     1                               ' bit0 high timing
bit0lo                  res     1                               ' bit0 low timing
bit1hi                  res     1                               ' bit1 high timing    
bit1lo                  res     1                               ' bit1 low timing     
hubpntr                 res     1                               ' pointer to rgb array

txmask                  res     1                               ' mask for tx output

bittimer                res     1                               ' timer for reset/bit
addr                    res     1                               ' address of current rgb bit
nleds                   res     1                               ' # of channels to process
colorbits               res     1                               ' rgb for current channel
nbits                   res     1                               ' # of bits to process

t1                      res     1                               ' work vars
t2                      res     1

                        fit     496                                    

                        
dat

{{

  Terms of Use: MIT License

  Permission is hereby granted, free of charge, to any person obtaining a copy of this
  software and associated documentation files (the "Software"), to deal in the Software
  without restriction, including without limitation the rights to use, copy, modify,
  merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be included in all copies
  or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
  PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

}}  