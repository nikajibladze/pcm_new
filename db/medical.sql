/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : medical

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 16/12/2021 11:05:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blood_types
-- ----------------------------
DROP TABLE IF EXISTS `blood_types`;
CREATE TABLE `blood_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blood_types
-- ----------------------------
INSERT INTO `blood_types` VALUES (1, 'O - პირველი ჯგუფი');
INSERT INTO `blood_types` VALUES (2, 'A - მეორე ჯგუფი');
INSERT INTO `blood_types` VALUES (3, 'B - მესამე ჯგუფი');
INSERT INTO `blood_types` VALUES (4, 'AB - მეოთხე ჯგუფი');

-- ----------------------------
-- Table structure for civilian_clinics
-- ----------------------------
DROP TABLE IF EXISTS `civilian_clinics`;
CREATE TABLE `civilian_clinics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilian_clinics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of civilian_clinics
-- ----------------------------

-- ----------------------------
-- Table structure for civilian_doctors
-- ----------------------------
DROP TABLE IF EXISTS `civilian_doctors`;
CREATE TABLE `civilian_doctors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilian_doctors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of civilian_doctors
-- ----------------------------

-- ----------------------------
-- Table structure for doctor_role_types
-- ----------------------------
DROP TABLE IF EXISTS `doctor_role_types`;
CREATE TABLE `doctor_role_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor_role_types
-- ----------------------------
INSERT INTO `doctor_role_types` VALUES (1, 'ადმინისტრატორი');
INSERT INTO `doctor_role_types` VALUES (2, 'ოპერატორი');
INSERT INTO `doctor_role_types` VALUES (3, 'მკურნალი ექიმი');
INSERT INTO `doctor_role_types` VALUES (4, 'მორიგე ექიმი');
INSERT INTO `doctor_role_types` VALUES (5, 'ექიმ სპეციალისტი');
INSERT INTO `doctor_role_types` VALUES (6, 'ანესთეზიოლოგი');
INSERT INTO `doctor_role_types` VALUES (7, 'ქირურგი');
INSERT INTO `doctor_role_types` VALUES (8, 'ქირურგის ასისტენტი');
INSERT INTO `doctor_role_types` VALUES (9, 'საოპერაცუი მედდა');
INSERT INTO `doctor_role_types` VALUES (10, 'ექთანი');
INSERT INTO `doctor_role_types` VALUES (11, 'ლაბორანტი');

-- ----------------------------
-- Table structure for doctor_roles
-- ----------------------------
DROP TABLE IF EXISTS `doctor_roles`;
CREATE TABLE `doctor_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor_roles
-- ----------------------------
INSERT INTO `doctor_roles` VALUES (1, 4, 1);
INSERT INTO `doctor_roles` VALUES (2, 2, 3);
INSERT INTO `doctor_roles` VALUES (3, 5, 2);
INSERT INTO `doctor_roles` VALUES (4, 6, 1);
INSERT INTO `doctor_roles` VALUES (5, 2, 4);
INSERT INTO `doctor_roles` VALUES (6, 1, 5);
INSERT INTO `doctor_roles` VALUES (7, 4, 5);
INSERT INTO `doctor_roles` VALUES (8, 3, 5);

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 1 COMMENT '1  ექიმი , 2 მორიგე ექიმი',
  `status` int(11) NULL DEFAULT 1 COMMENT '1 აქტიური , 2 გაუქმებული',
  `temp_pass` int(11) NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES (1, 'gmelelashvili', '1234', NULL, 'გიორგი', 'მელელაშვილი', 'ქირურგი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1, 1, 2);
INSERT INTO `doctors` VALUES (2, 'njibladze', '$2y$10$kPrZu3z4hwaVP9HGph810uYkRj.NV0oegM9RA1zNJLF.cu6uXnbBq', NULL, 'ნიკოლოზ', 'ჯიბლაძე', 'ელენტის ექსპერტი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1, 2, 2);
INSERT INTO `doctors` VALUES (3, 'vbalkhamishvili', '1234', 1, 'ვახტანგ', 'ბალხამიშვილი', 'გინეკოლოგი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 2, 1, 2);
INSERT INTO `doctors` VALUES (4, 'nugo', '1234', NULL, 'nugo', 'nugo', 'nugo', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1, 1, 1);
INSERT INTO `doctors` VALUES (5, 'test123123', '$2y$10$ZvWfAFnExYkBi8K9w3eFp.OP.RKFzzjoZO3xsh9XUXF.3r.KfRYZy', NULL, 'test123123', 'test123123', '123123', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1, 1, 2);
INSERT INTO `doctors` VALUES (6, 'nika1', '$2y$10$Rt/U9yfx3LRVZ4P6xYVciOQxrRtqgIp0yuVjbD9byGrPrImomo//y', NULL, 'nika1', 'nika1', '1234', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1, 1, 1);

-- ----------------------------
-- Table structure for med_visit_conditions
-- ----------------------------
DROP TABLE IF EXISTS `med_visit_conditions`;
CREATE TABLE `med_visit_conditions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visit_conditions
-- ----------------------------
INSERT INTO `med_visit_conditions` VALUES (1, 'სტაციონარი');
INSERT INTO `med_visit_conditions` VALUES (2, 'ამბულატორია');
INSERT INTO `med_visit_conditions` VALUES (3, 'ობსერვაცია');

-- ----------------------------
-- Table structure for med_visits
-- ----------------------------
DROP TABLE IF EXISTS `med_visits`;
CREATE TABLE `med_visits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `history_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `medical_visit_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო ვიზიტის ნომერი',
  `personal_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_type` int(11) NULL DEFAULT NULL COMMENT '1 სტაციონარი , 2 ამბულატორია, 3 ობსერვაცია',
  `visit_date` datetime NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NULL DEFAULT 1 COMMENT '1 მიმდინარე , 2 დახურული',
  `close_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator_doctore_id` int(11) NULL DEFAULT NULL COMMENT 'შემქმნელი იუზერის იდ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visits
-- ----------------------------
INSERT INTO `med_visits` VALUES (1, 1, 'HIS0001', NULL, '01019074079', 'გიორგი', 'მელელაშვილი', 2, 'ნიკოლოზ', 'ჯიბლაძე', 1, '2021-10-18 17:39:56', '2021-10-18 17:39:53', 1, NULL, NULL);
INSERT INTO `med_visits` VALUES (3, 3, '1635230438', NULL, '01023008831', 'ზურაბ', 'ზურაბ', 3, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `med_visits` VALUES (4, 4, '1638181316', NULL, '01033002799', 'ნატო', 'ბადაგაძე', 3, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `med_visits` VALUES (5, 5, '1638181330', NULL, '11111111111', 'ტესტ სახელი 1', 'ტესტ გვარი 1', 3, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `med_visits` VALUES (6, 5, '1638181457', NULL, '11111111111', 'ტესტ სახელი 1', 'ტესტ გვარი 1', 3, NULL, NULL, 2, NULL, '2021-11-29 00:00:00', 1, NULL, NULL);
INSERT INTO `med_visits` VALUES (7, 5, '1638271433', NULL, '11111111111', 'ტესტ სახელი 1', 'ტესტ გვარი 1', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for med_visits_doctor_on_duty
-- ----------------------------
DROP TABLE IF EXISTS `med_visits_doctor_on_duty`;
CREATE TABLE `med_visits_doctor_on_duty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NULL DEFAULT NULL,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visits_doctor_on_duty
-- ----------------------------
INSERT INTO `med_visits_doctor_on_duty` VALUES (21, 1, 2, NULL);
INSERT INTO `med_visits_doctor_on_duty` VALUES (27, 7, 2, NULL);

-- ----------------------------
-- Table structure for med_visits_doctor_specialist
-- ----------------------------
DROP TABLE IF EXISTS `med_visits_doctor_specialist`;
CREATE TABLE `med_visits_doctor_specialist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NULL DEFAULT NULL,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visits_doctor_specialist
-- ----------------------------
INSERT INTO `med_visits_doctor_specialist` VALUES (19, 1, 1, NULL);
INSERT INTO `med_visits_doctor_specialist` VALUES (20, 1, 4, NULL);
INSERT INTO `med_visits_doctor_specialist` VALUES (21, 1, 3, NULL);
INSERT INTO `med_visits_doctor_specialist` VALUES (32, 7, 4, NULL);
INSERT INTO `med_visits_doctor_specialist` VALUES (33, 7, 3, NULL);

-- ----------------------------
-- Table structure for med_visits_doctor_transfer_history
-- ----------------------------
DROP TABLE IF EXISTS `med_visits_doctor_transfer_history`;
CREATE TABLE `med_visits_doctor_transfer_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NULL DEFAULT NULL,
  `from_doctor_id` int(11) NULL DEFAULT NULL,
  `to_doctor_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visits_doctor_transfer_history
-- ----------------------------

-- ----------------------------
-- Table structure for patient_abuse_anamnesis
-- ----------------------------
DROP TABLE IF EXISTS `patient_abuse_anamnesis`;
CREATE TABLE `patient_abuse_anamnesis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'უნიკალური იდ',
  `history_id` int(11) NULL DEFAULT NULL COMMENT 'ისტორიის იდ',
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'დამატების თარიღი',
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დამატებელი იუზერის სახელი',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'იუზერის პოზიცია',
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'იუზერის სტრუქტურა',
  `abuse_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩივილები',
  `no_abuse` int(11) NULL DEFAULT 1 COMMENT '1 აქვს ჩივილი , 2 არ აქვს ჩივილი',
  `medicaments` int(11) NULL DEFAULT NULL COMMENT 'მედიკამენტებზე დამოკიდებულება 1 დადებითი ',
  `medicaments_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მედიკამენტებზე დამატებითი ინფორმაცია',
  `allergy` int(11) NULL DEFAULT NULL COMMENT 'ალერგია 1 დადებითი',
  `allergy_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ალერგიაზე დამატებითი ინფორმაცია',
  `tobacco` int(11) NULL DEFAULT NULL COMMENT 'თამბაქო 1 დადებითი',
  `alcohol` int(11) NULL DEFAULT NULL COMMENT 'ალკოჰოლი 1 დადებითი ',
  `drugs` int(11) NULL DEFAULT NULL COMMENT 'ნარკოტიკები 1 დადებითი',
  `bad_habits_other` int(11) NULL DEFAULT NULL COMMENT 'სხვა 1 დადებითი',
  `bad_habits_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მავნე ჩვევებზე დამატებითი ინფორმაცია',
  `ischemic_heart` int(11) NULL DEFAULT NULL COMMENT 'გულის იშემიური ავადმყოფობა 1 დადებითი',
  `hypertensive_disease` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერტენზიული ავადმყოფობა  1 დადებითი',
  `blood_diseases_other` int(11) NULL DEFAULT NULL COMMENT 'სისხლის მიმოქცევის სისტემის ავადმყოფობები სხვა',
  `blood_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლის მიმოქცევის სისტემის ავადმყოფობების დამატებითი ინფორმაცია',
  `asthma` int(11) NULL DEFAULT NULL COMMENT 'ასთმა 1 დადებითი ',
  `lung_disease` int(11) NULL DEFAULT NULL COMMENT 'ფილტვის ქრ. ობსტრუქციული ავადმყოფობა 1 დადებითი',
  `respiratory_system_other` int(11) NULL DEFAULT NULL COMMENT 'სუნთქვის სისტემის ავადმყოფობები სხვა 1 დადებითი',
  `respiratory_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სუნთქვის სისტემის ავადმყოფობების დამატებითი ინფორმაცია',
  `diabetes` int(11) NULL DEFAULT NULL COMMENT 'დიაბეტი',
  `thyroid_disease` int(11) NULL DEFAULT NULL COMMENT 'ფარისებრი ჯირკვლის ავადმყოფობა',
  `endocrine_system_other` int(11) NULL DEFAULT NULL COMMENT 'ენდოკრინული სისტემის სხვა',
  `endocrine_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ენდოკრინული სისტემის დამატებითი ინფორმაცია',
  `epilepsy` int(11) NULL DEFAULT NULL COMMENT 'ეპილეფსია',
  `sleep_disturbance` int(11) NULL DEFAULT NULL COMMENT 'ძილის დარღვევა',
  `nervous_system_other` int(11) NULL DEFAULT NULL COMMENT 'ნერვული სისტემის სხვა',
  `nervous_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნერვული სისტემის დამატებითი ინფორმაცია',
  `mental_disorder` int(11) NULL DEFAULT NULL COMMENT 'ფსიქიკური აშლილობა',
  `mental_disorder_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფსიქიკური და ქცევითი დარღვევები დამატებითი ინფორმაცია',
  `kidney_disease` int(11) NULL DEFAULT NULL COMMENT 'თირკმელების დაავადება',
  `urolithiasis` int(11) NULL DEFAULT NULL COMMENT 'უროლითიაზი',
  `gynecological_diseases` int(11) NULL DEFAULT NULL COMMENT 'გინეკოლოგიური დაავადებები',
  `genitourinary_system_other` int(11) NULL DEFAULT NULL COMMENT 'შარდ-სასქესო სისტემის ავადმყოფობები სხვა',
  `genitourinary_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შარდ-სასქესო სისტემის ავადმყოფობები დამატებითი ინფორმაცია',
  `gastric_ulcer` int(11) NULL DEFAULT NULL COMMENT 'კუჭისა და 12-გ ნაწლავის წყლული',
  `cholelithiasis` int(11) NULL DEFAULT NULL COMMENT 'ქოლელითიაზი',
  `digestive_system_other` int(11) NULL DEFAULT NULL COMMENT 'საჭმლის მომნელებელი სისტემის ავადმყოფობები სხვა',
  `digestive_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საჭმლის მომნელებელი სისტემის ავადმყოფობები დამატებითი ინფორმაცია',
  `restriction_movement` int(11) NULL DEFAULT NULL COMMENT 'მოძრაობის შეზღუდვა',
  `arthropathies` int(11) NULL DEFAULT NULL COMMENT 'ართროპათიები',
  `dorsopathies` int(11) NULL DEFAULT NULL COMMENT 'დორსოპათიები',
  `muscular_diseases_other` int(11) NULL DEFAULT NULL COMMENT 'ძვალ-კუნთოვანი სხვა',
  `muscular_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ძვალ-კუნთოვანი დამატებითი ინფორმაცია',
  `tuberculosis` int(11) NULL DEFAULT NULL COMMENT 'ტუბერკულოზი',
  `hepatitis` int(11) NULL DEFAULT NULL COMMENT 'ჰეპატიტი',
  `hiv_infection` int(11) NULL DEFAULT NULL COMMENT 'აივ ინფექცია',
  `meningitis_Encephalitis` int(11) NULL DEFAULT NULL COMMENT 'მენინგიტი / ენცეფალიტი',
  `malaria` int(11) NULL DEFAULT NULL COMMENT 'მალარია',
  `infectious_diseases_other` int(11) NULL DEFAULT NULL COMMENT 'ინფექციური და პარაზიტული სხვა',
  `infectious_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფექციური და პარაზიტული დამატებითი ინფორმაცია',
  `malignant_tumor` int(11) NULL DEFAULT NULL COMMENT 'ავთვისებიანი სიმსივნე',
  `malignant_tumor_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ავთვისებიანი სიმსივნე დამატებითი ინფორმაცია',
  `benign_tumor` int(11) NULL DEFAULT NULL COMMENT 'კეთილთვისებიანი სიმსივნე',
  `benign_tumor_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კეთილთვისებიანი სიმსივნე დამატებითი ინფორმაცია',
  `surgery` int(11) NULL DEFAULT NULL COMMENT 'ქირურგიული ჩარევა',
  `surgery_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ქირურგიული ჩარევა დამატებითი ინფორმაცია',
  `anesthesia` int(11) NULL DEFAULT NULL COMMENT 'წარსულში ჩატარებული ანესთეზიები',
  `anesthesia_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'წარსულში ჩატარებული ანესთეზიები დამატებითი ინფორმაცია',
  `head_trauma` int(11) NULL DEFAULT NULL COMMENT 'თავის ტრავმა',
  `loss_consciousness` int(11) NULL DEFAULT NULL COMMENT 'გონების დაკარგვა',
  `fracture` int(11) NULL DEFAULT NULL COMMENT 'მოტეხილობა',
  `self_harm` int(11) NULL DEFAULT NULL COMMENT 'თვითდაზიანება',
  `trauma_other` int(11) NULL DEFAULT NULL COMMENT 'ტრავმა სხვა',
  `trauma_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტრავმა დამატებითი ინფორმაცია',
  `anemia` int(11) NULL DEFAULT NULL COMMENT 'ანემია',
  `anemia_other` int(11) NULL DEFAULT NULL COMMENT 'ანემია სხვა',
  `anemia_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ანემია დამატებითი ინფორმაცია',
  `impairment_of_vision` int(11) NULL DEFAULT NULL COMMENT 'მხედველობის დარღვევა',
  `impairment_of_vision_other` int(11) NULL DEFAULT NULL COMMENT 'მხედველობის დარღვევა სხვა',
  `impairment_of_vision_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მხედველობის დარღვევა დამატებითი ინფორმაცია',
  `hearing_impairment` int(11) NULL DEFAULT NULL COMMENT 'სმენის დაქვეითება',
  `respiratory_disorders` int(11) NULL DEFAULT NULL COMMENT 'სუნთქვის დარღვევა',
  `ear_diseases_other` int(11) NULL DEFAULT NULL COMMENT 'ყურისა და დვრილისებრი სხვა',
  `ear_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყურისა და დვრილისებრი დამატებითი ინფორმაცია',
  `Atashangi` int(11) NULL DEFAULT NULL COMMENT 'ათაშანგი',
  `venereal_disease_other` int(11) NULL DEFAULT NULL COMMENT 'ვენერიული დაავადება სხვა',
  `venereal_disease_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ვენერიული დაავადება დამატებითი ინფორმაცია',
  `pregnancy_childbirth` int(11) NULL DEFAULT NULL COMMENT 'ორსულობა / მშობიარობა',
  `multiplicity_pregnancy` int(11) NULL DEFAULT NULL COMMENT 'ორსულობის ჯერადობა',
  `physiological` int(11) NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / ფიზიოლოგიური',
  `abnormal` int(11) NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / პათოლოგიური',
  `stillbirth` int(11) NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / მკვდრადშობადობა',
  `arbitrary` int(11) NULL DEFAULT NULL COMMENT 'აბორტის ჯერადობა / თვითნებური',
  `artificial` int(11) NULL DEFAULT NULL COMMENT 'აბორტის ჯერადობა / ხელოვნური',
  `pregnancy_childbirth_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ორსულობა / მშობიარობა დამატებითი ინფორმაცია',
  `genetic_diseases` int(11) NULL DEFAULT NULL COMMENT 'გენეტიკური დაავადებები',
  `genetic_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გენეტიკური დაავადებები დამატებითი ინფორმაცია',
  `family_history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოჯახური ანამნეზი',
  `working_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შრომის პირობები',
  `rest_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დასვენების პირობები',
  `nutritional_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კვების პირობები',
  `living_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცხოვრების პირობები',
  `harmful_factors` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მავნე ფაქტორების ზემოქმედება',
  `household_history_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შრომის და საყოფაცხოვრებო დამატებითი ინფორმაცია',
  `abuse_anamnesis_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩივილი/ანამნეზი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_abuse_anamnesis
-- ----------------------------
INSERT INTO `patient_abuse_anamnesis` VALUES (1, NULL, 1, '2021-10-29 16:22:34', NULL, NULL, NULL, 'dffdsfsdfdf', 1, 1, 'fgdfgdfgdfgdfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 999, 999, 999, 999, 999, 999, 'დამატებითი ინფორმაცია', NULL, 'დამატებითი ინფორმაცია', 'ოჯახური ანამნეზი', 'შრომის პირობები', 'დასვენების პირობები', 'კვების პირობები', 'ცხოვრების პირობები', 'მავნე ფაქტორების ზემოქმედება', 'დამატებითი ინფორმაცია', 'სატესტო 333333');
INSERT INTO `patient_abuse_anamnesis` VALUES (2, NULL, 7, '2021-12-01 10:28:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_abuse_anamnesis` VALUES (3, NULL, 6, '2021-12-02 12:16:03', NULL, NULL, NULL, NULL, 1, 1, 'დამატებითი ინფორმაცია - ანამნეზი - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - ანამნეზი - 12/2/2021 12:19:34 PM', 1, 1, 1, 1, 'დამატებითი ინფორმაცია - მავნე ჩვევები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - სისხლის მიმოქცევის სისტემის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - სუნთქვის სისტემის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - ენდოკრინული სისტემის, კვებისა და ნივთიერებათა ცვლის დარღვევით მიმდინარე ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - ნერვული სისტემის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - ფსიქიკური და ქცევითი დარღვევები - 12/2/2021 12:19:34 PM', 1, 1, 1, 1, 'დამატებითი ინფორმაცია - შარდ-სასქესო სისტემის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - საჭმლის მომნელებელი სისტემის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 1, 'დამატებითი ინფორმაცია - ძვალ-კუნთოვანი სისტემისა და შემაერთებელი ქსოვილის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 1, 1, 1, 'დამატებითი ინფორმაცია - ინფექციური და პარაზიტული ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - სიმსივნე - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - სიმსივნე - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - ქირურგიული ჩარევა - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - ჩატარებული ანესთეზია - 12/2/2021 12:19:34 PM', 1, 1, 1, 1, 1, 'დამატებითი ინფორმაცია - ტრავმა - 12/2/2021 12:19:34 PM', 1, 1, 'დამატებითი ინფორმაცია - სისხლისა და სისხლმბადი ორგანოების ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 'დამატებითი ინფორმაცია - თვალისა და მისი დანამატების ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 1, 'დამატებითი ინფორმაცია - ყურისა და დვრილისებრი მორჩის ავადმყოფობები - 12/2/2021 12:19:34 PM', 1, 1, 'დამატებითი ინფორმაცია - ვენერიული დაავადება - 12/2/2021 12:19:34 PM', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'დამატებითი ინფორმაცია - ორსულობა / მშობიარობა - 12/2/2021 12:19:34 PM', 1, 'დამატებითი ინფორმაცია - გენეტიკური დაავადებები - 12/2/2021 12:19:34 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'დამატებითი ინფორმაცია - შრომის და საყოფაცხოვრებო ანამნეზი - 12/2/2021 12:19:34 PM', 'დამატებითი ინფორმაცია - სხვა - 12/2/2021 12:19:34 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (4, NULL, 7, '2021-12-06 14:29:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_abuse_anamnesis` VALUES (5, NULL, 7, '2021-12-06 15:36:02', NULL, NULL, NULL, '12/6/2021 3:40:00 PM', 1, 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', 1, 1, 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, '12/6/2021 3:40:00 PM', 1, 1, '12/6/2021 3:40:00 PM', 1, 1, 1, '12/6/2021 3:40:00 PM', 1, 1, '12/6/2021 3:40:00 PM', 1, NULL, NULL, NULL, NULL, NULL, NULL, '12/6/2021 3:40:00 PM', 1, '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM', '12/6/2021 3:40:00 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (6, NULL, 7, '2021-12-06 15:40:12', NULL, NULL, NULL, '12/6/2021 3:44:09 PM', 1, 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', 1, 1, 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, '12/6/2021 3:44:09 PM', 1, 1, '12/6/2021 3:44:09 PM', 1, 1, 1, '12/6/2021 3:44:09 PM', 1, 1, '12/6/2021 3:44:09 PM', 1, NULL, NULL, NULL, NULL, NULL, NULL, '12/6/2021 3:44:09 PM', 1, '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM', '12/6/2021 3:44:09 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (7, NULL, 7, '2021-12-06 15:41:07', NULL, NULL, NULL, '12/6/2021 3:45:04 PM', 1, 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', 1, 1, 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, '12/6/2021 3:45:04 PM', 1, 1, '12/6/2021 3:45:04 PM', 1, 1, 1, '12/6/2021 3:45:04 PM', 1, 1, '12/6/2021 3:45:04 PM', 1, NULL, NULL, NULL, NULL, NULL, NULL, '12/6/2021 3:45:04 PM', 1, '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM', '12/6/2021 3:45:04 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (8, NULL, 7, '2021-12-06 15:48:17', NULL, NULL, NULL, '12/6/2021 3:52:13 PM', 1, 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', 1, 1, 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, '12/6/2021 3:52:13 PM', 1, 1, '12/6/2021 3:52:13 PM', 1, 1, 1, '12/6/2021 3:52:13 PM', 1, 1, '12/6/2021 3:52:13 PM', 1, 605, 125, 374, 926, 896, 504, '12/6/2021 3:52:13 PM', 1, '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM', '12/6/2021 3:52:13 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (9, NULL, 7, '2021-12-06 18:04:02', NULL, NULL, NULL, '12/6/2021 6:07:58 PM', 1, 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', 1, 1, 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, '12/6/2021 6:07:58 PM', 1, 1, '12/6/2021 6:07:58 PM', 1, 1, 1, '12/6/2021 6:07:58 PM', 1, 1, '12/6/2021 6:07:58 PM', 1, 633, 551, 253, 552, 840, 456, '12/6/2021 6:07:58 PM', 1, '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM', '12/6/2021 6:07:58 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (10, NULL, 7, '2021-12-06 18:15:52', NULL, NULL, NULL, '12/6/2021 6:19:48 PM', 1, 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, 1, 1, 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', 1, 1, 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, '12/6/2021 6:19:48 PM', 1, 1, '12/6/2021 6:19:48 PM', 1, 1, 1, '12/6/2021 6:19:48 PM', 1, 1, '12/6/2021 6:19:48 PM', 1, 135, 748, 921, 739, 147, 904, '12/6/2021 6:19:48 PM', 1, '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM', '12/6/2021 6:19:48 PM');
INSERT INTO `patient_abuse_anamnesis` VALUES (11, NULL, 7, '2021-12-10 15:00:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_abuse_anamnesis` VALUES (12, NULL, 7, '2021-12-10 15:00:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_abuse_anamnesis` VALUES (13, NULL, 7, '2021-12-10 17:06:32', NULL, NULL, NULL, 'test', 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 1, 1, 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 1, 1, 1, 1, 'test', 1, 1, 'test', 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 'test', 1, 123, 123, 123, 123, 123, 123, 'test', 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');
INSERT INTO `patient_abuse_anamnesis` VALUES (14, NULL, 7, '2021-12-10 17:06:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_abuse_anamnesis` VALUES (15, NULL, 7, '2021-12-10 17:12:46', NULL, NULL, NULL, 'test', 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 1, 1, 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 1, 1, 1, 1, 'test', 1, 1, 'test', 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 'test', 1, 123, 123, 123, 123, 123, 123, 'test', 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');
INSERT INTO `patient_abuse_anamnesis` VALUES (16, NULL, 7, '2021-12-10 17:13:46', NULL, NULL, NULL, 'test', 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 1, 1, 'test', 1, 1, 1, 1, 1, 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 'test', 1, 1, 1, 1, 1, 'test', 1, 1, 'test', 1, 1, 'test', 1, 1, 1, 'test', 1, 1, 'test', 1, 123, 123, 123, 123, 123, 123, 'test', 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');

-- ----------------------------
-- Table structure for patient_anthropometry
-- ----------------------------
DROP TABLE IF EXISTS `patient_anthropometry`;
CREATE TABLE `patient_anthropometry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL COMMENT 'წონა(კგ)',
  `height` int(11) NULL DEFAULT NULL COMMENT 'სიმაღლე(სმ);',
  `body_mass` int(11) NULL DEFAULT NULL COMMENT 'სხეულის მასის ინდექსი',
  `abdominal_circumference` int(11) NULL DEFAULT NULL COMMENT 'მუცლის გარშემოწერილობა(სმ);',
  `head_circumference` int(11) NULL DEFAULT NULL COMMENT 'თავის გარშემოწერილობა (სმ)',
  `waist_circumference` int(11) NULL DEFAULT NULL COMMENT 'წელის გარშემოწერილობა (სმ)',
  `height_sitting` int(11) NULL DEFAULT NULL COMMENT 'სიმაღლე ჯდომისას (სმ)',
  `right_upper_limb` int(11) NULL DEFAULT NULL COMMENT 'მარჯვენა ზედა კიდურის სიგრძე (სმ)',
  `left_upper_limb` int(11) NULL DEFAULT NULL COMMENT 'მარცხენა ზედა კიდურის სიგრძე (სმ)',
  `left_lower_limb` int(11) NULL DEFAULT NULL COMMENT 'მარცხენა ქვედა კიდურის სიგრძე (სმ)',
  `right_lower_limb` int(11) NULL DEFAULT NULL COMMENT 'მარჯვენა ქვედა კიდურის სიგრძე (სმ)',
  `construction` int(11) NULL DEFAULT NULL COMMENT 'აღნაგობა 1 ასთენიური, 2 ნორმოსთენიური, 3 ჰიპერსთენიური',
  `right_cluster_dynamometer` int(11) NULL DEFAULT NULL COMMENT 'მარჯვენა მტევნის დინამომეტრია',
  `left_cluster_dynamometer` int(11) NULL DEFAULT NULL COMMENT 'მარცხენა მტევნის დინამომეტრია',
  `traction_force_dynamometer` int(11) NULL DEFAULT NULL COMMENT 'წევის ძალის დინამომეტრია',
  `spirometry` int(11) NULL DEFAULT NULL COMMENT 'სპირომეტრია',
  `developmental_defect` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'განვითარების დეფექტი',
  `at_rest` int(11) NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა მოსვენებისას',
  `when_inhaling` int(11) NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა ჩასუნთქვისას',
  `on_exhalation` int(11) NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა ამოსუნთქვისას',
  `chest_circumference_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გულმკერდის გარშემოწერილობა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_anthropometry
-- ----------------------------
INSERT INTO `patient_anthropometry` VALUES (1, NULL, 6, '2021-11-30 11:25:44', NULL, NULL, NULL, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL, NULL);
INSERT INTO `patient_anthropometry` VALUES (2, NULL, 7, '2021-12-01 15:15:46', NULL, NULL, NULL, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_awareness
-- ----------------------------
DROP TABLE IF EXISTS `patient_awareness`;
CREATE TABLE `patient_awareness`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `eyeballs` int(11) NULL DEFAULT NULL COMMENT 'გუგები D 1. = S; 2. >S; 3. <S;',
  `skull_base_fracture` int(11) NULL DEFAULT NULL COMMENT 'ქალას ფუძის მოტეხილობის ნიშნები',
  `loss_of_consciousness` int(11) NULL DEFAULT NULL COMMENT 'გონების დაკარგვა (წთ)',
  `avpu` int(11) NULL DEFAULT NULL COMMENT 'AVPU 1. A-აქტიური; 2. V-პასუხი სიტყვიერ გაღიზიანებაზე; 3. P-პასუხი ტკივილით გაღიზიანებაზე; 4. U-რეაქციაზე გაღიზიანება არ გამოიხატება;',
  `open_eyes` int(11) NULL DEFAULT NULL COMMENT 'თვალის გახელა 1. სპონტანური - 4 ქულა,2. რეაგირებს ჩაძახილზე - 3 ქულა,3. რეაგირებს ტკივილზე - 2 ქულა,4. რეაქცია არ არის -1 ქულა',
  `verbal_speech` int(11) NULL DEFAULT NULL COMMENT 'ვერბალური მეტყველება 1. კონტაქტური/ორიენტირებული - 5 ქულა,2. კონტაქტური/დეზორიენტირებული - 4 ქულა,3. პასუხობს არაადექვატურად, ცალკეული სიტყვები - 3 ქულა,4. გაუგებარი სიტყვები-- 2 ქულა,5. არ არის ვერბალური რეაქცია - 1 ქულა',
  `motor_reaction` int(11) NULL DEFAULT NULL COMMENT 'მოტორული რეაქცია 1. A - აქტიური ასრულებს დავალებას - 6 ქულა,2. V - პასუხი სიტყვიერ გაღიზიანებაზე ტკივილის ლოკალიზაცია - 5 ქულა,3. P - პასუხი ტკივილით გაღიზიანებაზე მოცილების რეაქცია (ფლექსია)- 4 ქულა,4. U - გაღიზიანებაზე რეაქცია არ გამოიხატება დეკორტიკალური რიგიდობა (გაშლა)- 3 ქულა,5. დეცერებრაციული რიგიდობა (მოხრა) - 2ქულა,6. რეაქცია არა არის - 1 ქულა',
  `sum_of_results` int(11) NULL DEFAULT NULL COMMENT 'საბოლოო ქულის დათვლის ველი',
  `level_of_consciousness` int(11) NULL DEFAULT NULL COMMENT 'ცნობიერების დონე',
  `hallucination` int(11) NULL DEFAULT NULL COMMENT 'ჰალუცინაცია',
  `field_of_consciousness` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცნობიერების სფერო',
  `vegetative_nervous_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ვეგეტატიური ნერვული სისტემა',
  `mental_status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფსიქიური სტატუსი',
  `sleep` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ძილი',
  `glasgow_coma_scale_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გლაზგოს კომის შკალა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_awareness
-- ----------------------------
INSERT INTO `patient_awareness` VALUES (1, NULL, 7, '2021-12-03 17:29:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_blood_circulation_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_blood_circulation_system`;
CREATE TABLE `patient_blood_circulation_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capillary_filling_time` int(11) NULL DEFAULT NULL COMMENT 'კაპილარული ავსების დრო',
  `estimated_blood_loss` int(11) NULL DEFAULT NULL COMMENT 'სისხლის სავარაუდო დანაკარგი',
  `blood_circulation_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლის მიმოქცევის სიტემა დამატებითი ინფორმაცია',
  `pulse_at_rest` int(11) NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `pulse_after_loading` int(11) NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `pulse_after_3_minutes` int(11) NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `rhythm` int(11) NULL DEFAULT NULL COMMENT 'რითმი 1 რითმული,2 არითმიული;',
  `fill_in` int(11) NULL DEFAULT NULL COMMENT 'ავსება 1 კარგი 2 საშუალო 3 სუსტი;',
  `pulse_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პულსი დამატებითი ინფორმაცია',
  `pressure_at_rest` int(11) NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `pressure_after_loading` int(11) NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `pressure_after_3_minutes` int(11) NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `functional_test_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  `pure_tones` int(11) NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `curved_tones` int(11) NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `clear_tones` int(11) NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `heart_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  `boundaries_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_blood_circulation_system
-- ----------------------------
INSERT INTO `patient_blood_circulation_system` VALUES (1, NULL, 1, '2021-11-02 16:36:58', NULL, NULL, NULL, 1, NULL, 'gguukuhu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_blood_circulation_system` VALUES (2, NULL, 7, '2021-12-09 17:59:14', NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_blood_circulation_system` VALUES (3, NULL, 7, '2021-12-09 17:59:39', NULL, NULL, NULL, 456, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_clinical_examination
-- ----------------------------
DROP TABLE IF EXISTS `patient_clinical_examination`;
CREATE TABLE `patient_clinical_examination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `procedure_code` int(11) NULL DEFAULT NULL COMMENT 'პროცედურის კოდი',
  `procedure_clinecal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'პროცედურა',
  `demanding_doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'მომთხოვნი ექიმი',
  `performer_doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'შემსრულებელი ექიმი',
  `demanding_date` date NULL DEFAULT NULL COMMENT 'მოთხოვნის თარიღი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_clinical_examination
-- ----------------------------

-- ----------------------------
-- Table structure for patient_clinical_examination_main
-- ----------------------------
DROP TABLE IF EXISTS `patient_clinical_examination_main`;
CREATE TABLE `patient_clinical_examination_main`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_clinical_examination_main
-- ----------------------------
INSERT INTO `patient_clinical_examination_main` VALUES (1, NULL, 7, '2021-12-06 17:22:22', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_clinical_examination_procedures
-- ----------------------------
DROP TABLE IF EXISTS `patient_clinical_examination_procedures`;
CREATE TABLE `patient_clinical_examination_procedures`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_clinical_examination_procedures
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure`;
CREATE TABLE `patient_cure`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_adjustment` date NULL DEFAULT NULL COMMENT 'მომართვის თარიღი',
  `condition_cure` int(11) NULL DEFAULT NULL COMMENT 'მდგომარეობა 1. სტაციონარული, 2. ამბულატორიული',
  `description_treatment` int(11) NULL DEFAULT NULL COMMENT 'მკურნალობის აღწერა 1. კონსერვატიული, 2. ქირურგიული, 3. რეაბილიტაცია, 4. პალიატური',
  `begin_treatment` date NULL DEFAULT NULL COMMENT 'მკურნალობის დასაწყისი',
  `end_treatment` date NULL DEFAULT NULL COMMENT 'მკურნალობის დასასრული',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `treatment_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მკურნალობის შედეგი',
  `patient_consent` int(11) NULL DEFAULT NULL COMMENT 'პაციენტის თანხმობა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure_files`;
CREATE TABLE `patient_cure_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cure_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure_lazaret
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure_lazaret`;
CREATE TABLE `patient_cure_lazaret`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lazaret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure_lazaret
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure_meeting
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure_meeting`;
CREATE TABLE `patient_cure_meeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_cure_id` int(11) NULL DEFAULT NULL,
  `structural_unit` int(11) NULL DEFAULT NULL COMMENT 'სტრ. ერთეული',
  `specialty` int(11) NULL DEFAULT NULL COMMENT 'სპეციალობა',
  `addressee_doctor` int(11) NULL DEFAULT NULL COMMENT 'ადრესატი ექიმი',
  `date_meeting` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `condition` int(11) NULL DEFAULT NULL COMMENT 'მდგომარეობა 1. გეგმიური, 2. სასწრაფო',
  `meeting_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure_procedure_code
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure_procedure_code`;
CREATE TABLE `patient_cure_procedure_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_cure__id` int(11) NULL DEFAULT NULL,
  `procedure_code` int(11) NULL DEFAULT NULL COMMENT 'პროცედურის კოდი  patient_cure_procedure_codes ცხრილი',
  `procedure_cure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'პროცედურა patient_cure_procedure_codes ცხრილი',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კომენტარი',
  `Lazaret` int(11) NULL DEFAULT NULL COMMENT 'ლაზარეთი patient_cure_lazaret ცხრილი',
  `status` int(11) NULL DEFAULT NULL COMMENT 'სტატუსი 1. მიმდინარე,2. დასრულებული',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure_procedure_code
-- ----------------------------

-- ----------------------------
-- Table structure for patient_cure_procedure_codes
-- ----------------------------
DROP TABLE IF EXISTS `patient_cure_procedure_codes`;
CREATE TABLE `patient_cure_procedure_codes`  (
  `id` int(11) NOT NULL,
  `procedure_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cure_procedure_codes
-- ----------------------------

-- ----------------------------
-- Table structure for patient_daily_final_records
-- ----------------------------
DROP TABLE IF EXISTS `patient_daily_final_records`;
CREATE TABLE `patient_daily_final_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subjective_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სუბიექტური მონაცემები',
  `objective_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ობიექტური მონაცემები',
  `conclusion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დასკვნა',
  `recommendation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეკომენდაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_daily_final_records
-- ----------------------------
INSERT INTO `patient_daily_final_records` VALUES (1, NULL, 7, '2021-12-07 10:15:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_daily_final_records_list
-- ----------------------------
DROP TABLE IF EXISTS `patient_daily_final_records_list`;
CREATE TABLE `patient_daily_final_records_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_final_records_id` int(11) NULL DEFAULT NULL,
  `entry_date` date NULL DEFAULT NULL COMMENT 'შემოსვლის დრო',
  `subjective` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სუბიექტური',
  `objective` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ობიექტური',
  `conducted_procedure` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩატარებული პროცედურა',
  `further_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შემდგომი გეგმა',
  `exit_plan_date` date NULL DEFAULT NULL COMMENT 'გასვლის გეგმა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_daily_final_records_list
-- ----------------------------
INSERT INTO `patient_daily_final_records_list` VALUES (1, 1, '2021-12-30', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_death
-- ----------------------------
DROP TABLE IF EXISTS `patient_death`;
CREATE TABLE `patient_death`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `breathing_stopped` int(11) NULL DEFAULT NULL COMMENT 'სუნთქვა შეწყვეტილია',
  `pulsation_main_arteries` int(11) NULL DEFAULT NULL COMMENT 'პულსაცია მაგისტრალურ არტერიებზე არ ისინჯება',
  `heart_tones_not_heard` int(11) NULL DEFAULT NULL COMMENT 'გულის ტონები არ მოისმინება',
  `gugs_reaction_negative` int(11) NULL DEFAULT NULL COMMENT 'გუგის რეაქცია სინათლეზე უარყოფითი',
  `death_presence` date NULL DEFAULT NULL COMMENT 'სიკვდილი თანდასწრებით',
  `corneal_reaction` int(11) NULL DEFAULT NULL COMMENT 'რქოვანას რეაქციის არ გამოვლენა',
  `corpse_spots` int(11) NULL DEFAULT NULL COMMENT 'გვამური ლაქები',
  `corpse_firing` int(11) NULL DEFAULT NULL COMMENT 'გვამური გაშეშება',
  `before_corpse_arrives` int(11) NULL DEFAULT NULL COMMENT 'გვამი მისვლამდე',
  `death_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სიკვდილი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_death
-- ----------------------------
INSERT INTO `patient_death` VALUES (1, NULL, 3, '2021-10-29 16:24:56', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1231231');

-- ----------------------------
-- Table structure for patient_digestive_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_digestive_system`;
CREATE TABLE `patient_digestive_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `breathing_act` int(11) NULL DEFAULT NULL COMMENT 'მუცელი მონაწილეობს სუნთქვის აქტში',
  `soft_abdomen` int(11) NULL DEFAULT NULL COMMENT 'რბილი',
  `abdomen_painless` int(11) NULL DEFAULT NULL COMMENT 'უმტკივნეულო',
  `abdomen_painful` int(11) NULL DEFAULT NULL COMMENT 'მტკივნეული 1 მარჯვენა ფერდქვეშა მიდამო; 2 მარცხენა ფერდქვეშა მიდამო; 3 ეპიგასტრიუმის მიდამო; 4 ჰიპოგასტრიუმის მიდამო; 5 მარჯვენა ილიოცეკალური მიდამო;',
  `abdomen_deformation` int(11) NULL DEFAULT NULL COMMENT 'დეფორმაცია',
  `abdomen_ascites` int(11) NULL DEFAULT NULL COMMENT 'ასციტი',
  `abdomen_liver` int(11) NULL DEFAULT NULL COMMENT 'ღვიძლი სცილდება საზღვრებს სმ',
  `abdomen_spleen` int(11) NULL DEFAULT NULL COMMENT 'ელენთა ისინჯება 1 კი; 2 არა;',
  `Language_dry` int(11) NULL DEFAULT NULL COMMENT 'მშრალი',
  `Language_nadebit` int(11) NULL DEFAULT NULL COMMENT 'ნადებით',
  `Language_unadebo` int(11) NULL DEFAULT NULL COMMENT 'უნადებო',
  `Language_hyperemic` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემიული',
  `Language_wet` int(11) NULL DEFAULT NULL COMMENT 'სველი',
  `shield_irritation` int(11) NULL DEFAULT NULL COMMENT 'ფარის გაღიზიანების ნიშნები 1 არა; 2 კი D; 3 კი S; 4 კი D,S;',
  `carey` int(11) NULL DEFAULT NULL COMMENT 'კერი',
  `murphy` int(11) NULL DEFAULT NULL COMMENT 'მერფი',
  `ortner` int(11) NULL DEFAULT NULL COMMENT 'ორტნერი',
  `bloomberg` int(11) NULL DEFAULT NULL COMMENT 'ბლუმბერგი',
  `obraztsov` int(11) NULL DEFAULT NULL COMMENT 'ობრაზცოვი',
  `voskresensky` int(11) NULL DEFAULT NULL COMMENT 'ვოსკრესენსკი',
  `sitkovsky` int(11) NULL DEFAULT NULL COMMENT 'სიტკოვსკი',
  `nausea` int(11) NULL DEFAULT NULL COMMENT 'გულისრევა 1 კი; 2 არა;',
  `vomiting` int(11) NULL DEFAULT NULL COMMENT 'ღებინება 1 კი; 2 არა;',
  `vomiting_frequency` int(11) NULL DEFAULT NULL COMMENT 'ღებინება (ჯერადობა)',
  `defecation_regular` int(11) NULL DEFAULT NULL COMMENT 'რეგულარული',
  `defecation_irregular` int(11) NULL DEFAULT NULL COMMENT 'არარეგულარული',
  `defecation_involuntary` int(11) NULL DEFAULT NULL COMMENT 'უნებლიე',
  `defecation_multiplicity` int(11) NULL DEFAULT NULL COMMENT 'ჯერადობა',
  `rectum_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სწორი ნაწლავი დამატებითი ინფორმაცია',
  `feces_formed` int(11) NULL DEFAULT NULL COMMENT 'ფორმირებული',
  `feces_unformed` int(11) NULL DEFAULT NULL COMMENT 'არაფორმირებული',
  `feces_mucous` int(11) NULL DEFAULT NULL COMMENT 'ლორწოვანი',
  `feces_bloody` int(11) NULL DEFAULT NULL COMMENT 'სისხლიანი',
  `feces_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'განავალი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_digestive_system
-- ----------------------------
INSERT INTO `patient_digestive_system` VALUES (1, NULL, 3, '2021-11-03 12:45:22', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_digestive_system` VALUES (2, NULL, 7, '2021-12-01 15:16:49', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_disease_diagnosis_info
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_diagnosis_info`;
CREATE TABLE `patient_disease_diagnosis_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_source` int(11) NULL DEFAULT NULL COMMENT '1. შიდა დოკუმენტი, 2. გარე დოკუმენტი',
  `document_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დოკუმენტის ნომერი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ექიმი',
  `medical_institution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო დაწესებულება',
  `adjustment_date` date NULL DEFAULT NULL COMMENT 'მომართვის თარიღი',
  `multiplicity` int(11) NULL DEFAULT NULL COMMENT 'ჯერადობა 1. პირველადი, 2. მეორადი',
  `disease_id` int(11) NULL DEFAULT NULL COMMENT 'დაავადება patient_disease_types ცხრილის იდ',
  `diagnosis_info_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `severity_of_disease` int(11) NULL DEFAULT NULL COMMENT 'დაავადების სიმძიმე 1. მსუბუქი, 2. საშუალო, 3. მძიმე, 4. კრიტიკული',
  `active_phase_disease` int(11) NULL DEFAULT NULL COMMENT 'დაავადების აქტიური ფაზა',
  `solution_of_disease` int(11) NULL DEFAULT NULL COMMENT 'დაავადების გამოსავალი 1. გამოჯანმრთელებული, 2. გაუმჯობესებული, 3. უცვლელი, 4. გაუარესება, 5. გარდაიცვალა',
  `recovered` date NULL DEFAULT NULL COMMENT 'გამოჯანმრთელდა',
  `passed_away` date NULL DEFAULT NULL COMMENT 'გარდაიცვალა',
  `cause_of_death` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გარდაცვალების მიზეზი',
  `trauma` int(11) NULL DEFAULT NULL COMMENT 'ტრამვა 1. ტერიტორიის შიგნით ფიზ. მომზადება, 2. ტერიტორიის შიგნით სხვა, 3. ტერიტორიის გარეთ',
  `trauma_where` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სად',
  `trauma_when` date NULL DEFAULT NULL COMMENT 'როდის თარიღი',
  `under_what_circumstances` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რა ვითარებაში',
  `no_damage_observed` int(11) NULL DEFAULT NULL COMMENT 'დაზიანება არ აღენიშნება',
  `injury` int(11) NULL DEFAULT NULL COMMENT 'დაზიანება 1. ჭრილობა, 2. ექსკორიაცია, 3. დეფორმაცია, 4. ამპუტაცია, 5. დამწვრობა/მოყინვა, 6. დაჟეჟილობა, 7. ნაჭდევი, 8. ღია/დახ.მოტეხილობა, 9. ღრძობა-დაჭიმულობა, 10. ჰემატომა/სისხლჩაქცევა, 11. დაზიანება, 12. ნაკბენი, 13. პოლიტრამვა',
  `injury_location` int(11) NULL DEFAULT NULL COMMENT 'მდებარეობა 1. თავი, 2. სახე, 3. თვალი, 4. კისერი, 5. გულმკერდი, 6. ზურგი, 7. მუცელი, 8. მენჯი/გენიტ, 9. კიდური ზედა, 10. კიდური ქვედა, 11. ხერხემალი',
  `injury_wound` int(11) NULL DEFAULT NULL COMMENT 'ჭრილობა 1. ნახეთქი, 2. ნაკვეთი, 3. ნაჩხვლეტ-ნაკვეთი, 4. სკალპირებული, 5. ცეცხლნასროლი, 6. ნაფლეთი, 7. ნაჩხვლეტი',
  `prolonged_bleeding` int(11) NULL DEFAULT NULL COMMENT 'გახანგრძილვებული სისხლდება',
  `prolonged_bleeding_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `infection` int(11) NULL DEFAULT NULL COMMENT 'ინფექცია',
  `allergy` int(11) NULL DEFAULT NULL COMMENT 'ალერგია',
  `allergy_type` int(11) NULL DEFAULT NULL COMMENT 'ალერგიის ტიპი 1. მედიკამენტებზე ალერგია, 2. საკვებზე ალერგია, 3. სხვა ალერგია, 4. იდიოსინკრაზია',
  `pregnancy` int(11) NULL DEFAULT NULL COMMENT 'ორსულობა',
  `note_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შენიშვნა',
  `posted` int(11) NULL DEFAULT NULL COMMENT 'გამოგზავნილი 1. ნაწილის სამედიცინო სამსახურიდან, 2. ლაზარეთიდან, 3. ჰოსპიტალიდან, 4. სამოქ. დაწესებულებიდან,5. სხვა',
  `introduced_why` int(11) NULL DEFAULT NULL COMMENT 'შემოყვანილია 1. სასწრაფო ჩვენებით, 2. გეგმიურად',
  `hours_later` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საათის შემდეგ',
  `introduced` int(11) NULL DEFAULT NULL COMMENT 'შემოყვანილი 1. დაავადების დაწყებიდან, 2. ტრამვის მიღებიდან, 3. მოწამვლიდან',
  `hospitalized_this_year` int(11) NULL DEFAULT NULL COMMENT 'ჰოსპიტალიზებულია მიმდინარე წელს 1. პირველადი, 2. განმეორებითი',
  `transferred_civilian_clinic` int(11) NULL DEFAULT NULL COMMENT 'სამოქალაქო კლინიკაში გადაგზავნა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_diagnosis_info
-- ----------------------------
INSERT INTO `patient_disease_diagnosis_info` VALUES (1, NULL, 7, '2021-12-07 14:31:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_disease_diagnosis_info_appeal
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_diagnosis_info_appeal`;
CREATE TABLE `patient_disease_diagnosis_info_appeal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NULL DEFAULT NULL COMMENT 'patient_disease_diagnosis_info იდ',
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სტრ. ერთეული',
  `specialist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სპეციალისტი',
  `addressee_doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ადრესატი ექიმი',
  `date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `condition_meet` int(11) NULL DEFAULT NULL COMMENT 'მდგომარეობა 1. გეგმიური, 2. სასწრაფო',
  `information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფორმაცია',
  `civilian_specialist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სპეციალისტი',
  `civilian_structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'კლინიკები',
  `civilian_addressee_doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ადრესატი ექიმი',
  `civilian_date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `civilian_condition` int(11) NULL DEFAULT NULL COMMENT 'მდგომარეობა 1. გეგმიური, 2. სასწრაფო',
  `civilian_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_diagnosis_info_appeal
-- ----------------------------

-- ----------------------------
-- Table structure for patient_disease_diagnosis_info_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_diagnosis_info_files`;
CREATE TABLE `patient_disease_diagnosis_info_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NULL DEFAULT NULL,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_diagnosis_info_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_disease_diagnosis_info_recipient
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_diagnosis_info_recipient`;
CREATE TABLE `patient_disease_diagnosis_info_recipient`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NULL DEFAULT NULL,
  `name_surname` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სახელი/გვარი',
  `structure` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სტრ. ერთეული',
  `date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_diagnosis_info_recipient
-- ----------------------------

-- ----------------------------
-- Table structure for patient_disease_diagnosis_info_types
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_diagnosis_info_types`;
CREATE TABLE `patient_disease_diagnosis_info_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NULL DEFAULT NULL COMMENT 'patient_disease_diagnosis_info იდ',
  `type_of_diagnosis` int(11) NULL DEFAULT NULL COMMENT 'დიაგნოზის ტიპი 1. დიაგნოზი შემოსვლისას, 2. კლინიკური დიაგნოზი, 3. დასკვნითი კლინიკური დიაგნოზი, 4. ძირითადი ჰისტომორფოლოგიური დიაგნოზი, 5. ძირითადი ჰისტომორფოლოგიური გართულება, 6. თანმხლები ჰისტომორფოლოგიური დაავადება, 7. ძირითადი დაავადების გართულება, 8. თანმხლები დაავადება',
  `diagnos_disease_id` int(11) NULL DEFAULT NULL COMMENT 'დაავადება patient_disease_types ცხრილის იდ',
  `diagnos_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'კოდი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `diagnos_type_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_diagnosis_info_types
-- ----------------------------

-- ----------------------------
-- Table structure for patient_disease_types
-- ----------------------------
DROP TABLE IF EXISTS `patient_disease_types`;
CREATE TABLE `patient_disease_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_disease_types
-- ----------------------------

-- ----------------------------
-- Table structure for patient_doctor_record_duty
-- ----------------------------
DROP TABLE IF EXISTS `patient_doctor_record_duty`;
CREATE TABLE `patient_doctor_record_duty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_record` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მორიგე ექიმის ჩანაწერი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_doctor_record_duty
-- ----------------------------

-- ----------------------------
-- Table structure for patient_endocrine_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_endocrine_system`;
CREATE TABLE `patient_endocrine_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიების გარეშე',
  `subcutaneous_adipose_tissue` int(11) NULL DEFAULT NULL COMMENT 'კანქვეშა ცხიმოვანი ქსოვილი 1. ნორმის ფარგლებში;2. ზომიერი;3. ჭარბი;',
  `subcutaneous_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `hairs` int(11) NULL DEFAULT NULL COMMENT 'თმიანობა 1. მამაკაცის; 2. ქალის;',
  `correspond_sex` int(11) NULL DEFAULT NULL COMMENT 'გარეთა სასქესო ნიშნები სქესს შეესაბამება 1. კი; 2. არა;',
  `endocrine_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ენდოკრინული სისტემა დამატებითი ინფორმაცია',
  `size` int(11) NULL DEFAULT NULL COMMENT 'ზომა 1. ნორმის ფარგლებში; 2. არ ისინჯება;',
  `size_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `consistency` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კონსისტენცია',
  `pain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მტკივნეულობა',
  `pain_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_endocrine_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_genital_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_genital_system`;
CREATE TABLE `patient_genital_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `urination` int(11) NULL DEFAULT NULL COMMENT 'შარდვა 1. თავისუფალი; 2. გაძნელებული; 3. მტკივნეული; 4. უნებლიე; 5. ჰემატურია; 6. ანურია;',
  `kidney` int(11) NULL DEFAULT NULL COMMENT 'თირკმელი 1. ისინჯება D; 2. ისინჯება S; 3. ისინჯება DS; 4. არ ისინჯება D; 5. არ ისინჯება S; 6. არ ისინჯება DS;',
  `shock_syndrome` int(11) NULL DEFAULT NULL COMMENT 'დარტყმის სინდრომი 1. დადებითი D; 2. დადებითი S; 3. დადებითი DS; 4. უარყოფითი D; 5. უარყოფითი S; 6. უარყოფითი DS;',
  `pregnancy` int(11) NULL DEFAULT NULL COMMENT 'ორსულობა 1. კი; 2. არა;',
  `discharge_from_genitals` int(11) NULL DEFAULT NULL COMMENT 'გამონადენი სასქესო ორგანოდან 1. ლორწოვანი; 2. სისხლიანი; 3. ჩირქოვანი; 4. სეროზული; 5. არ არის;',
  `genital_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შარდ-სასქესო სისტემა დამატებითი ინფორმაცია',
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიების გარეშე/ნორმის ფარგლებში',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_genital_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_history
-- ----------------------------
DROP TABLE IF EXISTS `patient_history`;
CREATE TABLE `patient_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL COMMENT '1 მამრობითი , 2 მდედრობითი',
  `blood_group` int(11) NULL DEFAULT NULL,
  `rhesus` int(11) NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NULL DEFAULT 1 COMMENT '1 აქტიური , დახურული',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_history
-- ----------------------------
INSERT INTO `patient_history` VALUES (1, 'HIS0001', 'გიორგი', 'მელელაშვილი', '01019074079', '1994-10-04', 1, 2, 1, '2021-10-18 11:49:42', 1);
INSERT INTO `patient_history` VALUES (2, NULL, 'sadasdasd', 'asdasd', '01019074070', '2021-10-21', 1, 2, 2, '2021-10-21 17:09:41', 1);
INSERT INTO `patient_history` VALUES (3, NULL, 'ზურაბ', 'არევაძე', '01023008831', '1989-09-26', 1, 3, 3, '2021-10-26 10:39:57', 1);
INSERT INTO `patient_history` VALUES (4, NULL, 'ნატო', 'ბადაგაძე', '01033002799', '1983-02-26', 2, 1, NULL, '2021-11-29 14:21:13', 1);
INSERT INTO `patient_history` VALUES (5, NULL, 'ტესტ სახელი 1', 'ტესტ გვარი 1', '11111111111', NULL, 1, 2, 4, '2021-11-29 14:21:32', 1);

-- ----------------------------
-- Table structure for patient_immunization
-- ----------------------------
DROP TABLE IF EXISTS `patient_immunization`;
CREATE TABLE `patient_immunization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_type` int(11) NULL DEFAULT NULL COMMENT 'დოკუმენტის წყარო 1. შიდა დოკუმენტი , 2. გარე დოკუმენტი',
  `document_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დოკუმენტის ნომერი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ექიმი',
  `medical_institution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო დაწესებულება',
  `vaccine_date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `vaccine` int(11) NULL DEFAULT NULL COMMENT 'Vaccine',
  `not_require_revaccination` int(11) NULL DEFAULT NULL COMMENT 'არ საჭიროებს რევაქცინაციას',
  `revaccination` date NULL DEFAULT NULL COMMENT 'რევაქცინაცია',
  `contraindications` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'უკუჩვენება',
  `further_complication_vaccination` int(11) NULL DEFAULT NULL COMMENT 'აცრის შემდგომი გართულება 1. მძიმე ადგილობრივი რეაქცია, 2. ლიმფადენტი, 3. ჰიპერმია და შეშუპება 7-8 სმ-ზე მეტი დიამეტრის,4. მწვავე დუნე დამბლა, 5. გიენ-ბარეს სინდრომი, 6. ენცეფალოპათია, 7.7. ენცეფალიტი',
  `lot_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ლოტ ნომერი',
  `patient_rejection` int(11) NULL DEFAULT NULL COMMENT 'პაციენტის უარი',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_immunization
-- ----------------------------
INSERT INTO `patient_immunization` VALUES (1, NULL, 7, '2021-12-02 17:04:22', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-12-02', NULL, NULL, '2021-12-10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_immunization` VALUES (2, NULL, 7, '2021-12-10 17:27:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-10', NULL, 1, '2021-12-10', 'test', NULL, 'test', 1, 'test');
INSERT INTO `patient_immunization` VALUES (3, NULL, 7, '2021-12-10 17:54:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-10', NULL, 1, '2021-12-10', 'test', NULL, 'test', 1, 'test');
INSERT INTO `patient_immunization` VALUES (4, NULL, 7, '2021-12-14 11:09:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14', NULL, 1, '2021-12-14', 'test', NULL, 'test', 1, 'test');

-- ----------------------------
-- Table structure for patient_immunization_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_immunization_files`;
CREATE TABLE `patient_immunization_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `immunization_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_immunization_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_immunization_requirements
-- ----------------------------
DROP TABLE IF EXISTS `patient_immunization_requirements`;
CREATE TABLE `patient_immunization_requirements`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_type` int(11) NULL DEFAULT NULL COMMENT 'დოკუმენტის წყარო 1. შიდა დოკუმენტი , 2. გარე დოკუმენტი',
  `document_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დოკუმენტის ნომერი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ექიმი',
  `medical_institution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო დაწესებულება',
  `patient` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'პაციენიტი - პირადი ნომრის ჩაწერის ველი',
  `immunizationt_date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `vaccine` int(11) NULL DEFAULT NULL COMMENT 'Vaccine - ასარჩევი ველი ლაივ ძებნის შესაძლებლობით',
  `not_require_revaccination` int(11) NULL DEFAULT NULL COMMENT 'არ საჭიროებს რევაქცინაციას',
  `revaccination_date` date NULL DEFAULT NULL COMMENT 'რევაქცინაცია',
  `contraindications` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'უკუჩვენება',
  `further_complication_vaccination` int(11) NULL DEFAULT NULL COMMENT 'აცრის შემდგომი გართულება 1. მძიმე ადგილობრივი რეაქცია, 2. ლიმფადენტი, 3. ჰიპერმია და შეშუპება 7-8 სმ-ზე მეტი დიამეტრის, 4. მწვავე დუნე დამბლა, 5. გიენ-ბარეს სინდრომი, 6. ენცეფალოპათია, 7. ენცეფალიტი',
  `lot_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ლოტ ნომერი',
  `patient_rejection` int(11) NULL DEFAULT NULL COMMENT 'პაციენტის უარი',
  `immunizationt_additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_immunization_requirements
-- ----------------------------

-- ----------------------------
-- Table structure for patient_immunization_requirements_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_immunization_requirements_files`;
CREATE TABLE `patient_immunization_requirements_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requirements_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_immunization_requirements_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_immunization_vaccines
-- ----------------------------
DROP TABLE IF EXISTS `patient_immunization_vaccines`;
CREATE TABLE `patient_immunization_vaccines`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vaccine_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_immunization_vaccines
-- ----------------------------

-- ----------------------------
-- Table structure for patient_important_medical_information
-- ----------------------------
DROP TABLE IF EXISTS `patient_important_medical_information`;
CREATE TABLE `patient_important_medical_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_important_medical_information
-- ----------------------------

-- ----------------------------
-- Table structure for patient_important_medical_information_child
-- ----------------------------
DROP TABLE IF EXISTS `patient_important_medical_information_child`;
CREATE TABLE `patient_important_medical_information_child`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `information_id` int(11) NULL DEFAULT NULL,
  `information_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფორმაცია',
  `information_date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `doctor_id` int(11) NULL DEFAULT NULL COMMENT 'ექიმი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_important_medical_information_child
-- ----------------------------

-- ----------------------------
-- Table structure for patient_laboratory_tests
-- ----------------------------
DROP TABLE IF EXISTS `patient_laboratory_tests`;
CREATE TABLE `patient_laboratory_tests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Test_code` int(11) NULL DEFAULT NULL COMMENT 'ტესტის კოდი',
  `Test_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ტესტი ტიპი',
  `Test_date` date NULL DEFAULT NULL COMMENT 'ტესტის თარიღი',
  `demanding_doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'მომთხოვნი ექიმი',
  `Cyto` int(11) NULL DEFAULT NULL COMMENT 'ციტო',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_laboratory_tests
-- ----------------------------

-- ----------------------------
-- Table structure for patient_lymphatic_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_lymphatic_system`;
CREATE TABLE `patient_lymphatic_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიების გარეშე',
  `peripheral_lymph_nodes` int(11) NULL DEFAULT NULL COMMENT 'პერიფერიული ლიმფური კვნაძები 1. ისინჯება, 2. არ ისინჯება',
  `front_side_neck` int(11) NULL DEFAULT NULL COMMENT 'კისრის წინა გვერდითი მიდამო',
  `back_side_neck` int(11) NULL DEFAULT NULL COMMENT 'კისრის უკანა გვერდითი მიდამო',
  `under_jaw` int(11) NULL DEFAULT NULL COMMENT 'ყბისქვეშა მიდამო',
  `sublingual_area` int(11) NULL DEFAULT NULL COMMENT 'ენისქვეშა მიდამო',
  `under_hips` int(11) NULL DEFAULT NULL COMMENT 'იღლიისქვეშა მიდამო',
  `around_abdomen` int(11) NULL DEFAULT NULL COMMENT 'საზარდულის მიდამო',
  `size` int(11) NULL DEFAULT NULL COMMENT 'ზომა (სმ)',
  `consistency` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კონსისტენცია',
  `pain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მტკივნეულობა',
  `movement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მოძრაობა',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `lymphatic_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ლიმფური სისტემა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_lymphatic_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_medical_card
-- ----------------------------
DROP TABLE IF EXISTS `patient_medical_card`;
CREATE TABLE `patient_medical_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personality_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პიროვნების მონაცემები',
  `urogenital_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შარდ-სასქესო სისტემა',
  `cardiovascular_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გულ-სისხლძარღვთა სისტემა',
  `endocrine_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ენდოკრინული სისტემა',
  `breathing_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სასუნთქი სისტემა',
  `digestive_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საჭმლის მომნელებელი სისტემა',
  `nervous_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნერვული სისტემა',
  `musculoskeletal_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ძვალ-სახსროვანი სისტემა',
  `memory` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მეხსიერება',
  `emotional_realm` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ემოციური სფერო',
  `speech` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მეტყველება',
  `awareness` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცნობიერება',
  `occupational_therapy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოკუპაციური თერაპია',
  `physical_therapy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფიზიკური თერაპია',
  `prosthetics_orthopedics` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პროტეზისტის-ორთოპედია',
  `orthopedic_assistant` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ორთოპედის ასისტენტი',
  `evaluation_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შეფასების შედეგი',
  `consultations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კონსულტაციები',
  `preliminary_diagnosis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'წინასწარი დიაგნოზი',
  `required_examinations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საჭირო გამოკვლევები',
  `final_diagnosis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საბოლოო დიაგნოზი',
  `rehabilitation_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეაბილიტაციის გეგმა',
  `necessary_aids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საჭირო დამხმარე საშუალებები',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medical_card
-- ----------------------------
INSERT INTO `patient_medical_card` VALUES (1, NULL, 7, '2021-12-01 15:28:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdfsdfsdf', NULL);
INSERT INTO `patient_medical_card` VALUES (2, NULL, 7, '2021-12-07 17:15:59', NULL, NULL, NULL, 'asdf', 'asdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_medications
-- ----------------------------
DROP TABLE IF EXISTS `patient_medications`;
CREATE TABLE `patient_medications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_type` int(11) NULL DEFAULT NULL COMMENT 'დოკუმენტის წყარო 1. შიდა დოკუმენტი , 2. გარე დოკუმენტი',
  `document_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დოკუმენტის ნომერი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ექიმი',
  `medical_institution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო დაწესებულება',
  `current` int(11) NULL DEFAULT NULL COMMENT 'მიმდინარე',
  `indication` int(11) NULL DEFAULT NULL COMMENT 'ჩვენება - ასარჩევი ველი ლაივ ძებნის რეჟიმი',
  `begin_treatment` date NULL DEFAULT NULL COMMENT 'მკურნალობის დასაწყისი',
  `end_treatment` date NULL DEFAULT NULL COMMENT 'მკურნალობის დასასრული',
  `course_over` int(11) NULL DEFAULT NULL COMMENT 'კურსი დასრულებულია',
  `terminated_medication` int(11) NULL DEFAULT NULL COMMENT 'შეწყვეტილია',
  `termination_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შეწყვეტის მიზეზი',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შენიშვნა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medications
-- ----------------------------

-- ----------------------------
-- Table structure for patient_medications_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_medications_files`;
CREATE TABLE `patient_medications_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `medications_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medications_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_medications_indications
-- ----------------------------
DROP TABLE IF EXISTS `patient_medications_indications`;
CREATE TABLE `patient_medications_indications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indications` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medications_indications
-- ----------------------------

-- ----------------------------
-- Table structure for patient_medications_meds
-- ----------------------------
DROP TABLE IF EXISTS `patient_medications_meds`;
CREATE TABLE `patient_medications_meds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medications_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL COMMENT 'Product',
  `issuance_type` int(11) NULL DEFAULT NULL COMMENT 'გაცემის ტიპი 1. I , 2. II, 3. III',
  `dosage_form` int(11) NULL DEFAULT NULL COMMENT 'წამლის ფორმა 1. აბი, 2. ფლაკონი, 3. კაფსულა, 4. ცალი',
  `units_measurement` int(11) NULL DEFAULT NULL COMMENT 'ზომის ერთეული 1. სმ, 2. დღე(ები), 3. გრამი',
  `quantity` int(11) NULL DEFAULT NULL COMMENT 'რაოდენობა',
  `receipt_form` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მიღების ფორმა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medications_meds
-- ----------------------------

-- ----------------------------
-- Table structure for patient_medications_products
-- ----------------------------
DROP TABLE IF EXISTS `patient_medications_products`;
CREATE TABLE `patient_medications_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_medications_products
-- ----------------------------

-- ----------------------------
-- Table structure for patient_military_medical_commission
-- ----------------------------
DROP TABLE IF EXISTS `patient_military_medical_commission`;
CREATE TABLE `patient_military_medical_commission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `military_Medical_commission` int(11) NULL DEFAULT NULL COMMENT 'სამხედრო-საექიმო კომისიაზე გაგზავნა',
  `medical_characterization` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სამედიცინო დახასიათება',
  `job_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სამსახურებრივი დახასიათება',
  `release_commission` int(11) NULL DEFAULT NULL COMMENT 'გათავისუფლება 1. სრული, 2. ნაწილობრივ, 3. სამკურნალო შვებულება',
  `begin_date` date NULL DEFAULT NULL COMMENT 'დასაწყისი',
  `end_date` date NULL DEFAULT NULL COMMENT 'დასასრული',
  `recommendation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეკომენდაცია',
  `commander_decision` int(11) NULL DEFAULT NULL COMMENT 'მეთაურის (უფროსის) გადაწყვეტილება 1. ეთანხმება, 2. არ ეთანხმება',
  `reason_rejection` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'უარყოფის მიზეზი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_military_medical_commission
-- ----------------------------
INSERT INTO `patient_military_medical_commission` VALUES (1, NULL, 7, '2021-12-10 17:48:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_military_medical_commission_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_military_medical_commission_files`;
CREATE TABLE `patient_military_medical_commission_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_commission_id` int(11) NOT NULL,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_type` int(11) NULL DEFAULT NULL COMMENT '1 ზედა ფაილი 2 ქვედა ფაილი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_military_medical_commission_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_mouth
-- ----------------------------
DROP TABLE IF EXISTS `patient_mouth`;
CREATE TABLE `patient_mouth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიების გარეშე/ნორმის ფარგლებში',
  `diseased_teeth` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დაავადებული კბილ(ებ)ი',
  `causal_pain` int(11) NULL DEFAULT NULL COMMENT 'გამღიზიანებლით გამოწვეული მიზეზობრივი ხასიათის ტკივილი',
  `pain_when_pressing` int(11) NULL DEFAULT NULL COMMENT 'ტკივილი კბილის კბილზე დაჭერისას',
  `pain_of_deaf` int(11) NULL DEFAULT NULL COMMENT 'ყრუ ხასიათის ტკივილი',
  `pain_of_arbitrary` int(11) NULL DEFAULT NULL COMMENT 'თვითნებითი ხასიათის ტკივილი',
  `night_pain` int(11) NULL DEFAULT NULL COMMENT 'ღამის ტკივილი',
  `aesthetic_discomfort` int(11) NULL DEFAULT NULL COMMENT 'ესთეტიკური დისკომფორტი',
  `bjen_defect` int(11) NULL DEFAULT NULL COMMENT 'ბჟენის დეფექტი',
  `crown_defect` int(11) NULL DEFAULT NULL COMMENT 'გვირგვინის დეფექტი',
  `root` int(11) NULL DEFAULT NULL COMMENT 'ფესვი',
  `facial_asymmetry` int(11) NULL DEFAULT NULL COMMENT 'სახის ასიმეტრია',
  `existence_deposits` int(11) NULL DEFAULT NULL COMMENT 'ქვისა და რბილი ნადების არსებობა',
  `bleeding_gums` int(11) NULL DEFAULT NULL COMMENT 'სისხლდენა ღრძილებიდან',
  `adentia` int(11) NULL DEFAULT NULL COMMENT 'ადენტია',
  `halitosis` int(11) NULL DEFAULT NULL COMMENT 'ჰალითოზი',
  `joint_pathology` int(11) NULL DEFAULT NULL COMMENT 'საფეთქელ-ქვედა ყბის სახსრის პათოლოგია',
  `mouth_other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `occlusion_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'თანკბილვა',
  `mouth_condition_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პირის ღრუს ლორწოვანი გარსის მდგომარეობა',
  `defect_localization_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დეფექტის ლოკალიზაცია',
  `caries` int(11) NULL DEFAULT NULL COMMENT 'კარიესი',
  `archaic_caries_disease` int(11) NULL DEFAULT NULL COMMENT 'არქაკარიესული დაავადება',
  `pulpit` int(11) NULL DEFAULT NULL COMMENT 'პულპიტი',
  `periodontitis` int(11) NULL DEFAULT NULL COMMENT 'პერიოდონტიტი',
  `bjeni` int(11) NULL DEFAULT NULL COMMENT 'ბჟენი',
  `artificial_teeth` int(11) NULL DEFAULT NULL COMMENT 'ხელოვნური კბილი',
  `artificial_crown` int(11) NULL DEFAULT NULL COMMENT 'ხელოვნური გვირგვინი',
  `degree_tooth_extraction` int(11) NULL DEFAULT NULL COMMENT 'კბილის მორყევის ხარისხი 1. I; 2. II; 3. III;',
  `extruded_tooth` int(11) NULL DEFAULT NULL COMMENT 'ექსტრაგირებული კბილი',
  `tooth_root` int(11) NULL DEFAULT NULL COMMENT 'ფესვი',
  `swelling` int(11) NULL DEFAULT NULL COMMENT 'შეშუპება',
  `hyperemia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემია',
  `cyanosis` int(11) NULL DEFAULT NULL COMMENT 'ციანოზი',
  `retraction` int(11) NULL DEFAULT NULL COMMENT 'რეტრაქცია',
  `hypertrophy` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერტროფია',
  `bleeding` int(11) NULL DEFAULT NULL COMMENT 'სისხლდენა',
  `bone_pocket` int(11) NULL DEFAULT NULL COMMENT 'ძვლოვანი ჯიბე',
  `ridge_atrophy` int(11) NULL DEFAULT NULL COMMENT 'ალვეოლური მორჩის ატროფია',
  `periodontal_pocket` int(11) NULL DEFAULT NULL COMMENT 'პაროდონტული ჯიბე',
  `periodontal_pocket_depth` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პაროდონტული ჯიბის სიღრმე',
  `periodontal_other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `not_observed` int(11) NULL DEFAULT NULL COMMENT 'არ აღენიშნება',
  `soft` int(11) NULL DEFAULT NULL COMMENT 'რბილი',
  `pigmented` int(11) NULL DEFAULT NULL COMMENT 'პიგმენტური',
  `tough` int(11) NULL DEFAULT NULL COMMENT 'მაგარი',
  `gingival` int(11) NULL DEFAULT NULL COMMENT 'ღრძილზედა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_mouth
-- ----------------------------

-- ----------------------------
-- Table structure for patient_mouth_teeth
-- ----------------------------
DROP TABLE IF EXISTS `patient_mouth_teeth`;
CREATE TABLE `patient_mouth_teeth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `teeth_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teeth_number` int(11) NULL DEFAULT NULL COMMENT 'კბილის ნომერი',
  `non_carious_disease` int(11) NULL DEFAULT NULL COMMENT 'არაკარიესული დაავადება',
  `caries` int(11) NULL DEFAULT NULL COMMENT 'კარიესი',
  `pulpit` int(11) NULL DEFAULT NULL COMMENT 'პულპიტი',
  `periodontitis` int(11) NULL DEFAULT NULL COMMENT 'პერიოდონტიტი',
  `adentia_uncut` int(11) NULL DEFAULT NULL COMMENT 'ადენტია (ამოუჭრელი)',
  `adentia` int(11) NULL DEFAULT NULL COMMENT 'ადენტია',
  `adentia_retensive` int(11) NULL DEFAULT NULL COMMENT 'ადენტია (რეტენციული)',
  `bjeni` int(11) NULL DEFAULT NULL COMMENT 'ბჟენი',
  `vibration_1` int(11) NULL DEFAULT NULL COMMENT 'მორყევის ხარისხი I',
  `vibration_2` int(11) NULL DEFAULT NULL COMMENT 'მორყევის ხარისხი II',
  `vibration_3` int(11) NULL DEFAULT NULL COMMENT 'მორყევის ხარისხი III',
  `implant` int(11) NULL DEFAULT NULL COMMENT 'იმპლანტატი',
  `artificial_crown` int(11) NULL DEFAULT NULL COMMENT 'ხელოვნური გვირგვინი',
  `bridge_prosthesis` int(11) NULL DEFAULT NULL COMMENT 'ხიდისებური პროთეზი',
  `removable_prosthesis` int(11) NULL DEFAULT NULL COMMENT 'მოსახსნელი პროთეზი',
  `teeth_root` int(11) NULL DEFAULT NULL COMMENT 'ფესვი',
  `healthy` int(11) NULL DEFAULT NULL COMMENT 'ჯანმრთელი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_mouth_teeth
-- ----------------------------

-- ----------------------------
-- Table structure for patient_musculoskeletal_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_musculoskeletal_system`;
CREATE TABLE `patient_musculoskeletal_system`  (
  `id` int(11) NOT NULL,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე',
  `muscular_development` int(11) NULL DEFAULT NULL COMMENT 'კუნთოვანი განვითარება 2. საშუალო; 3. კარგი;',
  `movement_joints` int(11) NULL DEFAULT NULL COMMENT 'მოძრაობა სახსრებში 1. თავისუფალი; 2. შეზღუდული; 3. მტკივნეული;',
  `musculoskeletal_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საყრდენ-მამოძრავებელი აპარატი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_musculoskeletal_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_nervous_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_nervous_system`;
CREATE TABLE `patient_nervous_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ ნორმის ფარგლებში',
  `excited` int(11) NULL DEFAULT NULL COMMENT 'აგზნებული',
  `aggressive` int(11) NULL DEFAULT NULL COMMENT 'აგრესიული',
  `aggression_cannot_revealed` int(11) NULL DEFAULT NULL COMMENT 'აგრესია ვერ ვლინდება',
  `aggression_physical` int(11) NULL DEFAULT NULL COMMENT 'აგრესია ფიზიკური',
  `orientation_time` int(11) NULL DEFAULT NULL COMMENT 'ორიენტაცია დროში: 1. კი ,2. არა',
  `orientation_space` int(11) NULL DEFAULT NULL COMMENT 'ორიენტაცია სივრცეში:: 1. კი ,2. არა',
  `orientation_environment` int(11) NULL DEFAULT NULL COMMENT 'ორიენტაცია გარემოში:: 1. კი ,2. არა',
  `facial_asymmetry` int(11) NULL DEFAULT NULL COMMENT 'სახის ასიმეტრია',
  `speech_difficulty` int(11) NULL DEFAULT NULL COMMENT 'მეტყველების გაძნელება',
  `disruption_coordination` int(11) NULL DEFAULT NULL COMMENT 'კოორდინაციის მოშლა',
  `skull_nerves` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ქალა-ტვინის ნერვები',
  `reflective_sphere` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფლექტურული სფერო',
  `driving_field` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მამოძრავებლი სფერო',
  `romberg_pose` int(11) NULL DEFAULT NULL COMMENT 'რომბერგის პოზა: 1. მყარი, 2. არამყარი',
  `nose_finger_test` int(11) NULL DEFAULT NULL COMMENT 'ცხვირ-თითის სინჯი: 1. ასრულებს, 2. ვერ ასრულებს',
  `nervous_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნერვული სისტემა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_nervous_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_occupational_therapy
-- ----------------------------
DROP TABLE IF EXISTS `patient_occupational_therapy`;
CREATE TABLE `patient_occupational_therapy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dominant_hand` int(11) NULL DEFAULT NULL COMMENT 'დომინანტი ხელი 1. მარჯვენა , 2. მარცხენა',
  `pain_scale` int(11) NULL DEFAULT NULL COMMENT 'ტკივილის შკალა - ასარჩევი ველი (რიცხვები 1-დან 10-მდე)',
  `arom_prom` int(11) NULL DEFAULT NULL COMMENT 'AROM/PROM',
  `strength_upper_limb` int(11) NULL DEFAULT NULL COMMENT 'ძალა ზედა კიდურში - ასარჩევი ველი (რიცხვები 1-დან 10-მდე)',
  `patient_safety` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პაციენტის უსაფრთხოება',
  `sensitivity` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მგრძნობელობა',
  `purpose_of_patient` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პაციენტის მიზანი',
  `eating` int(11) NULL DEFAULT NULL COMMENT 'ჭამა 1. დამოუკიდებლად, 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება, 4. დამოკიდებულია',
  `personal_hygiene` int(11) NULL DEFAULT NULL COMMENT 'პირადი ჰიგიენა 1. დამოუკიდებლად, 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება , 4. დამოკიდებულია',
  `bathing_upper_limbs` int(11) NULL DEFAULT NULL COMMENT 'ზედა კიდურების დაბანა 1. დამოუკიდებლად , 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება, 4. დამოკიდებულია',
  `bathing_lower_limbs` int(11) NULL DEFAULT NULL COMMENT 'ქვედა კიდურების დაბანა 1. დამოუკიდებლად, 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება, 4. დამოკიდებულია',
  `dress_upper_limb` int(11) NULL DEFAULT NULL COMMENT 'ზედა კიდურზე ჩაცმა 1. დამოუკიდებლად , 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება, 4. დამოკიდებულია',
  `dress_lower_limb` int(11) NULL DEFAULT NULL COMMENT 'ქვედა კიდურზე ჩაცმა 1. დამოუკიდებლად, 2. დამხმარე საშუალებები, 3. ესაჭიროება დახმარება, 4. დამოკიდებულია',
  `transfer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტრანსფერი',
  `cooking` int(11) NULL DEFAULT NULL COMMENT 'საჭმლის მომზადება',
  `cleaning` int(11) NULL DEFAULT NULL COMMENT 'დასუფთავება',
  `washing` int(11) NULL DEFAULT NULL COMMENT 'სარეცხი',
  `shopping` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საყიდლები',
  `communication` int(11) NULL DEFAULT NULL COMMENT 'კომუნიკაცია',
  `driving_car` int(11) NULL DEFAULT NULL COMMENT 'მანქანის მართვა',
  `left_shoulder_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი გაშლა-ამოხრა',
  `left_shoulder_abduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი აბდუქცია',
  `left_shoulder_horizontal_unfolding` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი ჰორიზონტალური გაშლა',
  `left_shoulder_horizontal_bending` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი ჰორიზონტალური მოხრა',
  `left_shoulder_rotate_inside` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი შიგნით როტაცია',
  `left_shoulder_out_rotation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა მხრის სახსარი გარეთ როტაცია',
  `right_shoulder_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი გაშლა-ამოხრა',
  `right_shoulder_abduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი აბდუქცია',
  `right_shoulder_horizontal_unfolding` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი ჰორიზონტალური გაშლა',
  `right_shoulder_horizontal_bending` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი ჰორიზონტალური მოხრა',
  `right_shoulder_rotate_inside` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი შიგნით როტაცია',
  `right_shoulder_out_rotation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა მხრის სახსარი გარეთ როტაცია',
  `left_elbow_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხვენა იდაყვის სახსარი/წინამხარი გაშლა/მოხრა',
  `left_elbow_pronation_supination` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხვენა იდაყვის სახსარი/წინამხარი პრონაცია/სუპინაცია',
  `right_elbow_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა იდაყვის სახსარი/წინამხარი გაშლა/მოხრა',
  `right_elbow_pronation_supination` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა იდაყვის სახსარი/წინამხარი პრონაცია/სუპინაცია',
  `left_wrist_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა სხივ-მაჯის სახსარი გაშლა/მოხრა',
  `left_wrist_ulnar_deviation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა სხივ-მაჯის სახსარი ულნარული დევიაცია',
  `left_wrist_radial_deviation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა სხივ-მაჯის სახსარი რადიალური დევიაცია',
  `right_wrist_unfold` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა სხივ-მაჯის სახსარი გაშლა/მოხრა',
  `right_wrist_ulnar_deviation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა სხივ-მაჯის სახსარი ულნარული დევიაცია',
  `right_wrist_radial_deviation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა სხივ-მაჯის სახსარი რადიალური დევიაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_occupational_therapy
-- ----------------------------
INSERT INTO `patient_occupational_therapy` VALUES (1, NULL, 7, '2021-12-01 15:34:58', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_occupational_therapy` VALUES (2, NULL, 7, '2021-12-01 15:35:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_occupational_therapy_table_left
-- ----------------------------
DROP TABLE IF EXISTS `patient_occupational_therapy_table_left`;
CREATE TABLE `patient_occupational_therapy_table_left`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occupational_therapy_id` int(11) NULL DEFAULT NULL,
  `mcp_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `mcp_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `mcp_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `mcp_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `mcp_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  `pip_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `pip_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `pip_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `pip_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `pip_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  `dip_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `dip_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `dip_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `dip_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `dip_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_occupational_therapy_table_left
-- ----------------------------
INSERT INTO `patient_occupational_therapy_table_left` VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_occupational_therapy_table_left` VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_occupational_therapy_table_right
-- ----------------------------
DROP TABLE IF EXISTS `patient_occupational_therapy_table_right`;
CREATE TABLE `patient_occupational_therapy_table_right`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occupational_therapy_id` int(11) NULL DEFAULT NULL,
  `mcp_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `mcp_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `mcp_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `mcp_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `mcp_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  `pip_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `pip_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `pip_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `pip_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `pip_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  `dip_th` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'TH 1',
  `dip_if` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IF 2',
  `dip_mf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MF 3',
  `dip_rf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'RF 4',
  `dip_sf` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SF 5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_occupational_therapy_table_right
-- ----------------------------
INSERT INTO `patient_occupational_therapy_table_right` VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_occupational_therapy_table_right` VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_operations
-- ----------------------------
DROP TABLE IF EXISTS `patient_operations`;
CREATE TABLE `patient_operations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_type` int(11) NULL DEFAULT NULL COMMENT 'დოკუმენტის წყარო 1. შიდა დოკუმენტი , 2. გარე დოკუმენტი',
  `document_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დოკუმენტის ნომერი',
  `create_date` date NULL DEFAULT NULL COMMENT 'შექმნის თარიღი',
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ექიმი',
  `medical_institution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამედიცინო დაწესებულება',
  `protocol_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'პროტოკოლის ნომერი',
  `operation_id` int(11) NULL DEFAULT NULL COMMENT 'ოპერაციის დასახელება',
  `operation_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოპერაციის აღწერა',
  `department` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'განყოფილება',
  `card_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ბარათის ნომერი',
  `pain_relief` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გაუტკივარება',
  `operation_type` int(11) NULL DEFAULT NULL COMMENT 'ოპერაციის ტიპი 1. მცირე , 2. სასწრაფო, 3. გეგმიური',
  `operation_date` date NULL DEFAULT NULL COMMENT 'ოპერაციის თარიღი',
  `operation_end_date` date NULL DEFAULT NULL COMMENT 'ოპერაციის დასრულების თარიღი',
  `operation_duration` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოპერაციის ხანგრძლივობა',
  `processing_operating` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საოპერაციო არის დამუშავება',
  `area` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'არე',
  `size` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ზომა',
  `direction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მიმართულება',
  `layers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შრეები',
  `abnormal_changes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოპერაციის დროს გამოვლენილი პათოლოგიური ცვლილებები',
  `intraoperative_diagnosis` int(11) NULL DEFAULT NULL COMMENT 'ინტრაოპერაციული დიაგნოზი - ასარჩევი ველი ლაივ ძებნის შესაძლებლობით',
  `operation_complete` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოპერაციის დასრულება (ნაკერების ტიპი, ნახვევი)',
  `hemostasis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჰემოსტაზი',
  `drainage_skin` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დრენაჟების კანში გამოტანის ადგილები',
  `description_macropreparation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ამოკვეთილი მაკროპრეპარატის აღწერა',
  `indication_sending_examination` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გამოსაკვლევად გაგზავნის მითითება',
  `first_assistant` int(11) NULL DEFAULT NULL COMMENT 'პირველი ასისტენტი - ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  `second_assistant` int(11) NULL DEFAULT NULL COMMENT 'მეორე ასისტენტი - ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  `surgical_nurse` int(11) NULL DEFAULT NULL COMMENT 'საოპერაციო მედდა -ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  `anesthesiologist` int(11) NULL DEFAULT NULL COMMENT 'ანესთეზიოლოგი - ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  `surgeon` int(11) NULL DEFAULT NULL COMMENT 'ქირურგი - ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  `specialty` int(11) NULL DEFAULT NULL COMMENT 'სპეციალობა - ასარჩევი ველი ლაივ ძებნის შესაძლებლობა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_operations
-- ----------------------------

-- ----------------------------
-- Table structure for patient_operations_diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `patient_operations_diagnosis`;
CREATE TABLE `patient_operations_diagnosis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_operations_diagnosis
-- ----------------------------

-- ----------------------------
-- Table structure for patient_operations_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_operations_files`;
CREATE TABLE `patient_operations_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operations_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_operations_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_operations_specialty_types
-- ----------------------------
DROP TABLE IF EXISTS `patient_operations_specialty_types`;
CREATE TABLE `patient_operations_specialty_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialty_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_operations_specialty_types
-- ----------------------------

-- ----------------------------
-- Table structure for patient_operations_types
-- ----------------------------
DROP TABLE IF EXISTS `patient_operations_types`;
CREATE TABLE `patient_operations_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_operations_types
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight`;
CREATE TABLE `patient_organ_sight`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `sharpness_of_sight_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მხედველობის სიმახვილე D (VIS)',
  `sharpness_of_sight_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მხედველობის სიმახვილე S (VIS)',
  `ophthalmometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოფთალმომეტრია D',
  `ophthalmometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოფთალმომეტრია S',
  `refractometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფრაქტომეტრია D',
  `refractometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფრაქტომეტრია S',
  `tonometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტონომეტრია D',
  `tonometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტონომეტრია S',
  `within_norm` int(11) NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `deep` int(11) NULL DEFAULT NULL COMMENT 'ღრმა 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `narrow` int(11) NULL DEFAULT NULL COMMENT 'ვიწრო 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `precipitate` int(11) NULL DEFAULT NULL COMMENT 'პრეციპიტატი 2. კი დიდი D; 3. კი დიდი S; 4. კი დიდი DS; 5. კი საშუალო D; 6. კი საშუალო S; 7. კი საშუალო DS; 8. კი პიგმენტური D; 9. კი პიგმენტური S; 10. კი პიგმენტური DS;',
  `endothermic_dust` int(11) NULL DEFAULT NULL COMMENT 'ენდოთერმული მტვერი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `cells` int(11) NULL DEFAULT NULL COMMENT 'უჯრედები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyphema` int(11) NULL DEFAULT NULL COMMENT 'ჰიფემა  1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `sinecia` int(11) NULL DEFAULT NULL COMMENT 'სინექია 1. არ არის, 2. კი - წინა D, 3. კი - წინა S, 4. კი - წინა DS, 5. კი - უკანა D, 6. კი - უკანა S, 7. კი - უკანა DS, 8. კი - D, 9. კი - S, 10. კი - DS',
  `structural` int(11) NULL DEFAULT NULL COMMENT 'სტრუქტურული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `atrophic` int(11) NULL DEFAULT NULL COMMENT 'ატროფიული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyperemic` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემიული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `swollen` int(11) NULL DEFAULT NULL COMMENT 'შეშუპებული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `posterior_sinuses` int(11) NULL DEFAULT NULL COMMENT 'უკანა სინექიები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `coloboma` int(11) NULL DEFAULT NULL COMMENT 'კოლობომა 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `rubeoz` int(11) NULL DEFAULT NULL COMMENT 'რუბეოზი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `iridosis` int(11) NULL DEFAULT NULL COMMENT 'ირიდოშიზისი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_pigmented` int(11) NULL DEFAULT NULL COMMENT 'კვანძები - პიგმენტური 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_koeppe` int(11) NULL DEFAULT NULL COMMENT 'კვანძები - koeppe 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_busacca` int(11) NULL DEFAULT NULL COMMENT 'კვანძები - busacca 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `aniridia` int(11) NULL DEFAULT NULL COMMENT 'ანირიდია 1. არა; 2. სრული D; 3. სრული S; 4. სრული DS; 5. არასრული D; 6. არასრული S; 7. არასრული DS;',
  `round` int(11) NULL DEFAULT NULL COMMENT 'მრგვალი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `correct` int(11) NULL DEFAULT NULL COMMENT 'სწორი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `wrong` int(11) NULL DEFAULT NULL COMMENT 'არასწორი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `anisocoria` int(11) NULL DEFAULT NULL COMMENT 'ანიზოქორია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `correctopia` int(11) NULL DEFAULT NULL COMMENT 'კორექტოპია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `pseudocoria` int(11) NULL DEFAULT NULL COMMENT 'ფსევდოკორია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `mydriasis` int(11) NULL DEFAULT NULL COMMENT 'მიდრიაზი 1. არ არის; 2. სპაზმური D; 3. სპაზმური S; 4. სპაზმური DS; 5. პარალიზური D; 6. პარალიზური S; 7. პარალიზური DS;',
  `miosis` int(11) NULL DEFAULT NULL COMMENT 'მიოზი  1. არ არის; 2. სპაზმური D; 3. სპაზმური S; 4. სპაზმური DS; 5. პარალიზური D; 6. პარალიზური S; 7. პარალიზური DS;',
  `light_reaction_stored` int(11) NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე შენახულია  1. კი D; 2. კი S; 3. კი DS;',
  `light_reaction_dunea` int(11) NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე დუნეა  1. კი D; 2. კი S; 3. კი DS;',
  `light_reaction_is_not` int(11) NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე არ არის  1. კი D; 2. კი S; 3. კი DS;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight
-- ----------------------------
INSERT INTO `patient_organ_sight` VALUES (1, NULL, NULL, '2021-11-08 18:02:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `patient_organ_sight` VALUES (2, NULL, 3, '2021-11-08 18:04:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- ----------------------------
-- Table structure for patient_organ_sight_broli
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_broli`;
CREATE TABLE `patient_organ_sight_broli`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `sight_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `broli` int(11) NULL DEFAULT NULL COMMENT 'ბროლი 1. გამჭვირვალე; 2. შემღვრეული; 3. შემღვრევა; 4. მდებარეობა; 5. სხვა;',
  `transparent` int(11) NULL DEFAULT NULL COMMENT 'გამჭვირვალე 1. კი; 2. არა;',
  `distribution_turbidity` int(11) NULL DEFAULT NULL COMMENT 'შემღვრევის გავრცელება 1. კაფსულირებული; 2. შრეობრივი; 3. ქერქოვანი ; 4. ბირთვოვანი ; 5. ტოტალური ;',
  `type_turbulence` int(11) NULL DEFAULT NULL COMMENT 'შემღვრევის ტიპი 1. დაწყებითი; 2. ინტენსიური; 3. დიფუზური; 4. რუხი; 5. რძისფერი;',
  `place` int(11) NULL DEFAULT NULL COMMENT 'მდებარეობა 1. ეტოპია ; 2. სუბლუქსაცია; 3. აფაკია; 4. არტიფაკია ;',
  `location` int(11) NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `bruli_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ბროლი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_broli
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_retina
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_retina`;
CREATE TABLE `patient_organ_sight_retina`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `sight_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retina` int(11) NULL DEFAULT NULL COMMENT 'ბადურა 1. მხედველობის ნერვის დვრილი; 2. საზღვრები; 3. არტერიები; 4. ვენები; 5. სისხლჩაქცევები; 6. დისტროფიები; 7. ექსუდატები; 8. გახლეჩა; 9. ლოკალიზაცია; 10. სხვა;',
  `optic_nerve` int(11) NULL DEFAULT NULL COMMENT 'მხედველობის ნერვის დვრილი 1. ვარდისფერი; 2. ჰიპერემიული; 3. მოთეთრო-მორუხო; 4. შეშუპებული ; 5. პრომინირებული ;',
  `boundaries` int(11) NULL DEFAULT NULL COMMENT 'საზღვრები 1. მკაფიო; 2. წაშლილი ;',
  `arteries` int(11) NULL DEFAULT NULL COMMENT 'არტერიები 1. ნორმის ფარგლებში ; 2. შევიწროებული ; 3. გაფართოებული);',
  `veins` int(11) NULL DEFAULT NULL COMMENT 'ვენები 1. ნორმის ფარგლებში; 2. შევიწროებული; 3. გაფართოებული;',
  `bruises` int(11) NULL DEFAULT NULL COMMENT 'სისხლჩაქცევები 1. რეტინალური ; 2. პრერეტინალური; 3. სუბრეტინალური;',
  `dystrophies` int(11) NULL DEFAULT NULL COMMENT 'დისტროფიები 1. ბადისებური ; 2. ეკვატორიალური ; 3. ’’ლოკოკინას კვალი’’ ; 4. ფიფქები ; 5. ‘’სპილენძის მავთულის ფენომენი’’; 6. ‘’ვერცხლის მავთულის ფენომენი’’; 7. რეტინოშიზისი ; 8. დრუზები;',
  `exudates` int(11) NULL DEFAULT NULL COMMENT 'ექსუდატები 1. მყარი ; 2. თხევადი ; 3. ჰემორაგიული;',
  `rupture` int(11) NULL DEFAULT NULL COMMENT 'გახლეჩვა 1. სარქვლისებური ; 2. ნალისებური ; 3. ხვრელოვანი მრგვალი; 4. ხვრელოვანი ოვალური ; 5. ატიპური ;',
  `localization` int(11) NULL DEFAULT NULL COMMENT 'ლოკალიზაცია 1. დაკბილულ ხაზზე ; 2. დაკბილული ხაზის უკან ; 3. ეკვატორზე; 4. ეკვატორის უკან ; 5. მაკულაზე ;',
  `retina_location` int(11) NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `retina_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ბადურა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_retina
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_sclera
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_sclera`;
CREATE TABLE `patient_organ_sight_sclera`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `sight_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sclera_type` int(11) NULL DEFAULT NULL COMMENT 'სკლერა 1. სკლერა; 2. დისკოლორაცია კეროვანი; 3. დისკოლორაცია დიფუზური; 4. სხვა;',
  `sclera` int(11) NULL DEFAULT NULL COMMENT 'სკლერა 1. უცვლელი ; 2. ჰიპერემიული; 3. მუქი იისფერი; 4. მორუხო; 5. კვანძოვანი სიწითლე; 6. სტაფილომა;',
  `discoloration_focal` int(11) NULL DEFAULT NULL COMMENT 'დისკოლორაცია კეროვანი 1. ჩამოშლა; 2. ჰემოქრომატოზი;',
  `discoloration_diffuse` int(11) NULL DEFAULT NULL COMMENT 'დისკოლორაცია დიფუზური 1. ყვითელი; 2. ცისფერი;',
  `sclera_location` int(11) NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `sclera_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სკლერა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_sclera
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_vitreous_body
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_vitreous_body`;
CREATE TABLE `patient_organ_sight_vitreous_body`  (
  `id` int(11) NOT NULL,
  `history_id` int(11) NULL DEFAULT NULL,
  `sight_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vitreous_body` int(11) NULL DEFAULT NULL COMMENT 'მინისებრი სხეული 1. გამჭვირვალე; 2. ერთეული შემღვრევები; 3. ანთებადი ინფილტრატი; 4. ჰემოფთალმი; 5. შვარტა; 6. თიაქარი; 7. სხვა;',
  `vitreous_body_location` int(11) NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `vitreous_body_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მინისებრი სხეული დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_vitreous_body
-- ----------------------------

-- ----------------------------
-- Table structure for patient_physical_therapy
-- ----------------------------
DROP TABLE IF EXISTS `patient_physical_therapy`;
CREATE TABLE `patient_physical_therapy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `injury_history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დაზიანების ისტორია',
  `complain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩივილი',
  `in_morning` int(11) NULL DEFAULT NULL COMMENT 'დილის - ასარჩევი ველი (რიცხვების 1-დან 10-მდე)',
  `in_evening` int(11) NULL DEFAULT NULL COMMENT 'საღამოს -ასარჩევი ველი (რიცხვების 1-დან 10-მდე)',
  `at_night` int(11) NULL DEFAULT NULL COMMENT 'ღამით - ასარჩევი ველი (რიცხვების 1-დან 10-მდე)',
  `irritant_factors` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გამაღიზიანებელი ფაქტორები',
  `observation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დაკვირვება',
  `releasing_factors` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მომშვები ფაქტორები',
  `manner_walking` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სიარულის მანერა',
  `medications` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მედიკამენტები',
  `body_position_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხეულის პოზიცია მდგომარეობა',
  `short_term_goal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პაც. მოკლევადიანი მიზანი',
  `movement_of_funds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სახსრების მოძრაობა',
  `long_term_goal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პაც. გრძელვადიანი მიზანი',
  `subjective` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სუბიექტური',
  `objective` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ობიექტური',
  `conclusion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დასკვნა',
  `recommendation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეკომენდაცია',
  `funct` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Funct',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_physical_therapy
-- ----------------------------
INSERT INTO `patient_physical_therapy` VALUES (1, NULL, 3, '2021-11-19 15:10:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy` VALUES (2, NULL, 7, '2021-12-07 17:14:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy` VALUES (3, NULL, 7, '2021-12-07 17:15:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy` VALUES (4, NULL, 7, '2021-12-07 17:18:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_physical_therapy_table
-- ----------------------------
DROP TABLE IF EXISTS `patient_physical_therapy_table`;
CREATE TABLE `patient_physical_therapy_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physical_therapy_id` int(11) NULL DEFAULT NULL,
  `dorsa_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `dorsa_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `dorsa_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `dorsa_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `dorsa_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `dorsa_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `dorsa_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `dorsa_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `dorsa_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `planta_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `planta_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `planta_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `planta_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `planta_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `planta_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `planta_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `planta_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `planta_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `invers_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `invers_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `invers_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `invers_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `invers_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `invers_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `invers_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `invers_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `invers_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `iversia_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `iversia_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `iversia_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `iversia_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `iversia_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `iversia_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `iversia_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `iversia_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `iversia_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `knee_flexion_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `knee_flexion_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `knee_flexion_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `knee_flexion_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `knee_flexion_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `knee_flexion_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `knee_flexion_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `knee_flexion_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `knee_flexion_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `unfold_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `unfold_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `unfold_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `unfold_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `unfold_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `unfold_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `unfold_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `unfold_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `unfold_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `thigh_bending_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `thigh_bending_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `thigh_bending_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `thigh_bending_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `thigh_bending_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `thigh_bending_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `thigh_bending_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `thigh_bending_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `thigh_bending_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `unfold2_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `unfold2_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `unfold2_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `unfold2_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `unfold2_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `unfold2_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `unfold2_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `unfold2_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `unfold2_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `abduction_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `abduction_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `abduction_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `abduction_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `abduction_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `abduction_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `abduction_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `abduction_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `abduction_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `adduction_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `adduction_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `adduction_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `adduction_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `adduction_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `adduction_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `adduction_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `adduction_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `adduction_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `outside_rotation_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `outside_rotation_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `outside_rotation_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `outside_rotation_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `outside_rotation_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `outside_rotation_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `outside_rotation_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `outside_rotation_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `outside_rotation_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `inside_rotation_right_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Arom - ტექსტური ველი',
  `inside_rotation_right_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა Prom - ტექსტური ველი',
  `inside_rotation_left_arom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Arom - ტექსტური ველი',
  `inside_rotation_left_prom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა Prom - ტექსტური ველი',
  `inside_rotation_marking_crepitation` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილი, კრეპიტაცია) - ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  `inside_rotation_mmt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'MMT – ტექსტური ველი',
  `inside_rotation_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარჯვენა',
  `inside_rotation_left` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მარცხენა',
  `inside_rotation_pain_degree` int(11) NULL DEFAULT NULL COMMENT 'აღნიშვნა (ტკივილის ხარისხი) -ასარჩევი ველი ( რიცხვები 1-დან 10-მდე)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_physical_therapy_table
-- ----------------------------
INSERT INTO `patient_physical_therapy_table` VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cghjcghj', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'gjghj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chjcghj', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cjghjcg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy_table` VALUES (2, 2, 'მარჯვენა Arom - დორსა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - დორსა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - დორსა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - პლანტა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - პლანტა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - პლანტა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ინვერს - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - ინვერს - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - ინვერს - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ივერსია - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - ივერსია - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - ივერსია - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - მუხლის მოხრა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - მუხლის მოხრა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - მუხლის მოხრა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გაშლა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - გაშლა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - გაშლა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ბარძ.მოხრა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - ბარძ.მოხრა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - ბარძ.მოხრა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გაშლა - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - გაშლა - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - გაშლა - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - აბდუქც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - აბდუქც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - აბდუქც. - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ადუქც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - ადუქც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - ადუქც. - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გარეთ როტაც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - გარეთ როტაც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - გარეთ როტაც. - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - შიგნით როტაც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Prom - შიგნით როტაც. - 12/7/2021 5:18:28 PM', 'მარჯვენა Arom - შიგნით როტაც. - 12/7/2021 5:18:28 PM', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy_table` VALUES (3, 3, 'asdf', 'asdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdf', 'asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_physical_therapy_table` VALUES (4, 4, 'მარჯვენა Arom - დორსა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - დორსა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - დორსა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - პლანტა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - პლანტა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - პლანტა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ინვერს - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - ინვერს - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - ინვერს - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ივერსია - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - ივერსია - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - ივერსია - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - მუხლის მოხრა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - მუხლის მოხრა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - მუხლის მოხრა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გაშლა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - გაშლა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - გაშლა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ბარძ.მოხრა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - ბარძ.მოხრა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - ბარძ.მოხრა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გაშლა - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - გაშლა - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - გაშლა - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - აბდუქც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - აბდუქც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - აბდუქც. - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - ადუქც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - ადუქც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - ადუქც. - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - გარეთ როტაც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - გარეთ როტაც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - გარეთ როტაც. - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'მარჯვენა Arom - შიგნით როტაც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Prom - შიგნით როტაც. - 12/7/2021 5:22:19 PM', 'მარჯვენა Arom - შიგნით როტაც. - 12/7/2021 5:22:19 PM', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_psychological_examination
-- ----------------------------
DROP TABLE IF EXISTS `patient_psychological_examination`;
CREATE TABLE `patient_psychological_examination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examination_date` date NULL DEFAULT NULL COMMENT 'თარიღი',
  `specialist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სპეციალისტი',
  `diagnosis_id` int(11) NULL DEFAULT NULL COMMENT 'დიაგნოზი',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_psychological_examination
-- ----------------------------
INSERT INTO `patient_psychological_examination` VALUES (1, NULL, 7, '2021-12-10 14:20:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_psychological_examination_diagnosis_types
-- ----------------------------
DROP TABLE IF EXISTS `patient_psychological_examination_diagnosis_types`;
CREATE TABLE `patient_psychological_examination_diagnosis_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_psychological_examination_diagnosis_types
-- ----------------------------

-- ----------------------------
-- Table structure for patient_psychological_examination_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_psychological_examination_files`;
CREATE TABLE `patient_psychological_examination_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examination_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_psychological_examination_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_records
-- ----------------------------
DROP TABLE IF EXISTS `patient_records`;
CREATE TABLE `patient_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_records
-- ----------------------------

-- ----------------------------
-- Table structure for patient_records_consultation_destination
-- ----------------------------
DROP TABLE IF EXISTS `patient_records_consultation_destination`;
CREATE TABLE `patient_records_consultation_destination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `records_id` int(11) NULL DEFAULT NULL,
  `consultation_date` datetime NULL DEFAULT NULL COMMENT 'კონსულტაცია/დანიშნულება თარიღი',
  `record_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'ჩანაწერი',
  `consultation_destination` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'კონსულტაცია/დანიშნულება',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_records_consultation_destination
-- ----------------------------

-- ----------------------------
-- Table structure for patient_records_health_condition
-- ----------------------------
DROP TABLE IF EXISTS `patient_records_health_condition`;
CREATE TABLE `patient_records_health_condition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `records_id` int(11) NULL DEFAULT NULL,
  `health_date` date NULL DEFAULT NULL COMMENT 'პაციენტის ჯანმრთელობის მდგომარეობა თარიღი',
  `state_of_health` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'პაციენტის ჯანმრთელობის მდგომარეობა',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_records_health_condition
-- ----------------------------

-- ----------------------------
-- Table structure for patient_reflex_attemps
-- ----------------------------
DROP TABLE IF EXISTS `patient_reflex_attemps`;
CREATE TABLE `patient_reflex_attemps`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ ნორმის ფარგლებში',
  `kernig` int(11) NULL DEFAULT NULL COMMENT 'კერნიგი 1. D, 2. S, 3. D.S',
  `babinski` int(11) NULL DEFAULT NULL COMMENT 'ბაბინსკი 1. D, 2. S, 3. D.S',
  `muscle_tone` int(11) NULL DEFAULT NULL COMMENT 'კუნთების ტონუსი 1. მომატება D, 2. მომატება S, 3. მომატება DS, 4. დაქვეითება D,5. დაქვეითება S, 6. დაქვეითება DS',
  `neck_muscle_rigidity` int(11) NULL DEFAULT NULL COMMENT 'კისრის კუნთების რიგიდობა',
  `nystagmus` int(11) NULL DEFAULT NULL COMMENT 'ნისტაგმი 1. ვერტიკალური - D, 2. ჰორიზონტალური -D, 3. ვერტიკალური - S, 4. ჰორიზონტალური - S, 5. ვერტიკალური - DS, 6. ჰორიზონტალური -DS',
  `tonic_seizures` int(11) NULL DEFAULT NULL COMMENT 'ტონური კრუნჩხვები',
  `clonic_seizures` int(11) NULL DEFAULT NULL COMMENT 'კლონური კრუნჩხვები',
  `hypokinesia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპოკინეზია',
  `hyperemic` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემიული',
  `miosis` int(11) NULL DEFAULT NULL COMMENT 'მიოზი',
  `mydriasis` int(11) NULL DEFAULT NULL COMMENT 'მიდრიაზი',
  `anisocoria` int(11) NULL DEFAULT NULL COMMENT 'ანიზოკორია 1. D, 2. S, 3. D.S',
  `trism` int(11) NULL DEFAULT NULL COMMENT 'ტრიზმი',
  `photo_reaction_d` int(11) NULL DEFAULT NULL COMMENT 'ფოტორეაქცია D 1. ნორმის ფარგლებში, 2. შესუსტებული, 3. არ არის',
  `photo_reaction_s` int(11) NULL DEFAULT NULL COMMENT 'ფოტორეაქცია S 1. ნორმის ფარგლებში, 2. შესუსტებული, 3. არ არის',
  `reflex_attemps_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფლექსები და ცდები დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_reflex_attemps
-- ----------------------------

-- ----------------------------
-- Table structure for patient_rehabilitation_card
-- ----------------------------
DROP TABLE IF EXISTS `patient_rehabilitation_card`;
CREATE TABLE `patient_rehabilitation_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_surname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სახელი გვარი - ივსება ავტომატურად',
  `personal_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'პირადი ნომერი - ივსება ავტომატურად',
  `birth_date` date NULL DEFAULT NULL COMMENT 'დაბადების თარიღი - ივსება ავტომატურად',
  `subdivision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ქვედანაყოფი - ივსება ავტომატურად',
  `military_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'სამხედრო წოდება - ივსება ავტომატურად',
  `date_entry` date NULL DEFAULT NULL COMMENT 'შემოსვლის თარიღი',
  `date_discharge` date NULL DEFAULT NULL COMMENT 'გაწერის თარიღი',
  `dominant_side` int(11) NULL DEFAULT NULL COMMENT 'დომინანტი მხარე 1. მარჯვენა, 2. მარცხენა',
  `date_injury` date NULL DEFAULT NULL COMMENT 'დაშავების თარიღი',
  `place_injury` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დაშავების ადგილი',
  `entry_diagnosis` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შემოსვლის დიაგნოზი',
  `instrumental_examinations_conducted` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩატარებული ინსტრუმენტული გამოკვლევები',
  `consultations_conducted` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩატარებული კონსულტაციები',
  `treatment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მკურნალობა (მიმდინარე, მედიკამენტოზური)',
  `result_of_rehabilitation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეაბილიტაციის შედეგი',
  `further_recommendations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შემდგომი რეკომენდაციები',
  `further_rehabilitation_course` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შემდგომი რეაბილიტაციის კურსი',
  `recommended` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეკომენდირებული',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_rehabilitation_card
-- ----------------------------

-- ----------------------------
-- Table structure for patient_rehabilitation_plan
-- ----------------------------
DROP TABLE IF EXISTS `patient_rehabilitation_plan`;
CREATE TABLE `patient_rehabilitation_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clinical_findings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კლინიკური აღმოჩენები',
  `functional_findings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფუნქციური აღმოჩენები',
  `short_term_goal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მოკლევადიანი მიზანი',
  `long_term_goal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გრძელვადიანი მიზანი',
  `treatment_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სამკურნალო გეგმა',
  `recommendation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეკომენდაცია',
  `physical_therapy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფიზიკური თერაპია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_rehabilitation_plan
-- ----------------------------

-- ----------------------------
-- Table structure for patient_respiratory_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_respiratory_system`;
CREATE TABLE `patient_respiratory_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pneumothorax` int(11) NULL DEFAULT NULL COMMENT 'პნევმოთორაქსი',
  `floating_chest` int(11) NULL DEFAULT NULL COMMENT 'მცურავი გულმკერდი',
  `passage` int(11) NULL DEFAULT NULL COMMENT 'გამავლობა 1 ნორმის ფარგლებში ,2 დარღვეული;',
  `aspiration` int(11) NULL DEFAULT NULL COMMENT 'ასპირაცია 1 კი, 2 არა',
  `foreign_body` int(11) NULL DEFAULT NULL COMMENT 'უცხო სხეული 1 კი D, 2 კი S, 3 კი DS, 4 არა',
  `respiratory_disorders` int(11) NULL DEFAULT NULL COMMENT 'სუნთქვის დარღვევა 1 სპონტანური; 2 ტაქიპნოე; 3 გაგრძელებული; 4 აგონალური; 5 არ არის;',
  `chest_excursion` int(11) NULL DEFAULT NULL COMMENT 'გულმკერდის ექსკურსია 1 სიმეტრიული; 2 ასიმეტრიული D; 3 ასიმეტრიული S; 4 ასიმეტრიული D,S;',
  `spirometry` int(11) NULL DEFAULT NULL COMMENT 'სპირომეტრია',
  `cough` int(11) NULL DEFAULT NULL COMMENT 'ხველა 1 კი, 2 არა',
  `vesicular` int(11) NULL DEFAULT NULL COMMENT 'ვეზიკულური 1 D; 2 S; 3 D,S;',
  `bronchial` int(11) NULL DEFAULT NULL COMMENT 'ბრონქული 1 D; 2 S; 3 D,S;',
  `weakened` int(11) NULL DEFAULT NULL COMMENT 'შესუსტებული 1 D; 2 S; 3 D,S;',
  `pueruli` int(11) NULL DEFAULT NULL COMMENT 'პუერული 1 კი',
  `dry` int(11) NULL DEFAULT NULL COMMENT 'მშრალი 1 D; 2 S; 3 D,S;',
  `wet` int(11) NULL DEFAULT NULL COMMENT 'სველი 1 D; 2 S; 3 D,S;',
  `thin_vesicular` int(11) NULL DEFAULT NULL COMMENT 'წვრილ ბუშტუკოვანი 1 D; 2 S; 3 D,S;',
  `large_vesicular` int(11) NULL DEFAULT NULL COMMENT 'მსხვილ ბუშტუკოვანი 1 D; 2 S; 3 D,S;',
  `crepitation` int(11) NULL DEFAULT NULL COMMENT 'კრეპიტაცია 1 კი',
  `inspirational` int(11) NULL DEFAULT NULL COMMENT 'ინსპირაციული',
  `expiratory` int(11) NULL DEFAULT NULL COMMENT 'ექსპირაციული',
  `whistling` int(11) NULL DEFAULT NULL COMMENT 'მსტვინავი',
  `breath_crepitation` int(11) NULL DEFAULT NULL COMMENT 'კრეპიტაცია',
  `stridor` int(11) NULL DEFAULT NULL COMMENT 'სტრიდორი',
  `nadebi` int(11) NULL DEFAULT NULL COMMENT 'სასის რკალები ნადებით',
  `unadebo` int(11) NULL DEFAULT NULL COMMENT 'სასის რკალები უნადებო',
  `hyperemic` int(11) NULL DEFAULT NULL COMMENT 'სასის რკალები ჰიპერემიული',
  `tonsils_hyperemic` int(11) NULL DEFAULT NULL COMMENT 'ტონზილები ჰიპერემიული',
  `tonsils_hyperplastic` int(11) NULL DEFAULT NULL COMMENT 'ტონზილები ჰიპერპლაზიური',
  `sputum` int(11) NULL DEFAULT NULL COMMENT 'ნახველი',
  `sputum_color` int(11) NULL DEFAULT NULL COMMENT 'ფერი',
  `sputum_consistency` int(11) NULL DEFAULT NULL COMMENT 'კონსისტენცია',
  `sputum_composition` int(11) NULL DEFAULT NULL COMMENT 'შემადგენლობა',
  `sputum_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნახველი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_respiratory_system
-- ----------------------------
INSERT INTO `patient_respiratory_system` VALUES (1, NULL, 1, '2021-11-02 16:37:07', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_respiratory_system` VALUES (2, NULL, 7, '2021-12-09 17:59:45', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_skin
-- ----------------------------
DROP TABLE IF EXISTS `patient_skin`;
CREATE TABLE `patient_skin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიების გარეშე',
  `within_norm` int(11) NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში',
  `dew` int(11) NULL DEFAULT NULL COMMENT 'ნამიანი',
  `hyperemic` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემიული',
  `hem` int(11) NULL DEFAULT NULL COMMENT 'ნაწიბური',
  `turgor` int(11) NULL DEFAULT NULL COMMENT 'ტურგორი 1. დაქვეითებული; 2. შენარჩუნებული;',
  `cold` int(11) NULL DEFAULT NULL COMMENT 'ცივი',
  `adhesive` int(11) NULL DEFAULT NULL COMMENT 'წებოვანი',
  `rash` int(11) NULL DEFAULT NULL COMMENT 'გამონაყარი',
  `color` int(11) NULL DEFAULT NULL COMMENT 'ფერი 1. ნორმა; 2. ჰიპერემიული; 3. ფერმკრთალი; 4. ციანოზური;',
  `skin_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კანი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_skin
-- ----------------------------

-- ----------------------------
-- Table structure for patient_throat_ear_nose
-- ----------------------------
DROP TABLE IF EXISTS `patient_throat_ear_nose`;
CREATE TABLE `patient_throat_ear_nose`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე',
  `ear_ache` int(11) NULL DEFAULT NULL COMMENT 'ყურის ტკივილი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `noise_in_ears` int(11) NULL DEFAULT NULL COMMENT 'ხმაური ყურებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `itching_in_ears` int(11) NULL DEFAULT NULL COMMENT 'ქავილი ყურებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyperemia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `swelling` int(11) NULL DEFAULT NULL COMMENT 'შეშუპება 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `hemorrhage` int(11) NULL DEFAULT NULL COMMENT 'სისხლჩაქცევა 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `abnormal_discharge` int(11) NULL DEFAULT NULL COMMENT 'პათოლოგიური გამონადენი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `sulfur_plug` int(11) NULL DEFAULT NULL COMMENT 'გოგირდოვანი საცობი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `outer_ear_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გარეთა ყური დამატებითი ინფორმაცია',
  `perforation_of_plaque` int(11) NULL DEFAULT NULL COMMENT 'დაფის აპკის პერფორაცია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `light_reflex` int(11) NULL DEFAULT NULL COMMENT 'სინათლის რეფლექსი 1. არა; 2. კი სრული D; 3. კი სრული S; 4. კი სრული DS; 5. კი არასრული D; 6. კი არასრული S; 7. კი არასრული DS;',
  `fluid_cavity_board` int(11) NULL DEFAULT NULL COMMENT 'სითხე დაფის ღრუში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `granulations` int(11) NULL DEFAULT NULL COMMENT 'გრანულაციები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `middle_ear_hyperemia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `middle_ear_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შუა ყური დამატებითი ინფორმაცია',
  `within_norm` int(11) NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში',
  `whispered` int(11) NULL DEFAULT NULL COMMENT 'ჩურჩულით მეტყველება',
  `hearing_loss_conductive` int(11) NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა კონდუქტიური 1. D; 2. S; 3. DS;',
  `hearing_loss_neurosensory` int(11) NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა ნეიროსენსორული 1. D; 2. S; 3. DS;',
  `hearing_loss_mixed` int(11) NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა შერეული 1. D; 2. S; 3. DS;',
  `hearing_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სმენა დამატებითი ინფორმაცია',
  `narrowed` int(11) NULL DEFAULT NULL COMMENT 'შევიწროვებული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `breathe_free` int(11) NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა თავისუფალი 1. D; 2. S; 3. DS;',
  `breathe_weakened` int(11) NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა შესუსტებული 1. D; 2. S; 3. DS;',
  `breathe_blocked` int(11) NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა ბლოკირებული 1. D; 2. S; 3. DS;',
  `nose_discharge` int(11) NULL DEFAULT NULL COMMENT 'გამონადენი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nose_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცხვირი დამატებითი ინფორმაცია',
  `sinks_hyperemia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hypertrophy` int(11) NULL DEFAULT NULL COMMENT 'ჰიპერტროფია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `dzgide_curved` int(11) NULL DEFAULT NULL COMMENT 'ძგიდე  გამრუდებული 1. გამრუდებული - კი; 2. გამრუდებული - არა;',
  `sinks_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნიჟარები დამატებითი ინფორმაცია',
  `polyposis_tissue` int(11) NULL DEFAULT NULL COMMENT 'პოლიპოზური ქსოვილი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `vascular_picture_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლძარღვოვანი სურათი',
  `smell_within_norm` int(11) NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში',
  `hypoosmia` int(11) NULL DEFAULT NULL COMMENT 'ჰიპოოსმია',
  `anosmia` int(11) NULL DEFAULT NULL COMMENT 'ანოსმია',
  `barofunction_valsalva_attempt` int(11) NULL DEFAULT NULL COMMENT 'ბაროფუნქცია / ვალსალვას ცდა',
  `barofunction_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `audiometry` int(11) NULL DEFAULT NULL COMMENT 'აუდიომეტრია',
  `other_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `file_id` int(11) NULL DEFAULT NULL COMMENT 'მიმაგრებული ფაილი',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `vestibular_apparatus` int(11) NULL DEFAULT NULL COMMENT 'ვესტიბულური აპარატი / ნორმის ფარგლებში 1. არა; 2. კი;',
  `vestibular_other` int(11) NULL DEFAULT NULL COMMENT 'სხვა',
  `smell_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყნოსვა დამატებითი ინფორმაცია',
  `adrenal_glands` int(11) NULL DEFAULT NULL COMMENT 'ნუშურა ჯირკვლები 1. არის; 2. არ არის;',
  `throat` int(11) NULL DEFAULT NULL COMMENT 'ხახა 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `throat_other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `voice_yogis` int(11) NULL DEFAULT NULL COMMENT 'სახმო იოგები 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `voice_yogis_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `voice_yogis_movement` int(11) NULL DEFAULT NULL COMMENT 'სახმო იოგების მოძრაობა 1. სრული; 2. არასრული D; 3. არასრული S; 4. არასრული DS;',
  `larynx` int(11) NULL DEFAULT NULL COMMENT 'ხორხი 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `throat_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყელი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_throat_ear_nose
-- ----------------------------
INSERT INTO `patient_throat_ear_nose` VALUES (1, NULL, 3, '2021-11-10 16:03:56', NULL, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_throat_ear_nose` VALUES (2, NULL, 3, '2021-11-10 16:55:30', NULL, NULL, NULL, NULL, 4, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for patient_throat_ear_nose_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_throat_ear_nose_files`;
CREATE TABLE `patient_throat_ear_nose_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_throat_id` int(11) NULL DEFAULT NULL COMMENT 'patient_throat_ear_nose ის იდ ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_throat_ear_nose_files
-- ----------------------------
INSERT INTO `patient_throat_ear_nose_files` VALUES (3, 'https___blogs-images', 'uploads/96/1768154728.jpg', 1);
INSERT INTO `patient_throat_ear_nose_files` VALUES (4, 'RDR_Hero_FPO', 'uploads/50/1465880048.jpg', 1);
INSERT INTO `patient_throat_ear_nose_files` VALUES (5, 'test', 'uploads/92/1886147445.docx', 1);
INSERT INTO `patient_throat_ear_nose_files` VALUES (7, 'satesto123', 'uploads/33/1654334847.pdf', 1);
INSERT INTO `patient_throat_ear_nose_files` VALUES (8, 'satesto123', 'uploads/50/943838831.pdf', 1);
INSERT INTO `patient_throat_ear_nose_files` VALUES (9, 'Baby-Mattress-Juno-Baby', 'uploads/53/1617845910.jpg', 2);

-- ----------------------------
-- Table structure for patient_vital_options
-- ----------------------------
DROP TABLE IF EXISTS `patient_vital_options`;
CREATE TABLE `patient_vital_options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NULL DEFAULT NULL,
  `visit_id` int(11) NULL DEFAULT NULL COMMENT 'med_visits -ის იდ',
  `reg_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature` int(11) NULL DEFAULT NULL COMMENT 'ტემპერატურა',
  `system_pressure` int(11) NULL DEFAULT NULL COMMENT 'სისტ.წნევა მმ/ვწყ.სვ',
  `diast_pressure` int(11) NULL DEFAULT NULL COMMENT 'დიასტ. წნევა მმ/ვწყ.სვ',
  `pulse` int(11) NULL DEFAULT NULL COMMENT 'პულსი',
  `heart_rate` int(11) NULL DEFAULT NULL COMMENT 'გულისცემის სიხშირე',
  `oxygen_saturation` int(11) NULL DEFAULT NULL COMMENT 'ჟანგბადით სატურაცია %',
  `respiratory_rate` int(11) NULL DEFAULT NULL COMMENT 'სუნთქვის სიხშირე',
  `patient_weight` int(11) NULL DEFAULT NULL COMMENT 'პაციენტის წონა (კგ)',
  `defecation` int(11) NULL DEFAULT NULL COMMENT 'დეფეკაცია 24 სთ-ში',
  `fluid_released` int(11) NULL DEFAULT NULL COMMENT 'დრენაჟიდან გამოყოფილი სითხის რაოდენობა (მლ)',
  `urine_excreted` int(11) NULL DEFAULT NULL COMMENT 'გამოყოფილი შარდის რაოდენობა (მლ)',
  `fluid_taken` int(11) NULL DEFAULT NULL COMMENT 'მიღებული სითხის რაოდენობა (მლ)',
  `vital_options_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სასიცოცხლო პარამეტრები დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_vital_options
-- ----------------------------
INSERT INTO `patient_vital_options` VALUES (1, NULL, NULL, '2021-10-28 11:36:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_vital_options` VALUES (2, NULL, NULL, '2021-10-28 11:36:59', NULL, NULL, NULL, 123123, 123123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_vital_options` VALUES (3, NULL, NULL, '2021-10-28 11:37:22', NULL, NULL, NULL, 1111, 111, 222, 222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_vital_options` VALUES (4, NULL, NULL, '2021-10-28 11:38:02', NULL, NULL, NULL, 77777, 77777, 77777, 77777, 77777, 77777, 77777, 77777, 77777, 77777, 77777, 77777, '77777');
INSERT INTO `patient_vital_options` VALUES (5, NULL, NULL, '2021-10-28 11:44:03', NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_vital_options` VALUES (6, NULL, 6, '2021-11-30 11:25:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for rhesus_types
-- ----------------------------
DROP TABLE IF EXISTS `rhesus_types`;
CREATE TABLE `rhesus_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rhesus_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rhesus_types
-- ----------------------------
INSERT INTO `rhesus_types` VALUES (1, 'A RhD დადებითი (A+) - მეორე დადებითი');
INSERT INTO `rhesus_types` VALUES (2, 'A RhD უარყოფითი (A-) - მეორე უარყოფითი');
INSERT INTO `rhesus_types` VALUES (3, 'B RhD დადებითი (B+) - მესამე დადებითი');
INSERT INTO `rhesus_types` VALUES (4, 'B RhD უარყოფითი (B-) - მესამე უარყოფითი');
INSERT INTO `rhesus_types` VALUES (5, 'O RhD დადებითი (O+) - პირველი დადებითი');
INSERT INTO `rhesus_types` VALUES (6, 'O RhD უარყოფითი (O-) - პირველი უარყოფითი');
INSERT INTO `rhesus_types` VALUES (7, 'AB RhD დადებითი (AB+) - მეოთხე დადებითი');
INSERT INTO `rhesus_types` VALUES (8, 'AB RhD უარყოფითი (AB-) - მეოთხე უარყოფითი');

SET FOREIGN_KEY_CHECKS = 1;
