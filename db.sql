{\rtf1\ansi\ansicpg1251\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red191\green100\blue38;\red32\green32\blue32;\red153\green168\blue186;
\red133\green96\blue154;\red86\green132\blue173;\red88\green118\blue71;}
{\*\expandedcolortbl;;\csgenericrgb\c74902\c39216\c14902;\csgenericrgb\c12549\c12549\c12549;\csgenericrgb\c60000\c65882\c72941;
\csgenericrgb\c52157\c37647\c60392;\csgenericrgb\c33725\c51765\c67843;\csgenericrgb\c34510\c46275\c27843;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 \cb3 SET \cf4 SQL_MODE = \cf5 "NO_AUTO_VALUE_ON_ZERO"\cf2 ;\
SET \cf4 AUTOCOMMIT = \cf6 0\cf2 ;\
START TRANSACTION;\
SET \cf4 time_zone = \cf5 "+00:00"\cf2 ;\
\
CREATE TABLE \cf4 `error`\
(\
    \cf5 `id`          \cf2 int\cf4 (\cf6 11\cf4 )                                           \cf2 NOT NULL,\
    \cf5 `short_descr` \cf2 text COLLATE \cf4 utf8_unicode_ci                      \cf2 NOT NULL,\
    \cf5 `full_descr`  \cf2 text CHARACTER SET \cf4 utf32 \cf2 COLLATE \cf4 utf32_unicode_ci \cf2 NOT NULL,\
    \cf5 `urgency`     \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci               \cf2 NOT NULL,\
    \cf5 `criticality` \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci               \cf2 NOT NULL\
\cf4 ) \cf2 ENGINE \cf4 = InnoDB\
  \cf2 DEFAULT CHARSET \cf4 = utf8\
  \cf2 COLLATE \cf4 = utf8_unicode_ci\cf2 ;\
\
INSERT INTO \cf4 `error` (\cf5 `id`\cf2 , \cf5 `short_descr`\cf2 , \cf5 `full_descr`\cf2 , \cf5 `urgency`\cf2 , \cf5 `criticality`\cf4 )\
\cf2 VALUES \cf4 (\cf6 1\cf2 , \cf7 ';nk'\cf2 , \cf7 'bnbb'\cf2 , \cf7 'sssss'\cf2 , \cf7 'nn'\cf4 )\cf2 ,\
       \cf4 (\cf6 2\cf2 , \cf7 'jkj'\cf2 , \cf7 'bbbb'\cf2 , \cf7 'ddd'\cf2 , \cf7 'nnn'\cf4 )\cf2 ,\
       \cf4 (\cf6 3\cf2 , \cf7 'klkn'\cf2 , \cf7 'nlnljf'\cf2 , \cf7 'cccc cc ccc'\cf2 , \cf7 'jjj'\cf4 )\cf2 ,\
       \cf4 (\cf6 4\cf2 , \cf7 'ddd'\cf2 , \cf7 'jwkj'\cf2 , \cf7 'cmc ccc'\cf2 , \cf7 'nn'\cf4 )\cf2 ,\
       \cf4 (\cf6 5\cf2 , \cf7 'sjxjx'\cf2 , \cf7 'wmwm'\cf2 , \cf7 'bb bb b'\cf2 , \cf7 'nn'\cf4 )\cf2 ;\
\
DELIMITER \cf4 $$\
\cf2 CREATE TRIGGER \cf4 `new_history`\
    \cf2 AFTER UPDATE\
    ON \cf4 `error`\
    \cf2 FOR EACH ROW\
BEGIN\
    INSERT INTO \cf4 `errorhistory`(\cf5 `data`\cf2 , \cf5 `status`\cf2 , \cf5 `comment`\cf2 , \cf5 `user_id`\cf2 , \cf5 `error_id`\cf4 )\
    \cf2 VALUES \cf4 (\cf7 '2023-01-02 03:04:24'\cf2 , \cf7 'b b '\cf2 , \cf7 'bbd'\cf2 , \cf7 '1'\cf2 , \cf4 NEW.\cf5 id\cf4 )\cf2 ;\
END\
\cf4 $$\
\cf2 DELIMITER ;\
\
\
CREATE TABLE \cf4 `errorhistory`\
(\
    \cf5 `id`       \cf2 int\cf4 (\cf6 11\cf4 )                             \cf2 NOT NULL,\
    \cf5 `data`     \cf2 date                                NOT NULL,\
    \cf5 `status`   \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci \cf2 NOT NULL,\
    \cf5 `comment`  \cf2 text COLLATE \cf4 utf8_unicode_ci        \cf2 NOT NULL,\
    \cf5 `user_id`  \cf2 int\cf4 (\cf6 11\cf4 )                             \cf2 NOT NULL,\
    \cf5 `error_id` \cf2 int\cf4 (\cf6 11\cf4 )                             \cf2 NOT NULL\
\cf4 ) \cf2 ENGINE \cf4 = InnoDB\
  \cf2 DEFAULT CHARSET \cf4 = utf8\
  \cf2 COLLATE \cf4 = utf8_unicode_ci\cf2 ;\
\
INSERT INTO \cf4 `errorhistory` (\cf5 `id`\cf2 , \cf5 `data`\cf2 , \cf5 `status`\cf2 , \cf5 `comment`\cf2 , \cf5 `user_id`\cf2 , \cf5 `error_id`\cf4 )\
\cf2 VALUES \cf4 (\cf6 15\cf2 , \cf7 '2023-01-02 03:04:24'\cf2 , \cf7 'nnn'\cf2 , \cf7 'bb'\cf2 , \cf6 1\cf2 , \cf6 5\cf4 )\cf2 ,\
       \cf4 (\cf6 20\cf2 , \cf7 '2023-01-02 03:04:24'\cf2 , \cf7 ' g'\cf2 , \cf7 'bb'\cf2 , \cf6 1\cf2 , \cf6 5\cf4 )\cf2 ,\
       \cf4 (\cf6 22\cf2 , \cf7 '2023-01-02 03:04:24'\cf2 , \cf7 'vv v'\cf2 , \cf7 'bb'\cf2 , \cf6 1\cf2 , \cf6 5\cf4 )\cf2 ;\
\
\
CREATE TABLE \cf4 `systemuser`\
(\
    \cf5 `id`        \cf2 int\cf4 (\cf6 11\cf4 )                             \cf2 NOT NULL,\
    \cf5 `login`     \cf2 varchar\cf4 (\cf6 15\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci \cf2 NOT NULL,\
    \cf5 `firstname` \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci \cf2 NOT NULL,\
    \cf5 `lastname`  \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci \cf2 NOT NULL,\
    \cf5 `password`  \cf2 varchar\cf4 (\cf6 25\cf4 ) \cf2 COLLATE \cf4 utf8_unicode_ci \cf2 NOT NULL\
\cf4 ) \cf2 ENGINE \cf4 = InnoDB\
  \cf2 DEFAULT CHARSET \cf4 = utf8\
  \cf2 COLLATE \cf4 = utf8_unicode_ci\cf2 ;\
\
\
\
INSERT INTO \cf4 `systemuser` (\cf5 `id`\cf2 , \cf5 `login`\cf2 , \cf5 `firstname`\cf2 , \cf5 `lastname`\cf2 , \cf5 `password`\cf4 )\
\cf2 VALUES \cf4 (\cf6 1\cf2 , \cf7 'ddd'\cf2 , \cf7 'Ksu'\cf2 , \cf7 'kk'\cf2 , \cf7 '133'\cf4 )\cf2 ,\
       \cf4 (\cf6 2\cf2 , \cf7 'fuf'\cf2 , \cf7 'Den'\cf2 , \cf7 'kkkk'\cf2 , \cf7 '111'\cf4 )\cf2 ,\
       \cf4 (\cf6 3\cf2 , \cf7 'fuf1'\cf2 , \cf7 'Grisha'\cf2 , \cf7 'jkjk'\cf2 , \cf7 '111111'\cf4 )\cf2 ,\
       \cf4 (\cf6 4\cf2 , \cf7 'fuf2'\cf2 , \cf7 'Sam'\cf2 , \cf7 'jkkk'\cf2 , \cf7 '1234'\cf4 )\cf2 ,\
       \cf4 (\cf6 5\cf2 , \cf7 'fuf3'\cf2 , \cf7 'Amm'\cf2 , \cf7 'srff'\cf2 , \cf7 '12355'\cf4 )\cf2 ,\
       \cf4 (\cf6 6\cf2 , \cf7 'fuf4'\cf2 , \cf7 'Zan'\cf2 , \cf7 'ffffff'\cf2 , \cf7 '44444'\cf4 )\cf2 ;\
\
\
ALTER TABLE \cf4 `error`\
    \cf2 ADD PRIMARY KEY \cf4 (\cf5 `id`\cf4 )\cf2 ;\
\
ALTER TABLE \cf4 `errorhistory`\
    \cf2 ADD PRIMARY KEY \cf4 (\cf5 `id`\cf4 )\cf2 ,\
    ADD KEY \cf4 `error_id` (\cf5 `error_id`\cf4 )\cf2 ,\
    ADD KEY \cf4 `user_id` (\cf5 `user_id`\cf4 )\cf2 ;\
\
\
ALTER TABLE \cf4 `systemuser`\
    \cf2 ADD PRIMARY KEY \cf4 (\cf5 `id`\cf4 )\cf2 ;\
\
ALTER TABLE \cf4 `error`\
    \cf2 MODIFY \cf5 `id` \cf2 int\cf4 (\cf6 11\cf4 ) \cf2 NOT NULL AUTO_INCREMENT,\
    AUTO_INCREMENT \cf4 = \cf6 13\cf2 ;\
\
\
ALTER TABLE \cf4 `errorhistory`\
    \cf2 MODIFY \cf5 `id` \cf2 int\cf4 (\cf6 11\cf4 ) \cf2 NOT NULL AUTO_INCREMENT,\
    AUTO_INCREMENT \cf4 = \cf6 25\cf2 ;\
\
ALTER TABLE \cf4 `systemuser`\
    \cf2 MODIFY \cf5 `id` \cf2 int\cf4 (\cf6 11\cf4 ) \cf2 NOT NULL AUTO_INCREMENT,\
    AUTO_INCREMENT \cf4 = \cf6 7\cf2 ;\
\
\
ALTER TABLE \cf4 `errorhistory`\
    \cf2 ADD CONSTRAINT \cf4 `errorhistory_ibfk_1` \cf2 FOREIGN KEY \cf4 (\cf5 `error_id`\cf4 ) \cf2 REFERENCES \cf4 `error` (\cf5 `id`\cf4 )\cf2 ,\
    ADD CONSTRAINT \cf4 `errorhistory_ibfk_2` \cf2 FOREIGN KEY \cf4 (\cf5 `user_id`\cf4 ) \cf2 REFERENCES \cf4 `systemuser` (\cf5 `id`\cf4 )\cf2 ;\
COMMIT;\
\
\
\
}