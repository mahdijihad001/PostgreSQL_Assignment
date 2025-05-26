# Bonus Section Answer

## 1. What is PostgreSQL?
**PostgreSQL:** PostgresSQL is an open-source Database Management System (DBMS). It is a SQL (Structured Query Language) database. Postgres is a higher lavel RDBMS. It's help to write complex query and highly efficient. It provide us best performance and scalability, multiversion concurrency control services, deep language support. PSQL is 100% open source DBMS. <br/> <br/>
## 2. What is the purpose of a database schema in PostgreSQL?
 **Schema:** When we create a database, a public schema is created by-default. Schema's are like box. We normaly working in a public schema.
Schemas allow us to organize database objects tables, views, indexing, function etc. A database can have one or more schema. <br/> <br/>
## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**Primary key:** Primary key is a column in a database. It uniquely identifies each row in a table. It might be unique and incremental. The key should not be null. <br/>
**Foreign Key:** A foreign key is a column. It creates relationship between two tables. This key refers to the primary key of a parent table. <br/>  
For example, we have two tables 'departments' and 'students'. Now, department table has field like **department_id, department_name** etc. Here department_id is a Primary key of the departments table.
In Students table has some column including **student_id, student_name** and **department_id**. Here **department_id** is a foreign key that established a relationship between departments and students tables.
## 4. What is the difference between the VARCHAR and CHAR data types?
 `CHAR` and `VARCHAR` is two data types in PostgreSQL. The difference both are the CHAR data types stored fixed length of strings and the VARCHAR is stored characters strings of variable strings. <br/> <br/>
## 5. Explain the purpose of the WHERE clause in a SELECT statement.
**WHERE:** The **WHERE** clause is used for conditional query. When we want to get data using **SELECT** clause based on any condition, the **WHERE** clause helps us to querying data by conditions. The WHERE clause has a limit that is- When we use aggregate functions, the WHERE clause does not works with aggregate functions.
## 6. What are the LIMIT and OFFSET clauses used for?
**LIMIT:** LIMIT is a limiting to querying all data from tables. Suppose we have 10k data, we want just 50 data, than we can use LIMIT for limiting that kind of data. Here is the example below: <br/>
```
SELECT * FROM blogs LIMIT 50;
```
The query is *only retrive 50 data from blogs table.* <br/> <br/>
**OFFSET:** This clause used to skip data. This define that where to start limiting of data. Suppose we have lot's of data. We want to get 50 data instead of first 50 data. How we can do this? Here is the real magic of `OFFSET`. If we give OFFSET value is 50. It will skip first 50 data than it will start. For example, the pagination concept is working in this way. Suppose, In our first page, we want 50 data, for second page 50 data and so on. We can implement it using `LIMIT` and `OFFSET` clause. The example below: 
```
  SELECT * FROM students LIMIT 50 OFFSET 50 * 0;  // PAGE: 1
  SELECT * FROM students LIMIT 50 OFFSET 50 * 1;  // PAGE: 2
  SELECT * FROM students LIMIT 50 OFFSET 50 * 2;  // PAGE: 3
  SELECT * FROM students LIMIT 50 OFFSET 50 * 3;  // PAGE: 4
  SELECT * FROM students LIMIT 50 OFFSET 50 * 4;  // PAGE: 5
  SELECT * FROM students LIMIT 50 OFFSET 50 * 5;  // PAGE: 6
```
- **For first:** page our index is 0. It will be multifly with OFFSET 50 * 0 = 0, whether `LIMIT` is 50, so it will show first 50 data. Because our skip valu is 0.
- **For second:** page, our index is 1. It will be multifly with OFFSET 50 * 1 = 50. It means that the first 50 values will be skip. Then our second page will retrive 50 data by skiping first 50 data, and so on.
## 7. How can you modify data using UPDATE statements?
  We can update or modify record/row data using **UPDATE** clause. First of all, we have to write `UPDATE <tables_name>`. After that, we need to `SET` which column data we want to update like `SET course = 'Zoology'`. After set we have to clarify which row's column we want to update by WHERE clause, like `WHERE first_name = 'Jane'`. It means where naem is **Jane**, update course column data by **Zoology**. Example below:
  ```
    UPDATE students
        SET course = 'Zoology'
            WHERE first_name = 'Jane'
  ```

***WARNING*** If we don't clarify which rows data using WHERE, the update statement will update whole course column by **Zoology**.

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
Join operation means, joining between multiples tables. In PostgreSQL, there is kind of joins, **INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN, NATURAL JOIN**. All the join clause perform to join multiple tables for different cases for retrive data.<br/>

## 9. Explain the GROUP BY clause and its role in aggregation operations.
 We can grouping our data with `GROUP BY` clause. We can get the data of the rows by grouping. **GROUP BY** clause works with aggregate functions. For example: **sum( ), max( ), min( ), count( )** etc.
