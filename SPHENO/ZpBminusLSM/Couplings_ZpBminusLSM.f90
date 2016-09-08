! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 8.9.2016   
! ----------------------------------------------------------------------  
 
 
Module Couplings_ZpBminusLSM
 
Use Control 
Use Model_Data_ZpBminusLSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(lam2,lam3,lam1,v,vX,ZH,ZA,g1,g2,gYB,TW,              & 
& gBL,gBY,TWp,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,cplAhAhhh,cplhhhhhh,          & 
& cplhhHmcHm,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,              & 
& cplHmHmcHmcHm,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHmcVWm,cplAhcHmVWm,cplhhHmcVWm,      & 
& cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,       & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHmcVWmVP,cplHmcVWmVZ,cplHmcVWmVZp,cplcHmVPVWm,     & 
& cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWmVWm,          & 
& cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHmcVWmVP,cplAhHmcVWmVZ,cplAhHmcVWmVZp,     & 
& cplAhcHmVPVWm,cplAhcHmVWmVZ,cplAhcHmVWmVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,       & 
& cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHmcVWmVP,cplhhHmcVWmVZ,     & 
& cplhhHmcVWmVZp,cplhhcHmVPVWm,cplhhcHmVWmVZ,cplhhcHmVWmVZp,cplHmcHmVPVP,cplHmcHmVPVZ,   & 
& cplHmcHmVPVZp,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZVZp,cplHmcHmVZpVZp,               & 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHmL,cplcFdFuHmR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,         & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,   & 
& cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVPVWmVZp1,      & 
& cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,               & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,& 
& cplcgGgGVG,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,               & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,              & 
& cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh,cplcgWpCgWpCAh,              & 
& cplcgZgAhh,cplcgZpgAhh,cplcgWmgAHm,cplcgWpCgAcHm,cplcgWmgWmhh,cplcgZgWmcHm,            & 
& cplcgZpgWmcHm,cplcgWpCgWpChh,cplcgZgWpCHm,cplcgZpgWpCHm,cplcgZgZhh,cplcgZpgZhh,        & 
& cplcgWmgZHm,cplcgWpCgZcHm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpHm,cplcgWpCgZpcHm)

Implicit None 
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2),g1,g2,gYB,TW,gBL,gBY,TWp,g3

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),           & 
& ZUL(3,3),ZUR(3,3),Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHmcHm(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHmcHm(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHmcHm(2,2),cplHmHmcHmcHm,cplAhhhVP(2,2), & 
& cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHmcVWm(2),cplAhcHmVWm(2),cplhhHmcVWm(2),           & 
& cplhhcHmVWm(2),cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplhhVPVZ(2),cplhhVPVZp(2),           & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHmcVWmVP,cplHmcVWmVZ,     & 
& cplHmcVWmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),   & 
& cplAhAhVPVZp(2,2),cplAhAhcVWmVWm(2,2),cplAhAhVZVZ(2,2),cplAhAhVZVZp(2,2),              & 
& cplAhAhVZpVZp(2,2),cplAhHmcVWmVP(2),cplAhHmcVWmVZ(2),cplAhHmcVWmVZp(2),cplAhcHmVPVWm(2),& 
& cplAhcHmVWmVZ(2),cplAhcHmVWmVZp(2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),& 
& cplhhhhcVWmVWm(2,2),cplhhhhVZVZ(2,2),cplhhhhVZVZp(2,2),cplhhhhVZpVZp(2,2),             & 
& cplhhHmcVWmVP(2),cplhhHmcVWmVZ(2),cplhhHmcVWmVZp(2),cplhhcHmVPVWm(2),cplhhcHmVWmVZ(2), & 
& cplhhcHmVWmVZp(2),cplHmcHmVPVP,cplHmcHmVPVZ,cplHmcHmVPVZp,cplHmcHmcVWmVWm,             & 
& cplHmcHmVZVZ,cplHmcHmVZVZp,cplHmcHmVZpVZp,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,         & 
& cplcVWmVWmVZp,cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),& 
& cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),cplFvFvAhL(6,6,2),cplFvFvAhR(6,6,2),             & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),             & 
& cplFvFecHmL(6,3),cplFvFecHmR(6,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3),cplcFdFuHmR(3,3),               & 
& cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),cplcFeFvHmL(3,6),cplcFeFvHmR(3,6),cplcFdFdVGL(3,3),& 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),             & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),  & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvVWmL(3,6),   & 
& cplcFeFvVWmR(3,6),cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,              & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,       & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,& 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZVZp1,   & 
& cplcVWmVWmVZVZp2,cplcVWmVWmVZVZp3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,& 
& cplcgGgGVG,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpCVP,cplcgAgWpCVWm,               & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWmgZVWm,              & 
& cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplcgWmgWmAh(2),cplcgWpCgWpCAh(2),        & 
& cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWmgAHm,cplcgWpCgAcHm,cplcgWmgWmhh(2),cplcgZgWmcHm,   & 
& cplcgZpgWmcHm,cplcgWpCgWpChh(2),cplcgZgWpCHm,cplcgZpgWpCHm,cplcgZgZhh(2)

Complex(dp), Intent(out) :: cplcgZpgZhh(2),cplcgWmgZHm,cplcgWpCgZcHm,cplcgZgZphh(2),cplcgZpgZphh(2),               & 
& cplcgWmgZpHm,cplcgWpCgZpcHm

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcHmT(gt1,lam3,lam1,v,vX,ZH,cplhhHmcHm(gt1))

End Do 


cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHmcHmT(gt1,gt2,lam3,lam1,ZA,cplAhAhHmcHm(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHmcHmT(gt1,gt2,lam3,lam1,ZH,cplhhhhHmcHm(gt1,gt2))

 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Call CouplingHmHmcHmcHmT(lam1,cplHmHmcHmcHm)



cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPT(gt1,gt2,g1,g2,gYB,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmT(gt1,g2,ZA,cplAhHmcVWm(gt1))

End Do 


cplAhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmT(gt1,g2,ZA,cplAhcHmVWm(gt1))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmT(gt1,g2,ZH,cplhhHmcVWm(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmT(gt1,g2,ZH,cplhhcHmVWm(gt1))

End Do 


cplHmcHmVP = 0._dp 
Call CouplingHmcHmVPT(g1,g2,TW,cplHmcHmVP)



cplHmcHmVZ = 0._dp 
Call CouplingHmcHmVZT(g1,g2,gBY,TW,TWp,cplHmcHmVZ)



cplHmcHmVZp = 0._dp 
Call CouplingHmcHmVZpT(g1,g2,gBY,TW,TWp,cplHmcHmVZp)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZp(gt1))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Call CouplingHmcVWmVPT(g1,g2,v,TW,cplHmcVWmVP)



cplHmcVWmVZ = 0._dp 
Call CouplingHmcVWmVZT(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZ)



cplHmcVWmVZp = 0._dp 
Call CouplingHmcVWmVZpT(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZp)



cplcHmVPVWm = 0._dp 
Call CouplingcHmVPVWmT(g1,g2,v,TW,cplcHmVPVWm)



cplcHmVWmVZ = 0._dp 
Call CouplingcHmVWmVZT(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZ)



cplcHmVWmVZp = 0._dp 
Call CouplingcHmVWmVZpT(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZp)



cplAhAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVPT(gt1,gt2,g1,g2,gYB,ZA,TW,cplAhAhVPVP(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVPVZ(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVPVZp(gt1,gt2))

 End Do 
End Do 


cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmT(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZVZp(gt1,gt2))

 End Do 
End Do 


cplAhAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZpVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplAhHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmVPT(gt1,g1,g2,ZA,TW,cplAhHmcVWmVP(gt1))

End Do 


cplAhHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmVZT(gt1,g1,g2,gBY,ZA,TW,TWp,cplAhHmcVWmVZ(gt1))

End Do 


cplAhHmcVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmVZpT(gt1,g1,g2,gBY,ZA,TW,TWp,cplAhHmcVWmVZp(gt1))

End Do 


cplAhcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVPVWmT(gt1,g1,g2,ZA,TW,cplAhcHmVPVWm(gt1))

End Do 


cplAhcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmVZT(gt1,g1,g2,gBY,ZA,TW,TWp,cplAhcHmVWmVZ(gt1))

End Do 


cplAhcHmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmVZpT(gt1,g1,g2,gBY,ZA,TW,TWp,cplAhcHmVWmVZp(gt1))

End Do 


cplhhhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVPT(gt1,gt2,g1,g2,gYB,ZH,TW,cplhhhhVPVP(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVPVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVPVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZpVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplhhHmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmVPT(gt1,g1,g2,ZH,TW,cplhhHmcVWmVP(gt1))

End Do 


cplhhHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmVZT(gt1,g1,g2,gBY,ZH,TW,TWp,cplhhHmcVWmVZ(gt1))

End Do 


cplhhHmcVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmVZpT(gt1,g1,g2,gBY,ZH,TW,TWp,cplhhHmcVWmVZp(gt1))

End Do 


cplhhcHmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVPVWmT(gt1,g1,g2,ZH,TW,cplhhcHmVPVWm(gt1))

End Do 


cplhhcHmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmVZT(gt1,g1,g2,gBY,ZH,TW,TWp,cplhhcHmVWmVZ(gt1))

End Do 


cplhhcHmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmVZpT(gt1,g1,g2,gBY,ZH,TW,TWp,cplhhcHmVWmVZp(gt1))

End Do 


cplHmcHmVPVP = 0._dp 
Call CouplingHmcHmVPVPT(g1,g2,TW,cplHmcHmVPVP)



cplHmcHmVPVZ = 0._dp 
Call CouplingHmcHmVPVZT(g1,g2,gBY,TW,TWp,cplHmcHmVPVZ)



cplHmcHmVPVZp = 0._dp 
Call CouplingHmcHmVPVZpT(g1,g2,gBY,TW,TWp,cplHmcHmVPVZp)



cplHmcHmcVWmVWm = 0._dp 
Call CouplingHmcHmcVWmVWmT(g2,cplHmcHmcVWmVWm)



cplHmcHmVZVZ = 0._dp 
Call CouplingHmcHmVZVZT(g1,g2,gBY,TW,TWp,cplHmcHmVZVZ)



cplHmcHmVZVZp = 0._dp 
Call CouplingHmcHmVZVZpT(g1,g2,gBY,TW,TWp,cplHmcHmVZVZp)



cplHmcHmVZpVZp = 0._dp 
Call CouplingHmcHmVZpVZpT(g1,g2,gBY,TW,TWp,cplHmcHmVZpVZp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,TWp,cplcVWmVWmVZ)



cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvAhT(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2)            & 
& ,cplcFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHmL = 0._dp 
cplFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplFvFecHmL(gt1,gt2),cplFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2)              & 
& ,cplcFdFuHmR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplcFeFvHmL(gt1,gt2),cplcFeFvHmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,gYB,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,gYB,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,gYB,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVPT(gt1,gt2,g1,g2,gYB,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmT(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmVPVWmVZ1 = 0._dp 
cplcVWmVPVWmVZ2 = 0._dp 
cplcVWmVPVWmVZ3 = 0._dp 
Call CouplingcVWmVPVWmVZT(g2,TW,TWp,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)



cplcVWmVPVWmVZp1 = 0._dp 
cplcVWmVPVWmVZp2 = 0._dp 
cplcVWmVPVWmVZp3 = 0._dp 
Call CouplingcVWmVPVWmVZpT(g2,TW,TWp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,               & 
& cplcVWmVPVWmVZp3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmT(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZT(g2,TW,TWp,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplcVWmVWmVZVZp1 = 0._dp 
cplcVWmVWmVZVZp2 = 0._dp 
cplcVWmVWmVZVZp3 = 0._dp 
Call CouplingcVWmVWmVZVZpT(g2,TW,TWp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,               & 
& cplcVWmVWmVZVZp3)



cplcVWmVWmVZpVZp1 = 0._dp 
cplcVWmVWmVZpVZp2 = 0._dp 
cplcVWmVWmVZpVZp3 = 0._dp 
Call CouplingcVWmVWmVZpVZpT(g2,TW,TWp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,            & 
& cplcVWmVWmVZpVZp3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWmgAVWm = 0._dp 
Call CouplingcgWmgAVWmT(g2,TW,cplcgWmgAVWm)



cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmT(g2,TW,cplcgWpCgAcVWm)



cplcgWmgWmVP = 0._dp 
Call CouplingcgWmgWmVPT(g2,TW,cplcgWmgWmVP)



cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZT(g2,TW,TWp,cplcgWmgWmVZ)



cplcgWmgWmVZp = 0._dp 
Call CouplingcgWmgWmVZpT(g2,TW,TWp,cplcgWmgWmVZp)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmT(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmT(g2,TW,TWp,cplcgZgWmcVWm)



cplcgZpgWmcVWm = 0._dp 
Call CouplingcgZpgWmcVWmT(g2,TW,TWp,cplcgZpgWmcVWm)



cplcgWpCgWpCVP = 0._dp 
Call CouplingcgWpCgWpCVPT(g2,TW,cplcgWpCgWpCVP)



cplcgAgWpCVWm = 0._dp 
Call CouplingcgAgWpCVWmT(g2,TW,cplcgAgWpCVWm)



cplcgZgWpCVWm = 0._dp 
Call CouplingcgZgWpCVWmT(g2,TW,TWp,cplcgZgWpCVWm)



cplcgZpgWpCVWm = 0._dp 
Call CouplingcgZpgWpCVWmT(g2,TW,TWp,cplcgZpgWpCVWm)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZT(g2,TW,TWp,cplcgWpCgWpCVZ)



cplcgWpCgWpCVZp = 0._dp 
Call CouplingcgWpCgWpCVZpT(g2,TW,TWp,cplcgWpCgWpCVZp)



cplcgWmgZVWm = 0._dp 
Call CouplingcgWmgZVWmT(g2,TW,TWp,cplcgWmgZVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmT(g2,TW,TWp,cplcgWpCgZcVWm)



cplcgWmgZpVWm = 0._dp 
Call CouplingcgWmgZpVWmT(g2,TW,TWp,cplcgWmgZpVWm)



cplcgWpCgZpcVWm = 0._dp 
Call CouplingcgWpCgZpcVWmT(g2,TW,TWp,cplcgWpCgZpcVWm)



cplcgWmgWmAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmAhT(gt3,g2,v,ZA,cplcgWmgWmAh(gt3))

End Do 


cplcgWpCgWpCAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCAhT(gt3,g2,v,ZA,cplcgWpCgWpCAh(gt3))

End Do 


cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZgAhh(gt3))

End Do 


cplcgZpgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgAhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZpgAhh(gt3))

End Do 


cplcgWmgAHm = 0._dp 
Call CouplingcgWmgAHmT(g1,g2,v,TW,cplcgWmgAHm)



cplcgWpCgAcHm = 0._dp 
Call CouplingcgWpCgAcHmT(g1,g2,v,TW,cplcgWpCgAcHm)



cplcgWmgWmhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmhhT(gt3,g2,v,ZH,cplcgWmgWmhh(gt3))

End Do 


cplcgZgWmcHm = 0._dp 
Call CouplingcgZgWmcHmT(g1,g2,gBY,v,TW,TWp,cplcgZgWmcHm)



cplcgZpgWmcHm = 0._dp 
Call CouplingcgZpgWmcHmT(g1,g2,gBY,v,TW,TWp,cplcgZpgWmcHm)



cplcgWpCgWpChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpChhT(gt3,g2,v,ZH,cplcgWpCgWpChh(gt3))

End Do 


cplcgZgWpCHm = 0._dp 
Call CouplingcgZgWpCHmT(g1,g2,gBY,v,TW,TWp,cplcgZgWpCHm)



cplcgZpgWpCHm = 0._dp 
Call CouplingcgZpgWpCHmT(g1,g2,gBY,v,TW,TWp,cplcgZpgWpCHm)



cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZgZhh(gt3))

End Do 


cplcgZpgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZpgZhh(gt3))

End Do 


cplcgWmgZHm = 0._dp 
Call CouplingcgWmgZHmT(g1,g2,gBY,v,TW,TWp,cplcgWmgZHm)



cplcgWpCgZcHm = 0._dp 
Call CouplingcgWpCgZcHmT(g1,g2,gBY,v,TW,TWp,cplcgWpCgZcHm)



cplcgZgZphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZphhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZgZphh(gt3))

End Do 


cplcgZpgZphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZphhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplcgZpgZphh(gt3))

End Do 


cplcgWmgZpHm = 0._dp 
Call CouplingcgWmgZpHmT(g1,g2,gBY,v,TW,TWp,cplcgWmgZpHm)



cplcgWpCgZpcHm = 0._dp 
Call CouplingcgWpCgZpcHmT(g1,g2,gBY,v,TW,TWp,cplcgWpCgZpcHm)



Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(lam2,lam3,lam1,v,vX,ZH,ZA,g1,g2,gYB,TW,gBL,gBY,               & 
& TWp,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,cplAhAhhh,cplhhhhhh,cplhhHmcHm,       & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHmcVWm,cplAhcHmVWm,cplhhHmcVWm,cplhhcHmVWm,        & 
& cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplhhVPVZ,cplhhVPVZp,cplhhcVWmVWm,cplhhVZVZ,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHmcVWmVP,cplHmcVWmVZ,cplHmcVWmVZp,cplcHmVPVWm,               & 
& cplcHmVWmVZ,cplcHmVWmVZp,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,               & 
& cplFvFecHmL,cplFvFecHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFuHmL,cplcFdFuHmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvVWmL,cplcFeFvVWmR)

Implicit None 
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2),g1,g2,gYB,TW,gBL,gBY,TWp,g3

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),           & 
& ZUL(3,3),ZUR(3,3),Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHmcHm(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),        & 
& cplAhhhVZp(2,2),cplAhHmcVWm(2),cplAhcHmVWm(2),cplhhHmcVWm(2),cplhhcHmVWm(2),           & 
& cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplhhVPVZ(2),cplhhVPVZp(2),cplhhcVWmVWm(2),          & 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHmcVWmVP,cplHmcVWmVZ,cplHmcVWmVZp,        & 
& cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,              & 
& cplcVWmVWmVZp,cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),& 
& cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),cplFvFvAhL(6,6,2),cplFvFvAhR(6,6,2),             & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),             & 
& cplFvFecHmL(6,3),cplFvFecHmR(6,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3),cplcFdFuHmR(3,3),               & 
& cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),cplcFeFvHmL(3,6),cplcFeFvHmR(3,6),cplcFdFdVGL(3,3),& 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),             & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),  & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvVWmL(3,6),   & 
& cplcFeFvVWmR(3,6)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcHmT(gt1,lam3,lam1,v,vX,ZH,cplhhHmcHm(gt1))

End Do 


cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPT(gt1,gt2,g1,g2,gYB,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmT(gt1,g2,ZA,cplAhHmcVWm(gt1))

End Do 


cplAhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmT(gt1,g2,ZA,cplAhcHmVWm(gt1))

End Do 


cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmT(gt1,g2,ZH,cplhhHmcVWm(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmT(gt1,g2,ZH,cplhhcHmVWm(gt1))

End Do 


cplHmcHmVP = 0._dp 
Call CouplingHmcHmVPT(g1,g2,TW,cplHmcHmVP)



cplHmcHmVZ = 0._dp 
Call CouplingHmcHmVZT(g1,g2,gBY,TW,TWp,cplHmcHmVZ)



cplHmcHmVZp = 0._dp 
Call CouplingHmcHmVZpT(g1,g2,gBY,TW,TWp,cplHmcHmVZp)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZp(gt1))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Call CouplingHmcVWmVPT(g1,g2,v,TW,cplHmcVWmVP)



cplHmcVWmVZ = 0._dp 
Call CouplingHmcVWmVZT(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZ)



cplHmcVWmVZp = 0._dp 
Call CouplingHmcVWmVZpT(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZp)



cplcHmVPVWm = 0._dp 
Call CouplingcHmVPVWmT(g1,g2,v,TW,cplcHmVPVWm)



cplcHmVWmVZ = 0._dp 
Call CouplingcHmVWmVZT(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZ)



cplcHmVWmVZp = 0._dp 
Call CouplingcHmVWmVZpT(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,TWp,cplcVWmVWmVZ)



cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvAhT(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2)            & 
& ,cplcFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHmL = 0._dp 
cplFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplFvFecHmL(gt1,gt2),cplFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2)              & 
& ,cplcFdFuHmR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplcFeFvHmL(gt1,gt2),cplcFeFvHmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,gYB,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,gYB,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,gYB,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVPT(gt1,gt2,g1,g2,gYB,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*v*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res+lam3*v*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)
res = res+lam3*vX*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)
res = res+2*lam2*vX*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+6*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)
res = res+lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)
res = res+lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)
res = res+lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)
res = res+6*lam2*vX*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHmcHmT(gt1,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*v*ZH(gt1,1)
res = res+lam3*vX*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHmT  
 
 
Subroutine CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+6*lam1*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1)
res = res+lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2)
res = res+lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2)
res = res+lam3*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2)
res = res+6*lam2*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
res = res+lam3*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
res = res+2*lam2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHmcHmT(gt1,gt2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmT  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+6*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
res = res+lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1)
res = res+lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1)
res = res+lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2)
res = res+lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2)
res = res+lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
res = res+6*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHmcHmT(gt1,gt2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*ZH(gt1,1)*ZH(gt2,1)
res = res+lam3*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmT  
 
 
Subroutine CouplingHmHmcHmcHmT(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
res = 0._dp 
res = res+4._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmT  
 
 
Subroutine CouplingAhhhVPT(gt1,gt2,g1,g2,gYB,ZH,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZH(2,2),ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g2*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gYB*Cos(TW)*ZA(gt1,2)*ZH(gt2,2)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVPT  
 
 
Subroutine CouplingAhhhVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(gBY*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-2*gYB*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res+2*gBL*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhhhVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gBL*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = res+2*gYB*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZpT  
 
 
Subroutine CouplingAhHmcVWmT(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmT  
 
 
Subroutine CouplingAhcHmVWmT(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmT  
 
 
Subroutine CouplinghhHmcVWmT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmT  
 
 
Subroutine CouplinghhcHmVWmT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmT  
 
 
Subroutine CouplingHmcHmVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
res = 0._dp 
res = res-(g1*Cos(TW))/2._dp
res = res-(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPT  
 
 
Subroutine CouplingHmcHmVZT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))/2._dp
res = res+(g1*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZT  
 
 
Subroutine CouplingHmcHmVZpT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZp' 
 
res = 0._dp 
res = res-(gBY*Cos(TWp))/2._dp
res = res+(g2*Cos(TW)*Sin(TWp))/2._dp
res = res-(g1*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZpT  
 
 
Subroutine CouplinghhVPVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(g1**2*v*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*v*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g1*gBY*v*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-4*gYB**2*vX*Cos(TWp)*Sin(2._dp*(TW))*ZH(gt1,2)
res = res+8*gBL*gYB*vX*Cos(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZT  
 
 
Subroutine CouplinghhVPVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*gBY*v*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*v*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(g1**2*v*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g2**2*v*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g1*g2*v*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+8*gBL*gYB*vX*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+4*gYB**2*vX*Sin(2._dp*(TW))*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZpT  
 
 
Subroutine CouplinghhcVWmVWmT(gt1,g2,v,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(gBY**2*v*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+8*gYB**2*vX*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)
res = res-16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+8*gBL**2*vX*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplinghhVZVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(g1*gBY*v*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(gBY**2*v*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g2**2*v*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g1**2*v*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(gBY*g2*v*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(g1*gBY*v*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(g1*g2*v*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1))/2._dp
res = res-8*gBL*gYB*vX*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res+8*gBL*gYB*vX*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+4*gBL**2*vX*Sin(2._dp*(TWp))*ZH(gt1,2)
res = res-4*gYB**2*vX*Sin(TW)**2*Sin(2._dp*(TWp))*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZpT  
 
 
Subroutine CouplinghhVZpVZpT(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*v*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(g2**2*v*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+8*gBL**2*vX*Cos(TWp)**2*ZH(gt1,2)
res = res+16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+8*gYB**2*vX*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZpVZpT  
 
 
Subroutine CouplingHmcVWmVPT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVP' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVPT  
 
 
Subroutine CouplingHmcVWmVZT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZ' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*g2*v*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZT  
 
 
Subroutine CouplingHmcVWmVZpT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZp' 
 
res = 0._dp 
res = res-(gBY*g2*v*Cos(TWp))/2._dp
res = res-(g1*g2*v*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZpT  
 
 
Subroutine CouplingcHmVPVWmT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVPVWm' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVPVWmT  
 
 
Subroutine CouplingcHmVWmVZT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZ' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*g2*v*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZT  
 
 
Subroutine CouplingcHmVWmVZpT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZp' 
 
res = 0._dp 
res = res-(gBY*g2*v*Cos(TWp))/2._dp
res = res-(g1*g2*v*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZpT  
 
 
Subroutine CouplingAhAhVPVPT(gt1,gt2,g1,g2,gYB,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVPT  
 
 
Subroutine CouplingAhAhVPVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)**2*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*gBY*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(gBY*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-4*gYB**2*Cos(TWp)*Sin(2._dp*(TW))*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gBL*gYB*Cos(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZT  
 
 
Subroutine CouplingAhAhVPVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*gBY*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*g2*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gBL*gYB*Cos(TW)*Cos(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+4*gYB**2*Sin(2._dp*(TW))*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZpT  
 
 
Subroutine CouplingAhAhcVWmVWmT(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmT  
 
 
Subroutine CouplingAhAhVZVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(gBY**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2)
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gBL**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhAhVZVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*Cos(TW)*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*gBY*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(gBY**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(gBY*g2*Cos(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*gBY*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-8*gBL*gYB*Cos(TWp)**2*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gBL*gYB*Sin(TW)*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res = res+4*gBL**2*Sin(2._dp*(TWp))*ZA(gt1,2)*ZA(gt2,2)
res = res-4*gYB**2*Sin(TW)**2*Sin(2._dp*(TWp))*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZpT  
 
 
Subroutine CouplingAhAhVZpVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gBL**2*Cos(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZpVZpT  
 
 
Subroutine CouplingAhHmcVWmVPT(gt1,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVPT  
 
 
Subroutine CouplingAhHmcVWmVZT(gt1,g1,g2,gBY,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
res = res-(gBY*g2*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVZT  
 
 
Subroutine CouplingAhHmcVWmVZpT(gt1,g1,g2,gBY,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*Cos(TWp)*ZA(gt1,1))/2._dp
res = res-(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmVZpT  
 
 
Subroutine CouplingAhcHmVPVWmT(gt1,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVPVWmT  
 
 
Subroutine CouplingAhcHmVWmVZT(gt1,g1,g2,gBY,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
res = res+(gBY*g2*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmVZT  
 
 
Subroutine CouplingAhcHmVWmVZpT(gt1,g1,g2,gBY,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY*g2*Cos(TWp)*ZA(gt1,1))/2._dp
res = res+(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmVZpT  
 
 
Subroutine CouplinghhhhVPVPT(gt1,gt2,g1,g2,gYB,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVPT  
 
 
Subroutine CouplinghhhhVPVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*gBY*Cos(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gBY*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-4*gYB**2*Cos(TWp)*Sin(2._dp*(TW))*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gBL*gYB*Cos(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZT  
 
 
Subroutine CouplinghhhhVPVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*gBY*Cos(TW)*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gBL*gYB*Cos(TW)*Cos(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+4*gYB**2*Sin(2._dp*(TW))*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZpT  
 
 
Subroutine CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(gBY**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2)
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gBL**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhhhVZVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*gBY*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(gBY**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(gBY*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*gBY*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-8*gBL*gYB*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gBL*gYB*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res = res+4*gBL**2*Sin(2._dp*(TWp))*ZH(gt1,2)*ZH(gt2,2)
res = res-4*gYB**2*Sin(TW)**2*Sin(2._dp*(TWp))*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZpT  
 
 
Subroutine CouplinghhhhVZpVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gBL**2*Cos(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZpVZpT  
 
 
Subroutine CouplinghhHmcVWmVPT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVPT  
 
 
Subroutine CouplinghhHmcVWmVZT(gt1,g1,g2,gBY,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVZT  
 
 
Subroutine CouplinghhHmcVWmVZpT(gt1,g1,g2,gBY,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmVZpT  
 
 
Subroutine CouplinghhcHmVPVWmT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVPVWmT  
 
 
Subroutine CouplinghhcHmVWmVZT(gt1,g1,g2,gBY,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmVZT  
 
 
Subroutine CouplinghhcHmVWmVZpT(gt1,g1,g2,gBY,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBY,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmVZpT  
 
 
Subroutine CouplingHmcHmVPVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPT  
 
 
Subroutine CouplingHmcHmVPVZT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW)**2*Cos(TWp))/2._dp
res = res-(g1**2*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
res = res-(g1*g2*Cos(TWp)*Sin(TW)**2)/2._dp
res = res+(g1*gBY*Cos(TW)*Sin(TWp))/2._dp
res = res+(gBY*g2*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZT  
 
 
Subroutine CouplingHmcHmVPVZpT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZp' 
 
res = 0._dp 
res = res+(g1*gBY*Cos(TW)*Cos(TWp))/2._dp
res = res+(gBY*g2*Cos(TWp)*Sin(TW))/2._dp
res = res-(g1*g2*Cos(TW)**2*Sin(TWp))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
res = res-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*g2*Sin(TW)**2*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZpT  
 
 
Subroutine CouplingHmcHmcVWmVWmT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmT  
 
 
Subroutine CouplingHmcHmVZVZT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW))
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(gBY**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZT  
 
 
Subroutine CouplingHmcHmVZVZpT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZp' 
 
res = 0._dp 
res = res+(gBY*g2*Cos(TW)*Cos(TWp)**2)/2._dp
res = res-(g1*gBY*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(gBY**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
res = res-(gBY*g2*Cos(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*gBY*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZpT  
 
 
Subroutine CouplingHmcHmVZpVZpT(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZpVZp' 
 
res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2)/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZpVZpT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWmVPVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmT  
 
 
Subroutine CouplingcVWmVWmVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZT  
 
 
Subroutine CouplingcVWmVWmVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZpT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingFvFvAhT(gt1,gt2,gt3,Yx,Yv,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*ZA(gt3,1)*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZA(gt3,2)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*ZA(gt3,1)*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZA(gt3,2)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvAhT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdcHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHmT  
 
 
Subroutine CouplingFvFecHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,3 + j2))*Yv(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecHmT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFuHmT(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuHmT  
 
 
Subroutine CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*ZH(gt3,1)*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZH(gt3,2)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*ZH(gt3,1)*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZH(gt3,2)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvhhT  
 
 
Subroutine CouplingcFeFvHmT(gt1,gt2,Ye,Yv,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*ZEL(gt1,j1)*UV(gt2,3 + j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvHmT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,gYB,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gBY*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFdFdVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(gBY*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZpT  
 
 
Subroutine CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmT  
 
 
Subroutine CouplingFvFecVWmT(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWmT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,gYB,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gYB*Cos(TW)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gYB*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gBY*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gBL*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBY*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBL*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(gBY*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gBL*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gYB*Sin(TW)*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+gBY*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBL*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Sin(TW)*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gYB*Sin(TW)*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZpT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,gYB,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuVWmT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*gBY*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingcFuFuVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*gBY*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZpT  
 
 
Subroutine CouplingFvFvVPT(gt1,gt2,g1,g2,gYB,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gYB*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(UV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+gYB*Conjg(UV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVPT  
 
 
Subroutine CouplingFvFvVZT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gBL*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL+gYB*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+gYB*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+gBL*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZT  
 
 
Subroutine CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gBL*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gYB*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+gBL*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+gYB*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZpT  
 
 
Subroutine CouplingcFeFvVWmT(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvVWmT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWmVPVPVWmT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmT  
 
 
Subroutine CouplingcVWmVPVWmVZT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Cos(TWp)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TWp)*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TWp)*Sin(2._dp*(TW)))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZT  
 
 
Subroutine CouplingcVWmVPVWmVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZp' 
 
res1 = 0._dp 
res1 = res1-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
res2 = 0._dp 
res2 = res2+g2**2*Sin(2._dp*(TW))*Sin(TWp)
res3 = 0._dp 
res3 = res3+g2**2*Sin(2._dp*(TW))*Sin(TWp)
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZpT  
 
 
Subroutine CouplingcVWmcVWmVWmVWmT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmT  
 
 
Subroutine CouplingcVWmVWmVZVZT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Cos(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Cos(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Cos(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZT  
 
 
Subroutine CouplingcVWmVWmVZVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)**2*Sin(2._dp*(TWp))
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZpT  
 
 
Subroutine CouplingcVWmVWmVZpVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZpVZp' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Sin(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Sin(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Sin(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZpVZpT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWmgAVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAVWmT  
 
 
Subroutine CouplingcgWpCgAcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmT  
 
 
Subroutine CouplingcgWmgWmVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVPT  
 
 
Subroutine CouplingcgWmgWmVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZT  
 
 
Subroutine CouplingcgWmgWmVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZpT  
 
 
Subroutine CouplingcgAgWmcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmT  
 
 
Subroutine CouplingcgZgWmcVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmT  
 
 
Subroutine CouplingcgZpgWmcVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWmcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWmcVWmT  
 
 
Subroutine CouplingcgWpCgWpCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVPT  
 
 
Subroutine CouplingcgAgWpCVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpCVWmT  
 
 
Subroutine CouplingcgZgWpCVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCVWmT  
 
 
Subroutine CouplingcgZpgWpCVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpCVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpCVWmT  
 
 
Subroutine CouplingcgWpCgWpCVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZT  
 
 
Subroutine CouplingcgWpCgWpCVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZpT  
 
 
Subroutine CouplingcgWmgZVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZVWmT  
 
 
Subroutine CouplingcgWpCgZcVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmT  
 
 
Subroutine CouplingcgWmgZpVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZpVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZpVWmT  
 
 
Subroutine CouplingcgWpCgZpcVWmT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZpcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZpcVWmT  
 
 
Subroutine CouplingcgWmgWmAhT(gt3,g2,v,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*RXiWm*ZA(gt3,1))/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmAhT  
 
 
Subroutine CouplingcgWpCgWpCAhT(gt3,g2,v,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWm*ZA(gt3,1))/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCAhT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)**2*Cos(TWp)*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*v*Cos(TW)*Cos(TWp)*RXiZ*Sin(TW)*ZH(gt3,1))/4._dp
res = res-(g2**2*v*Cos(TW)*Cos(TWp)*RXiZ*Sin(TW)*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res-(g1*gBY*v*Cos(TW)*RXiZ*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(gBY*g2*v*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+2*gYB**2*vX*Cos(TWp)*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2)
res = res-4*gBL*gYB*vX*Cos(TW)*RXiZ*Sin(TWp)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgZpgAhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*gBY*v*Cos(TW)*Cos(TWp)*RXiZp*ZH(gt3,1))/4._dp
res = res+(gBY*g2*v*Cos(TWp)*RXiZp*Sin(TW)*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)**2*RXiZp*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-(g1**2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g2**2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1*g2*v*RXiZp*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-4*gBL*gYB*vX*Cos(TW)*Cos(TWp)*RXiZp*ZH(gt3,2)
res = res-2*gYB**2*vX*RXiZp*Sin(2._dp*(TW))*Sin(TWp)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgAhhT  
 
 
Subroutine CouplingcgWmgAHmT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAHm' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*RXiWm)/4._dp
res = res+(g2**2*v*RXiWm*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAHmT  
 
 
Subroutine CouplingcgWpCgAcHmT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcHm' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*RXiWm)/4._dp
res = res+(g2**2*v*RXiWm*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcHmT  
 
 
Subroutine CouplingcgWmgWmhhT(gt3,g2,v,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWm*ZH(gt3,1))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmhhT  
 
 
Subroutine CouplingcgZgWmcHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcHm' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiZ*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcHmT  
 
 
Subroutine CouplingcgZpgWmcHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWmcHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiZp)/4._dp
res = res+(g2**2*v*Cos(TW)*RXiZp*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiZp*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWmcHmT  
 
 
Subroutine CouplingcgWpCgWpChhT(gt3,g2,v,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWm*ZH(gt3,1))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpChhT  
 
 
Subroutine CouplingcgZgWpCHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCHm' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiZ*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCHmT  
 
 
Subroutine CouplingcgZpgWpCHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpCHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiZp)/4._dp
res = res+(g2**2*v*Cos(TW)*RXiZp*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiZp*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpCHmT  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*Cos(TWp)**2*RXiZ*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,1))/2._dp
res = res-(g1**2*v*Cos(TWp)**2*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))/2._dp
res = res+(g1*gBY*v*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,1))/2._dp
res = res-(gBY**2*v*RXiZ*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res-4*gYB**2*vX*Cos(TWp)**2*RXiZ*Sin(TW)**2*ZH(gt3,2)
res = res+8*gBL*gYB*vX*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,2)
res = res-4*gBL**2*vX*RXiZ*Sin(TWp)**2*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgZpgZhhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)**2*RXiZp*ZH(gt3,1))/4._dp
res = res+(g1*gBY*v*Cos(TWp)**2*RXiZp*Sin(TW)*ZH(gt3,1))/4._dp
res = res-(gBY**2*v*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1**2*v*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-(gBY*g2*v*Cos(TW)*RXiZp*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res-(g1*gBY*v*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res+(g1*g2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt3,1))/4._dp
res = res+4*gBL*gYB*vX*Cos(TWp)**2*RXiZp*Sin(TW)*ZH(gt3,2)
res = res-4*gBL*gYB*vX*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,2)
res = res-2*gBL**2*vX*RXiZp*Sin(2._dp*(TWp))*ZH(gt3,2)
res = res+2*gYB**2*vX*RXiZp*Sin(TW)**2*Sin(2._dp*(TWp))*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZhhT  
 
 
Subroutine CouplingcgWmgZHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZHm' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*RXiWm)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiWm*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiWm*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZHmT  
 
 
Subroutine CouplingcgWpCgZcHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcHm' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*RXiWm)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiWm*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiWm*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcHmT  
 
 
Subroutine CouplingcgZgZphhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)**2*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1*gBY*v*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,1))/4._dp
res = res-(gBY**2*v*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1**2*v*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-(gBY*g2*v*Cos(TW)*RXiZ*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res-(g1*gBY*v*RXiZ*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res+(g1*g2*v*Cos(TW)*RXiZ*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt3,1))/4._dp
res = res+4*gBL*gYB*vX*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,2)
res = res-4*gBL*gYB*vX*RXiZ*Sin(TW)*Sin(TWp)**2*ZH(gt3,2)
res = res-2*gBL**2*vX*RXiZ*Sin(2._dp*(TWp))*ZH(gt3,2)
res = res+2*gYB**2*vX*RXiZ*Sin(TW)**2*Sin(2._dp*(TWp))*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZphhT  
 
 
Subroutine CouplingcgZpgZphhT(gt3,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY**2*v*Cos(TWp)**2*RXiZp*ZH(gt3,1))/4._dp
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))/2._dp
res = res-(g1*gBY*v*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))/2._dp
res = res-(g2**2*v*Cos(TW)**2*RXiZp*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))/2._dp
res = res-(g1**2*v*RXiZp*Sin(TW)**2*Sin(TWp)**2*ZH(gt3,1))/4._dp
res = res-4*gBL**2*vX*Cos(TWp)**2*RXiZp*ZH(gt3,2)
res = res-8*gBL*gYB*vX*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,2)
res = res-4*gYB**2*vX*RXiZp*Sin(TW)**2*Sin(TWp)**2*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZphhT  
 
 
Subroutine CouplingcgWmgZpHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZpHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiWm)/4._dp
res = res-(g2**2*v*Cos(TW)*RXiWm*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZpHmT  
 
 
Subroutine CouplingcgWpCgZpcHmT(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZpcHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiWm)/4._dp
res = res-(g2**2*v*Cos(TW)*RXiWm*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZpcHmT  
 
 
Subroutine CouplingsForEffPot4(lam2,lam3,lam1,ZA,ZH,cplAhAhAhAh,cplAhAhhhhh,          & 
& cplAhAhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm)

Implicit None 
Real(dp), Intent(in) :: ZA(2,2),ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),cplAhAhHmcHm(2,2),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHmcHm(2,2),cplHmHmcHmcHm

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHmcHm2L(gt1,gt2,lam3,lam1,ZA,cplAhAhHmcHm(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHmcHm2L(gt1,gt2,lam3,lam1,ZH,cplhhhhHmcHm(gt1,gt2))

 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Call CouplingHmHmcHmcHm2L(lam1,cplHmHmcHmcHm)



Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(lam2,lam3,lam1,v,vX,ZH,ZA,g3,Yd,ZDL,ZDR,               & 
& Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,cplAhAhhh,cplhhhhhh,cplhhHmcHm,cplVGVGVG,               & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHmL,cplcFuFdcHmR,               & 
& cplFvFecHmL,cplFvFecHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFuHmL,cplcFdFuHmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHmL,cplcFeFvHmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2),g3

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),           & 
& ZUL(3,3),ZUR(3,3),Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHmcHm(2),cplVGVGVG,cplcFdFdAhL(3,3,2),         & 
& cplcFdFdAhR(3,3,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),cplcFuFuAhL(3,3,2),           & 
& cplcFuFuAhR(3,3,2),cplFvFvAhL(6,6,2),cplFvFvAhR(6,6,2),cplcFdFdhhL(3,3,2),             & 
& cplcFdFdhhR(3,3,2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),cplFvFecHmL(6,3),               & 
& cplFvFecHmR(6,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),             & 
& cplcFuFuhhR(3,3,2),cplcFdFuHmL(3,3),cplcFdFuHmR(3,3),cplFvFvhhL(6,6,2),cplFvFvhhR(6,6,2),& 
& cplcFeFvHmL(3,6),cplcFeFvHmR(3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),  & 
& cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcHm2L(gt1,lam3,lam1,v,vX,ZH,cplhhHmcHm(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAh2L(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)             & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAh2L(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)             & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAh2L(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)             & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvAh2L(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)             & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcHm2L(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2)           & 
& ,cplcFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHmL = 0._dp 
cplFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecHm2L(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplFvFecHmL(gt1,gt2),cplFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)             & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)             & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHmL = 0._dp 
cplcFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuHm2L(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFdFuHmL(gt1,gt2)             & 
& ,cplcFdFuHmR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvhh2L(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHmL = 0._dp 
cplcFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvHm2L(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplcFeFvHmL(gt1,gt2),cplcFeFvHmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+6*lam1*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+6*lam2*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+2*lam2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHmcHm2L(gt1,gt2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((gt1.eq.gt2)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+6*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+6*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHmcHm2L(gt1,gt2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+2*lam1*ZH(gt1,1)*ZH(gt2,1)
End If 
If ((gt1.eq.gt2)) Then 
res = res+lam3*ZH(gt1,2)*ZH(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2L  
 
 
Subroutine CouplingHmHmcHmcHm2L(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
res = 0._dp 
res = res+4._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2L  
 
 
Subroutine CouplingAhAhhh2L(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*v*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res+lam3*v*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)
res = res+lam3*vX*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)
res = res+2*lam2*vX*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+6*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)
res = res+lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)
res = res+lam3*vX*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)
res = res+lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)
res = res+lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)
res = res+6*lam2*vX*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHmcHm2L(gt1,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*v*ZH(gt1,1)
res = res+lam3*vX*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingFvFvAh2L(gt1,gt2,gt3,Yx,Yv,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*ZA(gt3,1)*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZA(gt3,2)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*ZA(gt3,1)*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZA(gt3,2)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvAh2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdcHm2L(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHm2L  
 
 
Subroutine CouplingFvFecHm2L(gt1,gt2,Ye,Yv,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,3 + j2))*Yv(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecHm2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFuHm2L(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuHm2L  
 
 
Subroutine CouplingFvFvhh2L(gt1,gt2,gt3,Yx,Yv,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*ZH(gt3,1)*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZH(gt3,2)*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*ZH(gt3,1)*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*ZH(gt3,2)*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvhh2L  
 
 
Subroutine CouplingcFeFvHm2L(gt1,gt2,Ye,Yv,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*ZEL(gt1,j1)*UV(gt2,3 + j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvHm2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsForLoopMasses(lam2,lam3,lam1,v,vX,ZA,g1,g2,gYB,TW,gBL,            & 
& gBY,TWp,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,ZH,g3,cplAhAhUhh,cplAhUhhVP,         & 
& cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,            & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,            & 
& cplUhhHmcVWm,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,              & 
& cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,& 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,       & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWmgWmUAh,          & 
& cplcgWpCgWpCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHmcVWm,cplUAhUAhAhAh,          & 
& cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhVPVP,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,             & 
& cplUAhUAhVZpVZp,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,        & 
& cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFuFuAhL,      & 
& cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,   & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplUFvFvAhL,       & 
& cplUFvFvAhR,cplUFvFecHmL,cplUFvFecHmR,cplUFvFecVWmL,cplUFvFecVWmR,cplUFvFvhhL,         & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,              & 
& cplUFvFvVZpR,cplAhcHmVWm,cplcFuFdcHmL,cplcFuFdcHmR,cplFvFecHmL,cplFvFecHmR,            & 
& cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,        & 
& cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm,cplhhcHmVWm,cplHmcHmVP,cplHmcHmVZ,             & 
& cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,cplAhAhHmcHm,cplhhhhHmcHm,            & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp,cplAhhhVZ,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,      & 
& cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,      & 
& cplcVWmVWmVZVZ3,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,        & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,       & 
& cplhhVPVZp,cplhhVZpVZp,cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,         & 
& cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplAhHmcVWm,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,cplhhcVWmVWm,cplHmcVWmVP,    & 
& cplcVWmVPVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,            & 
& cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)

Implicit None 
Real(dp), Intent(in) :: v,vX,ZA(2,2),g1,g2,gYB,TW,gBL,gBY,TWp,ZH(2,2),g3

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),           & 
& ZUL(3,3),ZUR(3,3),Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(3,3,2),& 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplFvFvUhhL(6,6,2),cplFvFvUhhR(6,6,2),cplcgWmgWmUhh(2),            & 
& cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),    & 
& cplUhhhhhh(2,2,2),cplUhhHmcHm(2),cplUhhHmcVWm(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWmVWm(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2),cplUAhAhhh(2,2,2),cplcFdFdUAhL(3,3,2),         & 
& cplcFdFdUAhR(3,3,2),cplcFeFeUAhL(3,3,2),cplcFeFeUAhR(3,3,2),cplcFuFuUAhL(3,3,2),       & 
& cplcFuFuUAhR(3,3,2),cplFvFvUAhL(6,6,2),cplFvFvUAhR(6,6,2),cplcgWmgWmUAh(2),            & 
& cplcgWpCgWpCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),cplUAhhhVZp(2,2),cplUAhHmcVWm(2),   & 
& cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),cplUAhUAhHmcHm(2,2),cplUAhUAhVPVP(2,2),  & 
& cplUAhUAhcVWmVWm(2,2),cplUAhUAhVZVZ(2,2),cplUAhUAhVZpVZp(2,2),cplcUFdFdAhL(3,3,2),     & 
& cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),cplcUFdFuHmL(3,3),             & 
& cplcUFdFuHmR(3,3),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFuFuAhL(3,3,2),           & 
& cplcUFuFuAhR(3,3,2),cplcUFuFdcHmL(3,3),cplcUFuFdcHmR(3,3),cplcUFuFdcVWmL(3,3),         & 
& cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),         & 
& cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),               & 
& cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFeFeAhL(3,3,2),           & 
& cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),         & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),              & 
& cplcUFeFeVZpR(3,3),cplcUFeFvHmL(3,6),cplcUFeFvHmR(3,6),cplcUFeFvVWmL(3,6),             & 
& cplcUFeFvVWmR(3,6),cplUFvFvAhL(6,6,2),cplUFvFvAhR(6,6,2),cplUFvFecHmL(6,3),            & 
& cplUFvFecHmR(6,3),cplUFvFecVWmL(6,3),cplUFvFecVWmR(6,3),cplUFvFvhhL(6,6,2),            & 
& cplUFvFvhhR(6,6,2),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),& 
& cplUFvFvVZpL(6,6),cplUFvFvVZpR(6,6),cplAhcHmVWm(2),cplcFuFdcHmL(3,3),cplcFuFdcHmR(3,3),& 
& cplFvFecHmL(6,3),cplFvFecHmR(6,3),cplcgZgWmcHm,cplcgWmgZHm,cplcgZpgWmcHm,              & 
& cplcgWmgZpHm,cplcgWpCgZcHm,cplcgZgWpCHm,cplcgWpCgZpcHm,cplcgZpgWpCHm,cplhhHmcHm(2),    & 
& cplhhcHmVWm(2),cplHmcHmVP,cplHmcHmVZ,cplHmcHmVZp,cplcHmVPVWm,cplcHmVWmVZ,              & 
& cplcHmVWmVZp,cplAhAhHmcHm(2,2),cplhhhhHmcHm(2,2),cplHmHmcHmcHm,cplHmcHmVPVP,           & 
& cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplHmcHmVZpVZp,cplAhhhVZ(2,2),cplcFdFdVZL(3,3),           & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ(2),              & 
& cplhhVZVZ(2),cplhhVZVZp(2),cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2), & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplAhhhVZp(2,2),cplcFdFdVZpL(3,3)

Complex(dp), Intent(out) :: cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),               & 
& cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcgWmgWmVZp,cplcgWpCgWpCVZp,     & 
& cplhhVPVZp(2),cplhhVZpVZp(2),cplHmcVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp(2,2),            & 
& cplhhhhVZpVZp(2,2),cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,              & 
& cplAhHmcVWm(2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),& 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,              & 
& cplcgWpCgZpcVWm,cplhhHmcVWm(2),cplhhcVWmVWm(2),cplHmcVWmVP,cplcVWmVPVWm,               & 
& cplAhAhcVWmVWm(2,2),cplhhhhcVWmVWm(2,2),cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,               & 
& cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVPL(gt1,gt2,g1,g2,gYB,ZA,TW,cplAhUhhVP(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhUhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)               & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)               & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)               & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUhhL = 0._dp 
cplFvFvUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvUhhL(gt1,gt2,gt3,Yx,Yv,UV,cplFvFvUhhL(gt1,gt2,gt3),cplFvFvUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,v,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,v,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZgZUhh(gt3))

End Do 


cplcgZpgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZpgZUhh(gt3))

End Do 


cplcgZgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZgZpUhh(gt3))

End Do 


cplcgZpgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZpgZpUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHmcHmL(gt1,lam3,lam1,v,vX,cplUhhHmcHm(gt1))

End Do 


cplUhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHmcVWmL(gt1,g2,cplUhhHmcVWm(gt1))

End Do 


cplUhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVPVZ(gt1))

End Do 


cplUhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVPVZp(gt1))

End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,v,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZVZ(gt1))

End Do 


cplUhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZVZp(gt1))

End Do 


cplUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZpVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZpVZp(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHmcHmL(gt1,gt2,lam3,lam1,cplUhhUhhHmcHm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gYB,TW,cplUhhUhhVPVP(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUhhUhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplUAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUAhAhhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,cplUAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdUAhL = 0._dp 
cplcFdFdUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUAhL(gt1,gt2,gt3,Yd,ZDL,ZDR,cplcFdFdUAhL(gt1,gt2,gt3)               & 
& ,cplcFdFdUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUAhL = 0._dp 
cplcFeFeUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUAhL(gt1,gt2,gt3,Ye,ZEL,ZER,cplcFeFeUAhL(gt1,gt2,gt3)               & 
& ,cplcFeFeUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUAhL = 0._dp 
cplcFuFuUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUAhL(gt1,gt2,gt3,Yu,ZUL,ZUR,cplcFuFuUAhL(gt1,gt2,gt3)               & 
& ,cplcFuFuUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUAhL = 0._dp 
cplFvFvUAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvUAhL(gt1,gt2,gt3,Yx,Yv,UV,cplFvFvUAhL(gt1,gt2,gt3),cplFvFvUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUAhL(gt3,g2,v,cplcgWmgWmUAh(gt3))

End Do 


cplcgWpCgWpCUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUAhL(gt3,g2,v,cplcgWpCgWpCUAh(gt3))

End Do 


cplUAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVPL(gt1,gt2,g1,g2,gYB,ZH,TW,cplUAhhhVP(gt1,gt2))

 End Do 
End Do 


cplUAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplUAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplUAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplUAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplUAhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUAhHmcVWmL(gt1,g2,cplUAhHmcVWm(gt1))

End Do 


cplUAhUAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,cplUAhUAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,cplUAhUAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhHmcHmL(gt1,gt2,lam3,lam1,cplUAhUAhHmcHm(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVPVPL(gt1,gt2,g1,g2,gYB,TW,cplUAhUAhVPVP(gt1,gt2))

 End Do 
End Do 


cplUAhUAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhcVWmVWmL(gt1,gt2,g2,cplUAhUAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUAhUAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUAhUAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)            & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)            & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,gYB,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2)             & 
& ,cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,cplcUFdFdVZL(gt1,gt2) & 
& ,cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZpL = 0._dp 
cplcUFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,cplcUFdFdVZpL(gt1,gt2)& 
& ,cplcUFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuHmL = 0._dp 
cplcUFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuHmL(gt1,gt2,Yd,Yu,ZUL,ZUR,cplcUFdFuHmL(gt1,gt2),cplcUFdFuHmR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)            & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcHmL = 0._dp 
cplcUFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcHmL(gt1,gt2,Yd,Yu,ZDL,ZDR,cplcUFuFdcHmL(gt1,gt2),cplcUFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)            & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,gYB,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2)             & 
& ,cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,cplcUFuFuVZL(gt1,gt2) & 
& ,cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZpL = 0._dp 
cplcUFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,cplcUFuFuVZpL(gt1,gt2)& 
& ,cplcUFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)            & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)            & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,gYB,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2)             & 
& ,cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,cplcUFeFeVZL(gt1,gt2) & 
& ,cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZpL = 0._dp 
cplcUFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,cplcUFeFeVZpL(gt1,gt2)& 
& ,cplcUFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvHmL = 0._dp 
cplcUFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcUFeFvHmL(gt1,gt2,Ye,Yv,UV,cplcUFeFvHmL(gt1,gt2),cplcUFeFvHmR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcUFeFvVWmL(gt1,gt2,g2,UV,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplUFvFvAhL = 0._dp 
cplUFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingUFvFvAhL(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplUFvFvAhL(gt1,gt2,gt3),               & 
& cplUFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFecHmL = 0._dp 
cplUFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingUFvFecHmL(gt1,gt2,Ye,Yv,ZEL,ZER,cplUFvFecHmL(gt1,gt2),cplUFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplUFvFecVWmL = 0._dp 
cplUFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingUFvFecVWmL(gt1,gt2,g2,ZEL,cplUFvFecVWmL(gt1,gt2),cplUFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplUFvFvhhL = 0._dp 
cplUFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingUFvFvhhL(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplUFvFvhhL(gt1,gt2,gt3),               & 
& cplUFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFvVPL = 0._dp 
cplUFvFvVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingUFvFvVPL(gt1,gt2,g1,g2,gYB,UV,TW,cplUFvFvVPL(gt1,gt2),cplUFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplUFvFvVZL = 0._dp 
cplUFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingUFvFvVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplUFvFvVZL(gt1,gt2)        & 
& ,cplUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplUFvFvVZpL = 0._dp 
cplUFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingUFvFvVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplUFvFvVZpL(gt1,gt2)      & 
& ,cplUFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplAhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmL(gt1,g2,ZA,cplAhcHmVWm(gt1))

End Do 


cplcFuFdcHmL = 0._dp 
cplcFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcHmL(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHmL(gt1,gt2)            & 
& ,cplcFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHmL = 0._dp 
cplFvFecHmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecHmL(gt1,gt2,Ye,Yv,ZEL,ZER,UV,cplFvFecHmL(gt1,gt2),cplFvFecHmR(gt1,gt2))

 End Do 
End Do 


cplcgZgWmcHm = 0._dp 
Call CouplingcgZgWmcHmL(g1,g2,gBY,v,TW,TWp,cplcgZgWmcHm)



cplcgWmgZHm = 0._dp 
Call CouplingcgWmgZHmL(g1,g2,gBY,v,TW,TWp,cplcgWmgZHm)



cplcgZpgWmcHm = 0._dp 
Call CouplingcgZpgWmcHmL(g1,g2,gBY,v,TW,TWp,cplcgZpgWmcHm)



cplcgWmgZpHm = 0._dp 
Call CouplingcgWmgZpHmL(g1,g2,gBY,v,TW,TWp,cplcgWmgZpHm)



cplcgWpCgZcHm = 0._dp 
Call CouplingcgWpCgZcHmL(g1,g2,gBY,v,TW,TWp,cplcgWpCgZcHm)



cplcgZgWpCHm = 0._dp 
Call CouplingcgZgWpCHmL(g1,g2,gBY,v,TW,TWp,cplcgZgWpCHm)



cplcgWpCgZpcHm = 0._dp 
Call CouplingcgWpCgZpcHmL(g1,g2,gBY,v,TW,TWp,cplcgWpCgZpcHm)



cplcgZpgWpCHm = 0._dp 
Call CouplingcgZpgWpCHmL(g1,g2,gBY,v,TW,TWp,cplcgZpgWpCHm)



cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcHmL(gt1,lam3,lam1,v,vX,ZH,cplhhHmcHm(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmL(gt1,g2,ZH,cplhhcHmVWm(gt1))

End Do 


cplHmcHmVP = 0._dp 
Call CouplingHmcHmVPL(g1,g2,TW,cplHmcHmVP)



cplHmcHmVZ = 0._dp 
Call CouplingHmcHmVZL(g1,g2,gBY,TW,TWp,cplHmcHmVZ)



cplHmcHmVZp = 0._dp 
Call CouplingHmcHmVZpL(g1,g2,gBY,TW,TWp,cplHmcHmVZp)



cplcHmVPVWm = 0._dp 
Call CouplingcHmVPVWmL(g1,g2,v,TW,cplcHmVPVWm)



cplcHmVWmVZ = 0._dp 
Call CouplingcHmVWmVZL(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZ)



cplcHmVWmVZp = 0._dp 
Call CouplingcHmVWmVZpL(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZp)



cplAhAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHmcHmL(gt1,gt2,lam3,lam1,ZA,cplAhAhHmcHm(gt1,gt2))

 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHmcHmL(gt1,gt2,lam3,lam1,ZH,cplhhhhHmcHm(gt1,gt2))

 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Call CouplingHmHmcHmcHmL(lam1,cplHmHmcHmcHm)



cplHmcHmVPVP = 0._dp 
Call CouplingHmcHmVPVPL(g1,g2,TW,cplHmcHmVPVP)



cplHmcHmcVWmVWm = 0._dp 
Call CouplingHmcHmcVWmVWmL(g2,cplHmcHmcVWmVWm)



cplHmcHmVZVZ = 0._dp 
Call CouplingHmcHmVZVZL(g1,g2,gBY,TW,TWp,cplHmcHmVZVZ)



cplHmcHmVZpVZp = 0._dp 
Call CouplingHmcHmVZpVZpL(g1,g2,gBY,TW,TWp,cplHmcHmVZpVZp)



cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,TWp,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,TWp,cplcgWpCgWpCVZ)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplHmcVWmVZ = 0._dp 
Call CouplingHmcVWmVZL(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZ)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,TWp,cplcVWmVWmVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,TWp,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZpL(gt1,gt2)         & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZpL(gt1,gt2)         & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZp = 0._dp 
Call CouplingcgWmgWmVZpL(g2,TW,TWp,cplcgWmgWmVZp)



cplcgWpCgWpCVZp = 0._dp 
Call CouplingcgWpCgWpCVZpL(g2,TW,TWp,cplcgWpCgWpCVZp)



cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplHmcVWmVZp = 0._dp 
Call CouplingHmcVWmVZpL(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZp)



cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpL(g2,TW,TWp,cplcVWmVWmVZp)



cplAhAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZpVZp1 = 0._dp 
cplcVWmVWmVZpVZp2 = 0._dp 
cplcVWmVWmVZpVZp3 = 0._dp 
Call CouplingcVWmVWmVZpVZpL(g2,TW,TWp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,            & 
& cplcVWmVWmVZpVZp3)



cplAhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmL(gt1,g2,ZA,cplAhHmcVWm(gt1))

End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmL(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,TWp,cplcgZgWmcVWm)



cplcgZpgWmcVWm = 0._dp 
Call CouplingcgZpgWmcVWmL(g2,TW,TWp,cplcgZpgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,TWp,cplcgWpCgZcVWm)



cplcgWpCgZpcVWm = 0._dp 
Call CouplingcgWpCgZpcVWmL(g2,TW,TWp,cplcgWpCgZpcVWm)



cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmL(gt1,g2,ZH,cplhhHmcVWm(gt1))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Call CouplingHmcVWmVPL(g1,g2,v,TW,cplHmcVWmVP)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+2*lam1*v*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((2.eq.gt3)) Then 
res = res+lam3*vX*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt3)) Then 
res = res+lam3*v*ZA(gt1,2)*ZA(gt2,2)
End If 
If ((2.eq.gt3)) Then 
res = res+2*lam2*vX*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhUhhVPL(gt1,gt2,g1,g2,gYB,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g1*Cos(TW)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(g2*Sin(TW)*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+2*gYB*Cos(TW)*ZA(gt1,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVPL  
 
 
Subroutine CouplingAhUhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(gBY*Sin(TWp)*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-2*gYB*Cos(TWp)*Sin(TW)*ZA(gt1,2)
End If 
If ((2.eq.gt2)) Then 
res = res+2*gBL*Sin(TWp)*ZA(gt1,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingAhUhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(gBY*Cos(TWp)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+2*gBL*Cos(TWp)*ZA(gt1,2)
End If 
If ((2.eq.gt2)) Then 
res = res+2*gYB*Sin(TW)*Sin(TWp)*ZA(gt1,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZpL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingFvFvUhhL(gt1,gt2,gt3,Yx,Yv,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvUhhL  
 
 
Subroutine CouplingcgWmgWmUhhL(gt3,g2,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmUhhL  
 
 
Subroutine CouplingcgWpCgWpCUhhL(gt3,g2,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*v*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*v*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gYB**2*vX*Cos(TWp)**2*RXiZ*Sin(TW)**2
End If 
If ((1.eq.gt3)) Then 
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*gBY*v*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+8*gBL*gYB*vX*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY**2*v*RXiZ*Sin(TWp)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gBL**2*vX*RXiZ*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingcgZpgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)**2*RXiZp)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*gBY*v*Cos(TWp)**2*RXiZp*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+4*gBL*gYB*vX*Cos(TWp)**2*RXiZp*Sin(TW)
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY**2*v*Cos(TWp)*RXiZp*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)*RXiZp*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1**2*v*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY*g2*v*Cos(TW)*RXiZp*Sin(TWp)**2)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*gBY*v*RXiZp*Sin(TW)*Sin(TWp)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gBL*gYB*vX*RXiZp*Sin(TW)*Sin(TWp)**2
End If 
If ((2.eq.gt3)) Then 
res = res-2*gBL**2*vX*RXiZp*Sin(2._dp*(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(2._dp*(TWp)))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+2*gYB**2*vX*RXiZp*Sin(TW)**2*Sin(2._dp*(TWp))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZUhhL  
 
 
Subroutine CouplingcgZgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(gBY*g2*v*Cos(TW)*Cos(TWp)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*gBY*v*Cos(TWp)**2*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+4*gBL*gYB*vX*Cos(TWp)**2*RXiZ*Sin(TW)
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY**2*v*Cos(TWp)*RXiZ*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)*RXiZ*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1**2*v*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp))/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY*g2*v*Cos(TW)*RXiZ*Sin(TWp)**2)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*gBY*v*RXiZ*Sin(TW)*Sin(TWp)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gBL*gYB*vX*RXiZ*Sin(TW)*Sin(TWp)**2
End If 
If ((2.eq.gt3)) Then 
res = res-2*gBL**2*vX*RXiZ*Sin(2._dp*(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*v*Cos(TW)*RXiZ*Sin(TW)*Sin(2._dp*(TWp)))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+2*gYB**2*vX*RXiZ*Sin(TW)**2*Sin(2._dp*(TWp))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZpUhhL  
 
 
Subroutine CouplingcgZpgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(gBY**2*v*Cos(TWp)**2*RXiZp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gBL**2*vX*Cos(TWp)**2*RXiZp
End If 
If ((1.eq.gt3)) Then 
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*gBY*v*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-8*gBL*gYB*vX*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*v*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*v*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-4*gYB**2*vX*RXiZp*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZpUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+6*lam1*v*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res+lam3*vX*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+lam3*vX*ZH(gt2,2)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res+lam3*v*ZH(gt2,2)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+lam3*vX*ZH(gt2,1)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+lam3*v*ZH(gt2,1)*ZH(gt3,2)
End If 
If ((1.eq.gt1)) Then 
res = res+lam3*v*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+6*lam2*vX*ZH(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhHmcHmL(gt1,lam3,lam1,v,vX,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vX

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+2*lam1*v
End If 
If ((2.eq.gt1)) Then 
res = res+lam3*vX
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcHmL  
 
 
Subroutine CouplingUhhHmcVWmL(gt1,g2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp*(g2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcVWmL  
 
 
Subroutine CouplingUhhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g1*g2*v*Cos(TW)**2*Cos(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1**2*v*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*v*Cos(TWp)*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-4*gYB**2*vX*Cos(TWp)*Sin(2._dp*(TW))
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*gBY*v*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gBL*gYB*vX*Cos(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-(gBY*g2*v*Sin(TW)*Sin(TWp))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVPVZL  
 
 
Subroutine CouplingUhhVPVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1*gBY*v*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gBL*gYB*vX*Cos(TW)*Cos(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-(gBY*g2*v*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*v*Cos(TW)**2*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g2**2*v*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*g2*v*Sin(TW)**2*Sin(TWp))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+4*gYB**2*vX*Sin(2._dp*(TW))*Sin(TWp)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVPVZpL  
 
 
Subroutine CouplingUhhcVWmVWmL(gt1,g2,v,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWmVWmL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*v*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gYB**2*vX*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1)) Then 
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1)) Then 
res = res-16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+(gBY**2*v*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gBL**2*vX*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingUhhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*gBY*v*Cos(TWp)**2*Sin(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-8*gBL*gYB*vX*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(gBY**2*v*Cos(TWp)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g2**2*v*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1**2*v*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(gBY*g2*v*Cos(TW)*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*gBY*v*Sin(TW)*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gBL*gYB*vX*Sin(TW)*Sin(TWp)**2
End If 
If ((2.eq.gt1)) Then 
res = res+4*gBL**2*vX*Sin(2._dp*(TWp))
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*g2*v*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-4*gYB**2*vX*Sin(TW)**2*Sin(2._dp*(TWp))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZpL  
 
 
Subroutine CouplingUhhVZpVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(gBY**2*v*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gBL**2*vX*Cos(TWp)**2
End If 
If ((1.eq.gt1)) Then 
res = res+gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1)) Then 
res = res+16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*v*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+8*gYB**2*vX*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZpVZpL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res+lam3*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res+2*lam2*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+6*lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+lam3*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+lam3*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+lam3*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+6*lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHmcHmL(gt1,gt2,lam3,lam1,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+2._dp*(lam1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHmcHmL  
 
 
Subroutine CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gYB,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVPVPL  
 
 
Subroutine CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhcVWmVWmL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(gBY**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gBL**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
Subroutine CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(gBY**2*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gBL**2*Cos(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZpVZpL  
 
 
Subroutine CouplingUAhAhhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: v,vX,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+2*lam1*v*ZA(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res+lam3*v*ZA(gt2,2)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+lam3*vX*ZA(gt2,1)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+2*lam2*vX*ZA(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhAhhhL  
 
 
Subroutine CouplingcFdFdUAhL(gt1,gt2,gt3,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUAhL  
 
 
Subroutine CouplingcFeFeUAhL(gt1,gt2,gt3,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUAhL  
 
 
Subroutine CouplingcFuFuUAhL(gt1,gt2,gt3,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUAhL  
 
 
Subroutine CouplingFvFvUAhL(gt1,gt2,gt3,Yx,Yv,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j1))*Conjg(UV(gt2,3 + j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j2))*Conjg(UV(gt2,3 + j1))*Yx(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,3 + j2))*Yx(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*UV(gt1,3 + j2)*UV(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*UV(gt1,3 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*UV(gt1,j1)*UV(gt2,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,j2))*UV(gt1,3 + j1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvUAhL  
 
 
Subroutine CouplingcgWmgWmUAhL(gt3,g2,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*v*RXiWm)/4._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmUAhL  
 
 
Subroutine CouplingcgWpCgWpCUAhL(gt3,g2,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWm)/4._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCUAhL  
 
 
Subroutine CouplingUAhhhVPL(gt1,gt2,g1,g2,gYB,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1*Cos(TW)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g2*Sin(TW)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gYB*Cos(TW)*ZH(gt2,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVPL  
 
 
Subroutine CouplingUAhhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g2*Cos(TW)*Cos(TWp)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*Cos(TWp)*Sin(TW)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(gBY*Sin(TWp)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-2*gYB*Cos(TWp)*Sin(TW)*ZH(gt2,2)
End If 
If ((2.eq.gt1)) Then 
res = res+2*gBL*Sin(TWp)*ZH(gt2,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVZL  
 
 
Subroutine CouplingUAhhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(gBY*Cos(TWp)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g2*Cos(TW)*Sin(TWp)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*Sin(TW)*Sin(TWp)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gBL*Cos(TWp)*ZH(gt2,2)
End If 
If ((2.eq.gt1)) Then 
res = res+2*gYB*Sin(TW)*Sin(TWp)*ZH(gt2,2)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVZpL  
 
 
Subroutine CouplingUAhHmcVWmL(gt1,g2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhHmcVWmL  
 
 
Subroutine CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+6*lam1*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+lam3*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+lam3*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+lam3*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+6*lam2*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhAhAhL  
 
 
Subroutine CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+2*lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+lam3*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhhhhhL  
 
 
Subroutine CouplingUAhUAhHmcHmL(gt1,gt2,lam3,lam1,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+2._dp*(lam1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+lam3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhHmcHmL  
 
 
Subroutine CouplingUAhUAhVPVPL(gt1,gt2,g1,g2,gYB,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVPVPL  
 
 
Subroutine CouplingUAhUAhcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhcVWmVWmL  
 
 
Subroutine CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(gBY**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gBL**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVZVZL  
 
 
Subroutine CouplingUAhUAhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(gBY**2*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gBL**2*Cos(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVZpVZpL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,gYB,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(ZDL(gt2,gt1))*Cos(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gYB*Conjg(ZDL(gt2,gt1))*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBY*Conjg(ZDL(gt2,gt1))*Sin(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(ZDL(gt2,gt1))*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(gBY*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,               & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBY*Conjg(ZDL(gt2,gt1))*Cos(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(ZDL(gt2,gt1))*Cos(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZDL(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(ZDL(gt2,gt1))*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(gBY*Cos(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Cos(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZpL  
 
 
Subroutine CouplingcUFdFuHmL(gt1,gt2,Yd,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*Yd(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,gt1))*ZUR(gt2,j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuHmL  
 
 
Subroutine CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuVWmL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdcHmL(gt1,gt2,Yd,Yu,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Yu(gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,gt1))*ZDR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcHmL  
 
 
Subroutine CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcVWmL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,gYB,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(ZUL(gt2,gt1))*Cos(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gYB*Conjg(ZUL(gt2,gt1))*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBY*Conjg(ZUL(gt2,gt1))*Sin(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(ZUL(gt2,gt1))*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Cos(TWp)*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*gBY*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,               & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBY*Conjg(ZUL(gt2,gt1))*Cos(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(ZUL(gt2,gt1))*Cos(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZUL(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(ZUL(gt2,gt1))*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*gBY*Cos(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Cos(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Sin(TW)*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZpL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,gYB,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gYB*Conjg(ZEL(gt2,gt1))*Cos(TW)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gYB*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(ZEL(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gBY*Conjg(ZEL(gt2,gt1))*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gBL*Conjg(ZEL(gt2,gt1))*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW)*ZER(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Cos(TWp)*Sin(TW)*ZER(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gBY*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gBL*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,               & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gBY*Conjg(ZEL(gt2,gt1))*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gBL*Conjg(ZEL(gt2,gt1))*Cos(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZEL(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gYB*Conjg(ZEL(gt2,gt1))*Sin(TW)*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gBY*Cos(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gBL*Cos(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Sin(TW)*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gYB*Sin(TW)*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZpL  
 
 
Subroutine CouplingcUFeFvHmL(gt1,gt2,Ye,Yv,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Ye(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-(Conjg(Yv(gt1,j2))*UV(gt2,3 + j2))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvHmL  
 
 
Subroutine CouplingcUFeFvVWmL(gt1,gt2,g2,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(UV(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvVWmL  
 
 
Subroutine CouplingUFvFvAhL(gt1,gt2,gt3,Yx,Yv,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j1))*Yv(j1,-3 + gt1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j1))*Yx(j1,-3 + gt1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j2))*Yv(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j2))*Yx(-3 + gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,-3 + gt1))*ZA(gt3,1)*UV(gt2,j1))/sqrt(2._dp)
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,-3 + gt1))*ZA(gt3,2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR+(Conjg(Yv(gt1,j2))*ZA(gt3,1)*UV(gt2,3 + j2))/sqrt(2._dp)
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(Yx(-3 + gt1,j2))*ZA(gt3,2)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvAhL  
 
 
Subroutine CouplingUFvFecHmL(gt1,gt2,Ye,Yv,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Yv(j1,-3 + gt1))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFecHmL  
 
 
Subroutine CouplingUFvFecVWmL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFecVWmL  
 
 
Subroutine CouplingUFvFvhhL(gt1,gt2,gt3,Yx,Yv,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j1))*Yv(j1,-3 + gt1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Yx(j1,-3 + gt1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j2))*Yv(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j2))*Yx(-3 + gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,-3 + gt1))*ZH(gt3,1)*UV(gt2,j1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yx(j1,-3 + gt1))*ZH(gt3,2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(Yv(gt1,j2))*ZH(gt3,1)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(Yx(-3 + gt1,j2))*ZH(gt3,2)*UV(gt2,3 + j2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvhhL  
 
 
Subroutine CouplingUFvFvVPL(gt1,gt2,g1,g2,gYB,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gYB,TW

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(UV(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(UV(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gYB*Conjg(UV(gt2,gt1))*Cos(TW)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(UV(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+gYB*Cos(TW)*UV(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Cos(TW)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Cos(TW)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVPL  
 
 
Subroutine CouplingUFvFvVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+gYB*Conjg(UV(gt2,gt1))*Cos(TWp)*Sin(TW)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(UV(gt2,gt1))*Sin(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(UV(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(UV(gt2,gt1))*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(UV(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gBY*Conjg(UV(gt2,gt1))*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gBL*Conjg(UV(gt2,gt1))*Sin(TWp)
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(gYB*Cos(TWp)*Sin(TW)*UV(gt2,gt1))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+gBL*Sin(TWp)*UV(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Cos(TW)*Cos(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TWp)*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gYB*Cos(TWp)*Sin(TW)*UV(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBY*Sin(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Sin(TWp)*UV(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZL  
 
 
Subroutine CouplingUFvFvVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(gBL*Conjg(UV(gt2,gt1))*Cos(TWp))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(gYB*Conjg(UV(gt2,gt1))*Sin(TW)*Sin(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(gBY*Conjg(UV(gt2,gt1))*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gBL*Conjg(UV(gt2,gt1))*Cos(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(UV(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(UV(gt2,gt1))*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+gYB*Conjg(UV(gt2,gt1))*Sin(TW)*Sin(TWp)
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+gBL*Cos(TWp)*UV(gt2,gt1)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+gYB*Sin(TW)*Sin(TWp)*UV(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBY*Cos(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gBL*Cos(TWp)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g2*Cos(TW)*Sin(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*Sin(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp)*UV(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZpL  
 
 
Subroutine CouplingAhcHmVWmL(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmVWmL  
 
 
Subroutine CouplingcFuFdcHmL(gt1,gt2,Yd,Yu,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcHmL  
 
 
Subroutine CouplingFvFecHmL(gt1,gt2,Ye,Yv,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZEL(3,3),ZER(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,3 + j2))*Yv(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecHmL  
 
 
Subroutine CouplingcgZgWmcHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcHm' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiZ*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcHmL  
 
 
Subroutine CouplingcgWmgZHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZHm' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*RXiWm)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiWm*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiWm*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZHmL  
 
 
Subroutine CouplingcgZpgWmcHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWmcHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiZp)/4._dp
res = res+(g2**2*v*Cos(TW)*RXiZp*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiZp*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWmcHmL  
 
 
Subroutine CouplingcgWmgZpHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZpHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiWm)/4._dp
res = res-(g2**2*v*Cos(TW)*RXiWm*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZpHmL  
 
 
Subroutine CouplingcgWpCgZcHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcHm' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*RXiWm)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiWm*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiWm*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcHmL  
 
 
Subroutine CouplingcgZgWpCHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCHm' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res+(gBY*g2*v*RXiZ*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCHmL  
 
 
Subroutine CouplingcgWpCgZpcHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZpcHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiWm)/4._dp
res = res-(g2**2*v*Cos(TW)*RXiWm*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiWm*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZpcHmL  
 
 
Subroutine CouplingcgZpgWpCHmL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpCHm' 
 
res = 0._dp 
res = res+(gBY*g2*v*Cos(TWp)*RXiZp)/4._dp
res = res+(g2**2*v*Cos(TW)*RXiZp*Sin(TWp))/4._dp
res = res+(g1*g2*v*RXiZp*Sin(TW)*Sin(TWp))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpCHmL  
 
 
Subroutine CouplinghhHmcHmL(gt1,lam3,lam1,v,vX,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vX,ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*v*ZH(gt1,1)
res = res+lam3*vX*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHmL  
 
 
Subroutine CouplinghhcHmVWmL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmVWmL  
 
 
Subroutine CouplingHmcHmVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
res = 0._dp 
res = res-(g1*Cos(TW))/2._dp
res = res-(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPL  
 
 
Subroutine CouplingHmcHmVZL(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))/2._dp
res = res+(g1*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZL  
 
 
Subroutine CouplingHmcHmVZpL(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZp' 
 
res = 0._dp 
res = res-(gBY*Cos(TWp))/2._dp
res = res+(g2*Cos(TW)*Sin(TWp))/2._dp
res = res-(g1*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZpL  
 
 
Subroutine CouplingcHmVPVWmL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVPVWm' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVPVWmL  
 
 
Subroutine CouplingcHmVWmVZL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZ' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*g2*v*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZL  
 
 
Subroutine CouplingcHmVWmVZpL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmVWmVZp' 
 
res = 0._dp 
res = res-(gBY*g2*v*Cos(TWp))/2._dp
res = res-(g1*g2*v*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmVWmVZpL  
 
 
Subroutine CouplingAhAhHmcHmL(gt1,gt2,lam3,lam1,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*ZA(gt1,1)*ZA(gt2,1)
res = res+lam3*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmL  
 
 
Subroutine CouplinghhhhHmcHmL(gt1,gt2,lam3,lam1,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam3,lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+2*lam1*ZH(gt1,1)*ZH(gt2,1)
res = res+lam3*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmL  
 
 
Subroutine CouplingHmHmcHmcHmL(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
res = 0._dp 
res = res+4._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmL  
 
 
Subroutine CouplingHmcHmVPVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPL  
 
 
Subroutine CouplingHmcHmcVWmVWmL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmL  
 
 
Subroutine CouplingHmcHmVZVZL(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW))
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(gBY**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZL  
 
 
Subroutine CouplingHmcHmVZpVZpL(g1,g2,gBY,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZpVZp' 
 
res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2)/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZpVZpL  
 
 
Subroutine CouplingAhhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(gBY*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-2*gYB*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res+2*gBL*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gBY*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gBY*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gBL*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBY*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBL*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(gYB*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*gBY*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingFvFvVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gBL*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL+gYB*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+gYB*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+gBL*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZL  
 
 
Subroutine CouplingcgWmgWmVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZL  
 
 
Subroutine CouplingcgWpCgWpCVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZL  
 
 
Subroutine CouplinghhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(g1**2*v*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g2**2*v*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*v*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g1*gBY*v*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-4*gYB**2*vX*Cos(TWp)*Sin(2._dp*(TW))*ZH(gt1,2)
res = res+8*gBL*gYB*vX*Cos(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(gBY**2*v*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+8*gYB**2*vX*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)
res = res-16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+8*gBL**2*vX*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplinghhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(gBY*g2*v*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-(g1*gBY*v*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(gBY**2*v*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g2**2*v*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g1**2*v*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(gBY*g2*v*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(g1*gBY*v*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-(g1*g2*v*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1))/2._dp
res = res-8*gBL*gYB*vX*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res+8*gBL*gYB*vX*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+4*gBL**2*vX*Sin(2._dp*(TWp))*ZH(gt1,2)
res = res-4*gYB**2*vX*Sin(TW)**2*Sin(2._dp*(TWp))*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZpL  
 
 
Subroutine CouplingHmcVWmVZL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZ' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TWp)*Sin(TW))/2._dp
res = res-(gBY*g2*v*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZL  
 
 
Subroutine CouplingcVWmVWmVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZL  
 
 
Subroutine CouplingAhAhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(gBY**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2)
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gBL**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-(g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(gBY**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gYB**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2)
res = res-16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gBL**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingcVWmVWmVZVZL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Cos(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Cos(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Cos(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZL  
 
 
Subroutine CouplingAhhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gBL*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = res+2*gYB*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZpL  
 
 
Subroutine CouplingcFdFdVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(gBY*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZpL  
 
 
Subroutine CouplingcFeFeVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(gBY*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gBL*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+gYB*Sin(TW)*Sin(TWp)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+gBY*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gBL*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Sin(TW)*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+gYB*Sin(TW)*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZpL  
 
 
Subroutine CouplingcFuFuVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBY*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW)*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*gBY*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gBL*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(gYB*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZpL  
 
 
Subroutine CouplingFvFvVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,TW,TWp

Complex(dp), Intent(in) :: UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(gBY*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gBL*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gYB*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1)
End Do 
Do j1 = 1,3
resL = resL-(gBL*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(gYB*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(gBY*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gBL*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gYB*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+gBL*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+gYB*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZpL  
 
 
Subroutine CouplingcgWmgWmVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZpL  
 
 
Subroutine CouplingcgWpCgWpCVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZpL  
 
 
Subroutine CouplinghhVPVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*gBY*v*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-(gBY*g2*v*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*v*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(g1**2*v*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g2**2*v*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(g1*g2*v*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+8*gBL*gYB*vX*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+4*gYB**2*vX*Sin(2._dp*(TW))*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZpL  
 
 
Subroutine CouplinghhVZpVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,v,vX,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*v*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+gBY*g2*v*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+g1*gBY*v*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(g2**2*v*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+8*gBL**2*vX*Cos(TWp)**2*ZH(gt1,2)
res = res+16*gBL*gYB*vX*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+8*gYB**2*vX*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZpVZpL  
 
 
Subroutine CouplingHmcVWmVZpL(g1,g2,gBY,v,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,gBY,v,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVZp' 
 
res = 0._dp 
res = res-(gBY*g2*v*Cos(TWp))/2._dp
res = res-(g1*g2*v*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVZpL  
 
 
Subroutine CouplingcVWmVWmVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZpL  
 
 
Subroutine CouplingAhAhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+8*gBL**2*Cos(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZpVZpL  
 
 
Subroutine CouplinghhhhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gBL,gBY,gYB,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(gBY**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+gBY*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+g1*gBY*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+8*gBL**2*Cos(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res = res+16*gBL*gYB*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+8*gYB**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZpVZpL  
 
 
Subroutine CouplingcVWmVWmVZpVZpL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZpVZp' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Sin(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Sin(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Sin(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZpVZpL  
 
 
Subroutine CouplingAhHmcVWmL(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcVWmL  
 
 
Subroutine CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmL  
 
 
Subroutine CouplingFvFecVWmL(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3),UV(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWmL  
 
 
Subroutine CouplingcgWpCgAcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmL  
 
 
Subroutine CouplingcgAgWmcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmL  
 
 
Subroutine CouplingcgZgWmcVWmL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmL  
 
 
Subroutine CouplingcgZpgWmcVWmL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWmcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWmcVWmL  
 
 
Subroutine CouplingcgWpCgZcVWmL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmL  
 
 
Subroutine CouplingcgWpCgZpcVWmL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZpcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZpcVWmL  
 
 
Subroutine CouplinghhHmcVWmL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcVWmL  
 
 
Subroutine CouplinghhcVWmVWmL(gt1,g2,v,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmL  
 
 
Subroutine CouplingHmcVWmVPL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcVWmVP' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcVWmVPL  
 
 
Subroutine CouplingcVWmVPVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmL  
 
 
Subroutine CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmL  
 
 
Subroutine CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmL  
 
 
Subroutine CouplingcVWmVPVPVWmL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmL  
 
 
Subroutine CouplingcVWmcVWmVWmVWmL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmL  
 
 
Subroutine CouplingsForVectorBosons(g2,ZA,ZH,g1,gBY,TW,TWp,v,gBL,gYB,UV,              & 
& vX,ZDL,ZUL,ZEL,cplAhcHmVWm,cplhhcHmVWm,cplHmcHmVZ,cplcHmVPVWm,cplcHmVWmVZ,             & 
& cplcHmVWmVZp,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,    & 
& cplhhhhVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplHmcVWmVZp,              & 
& cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplAhHmcVWm,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm,               & 
& cplhhcVWmVWm,cplHmcVWmVP,cplcVWmVPVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplcVWmVPVPVWm1,   & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)

Implicit None 
Real(dp), Intent(in) :: g2,ZA(2,2),ZH(2,2),g1,gBY,TW,TWp,v,gBL,gYB,vX

Complex(dp), Intent(in) :: UV(6,6),ZDL(3,3),ZUL(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhcHmVWm(2),cplhhcHmVWm(2),cplHmcHmVZ,cplcHmVPVWm,cplcHmVWmVZ,cplcHmVWmVZp,        & 
& cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplAhhhVZ(2,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),   & 
& cplHmcVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplcVWmVWmVZVZ1,            & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplHmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,          & 
& cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,cplAhHmcVWm(2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),& 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,        & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHmcVWm(2),cplhhcVWmVWm(2),          & 
& cplHmcVWmVP,cplcVWmVPVWm,cplAhAhcVWmVWm(2,2),cplhhhhcVWmVWm(2,2),cplcVWmVPVPVWm1,      & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHmVWmL(gt1,g2,ZA,cplAhcHmVWm(gt1))

End Do 


cplhhcHmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHmVWmL(gt1,g2,ZH,cplhhcHmVWm(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Call CouplingHmcHmVZL(g1,g2,gBY,TW,TWp,cplHmcHmVZ)



cplcHmVPVWm = 0._dp 
Call CouplingcHmVPVWmL(g1,g2,v,TW,cplcHmVPVWm)



cplcHmVWmVZ = 0._dp 
Call CouplingcHmVWmVZL(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZ)



cplcHmVWmVZp = 0._dp 
Call CouplingcHmVWmVZpL(g1,g2,gBY,v,TW,TWp,cplcHmVWmVZp)



cplHmcHmcVWmVWm = 0._dp 
Call CouplingHmcHmcVWmVWmL(g2,cplHmcHmcVWmVWm)



cplHmcHmVZVZ = 0._dp 
Call CouplingHmcHmVZVZL(g1,g2,gBY,TW,TWp,cplHmcHmVZVZ)



cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFdFdVZL(gt1,gt2)           & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFeFeVZL(gt1,gt2)           & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplcFuFuVZL(gt1,gt2)           & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,UV,TW,TWp,cplFvFvVZL(gt1,gt2)          & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,TWp,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,TWp,cplcgWpCgWpCVZ)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplHmcVWmVZ = 0._dp 
Call CouplingHmcVWmVZL(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZ)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,TWp,cplcVWmVWmVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,TWp,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplHmcVWmVZp = 0._dp 
Call CouplingHmcVWmVZpL(g1,g2,gBY,v,TW,TWp,cplHmcVWmVZp)



cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpL(g2,TW,TWp,cplcVWmVWmVZp)



cplcVWmVWmVZpVZp1 = 0._dp 
cplcVWmVWmVZpVZp2 = 0._dp 
cplcVWmVWmVZpVZp3 = 0._dp 
Call CouplingcVWmVWmVZpVZpL(g2,TW,TWp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,            & 
& cplcVWmVWmVZpVZp3)



cplAhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHmcVWmL(gt1,g2,ZA,cplAhHmcVWm(gt1))

End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmL(gt1,gt2,g2,ZEL,UV,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,TWp,cplcgZgWmcVWm)



cplcgZpgWmcVWm = 0._dp 
Call CouplingcgZpgWmcVWmL(g2,TW,TWp,cplcgZpgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,TWp,cplcgWpCgZcVWm)



cplcgWpCgZpcVWm = 0._dp 
Call CouplingcgWpCgZpcVWmL(g2,TW,TWp,cplcgWpCgZpcVWm)



cplhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHmcVWmL(gt1,g2,ZH,cplhhHmcVWm(gt1))

End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,v,ZH,cplhhcVWmVWm(gt1))

End Do 


cplHmcVWmVP = 0._dp 
Call CouplingHmcVWmVPL(g1,g2,v,TW,cplHmcVWmVP)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,ZA,ZDL,ZDR,ZH,g3,g1,g2,gYB,TW,gBL,               & 
& gBY,TWp,Yu,ZUL,ZUR,Ye,ZEL,ZER,Yv,UV,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,            & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHmL,cplcUFdFuHmR,cplcUFdFuVWmL,      & 
& cplcUFdFuVWmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHmL,cplcUFuFdcHmR,cplcUFuFdcVWmL,    & 
& cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,       & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFeFeAhL,       & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHmL,cplcUFeFvHmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR)

Implicit None 
Real(dp), Intent(in) :: ZA(2,2),ZH(2,2),g3,g1,g2,gYB,TW,gBL,gBY,TWp

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),        & 
& Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3,2),cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHmL(3,3),cplcUFdFuHmR(3,3),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),             & 
& cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),cplcUFuFdcHmL(3,3),cplcUFuFdcHmR(3,3),         & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),             & 
& cplcUFeFeAhL(3,3,2),cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),       & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFvHmL(3,6),cplcUFeFvHmR(3,6),             & 
& cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)            & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)            & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,gYB,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2)             & 
& ,cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,cplcUFdFdVZL(gt1,gt2) & 
& ,cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZpL = 0._dp 
cplcUFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZDL,ZDR,TW,TWp,cplcUFdFdVZpL(gt1,gt2)& 
& ,cplcUFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuHmL = 0._dp 
cplcUFdFuHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuHmL(gt1,gt2,Yd,Yu,ZUL,ZUR,cplcUFdFuHmL(gt1,gt2),cplcUFdFuHmR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)            & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcHmL = 0._dp 
cplcUFuFdcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcHmL(gt1,gt2,Yd,Yu,ZDL,ZDR,cplcUFuFdcHmL(gt1,gt2),cplcUFuFdcHmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)            & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,gYB,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2)             & 
& ,cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,cplcUFuFuVZL(gt1,gt2) & 
& ,cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZpL = 0._dp 
cplcUFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZUL,ZUR,TW,TWp,cplcUFuFuVZpL(gt1,gt2)& 
& ,cplcUFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)            & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)            & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,gYB,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2)             & 
& ,cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,cplcUFeFeVZL(gt1,gt2) & 
& ,cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZpL = 0._dp 
cplcUFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZEL,ZER,TW,TWp,cplcUFeFeVZpL(gt1,gt2)& 
& ,cplcUFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvHmL = 0._dp 
cplcUFeFvHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcUFeFvHmL(gt1,gt2,Ye,Yv,UV,cplcUFeFvHmL(gt1,gt2),cplcUFeFvHmR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcUFeFvVWmL(gt1,gt2,g2,UV,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(lam2,lam3,lam1,v,vX,ZA,g1,g2,gYB,TW,gBL,              & 
& gBY,TWp,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,Yx,Yv,UV,ZH,cplAhAhUhh,cplAhUhhVP,            & 
& cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,            & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHmcHm,            & 
& cplUhhHmcVWm,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWmVWm,cplUhhVZVZ,cplUhhVZVZp,              & 
& cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhVPVP,cplUhhUhhcVWmVWm,& 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp)

Implicit None 
Real(dp), Intent(in) :: v,vX,ZA(2,2),g1,g2,gYB,TW,gBL,gBY,TWp,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam1,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),           & 
& ZUL(3,3),ZUR(3,3),Yx(3,3),Yv(3,3),UV(6,6)

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(3,3,2),& 
& cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),       & 
& cplcFuFuUhhR(3,3,2),cplFvFvUhhL(6,6,2),cplFvFvUhhR(6,6,2),cplcgWmgWmUhh(2),            & 
& cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),    & 
& cplUhhhhhh(2,2,2),cplUhhHmcHm(2),cplUhhHmcVWm(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWmVWm(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVPL(gt1,gt2,g1,g2,gYB,ZA,TW,cplAhUhhVP(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,ZA,TW,TWp,cplAhUhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)               & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)               & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)               & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUhhL = 0._dp 
cplFvFvUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingFvFvUhhL(gt1,gt2,gt3,Yx,Yv,UV,cplFvFvUhhL(gt1,gt2,gt3),cplFvFvUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,v,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,v,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZgZUhh(gt3))

End Do 


cplcgZpgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZpgZUhh(gt3))

End Do 


cplcgZgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZgZpUhh(gt3))

End Do 


cplcgZpgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZpUhhL(gt3,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplcgZpgZpUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam2,lam3,lam1,v,vX,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHmcHmL(gt1,lam3,lam1,v,vX,cplUhhHmcHm(gt1))

End Do 


cplUhhHmcVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHmcVWmL(gt1,g2,cplUhhHmcVWm(gt1))

End Do 


cplUhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVPVZ(gt1))

End Do 


cplUhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVPVZp(gt1))

End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,v,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZVZ(gt1))

End Do 


cplUhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZVZp(gt1))

End Do 


cplUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZpVZpL(gt1,g1,g2,gBL,gBY,gYB,v,vX,TW,TWp,cplUhhVZpVZp(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam2,lam3,lam1,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHmcHmL(gt1,gt2,lam3,lam1,cplUhhUhhHmcHm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gYB,TW,cplUhhUhhVPVP(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gBL,gBY,gYB,TW,TWp,cplUhhUhhVZpVZp(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

End Module Couplings_ZpBminusLSM 
