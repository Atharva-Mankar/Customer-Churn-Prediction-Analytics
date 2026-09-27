USE CustomerChurnAnalytics;

-- Total Customers
SELECT COUNT(*) AS Total_Customers
FROM CustomerChurn;

-- Churned Customers
SELECT SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers
FROM CustomerChurn;

-- Churn Rate
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn;

-- Average Monthly Charges
SELECT ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM CustomerChurn;

-- Average Tenure
SELECT ROUND(AVG(tenure), 2) AS Avg_Tenure_Months
FROM CustomerChurn;

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 36 THEN '25-36 Months'
        WHEN tenure <= 48 THEN '37-48 Months'
        WHEN tenure <= 60 THEN '49-60 Months'
        ELSE '61-72 Months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate

FROM CustomerChurn
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 36 THEN '25-36 Months'
        WHEN tenure <= 48 THEN '37-48 Months'
        WHEN tenure <= 60 THEN '49-60 Months'
        ELSE '61-72 Months'
    END
ORDER BY Churn_Rate DESC;

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;