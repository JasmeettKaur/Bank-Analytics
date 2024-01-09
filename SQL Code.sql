/* 1) Year wise loan amount Stats */

UPDATE finance_3 SET issue_d = STR_TO_DATE(CONCAT('01-', issue_d), '%d-%b-%y');
select year(issue_d) as Years, sum(loan_amnt) as loan_amount from finance_3 group by years order by years; 

/* 2) Grade and sub grade wise revol_bal */

SELECT grade, sub_grade, Sum(revol_bal) AS Total_revol_bal
FROM Finance_3 inner join finance_2 on finance_3.id = finance_2.id
GROUP BY grade, sub_grade
order by grade, sub_grade;

/* 3) Total Payment for Verified Status Vs Total Payment for Non Verified Status */

SELECT verification_status, SUM(total_pymnt)  AS total_payment
FROM Finance_3  inner join finance_2 on finance_3.id = finance_2.id
GROUP BY verification_status
order by total_payment;

/* 4) State wise and last_credit_pull_d wise loan status */

SELECT addr_state, last_credit_pull_d, loan_status
FROM Finance_3 join finance_2 on finance_3.id = finance_2.id
group by addr_state, last_credit_pull_d, loan_status
order BY addr_state, last_credit_pull_d;

/* 5)  Home ownership Vs last payment date stats */

SELECT  home_ownership, count(last_pymnt_d) as Total_lst_payment_d, MAX(last_pymnt_d) AS latest_last_payment_date,
 MIN(last_pymnt_d) AS earliest_last_payment_date
FROM Finance_3 join finance_2 on finance_3.id = finance_2.id
GROUP BY home_ownership;
