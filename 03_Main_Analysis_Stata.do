import delimited C:\GitHub\score_horvath\data\df_orig_complete.csv, clear

encode cntry, gen(country)

oprobit stdliv_next5 i.cat_age i.wave i.cat_age#i.wave country
est sto m1

oprobit stdliv_next5 i.cat_age i.wave i.cat_age#i.wave female i.education i.egp6 i.income country
est sto m2

oprobit stdliv_next5 i.cat_age i.wave i.cat_age#i.wave female i.education i.egp6 i.income pensions unemployed car_owner country
est sto m3


estout m1 m2 m3, cells(b(star fmt(%9.3f))) stats(N r2_p ll)

margins, at(cat_age=(1 2 3 4) wave=(1993 2007))

*for speed I simply copied Stata results 'as table' into a csv called Tbl5_m3.csv
