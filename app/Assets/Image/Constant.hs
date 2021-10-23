module Assets.Image.Constant
  ( fileByType
  , types
  , files
  ) where

import Assets.Image.Types

fileByType = zip types files

types =
  [ Img100
  , Img1000
  , Img200
  , Img400
  , Img500
  , ImgBlock1
  , ImgBlock2
  , ImgBlock3
  , ImgBlock4
  , ImgBlock5
  , ImgBroken
  , ImgCloud00
  , ImgCloud01
  , ImgCloud02
  , ImgCloud10
  , ImgCloud11
  , ImgCloud12
  , ImgCoin0
  , ImgCoin1
  , ImgCoin2
  , ImgCoin3
  , ImgDk00
  , ImgDk01
  , ImgDk10
  , ImgDk11
  , ImgFire0
  , ImgFire1
  , ImgFire2
  , ImgFire3
  , ImgFlag
  , ImgFlower
  , ImgFNarioLJump
  , ImgFNarioLShot
  , ImgFNarioLSit
  , ImgFNarioLSlip
  , ImgFNarioLStand
  , ImgFNarioLWalk1
  , ImgFNarioLWalk2
  , ImgFNarioLWalk3
  , ImgFNarioRJump
  , ImgFNarioRShot
  , ImgFNarioRSit
  , ImgFNarioRSlip
  , ImgFNarioRStand
  , ImgFNarioRWalk1
  , ImgFNarioRWalk2
  , ImgFNarioRWalk3
  , ImgFont
  , ImgGrass0
  , ImgGrass1
  , ImgGrass2
  , ImgKinoko
  , ImgKoura
  , ImgKoura2
  , ImgKuri0
  , ImgKuri1
  , ImgKuriDead
  , ImgMt02
  , ImgMt11
  , ImgMt12
  , ImgMt13
  , ImgMt22
  , ImgNarioDead
  , ImgNarioLJump
  , ImgNarioLSlip
  , ImgNarioLStand
  , ImgNarioLWalk1
  , ImgNarioLWalk2
  , ImgNarioLWalk3
  , ImgNarioRJump
  , ImgNarioRSlip
  , ImgNarioRStand
  , ImgNarioRWalk1
  , ImgNarioRWalk2
  , ImgNarioRWalk3
  , ImgNokoL0
  , ImgNokoL1
  , ImgNokoR0
  , ImgNokoR1
  , ImgPole0
  , ImgPole1
  , ImgSNarioLJump
  , ImgSNarioLSit
  , ImgSNarioLSlip
  , ImgSNarioLStand
  , ImgSNarioLWalk1
  , ImgSNarioLWalk2
  , ImgSNarioLWalk3
  , ImgSNarioRJump
  , ImgSNarioRSit
  , ImgSNarioRSlip
  , ImgSNarioRStand
  , ImgSNarioRWalk1
  , ImgSNarioRWalk2
  , ImgSNarioRWalk3
  , ImgTitle
  ]

files =
  [ "100.bmp"
  , "1000.bmp"
  , "200.bmp"
  , "400.bmp"
  , "500.bmp"
  , "block1.bmp"
  , "block2.bmp"
  , "block3.bmp"
  , "block4.bmp"
  , "block5.bmp"
  , "broken.bmp"
  , "cloud00.bmp"
  , "cloud01.bmp"
  , "cloud02.bmp"
  , "cloud10.bmp"
  , "cloud11.bmp"
  , "cloud12.bmp"
  , "coin0.bmp"
  , "coin1.bmp"
  , "coin2.bmp"
  , "coin3.bmp"
  , "dk00.bmp"
  , "dk01.bmp"
  , "dk10.bmp"
  , "dk11.bmp"
  , "fire0.bmp"
  , "fire1.bmp"
  , "fire2.bmp"
  , "fire3.bmp"
  , "flag.bmp"
  , "flower.bmp"
  , "fNarioLJump.bmp"
  , "fNarioLShot.bmp"
  , "fNarioLSit.bmp"
  , "fNarioLSlip.bmp"
  , "fNarioLStand.bmp"
  , "fNarioLWalk1.bmp"
  , "fNarioLWalk2.bmp"
  , "fNarioLWalk3.bmp"
  , "fNarioRJump.bmp"
  , "fNarioRShot.bmp"
  , "fNarioRSit.bmp"
  , "fNarioRSlip.bmp"
  , "fNarioRStand.bmp"
  , "fNarioRWalk1.bmp"
  , "fNarioRWalk2.bmp"
  , "fNarioRWalk3.bmp"
  , "font.bmp"
  , "grass0.bmp"
  , "grass1.bmp"
  , "grass2.bmp"
  , "kinoko.bmp"
  , "koura.bmp"
  , "koura2.bmp"
  , "kuri0.bmp"
  , "kuri1.bmp"
  , "kuriDead.bmp"
  , "mt02.bmp"
  , "mt11.bmp"
  , "mt12.bmp"
  , "mt13.bmp"
  , "mt22.bmp"
  , "narioDead.bmp"
  , "narioLJump.bmp"
  , "narioLSlip.bmp"
  , "narioLStand.bmp"
  , "narioLWalk1.bmp"
  , "narioLWalk2.bmp"
  , "narioLWalk3.bmp"
  , "narioRJump.bmp"
  , "narioRSlip.bmp"
  , "narioRStand.bmp"
  , "narioRWalk1.bmp"
  , "narioRWalk2.bmp"
  , "narioRWalk3.bmp"
  , "nokoL0.bmp"
  , "nokoL1.bmp"
  , "nokoR0.bmp"
  , "nokoR1.bmp"
  , "pole0.bmp"
  , "pole1.bmp"
  , "sNarioLJump.bmp"
  , "sNarioLSit.bmp"
  , "sNarioLSlip.bmp"
  , "sNarioLStand.bmp"
  , "sNarioLWalk1.bmp"
  , "sNarioLWalk2.bmp"
  , "sNarioLWalk3.bmp"
  , "sNarioRJump.bmp"
  , "sNarioRSit.bmp"
  , "sNarioRSlip.bmp"
  , "sNarioRStand.bmp"
  , "sNarioRWalk1.bmp"
  , "sNarioRWalk2.bmp"
  , "sNarioRWalk3.bmp"
  , "title.bmp"
  ]