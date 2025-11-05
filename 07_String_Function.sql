/* ============================================================================== 
   SQL String Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL string functions, which allow 
   manipulation, transformation, and extraction of text data efficiently.

   Table of Contents:
     1. Manipulations
        - CONCAT
        - LOWER
        - UPPER
	- TRIM
	- REPLACE
     2. Calculation
        - LEN
     3. Substring Extraction
        - LEFT
        - RIGHT
        - SUBSTRING
=================================================================================
*/

/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */
-- Concatenate first name and country into one column
SELECT
	CONCAT(first_name, '-',country) AS full_info
FROM customers


/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */
-- Convert the first name to lowercase

SELECT
	LOWER(first_name) AS lower_case_name
FROM customers

-- Convert the first name to uppercase

SELECT
	UPPER(first_name) AS lower_case_name
FROM customers

/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

-- Find customers whose first name contains leading or trailing spaces

SELECT
	first_name,
	LENGTH(first_name) len_name,
	LENGTH(TRIM(first_name))  len_trim_name,
	LENGTH(first_name) - LENGTH(TRIM(first_name)) flag
FROM customers
WHERE LENGTH(first_name) != LENGTH(TRIM(first_name))
--WHERE first_name != TRIM(first_name)

/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */
-- Remove dashes (-) from a phone number

SELECT 
'123-456-789',
REPLACE('123-456-789','-','/') AS clean_phone_no

-- Replace File Extence from txt to csv
SELECT
'report.txt' AS old_filename,
REPLACE('report.txt', '.txt', '.csv') AS new_filename


/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

-- Calculate the length of each customer's first name
SELECT 
    first_name, 
    LENGTH(first_name) AS name_length
FROM customers

/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

-- Retrieve the first two characters of each first name
SELECT
	LEFT(TRIM(first_name),2) AS first_2_chars
FROM customers

-- Retrieve the last two characters of each first name
SELECT
	RIGHT(first_name, 2) AS last_2_chars
FROM customers


/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
=============================================================================== */

--Retrieve a list of customers' first names after removing the first character
SELECT
	SUBSTRING(TRIM(first_name), 2, LENGTH(first_name)) AS trimmed_name
FROM customers

/* ==============================================================================
   NESTING FUNCTIONS
===============================================================================*/
--Nesting 
SELECT
first_name,
UPPER(LOWER(TRIM(first_name))) AS nesting
FROM customers





























































































