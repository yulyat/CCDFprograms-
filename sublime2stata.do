#delimit ;
list state county program familygroup providertype providersubtype begindat2 reimbursehourly1 
reimbursedailyfull1 reimbursedailypart1 reimburseweeklyfull1 reimburseweeklypart1 
reimbursemonthlyfull1 reimbursemonthlypart1  if state == 1, nol noobs  display;

#delimit cr 
