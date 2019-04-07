<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0




;				ifn	itime		numpoints	gen		
gifn1		ftgen		1,	0,		8,		8,	0,	1,	0,	1,	0,	1,	0,	1,	0,	1,	0,	1,	0
gifn2		ftgen		2,	0,		8,		8,	0,	1,	0,	1,	0,	1,	0,	1,	0,	1,	0,	1,	0



gaverbL	init	0
gaverbR	init 0




instr 1 ;wave terrain
;kpan = .5
;kverbsend = 1

ktabpicker1 chnget "tabpicker1"
ktabpicker2 chnget "tabpicker2"
ktabpicker3 chnget "tabpicker3"
ktabpicker4 chnget "tabpicker4"
ktabpicker5 chnget "tabpicker5"

if (ktabpicker1 == 0) then
	k11 = 1
   	k21 = 0
	k31 = 0
	k41 = 0
	k51 = 0
elseif (ktabpicker1 == 1) then
	k11 = 0
   	k21 = 1
	k31 = 0
	k41 = 0
	k51 = 0
elseif (ktabpicker1 == 2) then
	k11 = 0
   	k21 = 0
	k31 = 3
	k41 = 0
	k51 = 0
elseif (ktabpicker1 == 3) then
	k11 = 0
   	k21 = 0
	k31 = 0
	k41 = 1
	k51 = 0
elseif (ktabpicker1 == 4) then
	k11 = 0
   	k21 = 0
	k31 = 0
	k41 = 0
	k51 = 1
else 
	k11 = 0
   	k21 = 0
	k31 = 0
	k41 = 0
	k51 = 0
endif

if (ktabpicker2 == 0) then
	k12 = 1
   	k22 = 0
	k32 = 0
	k42 = 0
	k52 = 0
elseif (ktabpicker2 == 1) then
	k12 = 0
   	k22 = 1
	k32 = 0
	k42 = 0
	k52 = 0
elseif (ktabpicker2 == 2) then
	k12 = 0
   	k22 = 0
	k32 = 1
	k42 = 0
	k52 = 0
elseif (ktabpicker2 == 3) then
	k12 = 0
   	k22 = 0
	k32 = 0
	k42 = 1
	k52 = 0
elseif (ktabpicker2 == 4) then
	k12 = 0
   	k22 = 0
	k32 = 0
	k42 = 0
	k52 = 1
else 
	k12 = 0
   	k22 = 0
	k32 = 0
	k42 = 0
	k52 = 0
endif

if (ktabpicker3 == 0) then
	k13 = 1
   	k23 = 0
	k33 = 0
	k43 = 0
	k53 = 0
elseif (ktabpicker3 == 1) then
	k13 = 0
   	k23 = 1
	k33 = 0
	k43 = 0
	k53 = 0
elseif (ktabpicker3 == 2) then
	k13 = 0
   	k23 = 0
	k33 = 1
	k43 = 0
	k53 = 0
elseif (ktabpicker3 == 3) then
	k13 = 0
   	k23 = 0
	k33 = 0
	k43 = 1
	k53 = 0
elseif (ktabpicker3 == 4) then
	k13 = 0
   	k23 = 0
	k33 = 1
	k43 = 0
	k53 = 0
else 
	k13 = 0
   	k23 = 0
	k33 = 0
	k43 = 0
	k53 = 0
endif

if (ktabpicker4 == 0) then
	k14 = 1
   	k24 = 0
	k34 = 0
	k44 = 0
	k54 = 0
elseif (ktabpicker4 == 1) then
	k14 = 0
   	k24 = 1
	k34 = 0
	k44 = 0
	k54 = 0
elseif (ktabpicker4 == 2) then
	k14 = 0
   	k24 = 0
	k34 = 1
	k44 = 0
	k54 = 0
elseif (ktabpicker4 == 3) then
	k14 = 0
   	k24 = 0
	k34 = 0
	k44 = 1
	k54 = 0
elseif (ktabpicker4 == 4) then
	k14 = 0
   	k24 = 0
	k34 = 0
	k44 = 0
	k54 = 1
else 
	k14 = 0
   	k24 = 0
	k34 = 0
	k44 = 0
	k54 = 0
endif

if (ktabpicker5 == 0) then
	k15 = 1
   	k25 = 0
	k35 = 0
	k45 = 0
	k55 = 0
elseif (ktabpicker5 == 1) then
	k15 = 0
   	k25 = 1
	k35 = 0
	k45 = 0
	k55 = 0
elseif (ktabpicker5 == 2) then
	k15 = 0
   	k25 = 0
	k35 = 1
	k45 = 0
	k55 = 0
elseif (ktabpicker5 == 3) then
	k15 = 0
   	k25 = 0
	k35 = 0
	k45 = 1
	k55 = 0
elseif (ktabpicker5 == 4) then
	k15 = 0
   	k25 = 0
	k35 = 0
	k45 = 0
	k55 = 1
else 
	k15 = 0
   	k25 = 0
	k35 = 0
	k45 = 0
	k55 = 0
endif
	
kverbsend chnget "verbsend"
kpan	chnget "waveTerrainPan"

kxamp1 chnget "xwave1"
kxamp2 chnget "xwave2"
kxamp3 chnget "xwave3"
kxamp4 chnget "xwave4"
kxamp5 chnget "xwave5"

kyamp1 chnget "ywave1"
kyamp2 chnget "ywave2"
kyamp3 chnget "ywave3"
kyamp4 chnget "ywave4"
kyamp5 chnget "ywave5"

klfoLvL1 chnget "lfoOneLevel"
klfoLvL2 chnget "lfoTwoLevel"
klfoLvL3 chnget "lfoThreeLevel"
klfoLvL4 chnget "lfoFourLevel"
klfoLvL5 chnget "lfoFiveLevel"

klcps1 chnget "lfocps1"
klcps2 chnget "lfocps2"
klcps3 chnget "lfocps3"
klcps4 chnget "lfocps4"
klcps5 chnget "lfocps5"

klfo1 lfo klfoLvL1, klcps1
klfo2 lfo klfoLvL2, klcps2
klfo3 lfo klfoLvL3, klcps3
klfo4 lfo klfoLvL4, klcps5
klfo5 lfo klfoLvL5, klcps5

kxtab1 = kxamp1+klfo1*k11+klfo2*k12+klfo3*k13+klfo4*k14+klfo5*k15
kxtab2 = kxamp2+klfo1*k21+klfo2*k22+klfo3*k23+klfo4*k24+klfo5*k25
kxtab3 = kxamp3+klfo1*k31+klfo2*k32+klfo3*k33+klfo4*k34+klfo5*k35
kxtab4 = kxamp4+klfo1*k41+klfo2*k42+klfo3*k43+klfo4*k44+klfo5*k45
kxtab5 = kxamp5+klfo1*k51+klfo2*k52+klfo3*k53+klfo4*k54+klfo5*k55

kxtab1 limit kxtab1, -1, 1
kxtab2 limit kxtab2, -1, 1
kxtab3 limit kxtab3, -1, 1
kxtab4 limit kxtab4, -1, 1
kxtab5 limit kxtab5, -1, 1

tablew kxtab1, 2, 1
tablew kxtab2, 3, 1
tablew kxtab3, 4, 1
tablew kxtab4, 5, 1
tablew kxtab5, 6, 1

tablew kyamp1, 2, 2
tablew kyamp2, 3, 2
tablew kyamp3, 4, 2
tablew kyamp4, 5, 2
tablew kyamp5, 6, 2





kwtcps cpsmidinn p4
kxcenter	chnget "xcenter"
kycenter	chnget "ycenter"
kyrad		chnget "yradius" 
kxrad		chnget "xradius"

kxcenter port kxcenter, .2 
kycenter port kycenter, .2
kxrad port kxrad, .2
kyrad port kyrad, .2


;printks "xcenter: %f", kxcenter
;printks "ycenter: %f", kycenter
;printks "xradius: %f", kxrad
;printks "yradius: %f", kyrad

awt wterrain .6, kwtcps, kxcenter, kycenter, kxrad,kyrad , 1, 2

ifreq = 1800

kenv linsegr 0, .7, .8, 2, .6, 1, 0

afilt butterlp awt*kenv, ifreq



outs (afilt*(cos(.5*3.14159*kpan))), (afilt*(sin(.5*3.14159*kpan)))

gaverbL += afilt*(cos(3.14159*kpan))*kverbsend
gaverbR += afilt*(sin(3.14159*kpan))*kverbsend

endin

instr 100 ;reverb

ainL = gaverbL
ainR = gaverbR

kfblvl = .8
kfco = (44100*.25)


aoutL, aoutR reverbsc ainL, ainR, kfblvl, kfco

outs aoutL*.8, aoutR*.8

gaverbL = 0
gaverbR = 0

endin


</CsInstruments>
<CsScore>
f0 z
i100 0 z

;i1 0 40 440


</CsScore>


</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>144</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
