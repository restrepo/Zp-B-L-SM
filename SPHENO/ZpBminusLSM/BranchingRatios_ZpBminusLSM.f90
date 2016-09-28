! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:01 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_ZpBminusLSM 
 
Use Control 
Use Couplings_ZpBminusLSM 
Use Model_Data_ZpBminusLSM 
Use LoopCouplings_ZpBminusLSM 
Use Fv3Decays_ZpBminusLSM 
Use Fu3Decays_ZpBminusLSM 
Use Fe3Decays_ZpBminusLSM 
Use Fd3Decays_ZpBminusLSM 
Use VZp3Decays_ZpBminusLSM 
Use hh3Decays_ZpBminusLSM 
Use TreeLevelDecays_ZpBminusLSM 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,               & 
& TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,v,vX,g1,gBY,g2,g3,gBL,gYB,               & 
& lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,mu,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,               & 
& gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWm,gTVWm,BRVWm,gPhh,gThh,BRhh,              & 
& gPVZp,gTVZp,BRVZp)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,gBY,g2,g3,gBL,gYB

Complex(dp),Intent(in) :: lam2,lam3,lam1,Yx(3,3),Yd(3,3),Ye(3,3),Yv(3,3),Yu(3,3),MUP,mu

Real(dp),Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),           & 
& Mhh(2),Mhh2(2),MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(6,6),ZW(2,2)

Real(dp),Intent(in) :: v,vX

Real(dp),Intent(inout) :: gPFu(3,258),gTFu(3),BRFu(3,258),gPFe(3,261),gTFe(3),BRFe(3,261),gPFd(3,258),          & 
& gTFd(3),BRFd(3,258),gPFv(6,432),gTFv(6),BRFv(6,432),gPVZ(1,53),gTVZ,BRVZ(1,53),        & 
& gPVWm(1,31),gTVWm,BRVWm(1,31),gPhh(2,338),gThh(2),BRhh(2,338),gPVZp(1,296),            & 
& gTVZp,BRVZp(1,296)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP(2),cplPseudoHiggsGG(2),cplHiggsZZvirt(2),& 
& cplHiggsWWvirt(2)

Real(dp) ::  gTAh(2) 
Real(dp) :: gFvFecFdFu(6,3,3,3),gFvFvcFeFe(6,6,3,3),gFvFvcFdFd(6,6,3,3),gFvFvcFuFu(6,6,3,3),      & 
& gFvFvFvFv(6,6,6,6),gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,6),gFuFucFeFe(3,3,3,3),        & 
& gFuFucFuFu(3,3,3,3),gFuFuFvFv(3,3,6,6),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),        & 
& gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,6,6),gFeFvcFuFd(3,6,3,3),gFdFdcFdFd(3,3,3,3),        & 
& gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,6,6),gFdFuFvFe(3,3,6,3),         & 
& gVZpFdcFdFd(1,3,3,3),gVZpFdcFeFe(1,3,3,3),gVZpFdcFuFu(1,3,3,3),gVZpFdFvFv(1,3,6,6),    & 
& gVZpFuFvFe(1,3,6,3),ghhAhFdcFd(2,2,3,3),ghhAhFecFe(2,2,3,3),ghhAhFucFu(2,2,3,3),       & 
& ghhAhFvFv(2,2,6,6),ghhhhFdcFd(2,2,3,3),ghhcHmFdcFu(2,1,3,3),ghhcHmFeFv(2,1,3,6),       & 
& ghhhhFecFe(2,2,3,3),ghhhhFucFu(2,2,3,3),ghhhhFvFv(2,2,6,6)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPFu(:,1:15),gTFu,BRFu(:,1:15))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPFe(:,1:18),gTFe,BRFe(:,1:18))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPFd(:,1:15),gTFd,BRFd(:,1:15))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPFv(:,1:27),gTFv,BRFv(:,1:27))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWm = 0._dp 
gTVWm = 0._dp 
BRVWm = 0._dp 
Call VWmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,               & 
& Yv,Yu,MUP,mu,v,vX,gPVWm,gTVWm,BRVWm)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gPhh(:,1:59),gThh,BRhh(:,1:59))

Do i1=1,2
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
End Do 
 

gPVZp = 0._dp 
gTVZp = 0._dp 
BRVZp = 0._dp 
Call VZpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& ZDL,ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,               & 
& Yv,Yu,MUP,mu,v,vX,gPVZp(:,1:53),gTVZp,BRVZp(:,1:53))

Do i1=1,1
gTVZp =Sum(gPVZp(i1,:)) 
If (gTVZp.Gt.0._dp) BRVZp(i1,: ) =gPVZp(i1,:)/gTVZp 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,             & 
& gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,16:258),BRFu(:,16:258))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,             & 
& gFuFuFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,16:258),BRFu(:,16:258))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,             & 
& gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,16:258),BRFu(:,16:258))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,              & 
& gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,              & 
& gFeFvcFuFd,epsI,deltaM,.True.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,              & 
& gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,              & 
& gFdFuFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,16:258),BRFd(:,16:258))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,              & 
& gFdFuFvFe,epsI,deltaM,.True.,gTFd,gPFd(:,16:258),BRFd(:,16:258))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,              & 
& gFdFuFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,16:258),BRFd(:,16:258))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFvFecFdFu,gFvFvcFeFe,gFvFvcFdFd,gFvFvcFuFu,             & 
& gFvFvFvFv,epsI,deltaM,.False.,gTFv,gPFv(:,28:432),BRFv(:,28:432))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFvFecFdFu,gFvFvcFeFe,gFvFvcFdFd,gFvFvcFuFu,             & 
& gFvFvFvFv,epsI,deltaM,.True.,gTFv,gPFv(:,28:432),BRFv(:,28:432))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,gThh,gTVWm,gTVZ,gTVZp,gFvFecFdFu,gFvFvcFeFe,gFvFvcFdFd,gFvFvcFuFu,             & 
& gFvFvFvFv,epsI,deltaM,.False.,gTFv,gPFv(:,28:432),BRFv(:,28:432))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

! No 3-body decays for VZ  
! No 3-body decays for VWm  
If (.Not.CTBD) Then 
If (Enable3BDecaysS) Then 
If (MaxVal(gThh).Lt.MaxVal(fac3*Abs(Mhh))) Then 
Call hhThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,ghhAhFvFv,ghhhhFdcFd,ghhcHmFdcFu,             & 
& ghhcHmFeFv,ghhhhFecFe,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,gThh,gPhh(:,60:338)     & 
& ,BRhh(:,60:338))

Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,ghhAhFvFv,ghhhhFdcFd,ghhcHmFdcFu,             & 
& ghhcHmFeFv,ghhhhFecFe,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.True.,gThh,gPhh(:,60:338)      & 
& ,BRhh(:,60:338))

End If 
 
End If 
Else 
Call hhThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,ZEL,               & 
& ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,MUP,             & 
& mu,v,vX,ghhAhFdcFd,ghhAhFecFe,ghhAhFucFu,ghhAhFvFv,ghhhhFdcFd,ghhcHmFdcFu,             & 
& ghhcHmFeFv,ghhhhFecFe,ghhhhFucFu,ghhhhFvFv,epsI,deltaM,.False.,gThh,gPhh(:,60:338)     & 
& ,BRhh(:,60:338))

End If 
Do i1=1,2
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysS) Then 
If (gTVZp.Lt.fac3*Abs(MVZp)) Then 
Call VZpThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gVZpFdcFdFd,gVZpFdcFeFe,gVZpFdcFuFu,gVZpFdFvFv,gVZpFuFvFe,epsI,            & 
& deltaM,.False.,gTVZp,gPVZp(:,54:296),BRVZp(:,54:296))

Else 
Call VZpThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gVZpFdcFdFd,gVZpFdcFeFe,gVZpFdcFuFu,gVZpFdFvFv,gVZpFuFvFe,epsI,            & 
& deltaM,.True.,gTVZp,gPVZp(:,54:296),BRVZp(:,54:296))

End If 
 
End If 
Else 
Call VZpThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,ZDL,               & 
& ZEL,ZUL,ZA,ZH,UV,ZW,ZZ,g1,gBY,g2,g3,gBL,gYB,lam2,lam3,lam1,Yx,Yd,Ye,Yv,Yu,             & 
& MUP,mu,v,vX,gVZpFdcFdFd,gVZpFdcFeFe,gVZpFdcFuFu,gVZpFdFvFv,gVZpFuFvFe,epsI,            & 
& deltaM,.False.,gTVZp,gPVZp(:,54:296),BRVZp(:,54:296))

End If 
Do i1=1,1
gTVZp =Sum(gPVZp(i1,:)) 
If (gTVZp.Gt.0._dp) BRVZp(i1,: ) =gPVZp(i1,:)/gTVZp 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_ZpBminusLSM 
 