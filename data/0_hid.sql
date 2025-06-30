create table "0_hid"
(
    id   integer not null constraint "0_hid_pk" primary key,
    fmt1 varchar not null constraint "0_hid_pk_2" unique,
    fmt2 varchar not null constraint "0_hid_pk_3" unique
);

INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (1, '002-15', 'HM15-2');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (2, '003-15', 'HM15-3');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (16, '017-15', 'HM15-17');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (3, '004-15', 'HM15-4');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (18, '019-15', 'HM15-19');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (12, '013-15', 'HM15-13');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (10, '011-15', 'HM15-11');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (14, '015-15', 'HM15-15');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (17, '018-15', 'HM15-18');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (4, '005-15', 'HM15-5');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (0, '001-15', 'HM15-1');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (6, '007-15', 'HM15-7');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (8, '009-15', 'HM15-9');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (13, '014-15', 'HM15-14');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (11, '012-15', 'HM15-12');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (15, '016-15', 'HM15-16');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (7, '008-15', 'HM15-8');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (9, '010-15', 'HM15-10');
INSERT INTO public."0_hid" (id, fmt1, fmt2) VALUES (5, '006-15', 'HM15-6');
