---
layout: post
title: "【Experiment】Fabrication of SIL"
description: ""
category: Experimental Physics
tags: [Academics, Physics, Experiment]
---
{% include JB/setup %}

# Procedure

1. Test for the NV density of the new sample
1. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %}) to remove oil
1. [ICP]({% post_url /Experiment/2016-11-23-ICP %}) 30s to get a distinct surface peak (scanz) (program: ``diamond etch-1``, $$O_2$$ 7/$$Ar$$ 8, 120W/1000W)
1. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
1. Marker imprinting by [FIB chipname and markers]({% post_url /Experiment/2017-03-24-FIB-chipname-marker %})(fixed with Ag colloid, 110 °C bake 30min) (no 3-acid clean and ICP, markers will become difficult to distinguish after this operations)
1. Clean and remove Al (see [Clean after FIB]({% post_url /Experiment/2016-11-23-clean-after-FIB%}))
1. NV location (see [NV location program](https://github.com/zhangchuheng123/NV_program))
1. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %})
1. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
1. SIL calculation and fabrication by FIB (fixed with Ag colloid, 110 °C bake 30min) (see [FIB-SIL]({% post_url /Experiment/2016-11-23-FIB-SIL%}))
1. Clean and remove Al (see [Clean after FIB]({% post_url /Experiment/2016-11-23-clean-after-FIB%}))
1. [Three-acid Clean]({% post_url /Experiment/2016-11-23-three-acid-clean %}) to remove carbon
1. [ICP]({% post_url /Experiment/2016-11-23-ICP %}) etch 70nm(20s) to remove Ga+(Run the program for 30s) (program: ``diamond etch-1``, $$O_2$$ 7/$$Ar$$ 8, 120W/1000W)
1. Test for the efficiency
1. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %})
1. [PMMA Spin-coating and baking]({% post_url /Experiment/2016-11-23-PMMA-Spin-coating %}) (A4, 3 layers, 6000rpm, 90s, 180°C baking for 5min, 5min and 10min respectively) 
1. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
1. [EBL]({% post_url /Experiment/2016-11-23-EBL %}), developing Lithography  (developing:  remove Al (using S1805 developer), DI water, N2, MIBK:IPA=1:3(PMMA developer)  1min, IPA  1min,  N2)
1. [Plasma clean]({% post_url /Experiment/2016-11-23-plasma-clean %}) (program: ``PMMA clean`` 6min)
1. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Ti60nm+Cr60nm+Au60nm
1. [Lift off]({% post_url /Experiment/2017-03-24-liftoff %})
1. [ALD Anti-reflecting coating]({% post_url /Experiment/2017-03-24-ALD %})
1. Fixed with cryogenic colloid, wire bonding
