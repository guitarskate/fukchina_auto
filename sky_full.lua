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
candles = off



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

gg.alert('PASOS DEFAULT: '..revertquickstp)

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
      wing..' Energia infinita', -- 1
      maxlvwing..' Nivel maximo alas', -- 2
      wingpower..' Poder de vuelo', -- 3
      graphx.. ' Suavizar graficos', -- 4
      quick.. ' Correr rapido', -- 5
      charg.. ' Recargar alas', -- 6
      under.. ' traspasar piso', -- 7
      jump.. ' saltos largos', -- 8
      flygravity.. ' Fly gravity', -- 9
      noequip.. ' Hide equipent', -- 10
      texture.. ' Stretch texture (must go through gate)', -- 11
      cloudss.. ' Remover nubes', -- 12
      candles.. ' Mostrar todas las velas', -- 13
      'Salir' -- 14
      },nil,'Select cheat')
  if menu == nil then return; end

  if menu == 14 then
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
    if menu == 13 then
      showAllCandles()
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
        v.value = '5000'
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
        v.value = '5000'
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
      'Suave',
      'Fuerte',
      'Extremadamente fuerte',
      'Explorar nuevas alturas',
      '¿En lo alto? Volar hacia abajo',
      'Atras'
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
  rv = gg.choice({
    'OFF', -- 1
    '🚲Rapido', -- 2
    '♋︎Naruto', -- 3
    '⚡️Flash', -- 4
    'Atras' -- 5
  },nil,'')
  if rv == 1 then
    quick = off
    gg.setValues(revertquickstp)
    gg.toast('Pasos rapidos desactivados')
  end
  if rv == 2 then
    addQuickSteep('30')
    gg.toast('Modo Rapido activado')
  end
  if rv == 3 then
    addQuickSteep('80')
    gg.toast('Modo Naruto activado')
  end
  if rv == 4 then
    addQuickSteep('180')
    gg.toast('Modo Flash activado')
  end
  if rv == 5 then
    START()
  end
end

function addQuickSteep(valueSteep)
  quick = on
  quickstp[1].value = valueSteep
  gg.setValues(quickstp)
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




function showAllCandles()
  if candles == on then
      candles = off
      viscandle(false)
      gg.toast('Velas Inactivas')
    else
      candles = on
      viscandle(true)
      gg.toast('Velas Activas')
    end
end

function viscandle(bool)
  xv = {}
  vcandles = 0x501BB4
  for i = 0,128 do
   if getadd(0x00 + vcandles + (0x70 * i) - 0x4,gg.TYPE_DWORD) ~= 0 then
     if bool then
       table.insert(xv,{address = 0x00 + vcandles + (0x70 * i),flags = gg.TYPE_DWORD,value = 28673})
       else
       table.insert(xv,{address = 0x00 + vcandles + (0x70 * i),flags = gg.TYPE_DWORD,value = 0})
     end

   else
     break;
   end
  end
  gg.setValues(xv)
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

function getadd(add,flag)
  local uu = {}
  uu[1] = {
    address = add,
    flags = flag
  }
  yy = gg.getValues(uu)
  return tonumber(yy[1].value)
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
