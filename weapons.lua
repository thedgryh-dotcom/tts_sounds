WeaponsConfig = {
  ----------------------------------------------------------------
  -- 1) HITTSCAN-ОРУЖИЕ (линейный луч)
  ----------------------------------------------------------------
  Autocannon = {
    -- [ОРУЖИЕ — допустимые ключи]
    --   type               : string
    --   ammoMax            : number
    --   reloads            : number
    --   shotSound          : string (URL)
    --   shotSoundHold      : number (seconds)
    --   muzzleOffset       : { x:number, y:number, z:number }
    --   spreadXDeg         : number (degrees)
    --   spreadYDeg         : number (degrees)
    --   tracerColor        : { r:number, g:number, b:number }  -- 0..1
    --   tracerThickness    : number
    --   tracerSpeed        : number (units/sec)
    --   tracerStep         : number
    --   tracerHold         : number (seconds)
    --   tracerFade         : number (seconds)
    --   overflyFeet        : number (feet)
    --   explode            : Stage | Stage[]   -- см. блок explode ниже
    --   fireModes          : FireMode[]        -- см. «[РЕЖИМЫ ОГНЯ — допустимые ключи]» ниже
    type = "Автопушка",                 -- имя в сообщениях
    ammoMax = 7,                        -- магазин
    reloads = 2,                        -- перезарядок

    shotSound = "https://thedgryh-dotcom.github.io/tts_sounds/autocannon.mp3", -- звук выстрела
    shotSoundHold = 0.25,               -- сколько держать плеер «занятым»

    muzzleOffset = { x = 0.0, y = 2.68, z = 4.4 }, -- где «дуло» на модели (локальные координаты)

    spreadXDeg = 5.0,                   -- базовый разброс по «гориз.» оси
    spreadYDeg = 2.5,                   -- базовый разброс по «верт.» оси

    tracerColor     = {1.0, 0.1, 0.1},  -- цвет трассера/колец
    tracerThickness = 0.07,             -- толщина линии
    tracerSpeed     = 160.0,            -- скорость анимации трассера
    tracerStep      = 0.02,             -- шаг прироста линии
    tracerHold      = 10.0,             -- подержать после последнего выстрела
    tracerFade      = 2.5,              -- и затем погасить за это время
    overflyFeet     = 40,               -- летим чуть дальше цели (визуально)

    -- [ВСПЫШКА/КОЛЬЦА ПРИ ПОПАДАНИИ — можно один объект или массив стадий]
    -- У КАЖДОЙ стадии поддерживаются ключи:
    --   radius           :number,
    --   expand:          :number(sec),
    --   fade             :number(sec),
    --   thickness        :number,
    --   color            :{r,g,b}(0..1),
    --   label            :string(опц.),
    --   labelAngleDeg    :number(опц.)
    explode = {
      {
        radius = 1.0,
        expand = 0.5,
        fade   = 2.0,
        thickness = 0.08,
        color  = {1.0, 0.3, 0.2},
        -- label = "AP",
        -- labelAngleDeg = 0,
      }
      -- ,{ radius=3.2, expand=0.35, fade=2.0, thickness=0.06, color={1.0,0.15,0.15} }
    },

    -- [РЕЖИМЫ ОГНЯ — допустимые ключи]
    --   name              : string
    --   ammoCost          : number
    --   accuracy          : number  (модификатор к d20)
    --   intensity         : number  (seconds, интервал «тиков»)
    --   spreadAddXDeg     : number  (degrees)
    --   spreadAddYDeg     : number  (degrees)
    --   damage            : number  (сохраняется, боёвка сейчас не читает)
    --   arcHeightFactor   : number  (учитывается ТОЛЬКО в баллистике; у hitscan игнорируется)
    fireModes = {
      {
        name="Одиночным",
        ammoCost=1,
        accuracy=2,
        intensity=0.05,
        spreadAddXDeg=0.0,
        spreadAddYDeg=0.0,
        -- damage=4,
        -- arcHeightFactor=0.10,
      },
      {
        name="Очередью",
        ammoCost=3,
        accuracy=1,
        intensity=0.45,
        spreadAddXDeg=2.0,
        spreadAddYDeg=-1.5,
        -- damage=4,
        -- arcHeightFactor=0.30,
      },
    }
  },

  MachineGun = {
    -- [ОРУЖИЕ — допустимые ключи: см. список над Autocannon]
    type = "Пулемет",
    ammoMax = 50,
    reloads = 10,

    shotSound = "https://thedgryh-dotcom.github.io/tts_sounds/autocannon_new.mp3",
    shotSoundHold = 0.18,

    muzzleOffset = { x = 1.00, y = 2.6, z = 1.7 },

    spreadXDeg = 7.5,
    spreadYDeg = 2.5,

    tracerColor     = {1.0, 0.1, 0.1},
    tracerThickness = 0.06,
    tracerSpeed     = 220.0,
    tracerStep      = 0.018,
    tracerHold      = 8.0,
    tracerFade      = 2.0,
    overflyFeet     = 30,

    -- [РЕЖИМЫ ОГНЯ]
    fireModes = {
      {
        name="Очередью",
        ammoCost=10,
        accuracy=-2,
        intensity=0.15,
        spreadAddXDeg=0.0,  -- раскомментировано: можно подправить эллипс X
        spreadAddYDeg=0.0,  -- раскомментировано: можно подправить эллипс Y
        -- damage=2,
        -- arcHeightFactor=0.10, -- для баллистики; здесь не используется
      },
      {
        name="На подавление",
        ammoCost=15,
        accuracy=-10,
        intensity=0.15,
        spreadAddXDeg=6.0,
        spreadAddYDeg=-1.0,
        -- damage=2,
        -- arcHeightFactor=0.10,
      },
    }
  },

  AR15 = {
    -- [ОРУЖИЕ — допустимые ключи: см. список над Autocannon]
    type = "AR-15",
    ammoMax = 30,
    reloads = 5,

    shotSound = "https://thedgryh-dotcom.github.io/tts_sounds/ar15.mp3",
    shotSoundHold = 0.2,

    muzzleOffset = { x = 0, y = 1.5, z = 0.25 },

    spreadXDeg = 2.5,
    spreadYDeg = 1.5,

    tracerColor     = {1.0, 0.1, 0.1},
    tracerThickness = 0.07,
    tracerSpeed     = 220.0,
    tracerStep      = 0.02,
    tracerHold      = 10.0,
    tracerFade      = 2.5,
    overflyFeet     = 40,

    -- [РЕЖИМЫ ОГНЯ]
    fireModes = {
      {
        name="Одиночным",
        ammoCost=1,
        accuracy=0,
        intensity=0.05,
        spreadAddXDeg=0.0,  -- раскомментировано: добавка к X
        spreadAddYDeg=0.0,  -- раскомментировано: добавка к Y
        -- damage=2,
        -- arcHeightFactor=0.10,
      },
      {
        name="Очередью",
        ammoCost=3,
        accuracy=-2,
        intensity=1.0,
        spreadAddXDeg=0.5,
        spreadAddYDeg=1.0,
        -- damage=2,
        -- arcHeightFactor=0.10,
      },
    }
  },

  ----------------------------------------------------------------
  -- 2) БАЛЛИСТИКА (параболическая траектория)
  ----------------------------------------------------------------
  M79 = {
    -- [ОРУЖИЕ — допустимые ключи: как у hitscan + ballistic + explode]
    type = "M79",
    ammoMax = 1,
    reloads = 12,

    shotSound = "https://thedgryh-dotcom.github.io/tts_sounds/m79.ogg",
    shotSoundHold = 1.2,

    muzzleOffset = { x = 0.0, y = 1.55, z = 0.65 },

    spreadXDeg = 12.0,
    spreadYDeg = 12.0,

    tracerColor     = {1.0, 0.1, 0.1},
    tracerThickness = 0.15,
    tracerStep      = 0.02,
    tracerHold      = 12.0,
    tracerFade      = 2.0,
    overflyFeet     = 100,              -- макс. «вынос» дуги за цель (вертикальный критерий)

    -- [БАЛЛИСТИКА — допустимые ключи]
    --   enabled          : boolean
    --   speed            : number  (units/sec, влияет на длительность прорисовки)
    --   arcHeightFactor  : number  (высота дуги = distH * factor)
    ballistic = {
      enabled = true,
      speed = 35.0,
      arcHeightFactor = 0.22,
    },

    -- [ВЗРЫВ/КОЛЬЦА — можно один объект или массив]
    -- Ключи у стадии: radius, expand, fade, thickness, color, label(опц.), labelAngleDeg(опц.)
    explode = {
      {
        radius = 2.5,
        expand = 0.6,
        fade   = 2.0,
        thickness = 0.10,
        color  = {1.0, 0.1, 0.1},
        -- label = "Взрыв",
        -- labelAngleDeg = 0,
      }
      -- ,{ radius=5.0, expand=0.4, fade=2.0, thickness=0.08, color={1.0,0.2,0.2} }
    },

    -- [РЕЖИМЫ ОГНЯ]
    -- ВАЖНО: arcHeightFactor в режиме перекрывает ballistic.arcHeightFactor
    fireModes = {
      {
        name="Навес (10%)",
        ammoCost=1,
        accuracy=-1,
        intensity=0.08,
        spreadAddXDeg=4,
        spreadAddYDeg=4,
        arcHeightFactor=0.10,
        -- damage=0,
      },
      {
        name="Навес (30%)",
        ammoCost=1,
        accuracy=-1,
        intensity=0.08,
        spreadAddXDeg=7,
        spreadAddYDeg=7,
        arcHeightFactor=0.30,
        -- damage=0,
      },
      {
        name="Навес (60%)",
        ammoCost=1,
        accuracy=-1,
        intensity=0.08,
        spreadAddXDeg=12,
        spreadAddYDeg=12,
        arcHeightFactor=0.60,
        -- damage=0,
      },
    }
  },

  Howitzer155 = {
    -- [ОРУЖИЕ]
    type = "Гаубица (155 мм)",
    ammoMax = 1,
    reloads = 6,

    shotSound = "https://thedgryh-dotcom.github.io/tts_sounds/howitzer155.ogg",
    shotSoundHold = 2.2,

    muzzleOffset = { x = 1.5, y = 1.75, z = 0 },

    spreadXDeg = 18.0,
    spreadYDeg = 14.0,

    tracerColor     = {1.0, 0.1, 0.1},
    tracerThickness = 0.15,
    tracerStep      = 0.02,
    tracerHold      = 16.0,
    tracerFade      = 2.5,
    overflyFeet     = 200,

    -- [БАЛЛИСТИКА]
    ballistic = {
      enabled = true,
      speed = 35.0,
      arcHeightFactor = 0.35,
    },

    -- [ВЗРЫВ/КОЛЬЦА] — ключи стадии: radius, expand, fade, thickness, color, label(опц.), labelAngleDeg(опц.)
    explode = {
      { radius = 4.0,  expand = 0.6,  fade = 2.5, thickness = 0.15, color={1.0,0.1,0.1} },
      { radius = 8.0,  expand = 0.3,  fade = 2.5, thickness = 0.10, color={1.0,0.1,0.1} },
      { radius = 12.0, expand = 0.15, fade = 2.5, thickness = 0.05, color={1.0,0.1,0.1} },
      -- { radius=16.0, expand=0.12, fade=2.5, thickness=0.04, color={1.0,0.1,0.1}, label="Blast", labelAngleDeg=45 },
    },

    -- [РЕЖИМЫ ОГНЯ]
    fireModes = {
      {
        name="Навес (10%)",
        ammoCost=1,
        accuracy=-5,
        intensity=0.10,
        spreadAddXDeg=5,
        spreadAddYDeg=5,
        arcHeightFactor=0.10,
        -- damage=0,
      },
      {
        name="Навес (25%)",
        ammoCost=1,
        accuracy=-5,
        intensity=0.12,
        spreadAddXDeg=10,
        spreadAddYDeg=10,
        arcHeightFactor=0.25,
        -- damage=0,
      },
      {
        name="Навес (45%)",
        ammoCost=1,
        accuracy=-5,
        intensity=0.14,
        spreadAddXDeg=15,
        spreadAddYDeg=15,
        arcHeightFactor=0.45,
        -- damage=0,
      },
    }
  }
}