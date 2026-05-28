# Reliability Incident Note

## Incident

A developer accidentally executed:

UPDATE submissions
SET score = 100;

without using a WHERE clause.

---

## What Happened

All submission scores in the database became 100.

This affected:
- Rankings
- Leaderboards
- Student analytics
- Performance reports

---

## Detection

The issue was identified after abnormal score increases were observed.

Audit logs and backups confirmed the accidental update.

---

## Recovery

Possible recovery methods:
- ROLLBACK if transaction not committed
- Restore from backup
- Use transaction logs

---

## Preventive Measures

1. Always use WHERE clauses
2. Run SELECT before UPDATE or DELETE
3. Use transactions
4. Maintain regular backups
5. Restrict production permissions
