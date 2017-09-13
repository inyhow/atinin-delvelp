DROP TABLE IF EXISTS `{dbprefix}member_auth`;
DELETE FROM `{dbprefix}field` WHERE `relatedname` = 'table-member_auth';
UPDATE `{dbprefix}member_data` SET `is_auth` = 0;