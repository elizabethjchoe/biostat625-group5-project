# Impact of Socioeconomic Factors on Heart Disease Incidence in U.S.

### Author Contributions
All members were responsible for searching for dataset to use and selecting/ narrowing down variables to use for this project 
###### Yijun Guo

###### Yaodong Xin

###### Elizabeth Choe

### Project Description

### Data
Variables from the 2021 Behavioural Risk Factor Surveillance System (BRFSS) were used to perform different machine learning methods.
| Original Variable Name | Variable Renamed | Question Asked | Responses | NA's |
| ---------------------- | ---------------- | -------------- | --------- | ---- |
| SEXVAR | SEX | Sex of Respondent | (1) Male (2) Female | 0 |
| GENHLTH | GENHLTH | Would you say that in general your health is: | (1) Excellent (2) Very Good (3) Good (4) Fair (5) Poor (7) Don't know/ Not sure (9) Refused | 4 |
| PHYSHLTH | PHYSHLTH | Now thinking about your physical health, which includes physical illness and injury, for how many days during the past 30 days was your physical health not good? | (1 - 30) Number of Days (88) None (77) Don't know/ Not sure (99) Refused | 3 |
| MENTHLTH | MENTHLTH | Now thinking about your mental health, which includes stress, depression, and problems with emotions, for how many days during the past 30 days was your mental health not good? | (1 - 30) Number of Days (88) None (77) Don't know/ Not sure (99) Refused | 2 |
| PRIMINSR | INSURANCE | What is the current primary source of your health insurance? | (1) A plan purchased through employer or union (2) A private nongovernmental plan that you or another family member buys on your own (3) Medicare (4) Medigap (5) Medicaid (6) Children ́s Health Insurance Program (7) Military related health care (8) Indian Health Service (9) State sponsored health plan (10) Other government program (88) No coverage of any type (77) Don't know/ Not sure (99) Refused | 3 |
| PERSDOC3 | DOCTOR | Do you have one person (or a group of doctors) that you think of as your personal health care provider? | (1) Yes, only one (2) More than one (3) No (7) Don't know/ Not sure (9) Refused | 2 | 
| MEDCOST1 | MEDCOST | Was there a time in the past 12 months when you needed to see a doctor but could not because you could not afford it? | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 5 | 
| CHECKUP1 | CHECKUPS | About how long has it been since you last visited a doctor for a routine checkup? | (1) Within past year (anytime < 12 months ago) (2) Within past 2 years (1 year but < 2 years ago) (3) Within past 5 years (2 years but < 5 years ago) (4) 5 or more years ago (7) Don't know/ Not sure (8) Never (9) Refused | 2 |
| EXERANY2 | EXERCISE | During the past month, other than your regular job, did you participate in any physical activities or exercises such as running, calisthenics, golf, gardening, or walking for exercise? | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 2 |
| CVDSTRK3 | STROKE | (Ever told) (you had) a stroke. | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 2 | 
| CHCSCNCR | SKINCANCR | (Ever told) (you had) skin cancer? | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 2 | 
| CHCKDNY2 | KIDNEYDIS | Not including kidney stones, bladder infection or incontinence, were you ever told you had kidney disease? | 1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 3 | 
| DIABETE4 | DIABETES | (Ever told) (you had) diabetes? (If  ́Yes ́ and respondent is female, ask  ́Was this only when you were pregnant? ́ | (1) Yes (2) Yes, but female told only during pregnancy (3) No (4) No, pre-diabetes or borderline diabetes (7) Don't know/ Not sure (9) Refused | 3 |
| EDUCA | EDUCATION | What is the highest grade or year of school you completed? | (1) Never attended school or only kindergarten (2) Elementary (3) Some high school (4) High school graduate (5) College or technical school (6) College graduate (9) Refused | 5 |
| EMPLOY1 | EMPLOY | Are you currenly..? | (1) Employed for wages (2) Self-employed (3) Out of work for 1 year or more (4) Out of work for < 1 year (5) A homemaker (6) A student (7) Retired (8) Unable to work (9) Refused | 3,588 | 
| INCOME3 | INCOME | Is your annual household income from all sources: | (1) < $10k (2) < $15k (3) < $20k (4) < $25k (5) < $35k (6) < $50k (7) < $75k (8) < $100k (9) < $150k (10) < $200k (11) ≥ $200k (77) Don't know/ Not sure (99) Refused | 8,847 |
| DECIDE | DECISION | Because of a physical, mental, or emotional condition, do you have serious difficulty concentrating, remembering, or making decisions? | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 16,843 | 
| SMOKE100 | SMOKE100 | Have you smoked at least 100 cigarettes in your entire life? | (1) Yes (2) No (7) Don't know/ Not sure (9) Refused | 21,232 | 
| USENOW3 | CURRENTSMOKE | Do you currently use chewing tobacco, snuff, or snus every day, some days, or not at all? | (1) Yes (2) No (3) Not at all (7) Don't know/ Not sure (9) Refused | 271,240 | 
| ECIGNOW1 | ECIGARETTE | Do you now use e-cigarettes or other electronic vaping products every day, some days, or not at all? | (1) Every day (2) Some days (3) Not at all (4) Never used e-cigs (7) Don't know/ Not sure (9) Refused | 23,025 | 
| ALCDAY5 | ALCOHOL | During the past 30 days, how many days per week or per month did you have at least one drink of any alcoholic beverage such as beer, wine, a malt beverage or liquor? | (101-107) Days per week (201-230) Days in past 30 days (777) Don't know/ Note sure (888) No drinks in past 30 days (999) Refused | 24,487 |
| X_MICHD | HEARTDISEASE | Respondents that have ever reported having coronary heart disease (CHD) or myocardial infarction (MI) | (1) Reported having MI or CHD (2) Did not report having MI or CHD | 4,635 | 
| X_CASTHM1 | ASTHMA | Adults who have been told they currently have asthma | (1) No (2) Yes (9) Don't know/ Not sure | 0 |
| X_RACEGR3 | RACE | Five-level race/ethnicity category | (1) White (2) Black (3) Other (4) Multiracial (5) Hispanic (9) Don't know / Not Sure / Refused | 0 |
| X_AGEG5YR | AGE | Fourteen-level age category | (1) 18-24 (2) 25-29 (3) 30-34 (4) 35-39 (5) 40-44 (6) 45-49 (7) 50-54 (8) 55-59 (9) 60-64 (10) 65-69 (11) 70-74 (12) 75-79 (13) 80 or older (14) Don't know/ Refused / Missing | 0 |
| X_BMI5CAT | BMIS | Four-categories of Body Mass Index (BMI) | (1) Underweight (2) Normal weight (3) Overweight (4) Obese | 46,852 |
