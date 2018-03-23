

clear all
set more off

global intvrdata "/Users/wtfaidh/Documents/REAP/SPJAN/数据导出/疾病调查总表_4_STATA_All"
global rawdata "/Users/wtfaidh/Documents/REAP/SPJAN/数据导出/ROT_raw_data"

cd "$intvrdata"

 use probability1a.dta
     reshape wide Q1_1_1 Q1_1_2 interview__key, i(interview__id) j(probability1a__id)
	save 1a.dta, replace
	
 use probability1b.dta
     reshape wide Q1_2_1 Q1_2_2 interview__key, i(interview__id) j(probability1b__id)
    save 1b.dta,replace
	
 use probability2.dta
     reshape wide Q3_1 Q3_2 interview__key, i(interview__id) j(probability2__id)
	save 2.dta, replace
	
 use probability4.dta
     reshape wide Q4_1 Q4_2 interview__key, i(interview__id) j(probability4__id)
    save 4.dta, replace 
 
use _.dta
 merge 1:1 interview__id using "1a.dta"
 order Q1_1_11 - interview__key7, after (order_1a)
 drop Q1_1_1__0 - Q1_1_1__9
 rename _merge a_merge
 
 merge 1:1 interview__id using "1b.dta"
 order Q1_2_11 - interview__key9, after (order_1b)
 drop Q1_2_1__0 - Q1_2_1__9
 rename _merge b_merge
 
 merge 1:1 interview__id using "2.dta"
 order Q3_11 - Q3_24, after (order_3)
 drop Q3_1__0 - Q3_1__9
 rename _merge d_merge
 
 merge 1:1 interview__id using "4.dta"
 order Q4_11 - Q4_27, after (order_4)
 drop Q4_1__0 - Q4_1__9
 rename _merge c_merge
 
save "$rawdata/rot_raw.dta", replace 
 
 
 
