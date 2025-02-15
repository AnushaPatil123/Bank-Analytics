CREATE DATABASE `BANK_ANALYSIS`;
USE `BANK_ANALYSIS`;
DESC bankprojectcsv;
select * from bankprojectcsv;
/*Q1*Total Loan Amount Funded: Measures the total value of loans disbursed*/
select  Disbursement_Date_Years,concat (round(sum(Funded_Amount)/1000000,0)," M") as Total_Loan_Amount_Funded from bankprojectcsv group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*Q2 Total Loans: Tracks the number of loans issued.*/
select  Disbursement_Date_Years,concat (ROUND(count(Loan_Amount)/1000,0)," K") as Total_Loans from bankprojectcsv group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*Q3 Total Collection: Reflects repayment performance, including principal and interest.*/
select Disbursement_Date_Years,concat (round(sum(Total_Pymnt)/1000000,0)," M") as Total_Collection from bankprojectcsv group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*Q4. Total Interest: Captures revenue from loan interest.*/
select Disbursement_Date_Years,concat (round(sum( Total_Rrec_int)/1000000,0)," M") as Total_Interest from bankprojectcsv group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*Q5 Branch-Wise Performance: Analyzes revenue (interest, fees, total) by branch*/
select Branch_Name,concat (round(sum(Total_Revenue)/1000000,0)," M") as Branch_Wise_Performance  from bankprojectcsv group by Branch_Name ;

/*Q6 State-Wise Loan: Shows geographic distribution of loans.*/
SELECT State_Name,concat (round(sum(Loan_Amount)/1000000,0)," M") as State_Wise_Loan from bankprojectcsv group by  State_Name;

/*Q7 Religion-Wise Loan: Monitors loan distribution across religious demographics.*/
SELECT Religion,concat (ROUND(sum(Funded_Amount)/1000,0)," K") as Religion_Wisee_Loan from bankprojectcsv group by  Religion;

/*Q8 Product Group-Wise Loan: Categorizes loans by product types (e.g., personal, auto).*/
select Purpose_Category as Product_Name ,concat (ROUND(sum(Loan_Amount)/1000000,0)," M") as Product_Wise_Loan from bankprojectcsv group by Purpose_Category ;

/*Q9 Disbursement Trend: Tracks changes in loan disbursements over time.*/
select Disbursement_Date_Years,concat (ROUND(sum(Loan_Amount)/1000000,0)," M") as Year_wise_Total_Loan from bankprojectcsv group by Disbursement_Date_Years;

/*Q10 Grade-Wise Loan: Assesses portfolio risk by borrower credit grades*/
SELECT Grade,concat (ROUND(sum(Funded_Amount)/1000000,0)," M") as Grade_Wisee_Loan from bankprojectcsv group by  Grade ORDER BY Grade;

/*11 Default Loan Count: Counts loans in default.*/
select Disbursement_Date_Years,count( Is_Default_Loan) as Total_Default_Loan_Count from bankprojectcsv where Is_Default_Loan="Y" group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*12 Delinquent Client Count: Tracks borrowers with missed payments.*/
select Disbursement_Date_Years,count( Client_id
) as Count_of_Delinquent_Clients from bankprojectcsv where Is_Delinquent_Loan
="Y" group by Disbursement_Date_Years order by Disbursement_Date_Years;

/*13 Delinquent Loan Rate: Percentage of loans overdue in the portfolio*/
select Is_Delinquent_Loan
,concat(ROUND(count(Is_Delinquent_Loan
)/100) ,"%") as Default_Loan_rate from bankprojectcsv group by Is_Delinquent_Loan;

/*14 Default Loan Rate: Proportion of defaulted loans to the total portfolio.*/
select Is_Default_Loan,concat(ROUND(count(Is_Default_Loan)/100) ,"%")  as Default_Loan_rate from bankprojectcsv group by Is_Default_Loan ;

/*15 Loan Status-Wise Loan: Breaks down loans by status (active, delinquent, closed).*/
select Loan_Status,concat (ROUND(sum(Loan_Amount)/1000000,0)," M") as Status_Wise_Loan from bankprojectcsv group by Loan_Status;

/*16 Age Group-Wise Loan: Categorizes loans by borrowers’ age groups.*/
select Age,concat (ROUND(sum(Funded_Amount)/1000000,0)," M")  as Age_Wise_Loan from bankprojectcsv group by Age order by Age;

/*17 Loan Maturity: Tracks the timeline until full repayment */
select Loan_Maturity,
count(Loan_Amount)as Total_Loans_Maturing_by_year  from bankprojectcsv group by Loan_Maturity order by Loan_Maturity;

/*18 No Verified Loans: Identifies loans without proper verification.*/
select Disbursement_Date_Years,count(Loan_Amount) as count_of_Non_Verified_loans from bankprojectcsv where Verification_Status
="Not Verified" group by Disbursement_Date_Years order by Disbursement_Date_Years;


