/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 34.92.193.98:3350
 Source Schema         : trader

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 17/04/2022 13:27:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin_users`;
CREATE TABLE `tbl_admin_users`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `state` tinyint UNSIGNED NOT NULL COMMENT '状态',
  `last_login_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_login_ip` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '紧急制动系统用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_agent_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_agent_limit`;
CREATE TABLE `tbl_agent_limit`  (
  `id` bigint NOT NULL COMMENT '代理限额配置ID',
  `agent_id` bigint NOT NULL COMMENT '代理ID',
  `game_id` bigint NOT NULL COMMENT '游戏ID，其他游戏:0',
  `tour_lv` int NOT NULL COMMENT '联赛等级，其他联赛等级:0',
  `match_limit` bigint NOT NULL DEFAULT 0 COMMENT '赛事赔付限额',
  `all_win_loss_early` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-早盘赔付限额',
  `all_win_loss_live` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-滚球赔付限额',
  `all_handicap_early` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-早盘赔付限额',
  `all_handicap_live` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-滚球赔付限额',
  `all_over_under_early` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-早盘赔付限额',
  `all_over_under_live` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-滚球赔付限额',
  `other_early` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-早盘限额',
  `other_live` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-滚球限额',
  `champion` bigint NOT NULL DEFAULT 0 COMMENT '冠军玩法限额',
  `single_win_loss_early` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-早盘赔付限额',
  `single_win_loss_live` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-滚球赔付限额',
  `single_handicap_early` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-早盘赔付限额',
  `single_handicap_live` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-滚球赔付限额',
  `single_over_under_early` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-早盘赔付限额',
  `single_over_under_live` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-滚球赔付限额',
  `correct_map_score_early` bigint NOT NULL DEFAULT 0 COMMENT '全局地图比分-早盘赔付限额',
  `correct_map_score_live` bigint NOT NULL DEFAULT 0 COMMENT '全局地图比分-滚盘赔付限额',
  `update_at` bigint NOT NULL DEFAULT 0 COMMENT '更新时间',
  `update_id` bigint NOT NULL DEFAULT 0 COMMENT '更新人ID',
  `update_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mgt_uq`(`agent_id`, `game_id`, `tour_lv`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '新增代理单注限额配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_agent_passof_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_agent_passof_limit`;
CREATE TABLE `tbl_agent_passof_limit`  (
  `id` bigint NOT NULL COMMENT '代理串关限额配置ID',
  `agent_id` bigint NULL DEFAULT NULL COMMENT '代理ID',
  `limit2` bigint NOT NULL DEFAULT 0 COMMENT '2串1赔付限额',
  `limit3` bigint NOT NULL DEFAULT 0 COMMENT '3串1赔付限额',
  `limit4` bigint NOT NULL DEFAULT 0 COMMENT '4串1赔付限额',
  `limit5` bigint NOT NULL DEFAULT 0 COMMENT '5串1赔付限额',
  `limit6` bigint NOT NULL DEFAULT 0 COMMENT '6串1赔付限额',
  `limit7` bigint NOT NULL DEFAULT 0 COMMENT '7串1赔付限额',
  `limit8` bigint NOT NULL DEFAULT 0 COMMENT '8串1赔付限额',
  `limit9` bigint NOT NULL DEFAULT 0 COMMENT '9串1赔付限额',
  `limit10` bigint NOT NULL DEFAULT 0 COMMENT '10串1赔付限额',
  `update_at` bigint NOT NULL DEFAULT 0 COMMENT '更新时间',
  `update_id` bigint NOT NULL DEFAULT 0 COMMENT '更新人ID',
  `update_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `m_uq`(`agent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代理串注限额配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_asn_trader
-- ----------------------------
DROP TABLE IF EXISTS `tbl_asn_trader`;
CREATE TABLE `tbl_asn_trader`  (
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `user_id` bigint NOT NULL COMMENT '操盘手ID',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操盘手名',
  `flag` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '1,操盘.2,赛果录入,3,最终结算',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '分配操盘手管理员ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分配操盘手管理员名',
  `group_id` bigint NOT NULL COMMENT '用户组ID',
  `group_type` int NOT NULL DEFAULT 0 COMMENT '用户组类别',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '1=正常,2=删除',
  INDEX `match_id_flag`(`match_id`, `flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_bad_debt_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bad_debt_record`;
CREATE TABLE `tbl_bad_debt_record`  (
  `id` bigint NOT NULL COMMENT '坏账ID',
  `bet_order_id` bigint NOT NULL COMMENT '注单编号',
  `parent_merchant_id` bigint NOT NULL COMMENT '父商户ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `parent_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员账号',
  `before_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '帐变前金额',
  `after_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '帐变后金额',
  `receivable_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '应收金额',
  `received_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '已收金额',
  `uncollected_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未收金额',
  `created_time` bigint NOT NULL COMMENT '回退时间',
  `ty` int NOT NULL COMMENT '记录类型 1 坏账 2 扣回',
  `order_type` tinyint NOT NULL DEFAULT 1 COMMENT '注单类型 1普通注单 2串注注单',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `exchange_rate` double(15, 2) NOT NULL DEFAULT 1.00 COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_bet_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bet_order`;
CREATE TABLE `tbl_bet_order`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键ID',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '玩家ID',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户账号',
  `parent_merchant_id` bigint UNSIGNED NOT NULL COMMENT '父商户ID',
  `parent_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `tester` tinyint NOT NULL DEFAULT 0 COMMENT '是否测试账号(0:正常账号,1:测试账号;2:信用账户)',
  `order_type` tinyint NULL DEFAULT NULL COMMENT '注单类型 1-普通注单 2-普通串关注单 3-局内串关注单, 4-复合玩法注单',
  `parley_type` tinyint NOT NULL DEFAULT 1 COMMENT '串关类型 1普通注单 2:2串1  3:3串1 4:4串1 5:5串1 6:6串1 7:7串1 8:8串1',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `tournament_id` bigint UNSIGNED NOT NULL COMMENT '联赛ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `match_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '赛事类型 正常-1 冠军-2 大逃杀-3 篮球-4 主播盘-5 足球-6',
  `market_id` bigint UNSIGNED NOT NULL COMMENT '盘口ID',
  `market_cn_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘口中文名称',
  `team_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '队伍名称',
  `odd_id` bigint UNSIGNED NOT NULL COMMENT '投注项ID',
  `odd_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投注项名称',
  `org_odd_id` bigint NOT NULL COMMENT '玩法ID',
  `round` int NOT NULL DEFAULT -1 COMMENT '第几局',
  `odd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赔率',
  `bet_ip` bigint NOT NULL COMMENT '投注IP',
  `device` smallint NOT NULL COMMENT '设备 [1-PC  2-H5  3-Android  4-IOS]',
  `bet_amount` decimal(20, 3) NOT NULL COMMENT '注单金额',
  `win_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '派彩金额',
  `is_live` smallint NOT NULL COMMENT '赛事阶段 1-初盘 2-滚盘',
  `bet_status` tinyint NOT NULL COMMENT '注单状态 1-待确认 2-已拒绝 3-待结算 4-已取消 5-赢(已中奖) 6-输(未中奖) 7-已撤销 8-赢半 9-输半 10-走水',
  `confirm_type` tinyint NOT NULL DEFAULT 1 COMMENT '确认方式 1-自动确认 2-手动待确认 3-手动确认 4-手动拒绝',
  `bet_time` bigint UNSIGNED NOT NULL COMMENT '投注时间',
  `settle_time` int NOT NULL DEFAULT 0 COMMENT '结算时间',
  `match_start_time` int NOT NULL COMMENT '赛事开始时间',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `theory_prize` decimal(20, 3) NOT NULL COMMENT '理论奖金',
  `settle_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算次数',
  `team_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '战队id',
  `reason` tinyint UNSIGNED NOT NULL COMMENT 'x-赛事取消理由, 1xx-盘口取消理由, 201-赔率错误，202-比赛提前开始',
  `odd_discount` decimal(10, 2) NULL DEFAULT 1.00,
  `market_en_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口英文名称',
  `odd_en_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投注项英文名称',
  `team_cn_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '队伍中文名称',
  `team_en_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '队伍英文名称',
  `agent_id` bigint NOT NULL DEFAULT 0 COMMENT '直属代理ID',
  `agent_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '直属代理账号',
  `org_odd` decimal(10, 3) NOT NULL DEFAULT 1.000 COMMENT '原始赔率',
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '串关父ID',
  `parley_num` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '串关注单数量',
  `risk_tag_id` bigint NOT NULL DEFAULT 0 COMMENT '风险标签ID',
  `ty_match_sid` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '体育的赛事ID',
  `ty_order_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '体育的注单id',
  `score_benchmark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '基准分',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `exchange_rate` double(15, 2) NOT NULL DEFAULT 1.00 COMMENT '汇率',
  `settled` tinyint NOT NULL DEFAULT 1 COMMENT '是否已结算 0-否 1-是',
  `market_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口名(用户实际投注语言)',
  `hide_amount_rate` float(5, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '藏单率:0-不藏单,0.3-藏单30%,1-藏单100%',
  `batch_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '批次号',
  `round_no` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '轮次',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cidx_tbo_bt_bs_ot`(`bet_time`, `bet_status`, `order_type`) USING BTREE,
  INDEX `cidx_tbo_markid_stats`(`market_id`, `bet_status`) USING BTREE,
  INDEX `cidx_tbo_st_bs_ot`(`settle_time`, `bet_status`, `order_type`) USING BTREE,
  INDEX `idx_tbo_odd_id`(`odd_id`) USING BTREE,
  INDEX `idx_tbo_member_id`(`member_id`) USING BTREE,
  INDEX `cidx_tbo_ma`(`member_account`) USING BTREE,
  INDEX `idx_tbo_bet_ip`(`bet_ip`) USING BTREE,
  INDEX `cidx_tbo_ts_ot_bs`(`tester`, `order_type`, `bet_status`, `bet_time`) USING BTREE,
  INDEX `idx_ty_match_sid`(`ty_match_sid`) USING BTREE,
  INDEX `idx_ty_order_id`(`ty_order_id`) USING BTREE,
  INDEX `cidx_tbo_cc_ot_bt_bs`(`currency_code`, `order_type`, `bet_time`, `bet_status`) USING BTREE,
  INDEX `cidx_tbo_rti_ot`(`risk_tag_id`, `order_type`) USING BTREE,
  INDEX `idx_tbo_sd_ot_ts`(`settled`, `order_type`, `tester`) USING BTREE,
  INDEX `cidx_tbo_bt_ot_sd`(`bet_time`, `order_type`, `settled`) USING BTREE,
  INDEX `idx_tbo_mi_bt`(`match_id`, `order_type`, `settled`, `tester`) USING BTREE,
  INDEX `idx_tbo_ot_sd_ts_gi`(`order_type`, `settled`, `tester`, `game_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '注单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_common_passof_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_common_passof_limit`;
CREATE TABLE `tbl_common_passof_limit`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `limit2` decimal(12, 3) NOT NULL COMMENT '2串1限额',
  `limit3` decimal(12, 3) NOT NULL COMMENT '3串N限额',
  `limit4` decimal(12, 3) NOT NULL COMMENT '4串N限额',
  `limit5` decimal(12, 3) NOT NULL COMMENT '5串N限额',
  `limit6` decimal(12, 3) NOT NULL COMMENT '6串N限额',
  `limit7` decimal(12, 3) NOT NULL COMMENT '7串N限额',
  `limit8` decimal(12, 3) NOT NULL COMMENT '8串N限额',
  `limit9` decimal(12, 3) NOT NULL COMMENT '9串N限额',
  `limit10` decimal(12, 3) NOT NULL COMMENT '10串N限额',
  `update_at` bigint NOT NULL DEFAULT 0 COMMENT '操作时间',
  `update_id` bigint NOT NULL DEFAULT 0 COMMENT '操作人员id',
  `update_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作人员',
  `types` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据类型',
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '普通串关会员单日赔付表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_credit_agent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_credit_agent`;
CREATE TABLE `tbl_credit_agent`  (
  `id` bigint NOT NULL COMMENT '代理ID',
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '代理账号',
  `top_id` bigint NOT NULL COMMENT '顶级ID',
  `top_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '顶级代理账号',
  `parent_id` bigint NOT NULL COMMENT '上级代理ID',
  `parent_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上级代理账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '代理排序层级',
  `deph` bigint NOT NULL COMMENT '代理层深',
  `cid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'c端代理ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `initial_quota` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '初始额度',
  `used_quota` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '已使用额度',
  `limit_mode` tinyint NOT NULL DEFAULT 0 COMMENT '限额模式(0：信用，1：标准)',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '代理状态(1：开启，0：关闭)',
  `create_time` int NOT NULL COMMENT '创建时间',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '信用网代理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_currency_rate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_currency_rate`;
CREATE TABLE `tbl_currency_rate`  (
  `currency_code` int NOT NULL COMMENT '币种编码',
  `country_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '币种名称【中文】',
  `country_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '币种名称【英文】',
  `rate` double(15, 2) NOT NULL COMMENT '汇率值,固定2位小数(以人民币为基准)',
  `full_rate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '汇率值,全小数展示出来',
  `update_time` int UNSIGNED NOT NULL COMMENT '最后更新时间',
  `quick_one` bigint NOT NULL DEFAULT 0 COMMENT '快捷累加金额1',
  `quick_two` bigint NOT NULL DEFAULT 0 COMMENT '快捷累加金额2',
  `quick_three` bigint NOT NULL DEFAULT 0 COMMENT '快捷累加金额3',
  PRIMARY KEY (`currency_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '货币汇率表(以人民币为基准)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_currency_rate_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_currency_rate_log`;
CREATE TABLE `tbl_currency_rate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `country_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '币种名称【中文】',
  `country_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '币种名称【英文】',
  `rate` double(15, 2) NOT NULL COMMENT '汇率值,固定2位小数(以人民币为基准)',
  `update_time` int UNSIGNED NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_currency_code`(`currency_code`) USING BTREE COMMENT '币种编码索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4510 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '汇率更新日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_domain
-- ----------------------------
DROP TABLE IF EXISTS `tbl_domain`;
CREATE TABLE `tbl_domain`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `pc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启动域名(pc)',
  `h5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启动域名(h5)',
  `api` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '启动域名(api)',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名字',
  `update_time` int NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_domain_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_domain_menu`;
CREATE TABLE `tbl_domain_menu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain_id` int NOT NULL COMMENT '域名ID',
  `type` tinyint NOT NULL COMMENT '域名类型(1:pc,2:h5,3:api)',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '域名值',
  `update_by_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人ID',
  `update_by_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名字',
  `update_time` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_game_risk_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_game_risk_tags`;
CREATE TABLE `tbl_game_risk_tags`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `risk_tag_id` bigint UNSIGNED NOT NULL COMMENT '风险标签ID',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_tgrt_gi_rti`(`game_id`, `risk_tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游戏配置风险标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_games
-- ----------------------------
DROP TABLE IF EXISTS `tbl_games`;
CREATE TABLE `tbl_games`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '简称',
  `en_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `status` tinyint NOT NULL COMMENT '状态 开启-1关闭-0',
  `sort_code` smallint NOT NULL COMMENT '排序码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示：0=隐藏，1=显示',
  `is_open_match` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示赛事 1-是 0-否',
  `is_open_video` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示视频 1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tg_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游戏信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_games_images
-- ----------------------------
DROP TABLE IF EXISTS `tbl_games_images`;
CREATE TABLE `tbl_games_images`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `type` int NOT NULL COMMENT '图片类型(1:pc推荐位背景图,2:pc二级页面背景图,3:h5人物卡片背景图,4:h5游戏筛选背景图,5:h5二级页面背景图)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片路径',
  `game_id` bigint NOT NULL COMMENT '游戏ID',
  `sort_code` int NOT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group`  (
  `gid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `gname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `permission` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限模块ID',
  `noted` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `state` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '0:关闭1:开启',
  `types` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '分类 1-操盘 2-客服 3-运营 4-风控 5-管理员 6-研发体系 7-B端 8-商务',
  `total` smallint NOT NULL DEFAULT 0 COMMENT '人数',
  `create_by_uid` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名字',
  `en_gname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ABC' COMMENT '用户组英文名',
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `types`(`types`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_heroes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_heroes`;
CREATE TABLE `tbl_heroes`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `en_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `status` tinyint NOT NULL COMMENT '状态 开启-1关闭-0',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_th_game_id`(`game_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '英雄信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_impact_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_impact_record`;
CREATE TABLE `tbl_impact_record`  (
  `id` bigint NOT NULL COMMENT '冲正记录ID',
  `transaction_id` bigint NOT NULL COMMENT '流水单号',
  `parent_merchant_id` bigint NOT NULL COMMENT '父商户ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `parent_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员账号',
  `before_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '帐变前金额',
  `after_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '帐变后金额',
  `impact_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '冲正金额',
  `created_time` bigint NOT NULL COMMENT '转账时间',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `exchange_rate` double(15, 2) NOT NULL DEFAULT 1.00 COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_language
-- ----------------------------
DROP TABLE IF EXISTS `tbl_language`;
CREATE TABLE `tbl_language`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码（游戏|玩法...）',
  `jc` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '简称',
  `cn` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '简体中文',
  `zh` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '繁体中文',
  `en` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '英文',
  `vi` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '越南语',
  `th` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '泰语',
  `ml` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '马来语',
  `ni` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '印尼语',
  `jp` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '日语',
  `pt` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '葡萄牙语',
  `ru` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '俄罗斯语',
  `it` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '意大利语',
  `de` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '德语',
  `fr` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '法语',
  `ko` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '韩语',
  `es` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '西班牙语',
  `other` varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '其他',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51640406111119157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '多语言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_market_mix_sub
-- ----------------------------
DROP TABLE IF EXISTS `tbl_market_mix_sub`;
CREATE TABLE `tbl_market_mix_sub`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `round` int UNSIGNED NOT NULL COMMENT '第几局',
  `mix_market_id` bigint UNSIGNED NOT NULL COMMENT '复合玩法父盘口ID',
  `sub_market_id` bigint UNSIGNED NOT NULL COMMENT '复合玩法子盘口ID',
  `count` int NOT NULL DEFAULT 0 COMMENT '子盘口数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sub_market_id`(`sub_market_id`) USING BTREE,
  INDEX `idx_mix_market_id`(`mix_market_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '复合玩法盘口关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_market_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_market_monitor`;
CREATE TABLE `tbl_market_monitor`  (
  `id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏id',
  `tournament_id` bigint UNSIGNED NOT NULL COMMENT '联赛id',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事id',
  `market_id` bigint UNSIGNED NOT NULL COMMENT '盘口id',
  `odd_id` bigint NOT NULL COMMENT '投注项id',
  `type` tinyint UNSIGNED NOT NULL COMMENT '记录类型 0-暂停记录 1-预警记录',
  `status` tinyint UNSIGNED NOT NULL COMMENT '预警记录警报状态 0-预警 1-超限',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  `update_time` bigint UNSIGNED NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_market_type`(`market_id`, `type`, `odd_id`) USING BTREE,
  INDEX `cidx_tmm_martid_matchid`(`market_id`, `match_id`) USING BTREE,
  INDEX `cidx_type_status_matchid`(`type`, `status`, `match_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘口预警记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_market_odd_linkage_param
-- ----------------------------
DROP TABLE IF EXISTS `tbl_market_odd_linkage_param`;
CREATE TABLE `tbl_market_odd_linkage_param`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `match_id` bigint NOT NULL COMMENT '赛事D',
  `market_id` bigint NOT NULL COMMENT '盘口ID',
  `param_type` tinyint NOT NULL COMMENT '参数类型 1-胜率 2-区间',
  `tag` tinyint NOT NULL COMMENT '参数标签 1-区间参数 2-附加赔率 3-双倍返还率 4-固定赔率',
  `min_master_low_odd` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '主玩法低赔区间-最低',
  `max_master_low_odd` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '主玩法低赔区间-最高',
  `master_coefficient` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '主玩法变赔系数',
  `min_slave_low_odd` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '副玩法低赔区间-最低',
  `max_slave_low_odd` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '副玩法低赔区间-最高',
  `slave_coefficient` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '副玩法变赔系数',
  `slave_additional_val` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '副玩法低赔选项附加赔率值',
  `slave_option_odd` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '副玩法对应选项赔率',
  `create_time` int NOT NULL COMMENT '创建时间',
  `create_by_id` bigint NOT NULL COMMENT '创建人id',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tmolp_mch_mkt_id`(`match_id`, `market_id`) USING BTREE COMMENT '盘口赔率联动参数赛事和盘口id索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_market_result_confirm
-- ----------------------------
DROP TABLE IF EXISTS `tbl_market_result_confirm`;
CREATE TABLE `tbl_market_result_confirm`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '比赛ID',
  `market_id` bigint UNSIGNED NOT NULL COMMENT '盘口ID',
  `status` tinyint UNSIGNED NOT NULL COMMENT '结算赛果获取状态 0-失败，1-成功',
  `win_odd_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '获胜投注项ID',
  `win_odd_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '获胜投注项名称',
  `data_source` tinyint UNSIGNED NOT NULL COMMENT '数据源标识',
  `confirm_time` int UNSIGNED NOT NULL COMMENT '赛果确认时间',
  `remark` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_markets
-- ----------------------------
DROP TABLE IF EXISTS `tbl_markets`;
CREATE TABLE `tbl_markets`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `odd_type_id` bigint UNSIGNED NOT NULL COMMENT '玩法类型ID',
  `en_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '英文名称',
  `cn_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '中文名称',
  `round` smallint NOT NULL COMMENT '第几局 0-全局 1-第一局 2-第二局 ... 100-上半场',
  `option_type` tinyint NOT NULL COMMENT '玩法类型 1-输赢 2-让分 3-大小 4趣味 5-波胆 6-胜负平 7-单双 8-是否 9-复合',
  `bonus_proportion` smallint NOT NULL DEFAULT 0 COMMENT '赔付占比',
  `return_rate` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '返还率',
  `single_max_bonus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '单注最高赔付',
  `max_bonus_total` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口最高总赔付',
  `suspended` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否暂停  1-暂停 0-取消暂停',
  `visible` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示  1-显示 0-隐藏',
  `lock_return_rate` tinyint NOT NULL DEFAULT 1 COMMENT '是否锁定返还率  1-是 0-否',
  `auto_odd` tinyint NOT NULL DEFAULT 1 COMMENT '是否开启自动变赔  1-是 0-否',
  `is_reopen` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否重新开盘  1-是 0-否',
  `is_input_reject` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否录入驳回  1-是 0-否',
  `is_settle_reject` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否结算驳回  1-是 0-否',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '待录入-1 已录入-2  录入驳回-3 待审核-4 待开盘-5 已开盘-6 已关盘-7 待结算-8 已结算-9 赛果驳回-10 待取消-11 已取消-12',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `sort_code` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序码',
  `create_time` int NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  `settle_time` int NOT NULL DEFAULT 0 COMMENT '结算时间',
  `settle_count` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算次数',
  `close_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '盘口关闭时间',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否首页展示默认盘口',
  `prize_limit` bigint NOT NULL COMMENT '风控单注赔付',
  `mb_mkt_prize_limit` bigint NOT NULL COMMENT '风控会员盘口赔付',
  `mb_mch_prize_limit` bigint NOT NULL DEFAULT 0 COMMENT '会员赛事赔付',
  `warning_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '预警值',
  `stop_profit` int UNSIGNED NOT NULL COMMENT '停盘值',
  `reason` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '101-无赛果，102-赛果无法定义，103-赛制错误，104-盘口信息错误，105-平局退款，300-返还率缩减未生效',
  `prize_static_profit` int NOT NULL DEFAULT 0 COMMENT '单注限红',
  `tag` bigint NOT NULL DEFAULT 0 COMMENT '玩法标签',
  `is_preset` tinyint NOT NULL DEFAULT 0 COMMENT '是否默认勾选 0-不勾选 1勾选',
  `is_update_name` tinyint NOT NULL DEFAULT 0 COMMENT '是否可编辑投注项 1-是 0-否',
  `tag_code` int NOT NULL DEFAULT 0 COMMENT '玩法标签排序',
  `is_pass_off` tinyint NULL DEFAULT 2 COMMENT '是否串关 0-否 1-普通串关 2-局内串关',
  `mch_comp_prize_limit` bigint NOT NULL DEFAULT 0 COMMENT '普通串关单注赔付',
  `comp_sub_num` int NOT NULL DEFAULT 0 COMMENT '复合盘口子盘口数量',
  `sub_mkt_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '复合玩法盘口子盘口id',
  `default_return_rate` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '默认值-返还率',
  `sub_odd_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '复合玩法盘口子盘口选项id',
  `suspended_type` tinyint NOT NULL DEFAULT 0 COMMENT '暂停类型 1-手动 0-自动',
  `visible_type` tinyint NOT NULL DEFAULT 0 COMMENT '显示类型 1-手动 0-自动',
  `odd_range_status` tinyint NOT NULL DEFAULT 0 COMMENT '是否启用特殊抽水:1-启用 0-禁用',
  `odd_linkage` tinyint NOT NULL DEFAULT 0 COMMENT '是否开启赔率联动 1-启用 0-禁用',
  `score_benchmark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '基准比分',
  `norm_return_rate` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '标准返回率',
  `detail_type` tinyint NOT NULL DEFAULT 0 COMMENT '详情页玩法分类 0-普通玩法,1-热门玩法,2-特别玩法,3-复合玩法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cidx_tm_matid_st`(`match_id`, `status`) USING BTREE,
  INDEX `cidx_tm_setcnt_upt`(`settle_count`, `update_time`) USING BTREE,
  INDEX `cidx_tm_matid_round`(`match_id`, `round`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘口信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_champ_teams
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_champ_teams`;
CREATE TABLE `tbl_match_champ_teams`  (
  `id` bigint NOT NULL,
  `match_id` bigint NOT NULL COMMENT '赛事id',
  `team_id` bigint NOT NULL COMMENT '战队id',
  `team_en_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '战队英文名称',
  `team_cn_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '战队中文名称',
  `create_time` int NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by_id` bigint NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `sort_id` int NOT NULL DEFAULT 0 COMMENT '排序码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '冠军赛战队表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_level
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_level`;
CREATE TABLE `tbl_match_level`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` smallint UNSIGNED NOT NULL COMMENT '等级',
  `prize_limit` int NOT NULL COMMENT '单注赔付默认值',
  `max_prize_limit` int NOT NULL COMMENT '单注赔付最大值',
  `mb_mkt_prize_limit` int NOT NULL COMMENT '会员盘口赔付默认值',
  `max_mb_mkt_prize_limit` int NOT NULL COMMENT '会员盘口赔付最大值',
  `mb_mch_prize_limit` int NOT NULL COMMENT '会员赛事赔付',
  `return_rate` decimal(10, 3) NOT NULL COMMENT '返还率',
  `status` tinyint NOT NULL COMMENT '启用状态(0-关闭, 1-开启)',
  `op_time` int NOT NULL COMMENT '操作时间',
  `op_by_id` bigint UNSIGNED NOT NULL COMMENT '操作人员id',
  `op_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人员名称',
  `warning_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '预警值',
  `max_warning_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '预警值最大值',
  `stop_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '停盘值',
  `max_stop_profit` int UNSIGNED NOT NULL COMMENT '停盘值最大值',
  `rnd_comp_prize_limit` int NOT NULL DEFAULT 0 COMMENT '单局串关单注赔付',
  `rnd_comp_mch_prize_limit` int NOT NULL DEFAULT 0 COMMENT '单局串关赛事赔付',
  `rnd_comp_odd_dscnt` decimal(10, 3) NOT NULL DEFAULT 100.000 COMMENT '单局串关赔率折扣',
  `prize_static_profit` int NOT NULL DEFAULT 0 COMMENT '单注限红默认值',
  `max_prize_static_profit` int NOT NULL DEFAULT 0 COMMENT '单注限红最大值',
  `mb_mch_max_prize_limit` int NOT NULL COMMENT '会员赛事最大赔付',
  `rnd_comp_max_prize_limit` int NOT NULL COMMENT '单局串关单注最大赔付',
  `rnd_comp_mch_max_prize_limit` int NOT NULL COMMENT '单局串关赛事最大赔付',
  `credit_level` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级:0=其他等级信用联赛,1=一级信用联赛,2=二级信用联赛,...',
  `mchs_comp_prize_limit` int NOT NULL DEFAULT 0 COMMENT '普通串关单注赔付默认值',
  `mchs_comp_max_prize_limit` int NOT NULL DEFAULT 0 COMMENT '普通串关单注赔付最大值',
  `level_remark` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赛事等级备注',
  `sort_code` smallint UNSIGNED NOT NULL COMMENT '序号',
  `mix_stop_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法停盘值',
  `mix_max_stop_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法停盘最大值',
  `mix_warning_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法预警值',
  `mix_max_warning_profit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法预警最大值',
  `mix_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法单注赔付',
  `mix_max_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法单注赔付最大值',
  `mix_mch_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法赛事赔付',
  `mix_mch_max_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法赛事赔付最大值',
  `mix_odd_dscnt` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '复合玩法返还率',
  `mb_mch_comp_max_prize_limit` int NOT NULL DEFAULT 0 COMMENT '会员赛事普通串关赔付',
  `mchs_comp_prize_total_limit` int NOT NULL DEFAULT 0 COMMENT '普通串关最高赛事赔付默认值',
  `mchs_comp_prize_max_total_limit` int NOT NULL DEFAULT 0 COMMENT '普通串关最高赛事赔付最大值',
  `mch_mix_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '复合玩法赛事总赔付',
  `mch_rnd_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '局内串关赛事总赔付',
  `mch_mkt_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员盘口总赔付',
  `mch_prize_limit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事总赔付',
  PRIMARY KEY (`level`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `idx_tm_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风控赛事等级设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_notes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_notes`;
CREATE TABLE `tbl_match_notes`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '注意内容',
  `created_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `created_uid` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `created_at` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tmn_match_id`(`match_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '赛事注意事项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_related
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_related`;
CREATE TABLE `tbl_match_related`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键，ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '比赛ID',
  `source_match_id` bigint UNSIGNED NOT NULL COMMENT '数据源比赛ID',
  `tournament_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据源联赛名',
  `match_team` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据源比赛战队，英文逗号分隔',
  `diff_sorted` tinyint NOT NULL COMMENT '数据源战队主客顺序是否一致 0-不一致 1-一致',
  `start_time` int UNSIGNED NOT NULL COMMENT '数据源比赛开始时间',
  `data_source` tinyint UNSIGNED NOT NULL COMMENT '数据源 1-abios,2-odds',
  `create_at` int NOT NULL COMMENT '关联关系创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '关联关系创建用户ID',
  `create_by_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联关系创建用户名',
  `update_at` int NOT NULL COMMENT '修改关联关系时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改关联关系用户ID',
  `update_by_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改关联关系用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_risk_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_risk_tags`;
CREATE TABLE `tbl_match_risk_tags`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `risk_tag_id` bigint NOT NULL COMMENT '风险标签ID',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '赛事游戏的风险标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_round_images
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_round_images`;
CREATE TABLE `tbl_match_round_images`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `match_id` bigint NOT NULL DEFAULT 0 COMMENT '赛事ID',
  `round` int NOT NULL DEFAULT 0 COMMENT '第几局',
  `images` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片描述',
  `sort_code` int NOT NULL DEFAULT 0 COMMENT '图片排序码',
  `create_by_id` bigint NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` int NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_by_id` bigint NOT NULL DEFAULT 0 COMMENT '修改人ID',
  `update_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '修改时间',
  `l_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '多语言code',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `match_id`(`match_id`) USING BTREE,
  INDEX `match_round_id`(`match_id`, `round`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主播盘单局图片记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_round_time
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_round_time`;
CREATE TABLE `tbl_match_round_time`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `match_id` bigint NOT NULL DEFAULT 0 COMMENT '赛事ID',
  `round` int NOT NULL DEFAULT 0 COMMENT '第几局',
  `start_time` int NOT NULL DEFAULT 0 COMMENT '开始时间',
  `create_by_id` bigint NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` int NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_by_id` bigint NOT NULL DEFAULT 0 COMMENT '修改人ID',
  `update_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `match_round_id`(`match_id`, `round`) USING BTREE,
  INDEX `match_id`(`match_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主播盘单局开始时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_match_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match_score`;
CREATE TABLE `tbl_match_score`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '编号',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `match_team` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛战队',
  `round` int NOT NULL COMMENT '所属局数',
  `winner_team` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '获胜战队',
  `create_time` int NOT NULL COMMENT '创建时间',
  `create_by_id` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0:0' COMMENT '比分',
  `result` tinyint NOT NULL DEFAULT 1 COMMENT '是否有赛果 0 无赛果 1 有赛果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `match_id_index`(`match_id`) USING BTREE,
  INDEX `match_id_round_index`(`match_id`, `round`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_matches
-- ----------------------------
DROP TABLE IF EXISTS `tbl_matches`;
CREATE TABLE `tbl_matches`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `tournament_id` bigint UNSIGNED NOT NULL COMMENT '联赛ID',
  `tournament_short_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛简称',
  `tournament_cn_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛中文名',
  `match_team` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '战队信息',
  `category` tinyint UNSIGNED NOT NULL COMMENT '赛事类型 正常-1 冠军-2 大逃杀-3 体育-4 主播盘-5 足球-6',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `bo` smallint NOT NULL COMMENT '赛制 无:-1 全局:0 B01:1 B02:2 B03:3 ...',
  `start_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `auto_closed_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '自动关盘时间',
  `user_video_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '直播源地址',
  `admin_video_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操盘直播源',
  `match_level` smallint UNSIGNED NOT NULL COMMENT '赛事等级 1-M1 2-M2 3-M3 4-M4 ... 9999 M9999',
  `status` tinyint UNSIGNED NOT NULL COMMENT '待录入-1 待审核-2 已驳回-3 待开盘-4 已开盘-5 已关盘-6 已结算-7 待取消-8 比赛取消-9',
  `is_live` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '赛事阶段 1-初盘 2-滚盘',
  `live_support` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否滚球 1-是 0-否',
  `is_pass_off` tinyint NULL DEFAULT NULL COMMENT '是否串关 0-否 1-普通串关 2-局内串关',
  `suspended` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否暂停  1-暂停 0-非暂停',
  `visible` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示  1-显示 0-隐藏',
  `bet_delay_time` smallint UNSIGNED NOT NULL DEFAULT 10 COMMENT '注单确认时间',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人ID',
  `update_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  `close_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事关闭时间',
  `score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0:0' COMMENT '赛事比分',
  `rec` tinyint NOT NULL DEFAULT 0 COMMENT '推荐序号',
  `team_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '战队id',
  `reason` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '1-赛事取消，2-赛事延时， 3-联赛名称错误，4-队伍名称错误，5-队伍弃权，6-比赛判负',
  `rnd_comp_prize_limit` int NOT NULL DEFAULT 0 COMMENT '单局串关单注赔付',
  `rnd_comp_mch_prize_limit` int NOT NULL DEFAULT 0 COMMENT '单局串关赛事赔付',
  `rnd_comp_odd_dscnt` decimal(10, 3) NOT NULL DEFAULT 100.000 COMMENT '局内串关返还率',
  `mb_mch_prize_limit` int NOT NULL COMMENT '会员赛事赔付',
  `match_cn_team` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '战队中文名',
  `match_en_team` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '战队英文名',
  `video_type` tinyint NOT NULL COMMENT '视频类型1-国内直播源 2-转播直播源 ',
  `video_label` tinyint NOT NULL COMMENT '视频标签1.虎牙 2.斗鱼3.腾讯',
  `credit_level` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级:0=其他等级信用联赛,1=一级信用联赛,2=二级信用联赛,...',
  `rate_limit` int NOT NULL DEFAULT 1 COMMENT '限红比例',
  `rate_reduce` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '返还率缩减',
  `mix_mch_prize_limit` int NOT NULL DEFAULT 0 COMMENT '复合玩法赛事赔付',
  `mix_odd_dscnt` decimal(10, 3) NOT NULL COMMENT '复合玩法返还率',
  `mchs_comp_prize_total_limit` int NOT NULL DEFAULT 0 COMMENT '普通串关最高赛事赔付',
  `sid` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '标准赛事ID',
  `data_src` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据源:0-无,1-TY',
  `mode` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '操盘模式:0-手动操盘,1-MTS',
  `is_open_match` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '游戏层面是否显示赛事 1-是 0-否',
  `is_open_video` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '游戏层面是否显示视频 1-是 0-否',
  `is_test` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否测试赛事 1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_live_index`(`is_live`) USING BTREE,
  INDEX `start_time_index`(`start_time`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `idx_tm_game_id`(`game_id`) USING BTREE,
  INDEX `rec_index`(`rec`) USING BTREE,
  INDEX `idx_tm_sid`(`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '赛事信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member`  (
  `uid` bigint NOT NULL,
  `parent_merchant_id` bigint NOT NULL COMMENT '父商户ID',
  `parent_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父商户名称',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `register_time` bigint NOT NULL COMMENT '注册时间',
  `last_login_time` bigint NOT NULL COMMENT '最后一次登录时间',
  `last_login_ip` bigint NOT NULL COMMENT '上次登录ip',
  `status` tinyint NOT NULL COMMENT '会员状态(1:正常,2资金冻结,3:限制登录,4:只可资金转出)',
  `tester` tinyint NOT NULL COMMENT '是否测试账号(0:正常账号,1:测试账号,2:信用账户)',
  `limit_status` tinyint NULL DEFAULT 0 COMMENT '会员限红开关 1 开启 0未开启/关闭',
  `online_status` tinyint NOT NULL DEFAULT 0 COMMENT '在线状态',
  `odd_update_type` tinyint NOT NULL DEFAULT 1 COMMENT '1 自动接受最新赔率 2自动接受更高赔率 3永不接受最新赔率',
  `agent_id` bigint NOT NULL DEFAULT 0 COMMENT '直属代理ID',
  `agent_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '直属代理账号',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  PRIMARY KEY (`uid`, `merchant_id`) USING BTREE,
  UNIQUE INDEX `merchant_id`(`merchant_id`, `account`) USING BTREE,
  INDEX `idx_tm_account`(`account`) USING BTREE,
  INDEX `idx_tm_parent_merchant_id`(`parent_merchant_id`) USING BTREE,
  INDEX `sort_level`(`sort_level`) USING BTREE,
  INDEX `tbl_member_last_login_time`(`last_login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_agent_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_agent_limit`;
CREATE TABLE `tbl_member_agent_limit`  (
  `id` bigint NOT NULL COMMENT '商户(代理)限额配置ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `game_id` bigint NOT NULL COMMENT '游戏ID，其他游戏:0',
  `tour_lv` int NOT NULL COMMENT '联赛等级，其他联赛等级:0',
  `match_limit` bigint NOT NULL DEFAULT 0 COMMENT '赛事赔付限额',
  `all_win_loss_early` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-早盘赔付限额',
  `all_win_loss_live` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-滚球赔付限额',
  `all_handicap_early` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-早盘赔付限额',
  `all_handicap_live` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-滚球赔付限额',
  `all_over_under_early` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-早盘赔付限额',
  `all_over_under_live` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-滚球赔付限额',
  `other_early` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-早盘限额',
  `other_live` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-滚球限额',
  `champion` bigint NOT NULL DEFAULT 0 COMMENT '冠军玩法限额',
  `single_win_loss_early` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-早盘赔付限额',
  `single_win_loss_live` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-滚球赔付限额',
  `single_handicap_early` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-早盘赔付限额',
  `single_handicap_live` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-滚球赔付限额',
  `single_over_under_early` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-早盘赔付限额',
  `single_over_under_live` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-滚球赔付限额',
  `correct_map_score_early` bigint NOT NULL DEFAULT 0 COMMENT '全局地图正确比分-早盘赔付限额',
  `correct_map_score_live` bigint NOT NULL DEFAULT 0 COMMENT '全局地图正确比分-滚盘赔付限额',
  `bet_all_win_loss_early_max` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-早盘-单注最大投注额',
  `bet_single_win_loss_early_max` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-早盘-单注最大投注额',
  `bet_all_win_loss_live_max` bigint NOT NULL DEFAULT 0 COMMENT '全局输赢-滚球-单注最大投注额',
  `bet_single_win_loss_live_max` bigint NOT NULL DEFAULT 0 COMMENT '单局输赢-滚球-单注最大投注额',
  `bet_all_handicap_early_max` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-早盘-单注最大投注额',
  `bet_single_handicap_early_max` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-早盘-单注最大投注额',
  `bet_all_handicap_live_max` bigint NOT NULL DEFAULT 0 COMMENT '全局让分-滚盘-单注最大投注额',
  `bet_single_handicap_live_max` bigint NOT NULL DEFAULT 0 COMMENT '单局让分-滚盘-单注最大投注额',
  `bet_all_over_under_early_max` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-早盘-单注最大投注额',
  `bet_single_over_under_early_max` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-早盘-单注最大投注额',
  `bet_all_over_under_live_max` bigint NOT NULL DEFAULT 0 COMMENT '全局大小-滚盘-单注最大投注额',
  `bet_single_over_under_live_max` bigint NOT NULL DEFAULT 0 COMMENT '单局大小-滚盘-单注最大投注额',
  `bet_correct_map_score_early_max` bigint NOT NULL DEFAULT 0 COMMENT '全局地图正确比分-早盘-单注最大投注额',
  `bet_correct_map_score_live_max` bigint NOT NULL DEFAULT 0 COMMENT '全局地图正确比分-滚盘-单注最大投注额',
  `bet_other_early_max` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-早盘-单注最大投注额',
  `bet_other_live_max` bigint NOT NULL DEFAULT 0 COMMENT '其他玩法-滚球-单注最大投注额',
  `bet_champion_max` bigint NOT NULL DEFAULT 0 COMMENT '冠军玩法-单注最大投注额',
  `update_at` bigint NOT NULL DEFAULT 0 COMMENT '更新时间',
  `update_id` bigint NOT NULL DEFAULT 0 COMMENT '更新人ID',
  `update_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mgt_uq`(`member_id`, `game_id`, `tour_lv`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员单注限额配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_balance
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_balance`;
CREATE TABLE `tbl_member_balance`  (
  `uid` bigint UNSIGNED NOT NULL COMMENT '主键ID',
  `balance` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '余额',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员余额表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_limit`;
CREATE TABLE `tbl_member_limit`  (
  `uid` bigint UNSIGNED NOT NULL COMMENT '会员id',
  `simple` int NOT NULL COMMENT '会员单注赔付',
  `complex` int NOT NULL COMMENT '会员串注赔付',
  `league` int NOT NULL COMMENT '会员赛事赔付',
  `handicap` int NOT NULL COMMENT '会员盘口赔付',
  `simple_limit` int NOT NULL COMMENT '会员单注限红',
  `limit_status` tinyint NOT NULL DEFAULT 0 COMMENT '会员限红开关 1 开启 0未开启/关闭',
  `update_time` int NOT NULL COMMENT '修改时间',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `mch_comp` int NOT NULL COMMENT '普通串关单注赔付',
  `rnd_comp` int NOT NULL COMMENT '局内串关单注赔付',
  `rnd_comp_mch` int NOT NULL COMMENT '局内串关赛事赔付',
  `mix_mch` int NOT NULL COMMENT '复合玩法赛事赔付',
  `member_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `parent_merchant_id` bigint NOT NULL COMMENT '父商户ID',
  `parent_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户账号',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `tester` tinyint NOT NULL DEFAULT 0 COMMENT '是否测试账号(0:正常账号,1:测试账号,2:信用账户)',
  `mch_comp_limit` int NOT NULL COMMENT '普通串关赛事赔付',
  `limit2` int NOT NULL COMMENT '2串1投注赔付限额',
  `limit3` int NOT NULL COMMENT '3串N投注赔付限额',
  `limit4` int NOT NULL COMMENT '4串N投注赔付限额',
  `limit5` int NOT NULL COMMENT '5串N投注赔付限额',
  `limit6` int NOT NULL COMMENT '6串N投注赔付限额',
  `limit7` int NOT NULL COMMENT '7串N投注赔付限额',
  `limit8` int NOT NULL COMMENT '8串N投注赔付限额',
  `limit9` int NOT NULL COMMENT '9串N投注赔付限额',
  `limit10` int NOT NULL COMMENT '10串N投注赔付限额',
  `single_prize_max` int NOT NULL DEFAULT -1 COMMENT '会员单单日注最大赔付金额',
  `comp_prize_max` int NOT NULL DEFAULT -1 COMMENT '会员单日串注最大赔付金额',
  `win_max` int NULL DEFAULT -1 COMMENT '会员单日最大派彩金额',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_member_limit_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_limit_history`;
CREATE TABLE `tbl_member_limit_history`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `uid` bigint UNSIGNED NOT NULL COMMENT '会员id',
  `operation_results` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作结果',
  `update_time` int NOT NULL COMMENT '修改时间',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员限红-历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_login_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_login_record`;
CREATE TABLE `tbl_member_login_record`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `top_merchant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '顶层商户ID',
  `top_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `parent_merchant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父商户ID',
  `parent_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户名称',
  `merchant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID',
  `merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户名称',
  `uid` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `ip` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'IP',
  `ua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登陆UA',
  `time` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '登陆时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_key`(`uid`, `ip`) USING BTREE COMMENT '联合索引,唯一',
  INDEX `idx_tmlr_ip`(`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'IP记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_order_total
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_order_total`;
CREATE TABLE `tbl_member_order_total`  (
  `id` bigint NOT NULL COMMENT 'ID',
  `member_id` bigint NOT NULL DEFAULT 0 COMMENT '会员ID',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `undo_single_num` bigint NOT NULL DEFAULT 0 COMMENT '已撤销单注数量',
  `undo_single_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '已撤销单注投注金额',
  `refused_single_num` bigint NOT NULL DEFAULT 0 COMMENT '已拒绝单注数量',
  `refused_single_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '已拒绝单注投注金额',
  `cancelled_single_num` bigint NOT NULL DEFAULT 0 COMMENT '已取消单注数量',
  `cancelled_single_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '已取消单注投注金额',
  `order_single_num` bigint NOT NULL DEFAULT 0 COMMENT '未中奖/已中奖单注数量',
  `order_single_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖单注投注金额',
  `order_single_win_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖单注盈利金额',
  `order_comp_num` bigint NOT NULL DEFAULT 0 COMMENT '未中奖/已中奖串注数量',
  `order_comp_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖串注投注金额',
  `order_comp_win_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖串注盈利金额',
  `order_rnd_num` bigint NOT NULL DEFAULT 0 COMMENT '未中奖/已中奖局内串注数量',
  `order_rnd_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖局内串注投注金额',
  `order_rnd_win_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖局内串注盈利金额',
  `order_mix_num` bigint NOT NULL DEFAULT 0 COMMENT '未中奖/已中奖复合串注数量',
  `order_mix_bet_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖复合串注投注金额',
  `order_mix_win_amount` decimal(20, 3) NOT NULL DEFAULT 0.000 COMMENT '未中奖/已中奖复合串注盈利金额',
  `total_time` bigint UNSIGNED NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `m_uq`(`member_id`, `total_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员注单统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_passof_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_passof_limit`;
CREATE TABLE `tbl_member_passof_limit`  (
  `id` bigint NOT NULL COMMENT '代理串关限额配置ID',
  `member_id` bigint NOT NULL DEFAULT 0 COMMENT '代理ID',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '代理ID',
  `limit2` bigint NOT NULL DEFAULT 0 COMMENT '2串1赔付限额',
  `limit3` bigint NOT NULL DEFAULT 0 COMMENT '3串1赔付限额',
  `limit4` bigint NOT NULL DEFAULT 0 COMMENT '4串1赔付限额',
  `limit5` bigint NOT NULL DEFAULT 0 COMMENT '5串1赔付限额',
  `limit6` bigint NOT NULL DEFAULT 0 COMMENT '6串1赔付限额',
  `limit7` bigint NOT NULL DEFAULT 0 COMMENT '7串1赔付限额',
  `limit8` bigint NOT NULL DEFAULT 0 COMMENT '8串1赔付限额',
  `limit9` bigint NOT NULL DEFAULT 0 COMMENT '9串1赔付限额',
  `limit10` bigint NOT NULL DEFAULT 0 COMMENT '10串1赔付限额',
  `update_at` bigint NOT NULL DEFAULT 0 COMMENT '更新时间',
  `update_id` bigint NOT NULL DEFAULT 0 COMMENT '更新人ID',
  `update_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `m_uq`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代理串注限额配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_risk_level
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_risk_level`;
CREATE TABLE `tbl_member_risk_level`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `risk_level` smallint NOT NULL DEFAULT 0 COMMENT '会员等级整数为会员等级 0为正常 负数为风险等级',
  `bet_win_limit` int NOT NULL DEFAULT 10000 COMMENT '单注限红',
  `bet_win_limit_rate` decimal(6, 3) NOT NULL COMMENT '单注限红百分比',
  `bet_limit` int NOT NULL DEFAULT 10000 COMMENT '单注限额',
  `bet_limit_rate` decimal(6, 3) NOT NULL COMMENT '单注限额百分比',
  `mkt_win_limit` int NOT NULL DEFAULT 10000 COMMENT '会员盘口限红',
  `mkt_win_limit_rate` decimal(6, 3) NOT NULL COMMENT '会员盘口限红百分比',
  `mch_win_limit` int NOT NULL DEFAULT 10000 COMMENT '会员赛事限红',
  `mch_win_limit_rate` decimal(6, 3) NOT NULL COMMENT '会员赛事限红百分比',
  `parley_win_limit` int NOT NULL DEFAULT 10000 COMMENT '串关最高赔付',
  `parley_win_limit_rate` decimal(6, 3) NOT NULL COMMENT '串关最高赔付百分比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member_transaction
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_transaction`;
CREATE TABLE `tbl_member_transaction`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键ID',
  `bet_order_id` bigint UNSIGNED NOT NULL COMMENT '注单ID',
  `order_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号(商户转账流水号或注单ID)',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员ID',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户ID',
  `parent_merchant_id` bigint UNSIGNED NOT NULL COMMENT '父商户id',
  `parent_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户账号',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `trade_type` smallint NOT NULL COMMENT '1-资金转入 2-资金转出 3-投注 4-派奖 5-取消注单 6-拒绝注单 7-撤销注单 8-赛果回退 9-投注失败 10-走水退款 11-输半退款 12-活动奖励',
  `amount` decimal(20, 3) NOT NULL COMMENT '账变金额',
  `balance_before` decimal(20, 3) NOT NULL COMMENT '账变前的余额',
  `balance_after` decimal(20, 3) NOT NULL COMMENT '账变后的余额',
  `created_time` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `tester` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否测试账号(0:正常账号,1:测试账号,2:信用账户)',
  `agent_id` bigint NOT NULL DEFAULT 0 COMMENT '直属代理ID',
  `agent_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '直属代理账号',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `exchange_rate` double(15, 2) NOT NULL DEFAULT 1.00 COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tmt_member_id`(`member_id`) USING BTREE,
  INDEX `idx_tmt_ct_sl`(`created_time`, `sort_level`) USING BTREE,
  INDEX `tbl_member_transaction_sort_level_index`(`sort_level`) USING BTREE,
  INDEX `tbl_member_transaction_deph_index`(`deph`) USING BTREE,
  INDEX `idx_tmt_order_no`(`order_no`) USING BTREE,
  INDEX `idx_tmt_member_account`(`member_account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '账变表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant`;
CREATE TABLE `tbl_merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户ID',
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `top_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父商户id',
  `parent_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `transfer_type` tinyint(1) NOT NULL COMMENT '转账方式 （1：免转，0：非免转）',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '商户状态(1：开启，0：关闭)',
  `bet_rate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算固定费率',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `rate_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '结算备注',
  `rate_cycle` tinyint(1) NOT NULL DEFAULT 1 COMMENT '结算周期(1:月度)',
  `rate_day` int NOT NULL DEFAULT 10 COMMENT '结算日（默认每月10号）',
  `rate_pattern` tinyint(1) NOT NULL DEFAULT 1 COMMENT '结算模式(1:固定,2阶梯)',
  `rate_way` tinyint(1) NOT NULL COMMENT '结算方式(1:盈亏占比,2:投注额占比)',
  `secret_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '秘钥',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户密码',
  `m_type` tinyint NOT NULL DEFAULT 0 COMMENT '商户类型(0：普通，1：信用)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tm_parent_id`(`parent_id`) USING BTREE,
  INDEX `sort_level`(`sort_level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154747387347232112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant_bill
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant_bill`;
CREATE TABLE `tbl_merchant_bill`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '账单ID',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `rate_cycle` tinyint NOT NULL COMMENT '结算周期(1:月度)',
  `rate_day` int NOT NULL DEFAULT 10 COMMENT '结算日(默认每月10号)',
  `rate_pattern` tinyint NOT NULL COMMENT '结算模式(1:固定,2阶梯)',
  `rate_way` tinyint NOT NULL COMMENT '结算方式(1:盈亏占比,2:投注额占比)',
  `period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '周期。如：2020-04(按月份)',
  `payable` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '应付金额，如：41000.00',
  `payment` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '实付金额，如：41000.00',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '结算状态。0-未结算 1-记账 2-已结算',
  `create_time` int NOT NULL DEFAULT 0 COMMENT '创建时间戳',
  `settle_time` int NOT NULL DEFAULT 0 COMMENT '结算时间戳',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '更新时间戳',
  `detail` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账单详情，序列化后的json字符串',
  `op_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人',
  `op_time` int NOT NULL COMMENT '操作时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `merchant_id`) USING BTREE,
  UNIQUE INDEX `merchant_id`(`merchant_id`, `period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant_filter_game
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant_filter_game`;
CREATE TABLE `tbl_merchant_filter_game`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户id',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `merchant_game`(`merchant_id`, `game_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户过滤游戏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant_info`;
CREATE TABLE `tbl_merchant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户ID',
  `number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称',
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户密码',
  `transfer_type` tinyint(1) NOT NULL COMMENT '转账方式 （1：免转，0：非免转）',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL COMMENT '商户状态(1：开启，0：关闭)',
  `bet_rate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结算固定费率',
  `merchant_api` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户API地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `rate_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '结算备注',
  `rate_cycle` tinyint(1) NOT NULL DEFAULT 1 COMMENT '结算周期(1:月度)',
  `rate_day` int NOT NULL DEFAULT 10 COMMENT '结算日（默认每月10号）',
  `rate_pattern` tinyint(1) NOT NULL DEFAULT 1 COMMENT '结算模式(1:固定,2阶梯)',
  `rate_way` tinyint(1) NOT NULL COMMENT '结算方式(1:盈亏占比,2:投注额占比)',
  `secret_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13092723281483600 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant_lang
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant_lang`;
CREATE TABLE `tbl_merchant_lang`  (
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `lang` tinyint NOT NULL DEFAULT 0 COMMENT '语言类型(0：简体中文，1：繁体中文，2：英文)',
  PRIMARY KEY (`merchant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户默认语言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_merchant_rate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_merchant_rate`;
CREATE TABLE `tbl_merchant_rate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID(父商户)',
  `rate_type` tinyint(1) NOT NULL COMMENT '费用类型(1:佣金比例,2:其他费用)',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '费用标题(其他费用)',
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '费用金额(其他费用)',
  `start_money` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始金额',
  `end_money` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束金额(不填代表正无穷)',
  `bet_rate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '佣金比例(0~100)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 463 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_notice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notice`;
CREATE TABLE `tbl_notice`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '公告标题-简体中文',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '公告内容-简体中文',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '1待发送，2已驳回, 3已发送, 4已撤回',
  `send_time` int UNSIGNED NULL DEFAULT NULL COMMENT '发送时间',
  `update_time` int UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `operation_by_id` bigint NOT NULL COMMENT '操作账号ID',
  `operation_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作账号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '0不删除，1删除',
  `game_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `top` tinyint NOT NULL DEFAULT 0 COMMENT '是否置顶:0=否,1=是',
  `sid` bigint NOT NULL DEFAULT 0 COMMENT '体育id',
  `lang` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '语言 1-简体中文\n2-繁体中文 3-英语 4-越南语 5-泰语 6-马来语 7-印尼语 8-日语 9-葡萄牙语\n10-俄罗斯语 11-意大利语 12-德语 13-法语 14-韩语 15-西班牙语 16-其他',
  `group_time` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '公告组创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1592978466938259705 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_composite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_composite`;
CREATE TABLE `tbl_odd_composite`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `en_name` varchar(1300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(1300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `sub_odds` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '子玩法ID列表',
  `sub_total` smallint NOT NULL COMMENT '选项数量',
  `sort_code` smallint NOT NULL COMMENT '排序码',
  `create_at` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_id` bigint NOT NULL COMMENT '创建人ID',
  `create_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_at` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_toc_game_id`(`game_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '复合玩法表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_composite_sub
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_composite_sub`;
CREATE TABLE `tbl_odd_composite_sub`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `odd_type_id` bigint UNSIGNED NOT NULL COMMENT '子玩法ID',
  `odd_composite_id` bigint UNSIGNED NOT NULL COMMENT '复合玩法ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_toc_odd_composite_id`(`odd_composite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '复合玩法子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_label
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_label`;
CREATE TABLE `tbl_odd_label`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '标签id',
  `code` smallint NOT NULL COMMENT '序号',
  `category` tinyint NOT NULL COMMENT '玩法类型 全局-1 单场-2 篮球上半场-3 冠军-4',
  `en_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `status` tinyint NOT NULL COMMENT '状态 开启-1关闭-0',
  `game_ids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适配游戏ids',
  `game_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适配游戏名',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示：0=隐藏，1=显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '玩法标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_linkage_program
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_linkage_program`;
CREATE TABLE `tbl_odd_linkage_program`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '赔率联动方案id',
  `program_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方案名称',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏id',
  `game_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游戏简称',
  `match_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赛事等级',
  `rule` tinyint NOT NULL DEFAULT 1 COMMENT '规则：1-主从 2-固定',
  `master_odd_type_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '主玩法id',
  `odd_type_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '副玩法id',
  `param_type` tinyint NOT NULL COMMENT '参数类型 1-胜率 2-区间',
  `create_time` int NOT NULL COMMENT '创建时间',
  `create_by_id` bigint NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `match_id` bigint NOT NULL DEFAULT 0 COMMENT '赛事ID',
  `market_id` bigint NOT NULL DEFAULT 0 COMMENT '盘口ID',
  `round` smallint NULL DEFAULT 0 COMMENT '第几局 0-全局 1-第一局 2-第二局 ... 100-上半场',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_game_program_name`(`game_id`, `program_name`) USING BTREE,
  INDEX `idx_game_otid`(`game_id`, `odd_type_id`) USING BTREE,
  INDEX `idx_mch_mkt_id`(`match_id`, `market_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_linkage_program_param
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_linkage_program_param`;
CREATE TABLE `tbl_odd_linkage_program_param`  (
  `id` bigint NOT NULL COMMENT 'id',
  `program_id` bigint NOT NULL COMMENT '赔率联动方案id',
  `tag` int UNSIGNED NOT NULL COMMENT '参数标签 1-区间参数 2-附加赔率 3-双倍返还率 4-固定赔率',
  `master_coefficient` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '主玩法变赔系数',
  `min_master_low_odd` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '主玩法低赔区间-最低',
  `max_master_low_odd` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '主玩法低赔区间-最高',
  `slave_coefficient` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '副玩法变赔系数',
  `min_slave_low_odd` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '副玩法低赔区间-最低',
  `max_slave_low_odd` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '副玩法低赔区间-最高',
  `slave_additional_val` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '副玩法低赔选项附加赔率值',
  `odd_option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '玩法投注项名',
  `odd_option_value` decimal(10, 3) NULL DEFAULT NULL COMMENT '玩法投注项固定赔率',
  `match_id` bigint NULL DEFAULT 0 COMMENT '赛事ID(赛事结算完成和确认取消后删除赔率联动方案)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_program_id`(`program_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_range_dscnt
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_range_dscnt`;
CREATE TABLE `tbl_odd_range_dscnt`  (
  `id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `market_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '盘口ID',
  `match_level` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事等级',
  `low_odd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '低赔率',
  `high_odd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '高赔率',
  `return_rate` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '返还率',
  `match_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_mktid_lev_low_high`(`market_id`, `match_level`, `low_odd`, `high_odd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '赔率区间特殊抽水表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_types`;
CREATE TABLE `tbl_odd_types`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `en_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `category` tinyint NOT NULL COMMENT '玩法类型 全局-1 单场-2 篮球上半场-3 冠军-4',
  `option_type` tinyint NOT NULL COMMENT '选项类型 1-输赢 2-让分 3-大小 4-趣味 5-波胆 6-胜负平 7-单双 8-是否 10-猜冠军（单项结算）11-猜冠军（多项结算）12-复合 13-队员输赢 14-队员让分 15-队员大小 16-队员单双 17-队员是否 18-英雄输赢 19-英雄让分 20-英雄大小 21-英雄单双 22-英雄是否',
  `option_total` smallint NOT NULL COMMENT '选项数量',
  `option_name` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项名称',
  `is_update_name` tinyint NOT NULL COMMENT '是否可编辑选项 1-是 0-否',
  `bonus_proportion` smallint NOT NULL COMMENT '赔付占比',
  `status` tinyint NOT NULL COMMENT '状态 开启-1关闭-0',
  `sort_code` smallint NOT NULL COMMENT '排序码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `tag` bigint NOT NULL DEFAULT 0 COMMENT '玩法标签',
  `option_en_name` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '选项英文名',
  `module` tinyint(1) NOT NULL DEFAULT 1 COMMENT '玩法模组 1-赛前 2-BP 3-滚球中',
  `league_level` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '联赛等级 1-M1 2-M2 3-M3 4-M4 ... 9999 M9999',
  `lnc_return_rate` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '返还率递增 范围限定在负10%至正10%',
  `tag_code` int NOT NULL DEFAULT 0 COMMENT '玩法标签排序',
  `is_pass_off` tinyint NULL DEFAULT 0 COMMENT '是否串关 0-否 1-普通串关 2-局内串关',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示：0=隐藏，1=显示',
  `odd_unique_id` int NOT NULL DEFAULT 0 COMMENT '唯一玩法id',
  `odd_unique_link_id` bigint NOT NULL DEFAULT 0 COMMENT '关联人id',
  `odd_unique_link_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '关联人名称',
  `odd_unique_link_time` int NOT NULL DEFAULT 0 COMMENT '关联时间',
  `sid` bigint UNSIGNED NULL DEFAULT 0 COMMENT '玩法标准化ID',
  `stop_proportion` smallint NOT NULL DEFAULT 50 COMMENT '停盘占比',
  `detail_type` tinyint NOT NULL DEFAULT 0 COMMENT '详情页玩法分类 0-普通玩法,1-热门玩法,2-特别玩法,3-复合玩法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cidx_gid_st`(`game_id`, `status`) USING BTREE,
  INDEX `idx_tot_category`(`category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '玩法类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_types_option
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_types_option`;
CREATE TABLE `tbl_odd_types_option`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `odd_type_id` bigint UNSIGNED NOT NULL COMMENT '玩法类型ID',
  `option_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项名称',
  `option_en_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '选项英文名',
  `sort` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `update_time` int NOT NULL COMMENT '修改时间',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `option_zh_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '选项繁体名',
  `option_vi_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '选项越南名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '玩法类型选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odd_unique
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odd_unique`;
CREATE TABLE `tbl_odd_unique`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `en_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '英文名称',
  `cn_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '中文名称',
  `category` tinyint NOT NULL COMMENT '玩法类型 全局-1 单场-2 篮球上半场-3 冠军-4',
  `option_type` tinyint NOT NULL COMMENT '选项类型 1-输赢 2-让分 3-大小 4-趣味 5-波胆 6-胜负平 7-单双 8-是否 10-猜冠军（单项结算）11-猜冠军（多项结算）12-复合 13-队员输赢 14-队员让分 15-队员大小 16-队员单双 17-队员是否 18-英雄输赢 19-英雄让分 20-英雄大小 21-英雄单双 22-英雄是否',
  `link_game` int NOT NULL DEFAULT 0 COMMENT '已关联玩法数量',
  `create_time` int NOT NULL COMMENT '创建时间',
  `create_by_id` bigint NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_time` int NOT NULL COMMENT '修改时间',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '修改人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '唯一玩法表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_odds
-- ----------------------------
DROP TABLE IF EXISTS `tbl_odds`;
CREATE TABLE `tbl_odds`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `market_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '盘口ID',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项中文名称',
  `odd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '赔率',
  `is_winner` smallint NOT NULL DEFAULT 0 COMMENT '是否获胜 1-是 0-否',
  `sort_id` tinyint NOT NULL DEFAULT 1 COMMENT '排序ID',
  `visible` tinyint NOT NULL DEFAULT 0 COMMENT '是否显示  1-显示 0-隐藏',
  `org_odd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '初始赔率',
  `match_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事ID',
  `round` tinyint NOT NULL DEFAULT 0 COMMENT '局数',
  `en_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '选项英文名称',
  `team_id` bigint NOT NULL DEFAULT 0 COMMENT '战队id',
  `suspended` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否暂停 1-暂停 0-取消暂停',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `market_id_index`(`market_id`) USING BTREE,
  INDEX `match_id_index`(`match_id`) USING BTREE,
  INDEX `round_index`(`round`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投注项信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_detail`;
CREATE TABLE `tbl_order_detail`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '串关注单明细ID',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '注单ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `tournament_id` bigint UNSIGNED NOT NULL COMMENT '联赛ID',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `match_type` tinyint NOT NULL COMMENT '赛事类型 1-正常 2-冠军  3-大逃杀',
  `market_id` bigint UNSIGNED NOT NULL COMMENT '盘口ID',
  `market_cn_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘口中文名称',
  `team_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '战队名称',
  `round` smallint NOT NULL DEFAULT -1 COMMENT '第几局',
  `is_live` tinyint NOT NULL COMMENT '赛事阶段 1-初盘 2-滚盘',
  `odd_id` bigint UNSIGNED NOT NULL COMMENT '投注项ID',
  `odd_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投注项名称',
  `org_odd_id` bigint NOT NULL COMMENT '玩法ID',
  `odd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赔率',
  `status` tinyint NOT NULL COMMENT '1-待结算 2-已取消 3-已中奖 4-未中奖 5-撤销 6-赢半 7-输半 8-走水',
  `bet_time` bigint UNSIGNED NOT NULL COMMENT '投注时间',
  `match_start_time` int NOT NULL COMMENT '赛事开始时间',
  `update_time` int NOT NULL DEFAULT 0 COMMENT '更新时间',
  `settle_time` int NOT NULL DEFAULT 0 COMMENT '结算时间',
  `settle_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算次数',
  `team_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '战队id',
  `reason` tinyint UNSIGNED NOT NULL COMMENT 'x-赛事取消理由, 1xx-盘口取消理由, 201-赔率错误，202-比赛提前开始',
  `market_en_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘口英文名称',
  `odd_en_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投注项英文名称',
  `team_cn_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '队伍中文名称',
  `team_en_names` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '队伍英文名称',
  `flag` tinyint NOT NULL DEFAULT 0 COMMENT '子单类型 0-串关，1-复合',
  `member_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `bet_amount` decimal(20, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '注单投注金额',
  `used_limit` decimal(20, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '子单已使用串注限额',
  `currency_code` int NOT NULL DEFAULT 1 COMMENT '币种编码',
  `exchange_rate` double(15, 2) NOT NULL DEFAULT 1.00 COMMENT '汇率',
  `market_name` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口名(用户实际投注语言)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tod_order_id`(`order_id`) USING BTREE,
  INDEX `cidx_tod_ct_st`(`bet_time`, `status`) USING BTREE,
  INDEX `idx_tod_market_id`(`market_id`) USING BTREE,
  INDEX `idx_tod_flag`(`flag`) USING BTREE,
  INDEX `idx_tod_settle_time`(`settle_time`) USING BTREE,
  INDEX `idx_tod_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '串关注单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_players
-- ----------------------------
DROP TABLE IF EXISTS `tbl_players`;
CREATE TABLE `tbl_players`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名',
  `cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名',
  `team_id` bigint UNSIGNED NOT NULL COMMENT '战队ID',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '队员状态[0:禁用|1:开启]',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '队员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_priv
-- ----------------------------
DROP TABLE IF EXISTS `tbl_priv`;
CREATE TABLE `tbl_priv`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限名字',
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '模块',
  `types` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类',
  `menu` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '1:菜单2:不是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1277 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_prize_total
-- ----------------------------
DROP TABLE IF EXISTS `tbl_prize_total`;
CREATE TABLE `tbl_prize_total`  (
  `id` bigint NOT NULL COMMENT '盘口ID(盘口类型数据)/赛事ID+类型(其他类型数据)',
  `match_id` bigint UNSIGNED NOT NULL COMMENT '赛事ID',
  `total` decimal(12, 3) NOT NULL COMMENT '已用赔付统计',
  `prize_max` int UNSIGNED NOT NULL COMMENT '最大赔付限额',
  `kind` tinyint UNSIGNED NOT NULL COMMENT '1-普通串关赛事总赔付 2-复合玩法总赔付 3-局内串关总赔付 4-赛事总赔付 5-盘口总赔付',
  `match_level` int UNSIGNED NOT NULL COMMENT '赛事等级 1-M1 2-M2 3-M3 4-M4 ... 9999 M9999',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `is_live` tinyint UNSIGNED NOT NULL COMMENT '赛事阶段 1-初盘 2-滚盘',
  `category` tinyint UNSIGNED NOT NULL COMMENT '赛事类型 正常-1 冠军-2 大逃杀-3 篮球-4 主播盘-5 足球-6',
  `bo` tinyint UNSIGNED NOT NULL COMMENT '赛制',
  `start_time` bigint UNSIGNED NOT NULL COMMENT '开始时间',
  `tournament_id` bigint UNSIGNED NOT NULL COMMENT '联赛id',
  `tournament_short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `credit_level` int UNSIGNED NOT NULL COMMENT '信用赛事等级',
  `match_cn_team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '队伍中文名称',
  `match_en_team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '队伍英文名称',
  `round` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '局数',
  `market_cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口中文名称',
  `market_en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '盘口英文名称',
  `update_time` bigint UNSIGNED NOT NULL COMMENT '更新时间',
  `option_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '玩法类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_common
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_common`;
CREATE TABLE `tbl_risk_common`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `order_id` int NOT NULL COMMENT '序号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数名称',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数key',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数值',
  `unit` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位',
  `type` int NOT NULL COMMENT '类型(1:比赛参数设置,2:自动变赔设置)',
  `op_time` int NOT NULL COMMENT '操作时间',
  `op_by_id` bigint NOT NULL COMMENT '操作人员id',
  `op_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人员名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_game
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_game`;
CREATE TABLE `tbl_risk_game`  (
  `id` bigint NOT NULL COMMENT 'id',
  `level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赛事等级',
  `param_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数类型',
  `win_limit` int NOT NULL COMMENT '单注限红默认值',
  `win_limit_max` int NOT NULL COMMENT '单注限红最大值',
  `win_max_limit` int NOT NULL COMMENT '单注最高投注默认值',
  `win_max_limit_max` int NOT NULL COMMENT '单注最高投注最大值',
  `member_mkt_bet_limit` int NOT NULL COMMENT '会员盘口限红默认值',
  `member_mkt_bet_limit_max` int NOT NULL COMMENT '会员盘口限红最大值',
  `stop_value` int NOT NULL COMMENT '停盘值',
  `stop_value_max` int NOT NULL COMMENT '停盘值最大值',
  `waring_value` int NOT NULL COMMENT '预警值',
  `waring_value_max` int NOT NULL COMMENT '预警值最大值',
  `member_mch_win_limit` int NOT NULL COMMENT '会员赛事限红',
  `return_rate` decimal(10, 3) NOT NULL COMMENT '默认返还率',
  `default_done_time` int NOT NULL COMMENT '默认注单确认时间',
  `op_time` int NOT NULL COMMENT '操作时间',
  `op_by_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人',
  `status` tinyint NOT NULL COMMENT '启用状态0 关闭，1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风控赛事等级设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_member`;
CREATE TABLE `tbl_risk_member`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员ID',
  `member_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户账号',
  `parent_merchant_id` bigint UNSIGNED NOT NULL COMMENT '父商户ID',
  `parent_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父商户账号',
  `label` bigint NULL DEFAULT NULL COMMENT '会员标签',
  `times` bigint NOT NULL COMMENT '风控次数',
  `ty` tinyint NOT NULL COMMENT '添加类型 1.手动 2.自动',
  `noted` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `created_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `updated_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人名称',
  `top_merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '顶层商户id',
  `top_merchant_account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '顶层商户账号',
  `sort_level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户排序层级',
  `deph` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户层深',
  `update_time` int NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风控会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_member_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_member_history`;
CREATE TABLE `tbl_risk_member_history`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员ID',
  `label` bigint NULL DEFAULT NULL COMMENT '会员标签',
  `noted` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `updated_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人名称',
  `pre_update_time` int UNSIGNED NOT NULL COMMENT '上次更新时间',
  `cur_update_time` int UNSIGNED NOT NULL COMMENT '当前更新时间',
  `total_days` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '总计天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员标签-历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_monitor`;
CREATE TABLE `tbl_risk_monitor`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员id',
  `member_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员账号',
  `merchant_id` bigint UNSIGNED NOT NULL COMMENT '商户ID',
  `merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户账号',
  `parent_merchant_id` bigint UNSIGNED NOT NULL COMMENT '父商户ID',
  `parent_merchant_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父商户账号',
  `date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发日期',
  `risk_type` tinyint NOT NULL COMMENT '风险类型',
  `risk_param` tinyint NOT NULL COMMENT '风险参数',
  `risk_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '风险参数值',
  `game_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '触发监控的游戏名称，可为空',
  `tournament_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '触发监控的联赛名称，可为空',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_params
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_params`;
CREATE TABLE `tbl_risk_params`  (
  `id` int NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '风控类型',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数key',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数名称',
  `value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数值',
  `status` tinyint NOT NULL COMMENT '状态：1.开启 0.关闭',
  `update_by_id` bigint NOT NULL COMMENT '修改人员ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `update_time` int NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风险参数设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_tags`;
CREATE TABLE `tbl_risk_tags`  (
  `id` bigint NOT NULL COMMENT '序号',
  `cn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文名称',
  `en_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名称',
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '颜色',
  `update_time` int NOT NULL COMMENT '修改时间',
  `update_by_id` bigint NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `sort_code` int NOT NULL COMMENT '排序码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风险标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_risk_win_limit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_risk_win_limit`;
CREATE TABLE `tbl_risk_win_limit`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '阶段名称',
  `start_time` int NOT NULL DEFAULT 0 COMMENT '时间段-起始时间',
  `end_time` int NOT NULL DEFAULT 0 COMMENT '时间段-结束时间',
  `rate_limit` int NOT NULL DEFAULT 0 COMMENT '限红比例',
  `rate_reduce` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '返还率缩减',
  `update_by_id` bigint NOT NULL COMMENT '修改人员ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `update_time` int NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '风控限红比例设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_setting`;
CREATE TABLE `tbl_setting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数名称',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数key',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数值',
  `unit` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位',
  `flag` tinyint NOT NULL COMMENT '类型(1:比赛参数设置,2:自动变赔设置)',
  `op_time` int NOT NULL COMMENT '操作时间',
  `op_by_id` bigint UNSIGNED NOT NULL COMMENT '操作人员id',
  `op_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人员名称',
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 473 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_srs_live
-- ----------------------------
DROP TABLE IF EXISTS `tbl_srs_live`;
CREATE TABLE `tbl_srs_live`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '序号id',
  `live_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '需要转播的直播地址(顶级域名)',
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用名',
  `match_id` bigint NOT NULL DEFAULT 0 COMMENT '赛事id',
  `room_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '直播流文件名',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态;1=推流,2=关流,3=手动关播',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `inx_live_url`(`live_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '直播视频转播推流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_srs_live_source
-- ----------------------------
DROP TABLE IF EXISTS `tbl_srs_live_source`;
CREATE TABLE `tbl_srs_live_source`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `live_title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '直播视频标题(比如: PGIS全球总决赛)',
  `live_source_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '直播源URL',
  `match_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赛事简称',
  `match_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '赛事ID',
  `stream_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频流识别码',
  `kickoff_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '踢流识别码',
  `rtmp_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'rtmp推流地址',
  `flv_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'flv推流地址',
  `hls_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'hls推流地址',
  `live_status` tinyint NOT NULL DEFAULT 1 COMMENT '推流状态: 1.未开播  2.正在转播 3.离线 4.异常停播 ',
  `auto_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用自动推流: 1.否 2.是',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `start_time` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '直播源列表(赛事列表) ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_srs_origin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_srs_origin`;
CREATE TABLE `tbl_srs_origin`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '服务器序号',
  `server_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip',
  `api_port` int NOT NULL DEFAULT 1985 COMMENT 'api端口',
  `server_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器别名',
  `server_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '服务器类型： 1 源站 2 边缘',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'srs服务器管理列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_teams
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teams`;
CREATE TABLE `tbl_teams`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `short_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '简称',
  `en_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `images` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'pc图标',
  `status` tinyint NOT NULL COMMENT '状态 开启-1关闭-0',
  `sort_code` smallint NOT NULL COMMENT '排序码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示：0=隐藏，1=显示',
  `sid` bigint UNSIGNED NULL DEFAULT 0 COMMENT '战队标准化ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ttl_game_id`(`game_id`) USING BTREE,
  INDEX `idx_tt_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '战队信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_tournaments
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tournaments`;
CREATE TABLE `tbl_tournaments`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `short_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '简称',
  `en_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `cn_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `game_id` bigint UNSIGNED NOT NULL COMMENT '游戏ID',
  `is_pass_off` tinyint NOT NULL COMMENT '是否串关 是-1 否-0',
  `status` tinyint NOT NULL COMMENT '状态 开启-1 关闭-0',
  `sort_code` smallint NOT NULL COMMENT '排序码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `match_level` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '赛事等级',
  `credit_level` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级:0=其他等级信用联赛,1=一级信用联赛,2=二级信用联赛,...',
  `visible` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示：0=隐藏，1=显示',
  `sid` bigint UNSIGNED NULL DEFAULT 0 COMMENT '联赛标准化ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tt_game_id`(`game_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '联赛信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `create_time` int UNSIGNED NOT NULL COMMENT '创建时间',
  `create_by_id` bigint UNSIGNED NOT NULL COMMENT '创建人ID',
  `create_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人名称',
  `update_time` int UNSIGNED NOT NULL COMMENT '修改时间',
  `update_by_id` bigint UNSIGNED NOT NULL COMMENT '修改人ID',
  `update_by_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人名称',
  `group_id` bigint UNSIGNED NOT NULL COMMENT '用户组ID',
  `group_type` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户组类别',
  `last_login_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `state` tinyint UNSIGNED NOT NULL COMMENT '状态',
  `last_login_ip` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
