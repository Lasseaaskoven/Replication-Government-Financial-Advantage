
*Load the "commons_candidate_campaign_spending_v20201027.tab" data set from the replication files of Fouirnaies (2021) https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/AP0DHP

* Generating  Early election varible: Source: https://publications.parliament.uk/pa/ld201011/ldselect/ldconst/69/6905.htm*

generate earlyelection=0
replace earlyelection=1 if year==2019 
replace earlyelection=1 if year==2017
replace earlyelection=1 if year==2005 
replace earlyelection=1 if year==2001
replace earlyelection=1 if year==1987
replace earlyelection=1 if year==1983
replace earlyelection=1 if year==1974
replace earlyelection=1 if year==1970 
replace earlyelection=1 if year==1966
replace earlyelection=1 if year==1959 
replace earlyelection=1 if year==1955
replace earlyelection=1 if year==1951



*Schleiter and Tavits (2016) opportunistic election
tostring date, gen (date_string)

	
generate opportunistic_election=0
replace opportunistic_election=1 if year==1951
replace opportunistic_election=1 if year==1955
replace opportunistic_election=1 if year==1959
replace opportunistic_election=1 if year==1966
replace opportunistic_election=1 if year==1970
replace opportunistic_election=1 if date_string=="5172"
replace opportunistic_election=1 if year==1983
replace opportunistic_election=1 if year==1987
replace opportunistic_election=1 if year==2001
replace opportunistic_election=1 if year==2005





*generating government parties*
encode party, gen (partynum)


generate govparty=0
replace govparty=. if year<1945
replace govparty=1 if year==1945 & partynum==15 | year==1945 & partynum==5 | year==1945 & partynum==13 | year==1945 & partynum==18  
replace govparty= 1 if partynum==13 & year>1945 & year<1952 
replace govparty= 1 if partynum==5 & year>1951 & year<1965 
replace govparty= 1 if partynum==13 & year>1964 & year<1971
 replace govparty= 1 if partynum==5 & year>1970 & year<1975
 replace govparty= 1 if partynum==13 & year>1974 & year<1980
 replace govparty= 1 if partynum==5 & year>1979 & year<1998
 replace govparty= 1 if partynum==13 & year>1997 & year<2011
 replace govparty= 1 if partynum==5 & year>2010
 replace govparty=1 if partynum== 15 & year>2010 & year<2016 


 
 generate conservative=0
replace conservative=1 if partynum==5
replace conservative=. if partynum==.


*Generate new measure of government party (not to be used for analyzing by-elections)*

generate new_gov_party=0
replace new_gov_party=. if year<1945

replace new_gov_party=1 if year==1945 & partynum==5
replace new_gov_party=1 if year==1945 & partynum==13
replace new_gov_party=1 if year==1945 & partynum==18
replace new_gov_party=1 if year==1945 & partynum==15

replace new_gov_party=1 if  partynum==13 & year==1950
replace new_gov_party=1 if  partynum==13 & year==1951
replace new_gov_party=1 if  partynum==5 & year==1955
replace new_gov_party=1 if  partynum==5 & year==1959
replace new_gov_party=1 if  partynum==5 & year==1964
replace new_gov_party=1 if  partynum==13 & year==1966
replace new_gov_party=1 if  partynum==13 & year==1970
replace new_gov_party=1 if  partynum==5 & year==1974
replace new_gov_party=1 if  partynum==13 & year==1979
replace new_gov_party=1 if  partynum==5 & year==1983
replace new_gov_party=1 if  partynum==5 & year==1987
replace new_gov_party=1 if  partynum==5 & year==1992
replace new_gov_party=1 if  partynum==5 & year==1997
replace new_gov_party=1 if  partynum==13 & year==2001
replace new_gov_party=1 if  partynum==13 & year==2005
replace new_gov_party=1 if  partynum==13 & year==2010
replace new_gov_party=1 if  partynum==5 & year==2015
replace new_gov_party=1 if  partynum==15 & year==2015
replace new_gov_party=1 if  partynum==5 & year==2017
replace new_gov_party=1 if  partynum==5 & year==2019













	
	
* Generating term lenght variable:  Source: https://publications.parliament.uk/pa/ld201011/ldselect/ldconst/69/6905.htm*

	

generate termlength=.
replace termlength= 4.6 if year==1950
replace termlength= 1.7 if year==1951
replace termlength= 3.6 if year==1955
replace termlength=4.4 if year==1959
replace termlength= 5.0 if year==1964
replace termlength=1.5 if year==1966
replace termlength= 4.2 if year==1970
replace termlength= 3.7 if date_string=="5172"
replace termlength= 0.6 if date_string== "5396"
replace termlength= 4.6 if year== 1979
replace termlength= 4.1 if year== 1983
replace termlength= 4.0 if year== 1987
replace termlength= 4.8 if year== 1992
replace termlength= 5.1 if year==1997
replace termlength= 4.1 if year==2001
replace termlength= 3.9 if year==2005
replace termlength= 5.0 if year==2010 
replace termlength= 5.0 if year==2015
replace termlength= 2.1 if year==2017
replace termlength= 2.5 if year== 2019



* Merging with poll data
generate election_id=.
replace election_id= 0 if year==1945
replace election_id= 1 if year==1950
replace election_id= 2 if year==1951
replace election_id= 3 if year==1955
replace election_id= 4 if year==1959
replace election_id=  5 if year==1964
replace election_id= 6 if year==1966
replace election_id= 7 if year==1970
replace election_id= 8 if date_string=="5172"
replace election_id= 9 if date_string== "5396"
replace election_id= 10 if year== 1979
replace election_id= 11 if year== 1983
replace election_id= 12 if year== 1987
replace election_id= 13 if year== 1992
replace election_id= 14 if year==1997
replace election_id= 15 if year==2001
replace election_id= 16 if year==2005
replace election_id= 17 if year==2010 
replace election_id= 18 if year==2015
replace election_id= 19 if year==2017
replace election_id= 20 if year== 2019

merge m:1 election_id using "incumbent_poll.dta", force
 
 * Descriptive statistics*
 
 
 sum spending_total_adj  earlyelection termlength  govparty   electors mp  if year>1945 & by_election!=1 & spending_total_adj!=. 
 
 * Descriptive figures*
 label define ncategory 0 "Non-government party"   1 "Government party"
label value govparty ncategory
 
 graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 3000 6000 9000 12000 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==0
 
 graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 3000 6000 9000 12000 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==1
 
 
 *Figure 1:Descriptive figures: Only Labour and Conservative*
  graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 2500 5000 7500 10000 12500 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==0 & partynum==5 |  year>1945 & by_election!=1 & earlyelection==0 & partynum==13 
 
 graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 2500 5000 7500 10000 12500 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==1 & partynum==5 | year>1945 & by_election!=1 & earlyelection==1 &  partynum==13 
 
 
 
 * Descriptive figures: Only Labour, Conservative and Lib Dem.
   graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 2500 5000 7500 10000 12500 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==0 & partynum==5 | year>1945 & by_election!=1 & earlyelection==0 & partynum==13 | year>1945 & by_election!=1 & earlyelection==0 & partynum== 15
 
 graph bar spending_total_adj ,  over( govparty   ) ytitle("Average candidate spending in constant £") ylabel(0 2500 5000 7500 10000 12500 15000) graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 & earlyelection==1 & partynum==5 | year>1945 & by_election!=1 & earlyelection==1 &  partynum==13 | year>1945 & by_election!=1 & earlyelection==1 &  partynum== 15
 
 
 
 *Table 2: main results*
encode const, gen (const_id)
 
 reg spending_total_adj govparty i.year, cluster (const_id), if year>1945 & by_election!=1 

 reg spending_total_adj govparty i.partynum i.year, cluster (const_id), if year>1945 & by_election!=1 


 reg spending_total_adj govparty i.year i.partynum i.region i.county , cluster (const_id), if year>1945 & by_election!=1 
 
 
  reg spending_total_adj govparty electors i.partynum i.region i.county i.year , cluster (const_id), if year>1945 & by_election!=1 
 
 
  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty electors ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 


reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum region)cluster (const_id), if year>1945 & by_election!=1 

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  , absorb( const_id partynum year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 

*Footnote: Including by-elections*

  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945  

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year) cluster (const_id), if year>1945  

reghdfe spending_total_adj c.earlyelection##c.govparty   ,  absorb( year)cluster (const_id), if year>1945 

reghdfe spending_total_adj c.earlyelection##c.govparty   , absorb( year partynum,)cluster (const_id), if year>1945 


reghdfe spending_total_adj c.earlyelection##c.govparty   ,  absorb( year partynum region)cluster (const_id), if year>1945 

   
reghdfe spending_total_adj c.earlyelection##c.govparty   , absorb( const_id year  partynum) cluster(const_id), if year>1945 

reghdfe spending_total_adj c.earlyelection##c.govparty    , absorb( cand_id year) cluster(const_id), if year>1945 





*Table 3: Analysis with incumbent MP status*


reghdfe spending_total_adj c.earlyelection##c.govparty##c.mp  electors   , absorb( const_id year partynum) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty##c.mp   electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 




  *Table 4 Analysis with fixed term act*
   
generate fixedtermparliament=0
replace fixedtermparliament= 1 if year>2011   
   
    reg spending_total_adj c.earlyelection##c.govparty##c.fixedtermparliament electors i.partynum i.region i.county i.year , cluster (const_id), if year>1945 & by_election!=1 
	
	reghdfe spending_total_adj c.earlyelection##c.govparty##c.fixedtermparliament  electors , absorb( partynum const_id year) cluster(const_id), if year>1945 & by_election!=1 
	
		reghdfe spending_total_adj c.earlyelection##c.govparty##c.fixedtermparliament  electors  , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 

	


*Table 5 Controlling for incumbent opinion polls*
 label define electioncategory 0 "Scheduled election"   1 "Early election"
label value earlyelection electioncategory
 
 
  graph bar  incumbent_pm_poll,  over( earlyelection  ) ytitle("PM party percentage support in polls pre-election")  graphregion(color(white))legend (off) , if  year>1945 & by_election!=1 
 
 
 reg spending_total_adj c.earlyelection##c.govparty  incumbent_pm_poll,  cluster (const_id), if year>1945 & by_election!=1 
  reghdfe spending_total_adj c.earlyelection##c.govparty  incumbent_pm_poll,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

 
 reg spending_total_adj c.earlyelection##c.govparty electors  incumbent_pm_poll,  cluster (const_id), if year>1945 & by_election!=1 
reghdfe spending_total_adj c.earlyelection##c.govparty electors  incumbent_pm_poll,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

  reg spending_total_adj c.earlyelection##c.govparty electors  incumbent_pm_poll ,  cluster (const_id), if year>1945 & by_election!=1 
 reghdfe spending_total_adj c.earlyelection##c.govparty electors  incumbent_pm_poll ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 

   reg spending_total_adj c.earlyelection##c.govparty electors  incumbent_pm_poll ,  cluster (const_id ), if year>1945 & by_election!=1 
reghdfe spending_total_adj c.earlyelection##c.govparty electors incumbent_pm_poll,   absorb( partynum region year)cluster (const_id ,), if year>1945 & by_election!=1 



reghdfe spending_total_adj c.earlyelection##c.govparty  electors incumbent_pm_poll  , absorb( const_id partynum) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_total_adj c.earlyelection##c.govparty  electors incumbent_pm_poll   , absorb( const_id year partynum) cluster(const_id), if year>1945 & by_election!=1 



reghdfe spending_total_adj c.earlyelection##c.govparty  electors  incumbent_pm_poll  , absorb( cand_id ) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  incumbent_pm_poll  , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 


reghdfe  spending_total_adj   c.termlength##c.govparty  electors  incumbent_pm_poll , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")  addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))

	
	
	
*Table 6: What is it spent on?*
reghdfe spending_ads_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_allemployees_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_facilities_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_meetings_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_misc_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
reghdfe spending_personal_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 

	

	
	
	reghdfe spending_ads_adj c.earlyelection##c.govparty  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_ads_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 


	reghdfe spending_staff_adj c.earlyelection##c.govparty  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_staff_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 




	reghdfe spending_personal_adj c.earlyelection##c.govparty  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_personal_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 


	
	*Table 7:  Effect of spending*
reghdfe vote_pct spending_total_adj electors, absorb( const_id year  partynum ) cluster(const_id), if year>1945 & by_election!=1 



*Figures: Analysis with term lenght*

 
  reg spending_total_adj c.termlength##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")


reghdfe spending_total_adj c.termlength##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")


reghdfe spending_total_adj c.termlength##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")


reghdfe spending_total_adj c.termlength##c.govparty electors  i.partynum,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")



reghdfe spending_total_adj c.termlength##c.govparty electors  i.partynum i.region,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")


   
reghdfe spending_total_adj c.termlength##c.govparty  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")



reghdfe spending_total_adj c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")  addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))




*Figure 3: Analysis with term lenght and incumbent mp*

reghdfe spending_total_adj c.termlength##c.govparty##c.mp   electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) noestimcheck, if mp==0
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=. & mp==0, below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))



reghdfe spending_total_adj c.termlength##c.govparty##c.mp   electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) noestimcheck, if mp==1 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=.& mp==1 , below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))



*Figure 4: Analysis with term lenght and fixed-term parliaments act*
	reghdfe spending_total_adj c.termlength##c.govparty##c.fixedtermparliament   electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) noestimcheck, if fixedtermparliament==0 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=. & fixedtermparliament==0, below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))




	reghdfe spending_total_adj c.termlength##c.govparty##c.fixedtermparliament   electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) noestimcheck, if fixedtermparliament==1
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=. & fixedtermparliament==1 , below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))

	


*Appendix: 1945 election included
 reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1944 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1944 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1944 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( partynum year)cluster (const_id), if year>1944 & by_election!=1 


reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( partynum region year)cluster (const_id), if year>1944 & by_election!=1 

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( const_id year partynum) cluster(const_id), if year>1944 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1944 & by_election!=1 

*Appendix: Log of spending instead*
hist spending_total_adj, xtitle("Candidate spending in constant £")  graphregion(color(white))legend (off), if year>1945 & by_election!=1 


generate plusspending= spending_total_adj +1
generate logspending = log(plusspending)


reg logspending govparty i.year, cluster (const_id), if year>1945 & by_election!=1 

 reg logspending govparty i.partynum i.year, cluster (const_id), if year>1945 & by_election!=1 


 reg logspending govparty i.year i.partynum i.region i.county , cluster (const_id), if year>1945 & by_election!=1 
 
 
  reg logspending govparty electors i.partynum i.region i.county i.year , cluster (const_id), if year>1945 & by_election!=1 
 
 
  reg logspending c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 

reghdfe logspending c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe logspending c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe logspending c.earlyelection##c.govparty electors  ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 


reghdfe logspending c.earlyelection##c.govparty electors ,  absorb( year  partynum region)cluster (const_id), if year>1945 & by_election!=1 

   
reghdfe logspending c.earlyelection##c.govparty  electors  , absorb( const_id year  partynum) cluster(const_id), if year>1945 & by_election!=1 

reghdfe logspending c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe logspending  c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")  addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))



* Appendix: Schleiter and Tavits (2016)opportunistic elections instead*

  reg spending_total_adj c.opportunistic_election##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.opportunistic_election##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.opportunistic_election##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.opportunistic_election##c.govparty electors ,  absorb( year  partynum)cluster (const_id), if year>1945 & by_election!=1 


reghdfe spending_total_adj c.opportunistic_election##c.govparty electors  ,  absorb( year partynum region)cluster (const_id), if year>1945 & by_election!=1 

   
reghdfe spending_total_adj c.opportunistic_election##c.govparty  electors   , absorb( const_id year partynum) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.opportunistic_election##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 



*Appendix: Only Labour and Conservative candidates*	
  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 & partynum==13 

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1  & partynum==5 | year>1945 & by_election!=1 & partynum==13 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 & partynum==13 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 & partynum==13 


reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum region)cluster (const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 &  partynum==13 

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  , absorb( const_id year  i.partynum) cluster(const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 &  partynum==13 

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 &  partynum==13 
	
	

reghdfe spending_total_adj c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 & partynum==5 | year>1945 & by_election!=1 & partynum==13 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("")  addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))





*Appendix: Excluding high-spending candidates*
  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  


reghdfe spending_total_adj c.earlyelection##c.govparty electors ,  absorb( year  partynum region)cluster (const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  , absorb( const_id year  partynum) cluster(const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 & spending_total_adj<9291.653  


reghdfe spending_total_adj c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>194 & by_election!=1 & spending_total_adj<9291.653 
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))




*Appendix: Only looking at close-election candidates
 reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55

reghdfe spending_total_adj c.earlyelection##c.govparty electors ,   absorb( year partynum,)cluster (const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55


reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum region)cluster (const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors , absorb( const_id year  partynum ) cluster(const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 & vote_pct> 45 & vote_pct<55



reghdfe spending_total_adj c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 &  vote_pct> 45 & vote_pct<55
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))




*Appendix: Only looking at safe seat candidates
 reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1  & vote_pct>55

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & vote_pct>55

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 & vote_pct>55

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum)cluster (const_id), if year>1945 & by_election!=1 & vote_pct>55


reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year partynum region)cluster (const_id), if year>1945 & vote_pct>55

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  , absorb( const_id year  partynum) cluster(const_id), if year>1945 & by_election!=1 & vote_pct>55

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 &  vote_pct>55

reghdfe spending_total_adj c.termlength##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 &   vote_pct>55
margins, dydx( govparty) at (termlength=(0 (1) 5)) 
marginsplot, level(95)xtitle (Years since last election) ytitle (Effect of government party on candidate spending) yline(0, lstyle(grid) lcolor(gs8) lpattern(dash))graphregion(color(white))legend (off) scheme(s2mono) recastci(rline) recast(line) title("") addplot(hist termlength if by_election!=1  & govparty!=. & spending_total_adj!=. & electors!=., below discret percent lcolor(black*0.5) fcolor(white) yaxis(2)ylabel(0 150, axis(2)) yscale(off axis(2)))

	
	



* Other analyses not in paper* 



*Only conservative candidates*
  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 & partynum==5 


*Only Labour candidates*
reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 & by_election!=1 & partynum==13 



*Interaction with conservative dummy*
  reg spending_total_adj c.earlyelection##c.govparty##c.conservative  ,  cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1  

reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative electors  ,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative electors  i.partynum,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative electors  i.partynum i.region,  absorb( year)cluster (const_id), if year>1945 & by_election!=1 
   
reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 

reghdfe spending_total_adj c.earlyelection##c.govparty##c.conservative electors   , absorb( cand_id year) cluster(const_id), if year>1945 & by_election!=1 
		


	
	
	
*Including by_elections*	
  reg spending_total_adj c.earlyelection##c.govparty,  cluster (const_id), if year>1945 

reghdfe spending_total_adj c.earlyelection##c.govparty ,  absorb( year)cluster (const_id), if year>1945

reghdfe spending_total_adj c.earlyelection##c.govparty electors  ,  absorb( year)cluster (const_id), if year>1945 

reghdfe spending_total_adj c.earlyelection##c.govparty electors  i.partynum,  absorb( year)cluster (const_id), if year>1945 


reghdfe spending_total_adj c.earlyelection##c.govparty electors  i.partynum i.region,  absorb( year)cluster (const_id), if year>1945 

   
reghdfe spending_total_adj c.earlyelection##c.govparty  electors  i.partynum , absorb( const_id year) cluster(const_id), if year>1945 

reghdfe spending_total_adj c.earlyelection##c.govparty  electors   , absorb( cand_id year) cluster(const_id), if year>1945 
	
		
	
	

* Effect of comapign spending*
reghdfe vote_pct spending_total_adj  electors  i.partynum  , absorb( const_id year) cluster(const_id), if year>1945 & by_election!=1 	
	


