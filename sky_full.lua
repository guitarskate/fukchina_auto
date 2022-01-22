if gg.isVisible(true) then
  gg.setVisible(false)
end

str1 = false
str2 = false
str3 = false


on = "[ON]"
off = "[OFF]"

wing = off
maxlvwing = off
wingpower = off
graphx = off
quick = off
charg = off
under = off
jump = off
flygravity = off
noequip = off
texture = off
cloudss = off



local old = gg.getRanges();

gg.setRanges(gg.REGION_CODE_APP)
gg.clearResults()
gg.searchNumber('1D;2D;5D;10D;20D;35D;55D;75D;100D;120D;150D;200D;250D;300D;400D::57', gg.TYPE_DWORD)
wnglv = gg.getResults(14)
gg.clearResults()
gg.toast('wing level ready')
revertwnglv = {}
for i, v in ipairs(wnglv) do
revertwnglv[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber('0.30426996946F;1.0F;1.0F;1.0F;0.5F::73', gg.TYPE_FLOAT)
gg.refineNumber(1, gg.TYPE_FLOAT)
wingpwr = gg.getResults(3)
gg.clearResults()
gg.toast('wing power ready')
revertwingpwr = {}
for i, v in ipairs(wingpwr) do
revertwingpwr[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.searchNumber('3.5', gg.TYPE_FLOAT)
quickstp = gg.getResults(1)
gg.clearResults()
gg.toast('Quick Steps ready')
revertquickstp = {}
for i, v in ipairs(quickstp) do
revertquickstp[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.searchNumber('2.5', gg.TYPE_FLOAT)
chargwing = gg.getResults(1)
gg.clearResults()
gg.toast('Charging wings ready')
revertchargwing = {}
for i, v in ipairs(chargwing) do
revertchargwing[i] = {address = v.address, flags = v.flags, value = v.value}
end


gg.searchNumber('1D;0.15000000596F;0.5F;1.0F;0.40000000596F::25', gg.TYPE_DWORD)
clouds = gg.getResults(5)
gg.clearResults()
gg.toast('Clouds ready')
revertclouds = {}
for i, v in ipairs(clouds) do
  revertclouds[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber('1,000.0F;0.05000000075F;-0.05000000075F::9', gg.TYPE_FLOAT)
graph = gg.getResults(3)
gg.clearResults()
gg.toast('graphic ready')
revertgraph = {}
for i, v in ipairs(graph) do
revertgraph[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.searchNumber('-0.01499999966', gg.TYPE_FLOAT)
undergrnd = gg.getResults(2)
gg.clearResults()
gg.toast('Underground ready')
revertundergrnd = {}
for i, v in ipairs(undergrnd) do
revertundergrnd[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.searchNumber('4.90000009537F;4.59999990463F;0.89999997616F;0.81999999285F::13', gg.TYPE_FLOAT)
gg.refineNumber('4.9', gg.TYPE_FLOAT)
jumppwr = gg.getResults(4)
gg.clearResults()
gg.toast('Jump ready')
revertjumppwr = {}
for i, v in ipairs(jumppwr) do
revertjumppwr[i] = {address = v.address, flags = v.flags, value = v.value}
end

gg.searchNumber('-3.16081619263', gg.TYPE_FLOAT)
flygrvt = gg.getResults(1)
gg.clearResults()
gg.toast('Gravity ready')
revertflygravity = {}
for i, v in ipairs(flygrvt) do
revertflygravity[i] = {address = v.address, flags = v.flags, value = v.value}
end

function START()
  menu = gg.choice({
      wing..'Energia infinita', -- 1
      maxlvwing..'Nivel maximo alas', -- 2
      wingpower..'Poder de vuelo', -- 3
      graphx.. 'Suavizar graficos', -- 4
      quick.. 'Correr rapido', -- 5
      charg.. 'Recargar alas', -- 6
      under.. 'traspasar piso', -- 7
      jump.. 'saltos largos', -- 8
      flygravity.. 'Fly gravity', -- 9
      noequip.. 'Hide equipent', -- 10
      texture.. 'Stretch texture (must go through gate)', -- 11
      cloudss.. 'Remover nubes', -- 12
      'Salir' -- 13
      },nil,'Select cheat')
  if menu == nil then return; end

  if menu == 13 then
    wiping()
  else
    if menu == 1 then
      infinityLight()
    end

    if menu == 2 then
      maxLevelWing()
    end

    if menu == 3 then
      wingPower()
    end

    if menu == 4 then
      smootherGraphixs()
    end

    if menu == 5 then
      quickSteep()
    end

    if menu == 6 then
      rechargeLight()
    end

    if menu == 7 then
      underground()
    end

    if menu == 8 then
      jumpDistance()
    end

    if menu == 9 then
      if flygravity == on then
        flygravity = off
        gg.setValues(revertflygravity)
        gg.toast('flygravity deactivated')
      else
        flygravity = on
        flygrvt[1].value = '5'
        gg.setValues(flygrvt)
        gg.toast('flygravity activated')
      end
    end

    if menu == 10 then
      if noequip == on then
        noequip = off
        gg.setValues(revertequipment)
        gg.toast('Equipment deactivated')
      else
        if str2 then
          noequip = on
          for i, v in ipairs(equipment) do
            gg.setValues(equipment)
          end
          gg.toast('Equipment activated')
        else
          str2 = true
          gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
          gg.clearResults()
          gg.searchNumber('1.0F;1.0F;1.0F;1.0F;1.0F;-32D;-128D;1.0F;1.0F:41', gg.TYPE_FLOAT)
          gg.refineNumber('1', gg.TYPE_FLOAT)
          equipment = gg.getResults(5000)
          gg.clearResults()
          revertequipment = {}
          for i, v in ipairs(equipment) do
            revertequipment[i] = {address = v.address, flags = v.flags, value = v.value}
          end
          noequip = on
          for i, v in ipairs(equipment) do
            equipment[i].value = '0'
            gg.setValues(equipment)
          end
          gg.toast('Equipment activated')
        end
      end
    end

    if menu == 11 then
      if texture == on then
        texture = off
        gg.setValues(reverttexture)
        gg.toast('Texture deactivated, must go through gate')
      else
        if str3 then
          texture = on
          for i, v in ipairs(textures) do
            gg.setValues(textures)
            gg.toast('Textures activated, must go through gate')
          end
        else
          str3 = true
          gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
          gg.searchNumber('h 06 00 00 00 61 00 00 00 00 00 00 3F 2B 00 04 00', gg.TYPE_BYTE)
          gg.refineNumber('h 00 00 00 3F', gg.TYPE_BYTE)
          gg.refineNumber('h 00 00 00', gg.TYPE_BYTE)
          textures = gg.getResults(32)
          gg.clearResults()
          reverttexture = {}
          for i, v in ipairs(textures) do
            reverttexture[i] = {address = v.address, flags = v.flags, value = v.value}
          end
          texture = on
          for i, v in ipairs(textures) do
          textures[i].value = '51'
          gg.setValues(textures)
          end
          gg.toast('Textures activated, must go through gate')
        end
      end
    end

    if menu == 12 then
      removeClouds()
    end
  end
  gg.setRanges(old)
end

function infinityLight() -- menu 1
  if wing == on then
    wing = off
    for i, v in ipairs(wings) do
      v.value = '1'
      v.freeze = true
    end
    gg.addListItems(wings)
    gg.toast('wings deactivated')
  else
    wing = on
    if str1 then
      for i, v in ipairs(wings) do
        v.value = '50000'
        v.freeze = true
      end
      gg.addListItems(wings)
      gg.toast('wings activated')
    else
      str1 = true
      gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
      gg.searchNumber('30;1;1;20::13', gg.TYPE_FLOAT)
      gg.refineNumber(1, gg.TYPE_FLOAT)
      wings = gg.getResults(1000)
      for i, v in ipairs(wings) do
        v.value = '50000'
        v.freeze = true
      end
      gg.addListItems(wings)
      gg.clearResults()
      gg.toast('wings activated 1')
    end
  end
end

function maxLevelWing() -- menu 2
  if maxlvwing == on then
    maxlvwing = off
    gg.setValues(revertwnglv)
    gg.toast('Wing level deactivated')
  else
    maxlvwing = on
    wnglv[1].value = '0'
    wnglv[2].value = '0'
    wnglv[3].value = '0'
    wnglv[4].value = '0'
    wnglv[5].value = '0'
    wnglv[6].value = '0'
    wnglv[7].value = '0'
    wnglv[8].value = '0'
    wnglv[9].value = '0'
    wnglv[10].value = '0'
    wnglv[11].value = '0'
    wnglv[12].value = '0'
    wnglv[13].value = '0'
    wnglv[14].value = '0'
    gg.setValues(wnglv)
    gg.toast('Wing level activated')
  end
end

function wingPower() -- menu 3
  pwr = gg.choice({
      'OFF',
      'soft',
      'strong',
      'strong extreme',
      'explore new hights',
      'To high? Fly down',
      'BACK'
      },nil,'WARNING, DONT TRAP YOUR SELF')
  if pwr == nil then
    noselect()
  else
    if pwr == 9 then
      START()
    else
      if pwr == 1 then
        wingpower = off
        gg.setValues(revertwingpwr)
        gg.toast('Wing power deactivated')
      else
        if pwr == 2 then
          wingpower = on
          wingpwr[3].value = '2'
          gg.setValues(wingpwr)
          gg.toast('Wing power activated')
        else
          if pwr == 3 then
            wingpower = on
            wingpwr[3].value = '5'
            gg.setValues(wingpwr)
            gg.toast('Wing power activated')
          else
            if pwr == 4 then
              wingpower = on
              wingpwr[3].value = '20'
              gg.setValues(wingpwr)
              gg.toast('Wing power activated')
            else
              if pwr == 5 then
                wingpower = on
                wingpwr[3].value = '2000'
                gg.setValues(wingpwr)
                gg.toast('Wing power activated')
              else
                if pwr == 6 then
                  wingpower = on
                  wingpwr[3].value = '-500'
                  gg.setValues(wingpwr)
                  gg.toast('Wing power activated')
                end
              end
            end
          end
        end
      end
    end
  end
end

function smootherGraphixs() -- menu 4
  if graphx == on then
    graphx = off
    gg.setValues(revertgraph)
    gg.toast('Graphics deactivated')
  else
    graphx = on
    graph[1].value = '1'
    gg.setValues(graph)
    gg.toast('Graphics activated')
  end
end

function quickSteep() -- menu 5
  if quick == on then
    quick = off
    gg.setValues(revertquickstp)
    gg.toast('Quick Steps deactivated')
  else
    quick = on
    quickstp[1].value = '50'
    gg.setValues(quickstp)
    gg.toast('Quick Steps activated')
  end
end

function rechargeLight() -- menu 6
  charg = on
  chargwing[1].value = '4.5'
  gg.setValues(chargwing)
  gg.sleep(8000)
  gg.setValues(revertchargwing)
  charg = off
end

function underground() -- menu 7
  if under == on then
    under = off
    gg.setValues(revertundergrnd)
    gg.toast('Underground is deactivated')
  else
    under = on
    undergrnd[2].value = '-2'
    gg.setValues(undergrnd)
    gg.toast('Underground is activated')
  end
end

function jumpDistance() -- menu 8
  if jump == on then
    jump = off
    gg.setValues(revertjumppwr)
    gg.toast('Jump distance midair is deactivated')
  else
    jump = on
    jumppwr[1].value = '10'
    gg.setValues(jumppwr)
    gg.toast('Jump distance midair activated')
  end
end

function removeClouds()
  if cloudss == on then
    cloudss = off
    gg.setValues(revertclouds)
    gg.toast('Clouds deactivated')
  else
    cloudss = on
    clouds[1].value = '0'
    gg.setValues(clouds)
    gg.toast('Clouds activated')
  end
end






function collectkrill(uy)
  frz = true
  eval = {}
  pattern = 0x2B0
  rpoint = eoffsets.nentity - poffsets.ecrabs - 0xC170
  mpoint = getcoord(true)
  if uy == 0 then
    for i=0,10 do
    evalid = getadd(rpoint + (pattern*i)+0x30,gg.TYPE_FLOAT)
    if evalid == 0 then
      break
    end
    --eposit = {getadd(rpoint + (0xC80*i),gg.TYPE_FLOAT),getadd(rpoint + (0xC80*i)+0x4,gg.TYPE_FLOAT),getadd(rpoint + (0xC80*i)+0x8,gg.TYPE_FLOAT)}
    table.insert(eval,{address=rpoint + (pattern*i)+0x4,flags=gg.TYPE_FLOAT,value=-999,freeze=true,name='krillY'})
    end
if #eval == 0 then return; end
  --gg.setValues(eval)
  if isfreeze(rpoint) then
    gg.removeListItems(eval)
    gg.toast('off')
    else
    gg.addListItems(eval)
    gg.toast('on')
  end
  return;
  end
  if uy == 1 then
    for i=0,10 do
    --detec : 1D0
    evalid = getadd(rpoint + (pattern*i),gg.TYPE_FLOAT)
    if evalid == 0 then
      break
    end
      table.insert(eval,{address=rpoint + (pattern*i),flags=gg.TYPE_FLOAT,value=mpoint[1]})
      table.insert(eval,{address=rpoint + (pattern*i)+0x4,flags=gg.TYPE_FLOAT,value=mpoint[2]})
      table.insert(eval,{address=rpoint + (pattern*i)+0x8,flags=gg.TYPE_FLOAT,value=mpoint[3]})
    end
    gg.setValues(eval)
    return;
  end
  if uy == 2 then
    for i=0,10 do
    --detec : 1D0
    evalid = getadd(rpoint + (pattern*i),gg.TYPE_FLOAT)
    if evalid == 0 then
      break
    end
    if isfreeze(rpoint+(pattern*i)+0x24) then
      setadd(rpoint+(pattern*i)+0x24,gg.TYPE_FLOAT,0,false)
    else
      setadd(rpoint+(pattern*i)+0x24,gg.TYPE_FLOAT,0,true)
    end
    end
    return;
  end
  if uy == 3 then
    for i=0,10 do
    --detec : 1D0
    evalid = getadd(rpoint + (pattern*i),gg.TYPE_FLOAT)
    if evalid == 0 then
      break
    end
    if isfreeze(rpoint+(pattern*i)+0x1AC) then
      setadd(rpoint+(pattern*i)+0x1AC,gg.TYPE_DWORD,257,false)
    else
      setadd(rpoint+(pattern*i)+0x1AC,gg.TYPE_DWORD,257,true)
    end
    end
    return;
  end
  if uy == 4 then
    for i=0,10 do
    --detec : 1D0
    evalid = getadd(rpoint + (pattern*i),gg.TYPE_FLOAT)
    if evalid == 0 then
      break
    end
    if isfreeze(rpoint+(pattern*i)+0x1AC) then
      setadd(rpoint+(pattern*i)+0x1AC,gg.TYPE_DWORD,258,false)
    else
      setadd(rpoint+(pattern*i)+0x1AC,gg.TYPE_DWORD,258,true)
    end
    end
    return;
  end
  if uy == 5 then
    setposit(getadd(rpoint,gg.TYPE_FLOAT),getadd(rpoint+0x4,gg.TYPE_FLOAT),getadd(rpoint+0x8,gg.TYPE_FLOAT))
  end
end

function breachWall()
  adr = pbase + poffsets.pwing
  if isfreeze(adr) then
    setadd(adr,gg.TYPE_FLOAT,14,false)
    gg.toast('off')
  else
    setadd(adr,gg.TYPE_FLOAT,inputnum(14),true)
    gg.toast('on')
  end
end

function wiping()
  gg.clearList()
  os.exit()
end

function noselect()
  gg.toast('You not select anything')
end

while (true) do
  if gg.isVisible(true) then
    gg.setVisible(false)
    START()
  end
  gg.sleep(100)
end