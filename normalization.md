
# Database Normalization to 3NF

## Objective
The goal is to eliminate redundancy and ensure data integrity by normalizing the AirBnB-style relational schema into **Third Normal Form (3NF)**.

---

## Step 1: First Normal Form (1NF)
**Requirements:**
- Each table must have a primary key.
- All fields must contain atomic values (no repeating groups or arrays).

✅ **Status:** All tables in the schema already satisfy 1NF.  
Fields are atomic, and each entity has a unique primary key (UUID-based).

---

## Step 2: Second Normal Form (2NF)
**Requirements:**
- Must meet 1NF.
- All non-key attributes must be fully functionally dependent on the whole primary key.

✅ **Status:** Satisfied.  
Each non-key attribute in every table depends on the full primary key, not part of it.


## Step 3: Third Normal Form (3NF)
**Requirements:**
- Must meet 2NF.
- No transitive dependencies (non-key attributes must not depend on other non-key attributes).

✅ **Status:** Satisfied.  
No non-key attribute in each table depends on other non-key attributes.


---

## Final Verdict: ✅ The schema meets **3NF**

