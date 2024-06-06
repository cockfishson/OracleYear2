DROP TABLE IPA_t;
CREATE TABLE IPA_t (
    One NUMBER(3,0) NOT NULL PRIMARY KEY,
    Two VARCHAR2(50)
);

INSERT INTO IPA_t (
    One,
    Two
)
VALUES
    (1, 'Pavel');

INSERT INTO IPA_t (
    One,
    Two
)
VALUES
    (2, 'Labko');

INSERT INTO IPA_t (
    One,
    Two
)
VALUES
    (3, 'Labkovich');

SELECT * FROM IPA_t

UPDATE IPA_t
SET Two = 'Labko'
WHERE One = 3;

UPDATE IPA_t
SET Two = 'Labkovich'
WHERE One = 2;
SELECT * FROM IPA_t

SELECT TWO
FROM IPA_t
WHERE ONE < 3

DELETE FROM IPA_t
WHERE One = 2;

SELECT * FROM IPA_t

ROLLBACK;

SELECT * FROM IPA_t

CREATE TABLE IPA_t_child (
    ChildID NUMBER(3,0) NOT NULL PRIMARY KEY,
    ParentID NUMBER(3,0) NOT NULL,
    ChildName VARCHAR2(50),
    FOREIGN KEY (ParentID) REFERENCES IPA_t(One)
);

INSERT INTO IPA_t_child (ChildID, ParentID, ChildName)
VALUES (101, 1, 'Child of Pavel');

INSERT INTO IPA_t_child (ChildID, ParentID, ChildName)
VALUES (102, 2, 'Child of Labko');

INSERT INTO IPA_t_child (ChildID, ParentID, ChildName)
VALUES (103, 3, 'Child of Labkovich');

SELECT * FROM IPA_t_child

---LEFT JOIN
SELECT IPA_t.One, IPA_t.Two, IPA_t_child.ChildName
FROM IPA_t
LEFT JOIN IPA_t_child ON IPA_t.One = IPA_t_child.ParentID;

---INNER
SELECT IPA_t.One, IPA_t.Two, IPA_t_child.ChildName
FROM IPA_t
INNER JOIN IPA_t_child ON IPA_t.One = IPA_t_child.ParentID;

DROP TABLE IPA_t_child;

DROP TABLE IPA_t;