load 1irj_with-exchange_a9.pdb, a9
load 1irj_with-exchange_m63f.pdb, m63f
load 1irj_with-exchange_diff.pdb, diff
load 1irj.pdb, bg_struct

hide eve

select missing, b > 8

select fast, (a9 or m63f) and name CA and b > -1 and b < 1
select expt, (a9 or m63f) and name CA and b > 0 and b < 2
select slow, (a9 or m63f) and name CA and b > 1 and b < 3

select fast_to_fast, diff and name CA and b > 2 and b < 4
select fast_to_expt, diff and name CA and b > 3 and b < 5
select expt_to_expt, diff and name CA and b > 4 and b < 6
select expt_to_slow, diff and name CA and b > 5 and b < 7
select slow_to_slow, diff and name CA and b > 6 and b < 8
select expt_to_fast, diff and name CA and b > 7 and b < 9

color gray80

color firebrick, fast
color teal, expt
color deepblue, slow

color gray50, fast_to_fast
color blue, fast_to_expt
color blue, expt_to_expt
color blue, expt_to_slow
color gray50, slow_to_slow
color red, expt_to_fast

set orthoscopic, 1
set ray_shadow, 0
bg_color white

show spheres, resid 63 and sidechain
color yellow, resid 63 and sidechain

set_view (\
     0.402627438,    0.608519852,   -0.683810294,\
     0.369849145,   -0.791489720,   -0.486576259,\
    -0.837320447,   -0.056997716,   -0.543735385,\
     0.000000000,    0.000000000, -138.511245728,\
    22.586925507,   49.168819427,   10.884865761,\
  -46126.457031250, 46403.480468750,   20.000000000 )

show spheres, name CA and not resn CA
hide spheres, diff and fast_to_fast
hide spheres, diff and slow_to_slow
hide spheres, diff and missing

color gray80, bg_struct and chain A
color gray20, bg_struct and chain B
show cartoon, bg_struct
hide spheres, bg_struct
set cartoon_cylindrical_helices, 1
set cartoon_helix_radius, 1.5
set cartoon_loop_radius, 0.5

show spheres, bg_struct and resn CA
color green, bg_struct and resn CA
set sphere_scale, 0.85, name CA and (not sidechain) and elem C

disable a9
disable m63f
disable diff

enable a9
ray 2000
png a9_front.png
rotate x, 90
ray 2000
png a9_top.png
rotate x, -90
disable a9

enable m63f
ray 2000
png m63f_front.png
rotate x, 90
ray 2000
png m63f_top.png
rotate x, -90
disable m63f

enable diff
ray 2000
png diff_front.png
rotate x, 90
ray 2000
png diff_top.png
rotate x, -90
disable diff
