      program example3
      implicit real*8(a-h,o-z)
      real*8 f(-6:6)
*
      QMZ=91.71d0
      Nmem=31
      write(*,*)
      do i=1,Nmem
         write(*,*) '---------------------------------------------'
         write(*,*) 'PDF set ',i
         write(*,*)
         write(*,*) 'x*Gluon'
         write(*,*) '   x     Q=10 GeV     Q=100 GeV    Q=1000 GeV'
         do x=0.01d0,0.095d0,0.01d0
            Q=10d0
            call parden(x,Q,f,i)
            g1=f(0)
            Q=100d0
            call parden(x,Q,f,i)
            g2=f(0)
            Q=1000d0
            call parden(x,Q,f,i)
            g3=f(0)
            write(*,*) x,g1,g2,g3
         enddo
         a=alphasPDF(QMZ)
         write(*,*)
         write(*,*) 'alpha_S(M_Z) = ',a
         write(*,*)
      enddo
*
      end
*
      subroutine parden(x,Q,f,imem)
      implicit none
      character*32 name/'../PDFsets/Alekhin_100.LHpdf'/
      real*8 x,Q,f(-6:6),alfas
      integer imem,init/0/,lmem/-1/
      save init,lmem
*
      if (init.eq.0) then
         init=1
         call InitPDFset(name)
      endif
      if (imem.ne.lmem) then
         lmem=imem
         call InitPDF(lmem)
      endif
      call evolvePDF(x,Q,f)
      return
*
      end

         
