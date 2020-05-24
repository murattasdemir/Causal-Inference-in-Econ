---
# May_23_2020_RDD_in_Stata_rdrobust stata 16 do file
---
* Name: Jikhan Jeong
* Ref: https://sites.google.com/site/rdpackages/rdrobust (package)
* Ref: https://cattaneo.princeton.edu/papers/Calonico-Cattaneo-Farrell-Titiunik_2017_Stata.pdf (Stata Journal)
* Ref: https://onlinelibrary.wiley.com/doi/abs/10.3982/ECTA11757 (Paper), Econometrica 2014
* Install:  ssc install rdrobust or net install rdrobust, from(https://sites.google.com/site/rdpackages/rdrobust/stata) replace
---


net install rdrobust, from(https://sites.google.com/site/rdpackages/rdrobust/stata) replace
use rdrobust_senate.dta

---
* **margin** ranges from -100 to 100, records the Democratic party's margin of victory in the statewide election for a given U.S. Senate seat which the vote sahre of the Demoratic party - that of the strongest opponent
* margin > 0, the Democratic party wins the election for that seat. The discontinuity in incumbency status that occurs at margin = 0, **running variable** is **margin**
* **vote** : ranges from 0 to 100, records the Democratic vote share in the following election for the same seat (6 year later), **the outcome variable**
---

sum

summarize vote margin

---
### rdplot : automatic plot 
---

rdplot vote margin,graph_options(title(RD Plot - Senate elections data) ytitle(Vote share in election at time t+1) xtitle(Vote share in election at time t))
	   
rdplot vote margin, binselect(es) graph_options(title(RD Plot - Senate elections data) ytitle(Vote share in election at time t+1) xtitle(Vote share in election at time t))
	   
rdplot vote margin, binselect(qsmv) graph_options(title(RD Plot - Senate elections data) ytitle(Vote share in election at time t+1) xtitle(Vote share in election at time t))	   
	   
* rdrobust

rdrobust vote margin

* rdrobust : datailed output

rdrobust vote margin, all

* bandwidth selection

rdbwselect vote margin, all

* overall, the problem in rdrobust is no explain in detail in each options and using stata is better in overall for reproducing 

	   