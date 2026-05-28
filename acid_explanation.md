# ACID Properties

## Atomicity
A transaction is completed fully or not executed at all.

Example:
If enrollment insertion fails, all changes are rolled back.

---

## Consistency
Database rules remain valid after every transaction.

Example:
Foreign key constraints prevent invalid enrollments.

---

## Isolation
Transactions do not interfere with each other.

Example:
Partial updates are hidden until COMMIT occurs.

---

## Durability
Committed changes remain permanently stored.

Example:
After COMMIT, inserted submissions remain saved even after restart.
