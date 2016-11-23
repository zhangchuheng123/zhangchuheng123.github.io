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
2. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %}) to remove oil
3. [ICP]({% post_url /Experiment/2016-11-23-ICP %}) 30s to get a distinct surface peak (scanz) (program: ``diamond etch-1``, $$O_2$$ 7/$$Ar$$ 8, 120W/1000W)
4. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
5. Marker imprinting by [FIB]({% post_url /Experiment/2016-11-23-FIB%})(fixed with Ag colloid, 110 °C bake 30min) (no 3-acid clean and ICP, markers will become difficult to distinguish after this operations)
6. Clean and remove Al (see [Clean after FIB]({% post_url /Experiment/2016-11-23-clean-after-FIB%}))
7. NV location (see [NV location program](https://github.com/zhangchuheng123/NV_program))
8. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %})
9. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
10. SIL calculation and fabrication by FIB (fixed with Ag colloid, 110 °C bake 30min) (see [FIB-SIL]({% post_url /Experiment/2016-11-23-FIB-SIL%}))
11. [Three-acid Clean]({% post_url /Experiment/2016-11-23-three-acid-clean %}) to remove carbon
12. [ICP]({% post_url /Experiment/2016-11-23-ICP %}) etch 70nm(20s) to remove Ga+(Run the program for 30s) (program: ``diamond etch-1``, $$O_2$$ 7/$$Ar$$ 8, 120W/1000W)
13. Test for the efficiency
14. [Piranha clean]({% post_url /Experiment/2016-11-23-Piranha-Clean %})
15. [PMMA Spin-coating and baking]({% post_url /Experiment/2016-11-23-PMMA-Spin-coating %}) (A4, 3 layers, 6000rpm, 90s, 180°C baking for 5min, 5min and 10min respectively) 
16. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Al 20nm 
17. [EBL]({% post_url /Experiment/2016-11-23-EBL %}), developing Lithography  (developing:  remove Al (using S1805 developer), DI water, N2, MIBK:IPA=1:3(PMMA developer)  1min, IPA  1min,  N2)
18. [Plasma clean]({% post_url /Experiment/2016-11-23-plasma-clean %}) (program: ``PMMA clean`` 6min)
19. [Evaporate]({% post_url /Experiment/2016-11-23-Electron-beam-Evaporation-Deposition %}) Ti60nm+Cr60nm+Au60nm
20. Lift off: Soak in PG remover > 12h, then 85°C boil >30min, then lift off
21. Fixed with cryogenic colloid, wire bonding
