/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : medical_db

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 25/10/2021 14:03:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blood_types
-- ----------------------------
DROP TABLE IF EXISTS `blood_types`;
CREATE TABLE `blood_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for condition_types
-- ----------------------------
DROP TABLE IF EXISTS `condition_types`;
CREATE TABLE `condition_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `condition_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of condition_types
-- ----------------------------
INSERT INTO `condition_types` VALUES (1, 'სტაციონარი');
INSERT INTO `condition_types` VALUES (2, 'ამბულატორია');
INSERT INTO `condition_types` VALUES (3, 'ობსერვაცია');

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT 1 COMMENT '1  ექიმი , 2 მორიგე ექიმი',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES (1, NULL, 'გიორგი', 'მელელაშვილი', 'ქირურგი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1);
INSERT INTO `doctors` VALUES (2, NULL, 'ნიკოლოზ', 'ჯიბლაძე', 'ელენტის ექსპერტი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 1);
INSERT INTO `doctors` VALUES (3, 1, 'ვახტანგ', 'ბალხამიშვილი', 'გინეკოლოგი', 'საინფორმაციო ტექნოლოგიების განყოფილება', 2);

-- ----------------------------
-- Table structure for med_visit_conditions
-- ----------------------------
DROP TABLE IF EXISTS `med_visit_conditions`;
CREATE TABLE `med_visit_conditions`  (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NOT NULL,
  `history_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_id` int NULL DEFAULT NULL,
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_type` int NULL DEFAULT NULL COMMENT '1 სტაციონარი , 2 ამბულატორია, 3 ობსერვაცია',
  `visit_date` datetime NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `status` int NULL DEFAULT 1 COMMENT '1 მიმდინარე , 2 დახურული',
  `close_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of med_visits
-- ----------------------------
INSERT INTO `med_visits` VALUES (1, 1, 'HIS0001', '01019074079', 'გიორგი', 'მელელაშვილი', 2, 'ნიკოლოზ', 'ჯიბლაძე', 1, '2021-10-18 17:39:56', '2021-10-18 17:39:53', 1, NULL);

-- ----------------------------
-- Table structure for patient_abuse_anamnesis
-- ----------------------------
DROP TABLE IF EXISTS `patient_abuse_anamnesis`;
CREATE TABLE `patient_abuse_anamnesis`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'უნიკალური იდ',
  `history_id` int NOT NULL COMMENT 'ისტორიის იდ',
  `reg_date` datetime NULL DEFAULT current_timestamp COMMENT 'დამატების თარიღი',
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'დამატებელი იუზერის სახელი',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'იუზერის პოზიცია',
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'იუზერის სტრუქტურა',
  `abuse_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩივილები',
  `no_abuse` int NULL DEFAULT 1 COMMENT '1 აქვს ჩივილი , 2 არ აქვს ჩივილი',
  `medicaments` int NULL DEFAULT NULL COMMENT 'მედიკამენტებზე დამოკიდებულება 1 დადებითი ',
  `medicaments_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მედიკამენტებზე დამატებითი ინფორმაცია',
  `allergy` int NULL DEFAULT NULL COMMENT 'ალერგია 1 დადებითი',
  `allergy_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ალერგიაზე დამატებითი ინფორმაცია',
  `tobacco` int NULL DEFAULT NULL COMMENT 'თამბაქო 1 დადებითი',
  `alcohol` int NULL DEFAULT NULL COMMENT 'ალკოჰოლი 1 დადებითი ',
  `drugs` int NULL DEFAULT NULL COMMENT 'ნარკოტიკები 1 დადებითი',
  `bad_habits_other` int NULL DEFAULT NULL COMMENT 'სხვა 1 დადებითი',
  `bad_habits_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მავნე ჩვევებზე დამატებითი ინფორმაცია',
  `ischemic_heart` int NULL DEFAULT NULL COMMENT 'გულის იშემიური ავადმყოფობა 1 დადებითი',
  `hypertensive_disease` int NULL DEFAULT NULL COMMENT 'ჰიპერტენზიული ავადმყოფობა  1 დადებითი',
  `blood_diseases_other` int NULL DEFAULT NULL COMMENT 'სისხლის მიმოქცევის სისტემის ავადმყოფობები სხვა',
  `blood_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლის მიმოქცევის სისტემის ავადმყოფობების დამატებითი ინფორმაცია',
  `asthma` int NULL DEFAULT NULL COMMENT 'ასთმა 1 დადებითი ',
  `lung_disease` int NULL DEFAULT NULL COMMENT 'ფილტვის ქრ. ობსტრუქციული ავადმყოფობა 1 დადებითი',
  `respiratory_system_other` int NULL DEFAULT NULL COMMENT 'სუნთქვის სისტემის ავადმყოფობები სხვა 1 დადებითი',
  `respiratory_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სუნთქვის სისტემის ავადმყოფობების დამატებითი ინფორმაცია',
  `diabetes` int NULL DEFAULT NULL COMMENT 'დიაბეტი',
  `thyroid_disease` int NULL DEFAULT NULL COMMENT 'ფარისებრი ჯირკვლის ავადმყოფობა',
  `endocrine_system_other` int NULL DEFAULT NULL COMMENT 'ენდოკრინული სისტემის სხვა',
  `endocrine_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ენდოკრინული სისტემის დამატებითი ინფორმაცია',
  `epilepsy` int NULL DEFAULT NULL COMMENT 'ეპილეფსია',
  `sleep_disturbance` int NULL DEFAULT NULL COMMENT 'ძილის დარღვევა',
  `nervous_system_other` int NULL DEFAULT NULL COMMENT 'ნერვული სისტემის სხვა',
  `nervous_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნერვული სისტემის დამატებითი ინფორმაცია',
  `mental_disorder` int NULL DEFAULT NULL COMMENT 'ფსიქიკური აშლილობა',
  `mental_disorder_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფსიქიკური და ქცევითი დარღვევები დამატებითი ინფორმაცია',
  `kidney_disease` int NULL DEFAULT NULL COMMENT 'თირკმელების დაავადება',
  `urolithiasis` int NULL DEFAULT NULL COMMENT 'უროლითიაზი',
  `gynecological_diseases` int NULL DEFAULT NULL COMMENT 'გინეკოლოგიური დაავადებები',
  `genitourinary_system_other` int NULL DEFAULT NULL COMMENT 'შარდ-სასქესო სისტემის ავადმყოფობები სხვა',
  `genitourinary_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შარდ-სასქესო სისტემის ავადმყოფობები დამატებითი ინფორმაცია',
  `gastric ulcer` int NULL DEFAULT NULL COMMENT 'კუჭისა და 12-გ ნაწლავის წყლული',
  `cholelithiasis` int NULL DEFAULT NULL COMMENT 'ქოლელითიაზი',
  `digestive_system_other` int NULL DEFAULT NULL COMMENT 'საჭმლის მომნელებელი სისტემის ავადმყოფობები სხვა',
  `digestive_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'საჭმლის მომნელებელი სისტემის ავადმყოფობები დამატებითი ინფორმაცია',
  `restriction_movement` int NULL DEFAULT NULL COMMENT 'მოძრაობის შეზღუდვა',
  `arthropathies` int NULL DEFAULT NULL COMMENT 'ართროპათიები',
  `dorsopathies` int NULL DEFAULT NULL COMMENT 'დორსოპათიები',
  `muscular_diseases_other` int NULL DEFAULT NULL COMMENT 'ძვალ-კუნთოვანი სხვა',
  `muscular_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ძვალ-კუნთოვანი დამატებითი ინფორმაცია',
  `tuberculosis` int NULL DEFAULT NULL COMMENT 'ტუბერკულოზი',
  `hepatitis` int NULL DEFAULT NULL COMMENT 'ჰეპატიტი',
  `hiv_infection` int NULL DEFAULT NULL COMMENT 'აივ ინფექცია',
  `meningitis_Encephalitis` int NULL DEFAULT NULL COMMENT 'მენინგიტი / ენცეფალიტი',
  `malaria` int NULL DEFAULT NULL COMMENT 'მალარია',
  `infectious_diseases_other` int NULL DEFAULT NULL COMMENT 'ინფექციური და პარაზიტული სხვა',
  `infectious_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ინფექციური და პარაზიტული დამატებითი ინფორმაცია',
  `malignant_tumor` int NULL DEFAULT NULL COMMENT 'ავთვისებიანი სიმსივნე',
  `malignant_tumor_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ავთვისებიანი სიმსივნე დამატებითი ინფორმაცია',
  `benign_tumor` int NULL DEFAULT NULL COMMENT 'კეთილთვისებიანი სიმსივნე',
  `benign_tumor_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კეთილთვისებიანი სიმსივნე დამატებითი ინფორმაცია',
  `surgery` int NULL DEFAULT NULL COMMENT 'ქირურგიული ჩარევა',
  `surgery_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ქირურგიული ჩარევა დამატებითი ინფორმაცია',
  `anesthesia` int NULL DEFAULT NULL COMMENT 'წარსულში ჩატარებული ანესთეზიები',
  `anesthesia_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'წარსულში ჩატარებული ანესთეზიები დამატებითი ინფორმაცია',
  `head_trauma` int NULL DEFAULT NULL COMMENT 'თავის ტრავმა',
  `loss_consciousness` int NULL DEFAULT NULL COMMENT 'გონების დაკარგვა',
  `fracture` int NULL DEFAULT NULL COMMENT 'მოტეხილობა',
  `self_harm` int NULL DEFAULT NULL COMMENT 'თვითდაზიანება',
  `trauma_other` int NULL DEFAULT NULL COMMENT 'ტრავმა სხვა',
  `trauma_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტრავმა დამატებითი ინფორმაცია',
  `anemia` int NULL DEFAULT NULL COMMENT 'ანემია',
  `blood_organ_disease_other` int NULL DEFAULT NULL COMMENT 'სისხლისა და სისხლმბადი სხვა',
  `blood_organ_disease_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლისა და სისხლმბადი დამატებითი ინფორმაცია',
  `hearing_impairment` int NULL DEFAULT NULL COMMENT 'სმენის დაქვეითება',
  `respiratory_disorders` int NULL DEFAULT NULL COMMENT 'სუნთქვის დარღვევა',
  `ear_diseases_other` int NULL DEFAULT NULL COMMENT 'ყურისა და დვრილისებრი სხვა',
  `ear_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყურისა და დვრილისებრი დამატებითი ინფორმაცია',
  `Atashangi` int NULL DEFAULT NULL COMMENT 'ათაშანგი',
  `venereal_disease_other` int NULL DEFAULT NULL COMMENT 'ვენერიული დაავადება სხვა',
  `venereal_disease_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ვენერიული დაავადება დამატებითი ინფორმაცია',
  `pregnancy_childbirth` int NULL DEFAULT NULL COMMENT 'ორსულობა / მშობიარობა',
  `multiplicity_pregnancy` int NULL DEFAULT NULL COMMENT 'ორსულობის ჯერადობა',
  `physiological` int NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / ფიზიოლოგიური',
  `abnormal` int NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / პათოლოგიური',
  `stillbirth` int NULL DEFAULT NULL COMMENT 'მშობიარობის ჯერადობა / მკვდრადშობადობა',
  `arbitrary` int NULL DEFAULT NULL COMMENT 'აბორტის ჯერადობა / თვითნებური',
  `artificial` int NULL DEFAULT NULL COMMENT 'აბორტის ჯერადობა / ხელოვნური',
  `pregnancy_childbirth_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ორსულობა / მშობიარობა დამატებითი ინფორმაცია',
  `genetic_diseases` int NULL DEFAULT NULL COMMENT 'გენეტიკური დაავადებები',
  `genetic_diseases_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გენეტიკური დაავადებები დამატებითი ინფორმაცია',
  `family_history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოჯახური ანამნეზი',
  `working_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შრომის პირობები',
  `rest_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დასვენების პირობები',
  `nutritional_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'კვების პირობები',
  `living_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცხოვრების პირობები',
  `harmful_factors` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მავნე ფაქტორების ზემოქმედება',
  `household_history_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შრომის და საყოფაცხოვრებო დამატებითი ინფორმაცია',
  `abuse_anamnesis_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ჩივილი/ანამნეზი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_abuse_anamnesis
-- ----------------------------

-- ----------------------------
-- Table structure for patient_anthropometry
-- ----------------------------
DROP TABLE IF EXISTS `patient_anthropometry`;
CREATE TABLE `patient_anthropometry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL COMMENT 'წონა(კგ)',
  `height` int NULL DEFAULT NULL COMMENT 'სიმაღლე(სმ);',
  `body_mass` int NULL DEFAULT NULL COMMENT 'სხეულის მასის ინდექსი',
  `abdominal_circumference` int NULL DEFAULT NULL COMMENT 'მუცლის გარშემოწერილობა(სმ);',
  `head_circumference` int NULL DEFAULT NULL COMMENT 'თავის გარშემოწერილობა (სმ)',
  `waist_circumference` int NULL DEFAULT NULL COMMENT 'წელის გარშემოწერილობა (სმ)',
  `height_sitting` int NULL DEFAULT NULL COMMENT 'სიმაღლე ჯდომისას (სმ)',
  `right_upper_limb` int NULL DEFAULT NULL COMMENT 'მარჯვენა ზედა კიდურის სიგრძე (სმ)',
  `left_upper_limb` int NULL DEFAULT NULL COMMENT 'მარცხენა ზედა კიდურის სიგრძე (სმ)',
  `left_lower_limb` int NULL DEFAULT NULL COMMENT 'მარცხენა ქვედა კიდურის სიგრძე (სმ)',
  `right_lower_limb` int NULL DEFAULT NULL COMMENT 'მარჯვენა ქვედა კიდურის სიგრძე (სმ)',
  `construction` int NULL DEFAULT NULL COMMENT 'აღნაგობა 1 ასთენიური, 2 ნორმოსთენიური, 3 ჰიპერსთენიური',
  `right_cluster_dynamometer` int NULL DEFAULT NULL COMMENT 'მარჯვენა მტევნის დინამომეტრია',
  `left_cluster_dynamometer` int NULL DEFAULT NULL COMMENT 'მარცხენა მტევნის დინამომეტრია',
  `traction_force_dynamometer` int NULL DEFAULT NULL COMMENT 'წევის ძალის დინამომეტრია',
  `spirometry` int NULL DEFAULT NULL COMMENT 'სპირომეტრია',
  `developmental_defect` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'განვითარების დეფექტი',
  `at_rest` int NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა მოსვენებისას',
  `when_inhaling` int NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა ჩასუნთქვისას',
  `on_exhalation` int NULL DEFAULT NULL COMMENT 'გულმკერდის გარშემოწერილობა ამოსუნთქვისას',
  `chest_circumference_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გულმკერდის გარშემოწერილობა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_anthropometry
-- ----------------------------

-- ----------------------------
-- Table structure for patient_awareness
-- ----------------------------
DROP TABLE IF EXISTS `patient_awareness`;
CREATE TABLE `patient_awareness`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `eyeballs` int NULL DEFAULT NULL COMMENT 'გუგები D 1. = S; 2. >S; 3. <S;',
  `skull_base_fracture` int NULL DEFAULT NULL COMMENT 'ქალას ფუძის მოტეხილობის ნიშნები',
  `loss_of_consciousness` int NULL DEFAULT NULL COMMENT 'გონების დაკარგვა (წთ)',
  `avpu` int NULL DEFAULT NULL COMMENT 'AVPU 1. A-აქტიური; 2. V-პასუხი სიტყვიერ გაღიზიანებაზე; 3. P-პასუხი ტკივილით გაღიზიანებაზე; 4. U-რეაქციაზე გაღიზიანება არ გამოიხატება;',
  `open_eyes` int NULL DEFAULT NULL COMMENT 'თვალის გახელა 1. სპონტანური - 4 ქულა,2. რეაგირებს ჩაძახილზე - 3 ქულა,3. რეაგირებს ტკივილზე - 2 ქულა,4. რეაქცია არ არის -1 ქულა',
  `verbal_speech` int NULL DEFAULT NULL COMMENT 'ვერბალური მეტყველება 1. კონტაქტური/ორიენტირებული - 5 ქულა,2. კონტაქტური/დეზორიენტირებული - 4 ქულა,3. პასუხობს არაადექვატურად, ცალკეული სიტყვები - 3 ქულა,4. გაუგებარი სიტყვები-- 2 ქულა,5. არ არის ვერბალური რეაქცია - 1 ქულა',
  `motor_reaction` int NULL DEFAULT NULL COMMENT 'მოტორული რეაქცია 1. A - აქტიური ასრულებს დავალებას - 6 ქულა,2. V - პასუხი სიტყვიერ გაღიზიანებაზე ტკივილის ლოკალიზაცია - 5 ქულა,3. P - პასუხი ტკივილით გაღიზიანებაზე მოცილების რეაქცია (ფლექსია)- 4 ქულა,4. U - გაღიზიანებაზე რეაქცია არ გამოიხატება დეკორტიკალური რიგიდობა (გაშლა)- 3 ქულა,5. დეცერებრაციული რიგიდობა (მოხრა) - 2ქულა,6. რეაქცია არა არის - 1 ქულა',
  `sum_of_results` int NULL DEFAULT NULL COMMENT 'საბოლოო ქულის დათვლის ველი',
  `level_of_consciousness` int NULL DEFAULT NULL COMMENT 'ცნობიერების დონე',
  `hallucination` int NULL DEFAULT NULL COMMENT 'ჰალუცინაცია',
  `field_of_consciousness` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცნობიერების სფერო',
  `vegetative_nervous_system` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ვეგეტატიური ნერვული სისტემა',
  `mental_status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ფსიქიური სტატუსი',
  `sleep` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ძილი',
  `glasgow_coma_scale_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გლაზგოს კომის შკალა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_awareness
-- ----------------------------

-- ----------------------------
-- Table structure for patient_blood_circulation_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_blood_circulation_system`;
CREATE TABLE `patient_blood_circulation_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capillary_filling_time` int NULL DEFAULT NULL COMMENT 'კაპილარული ავსების დრო',
  `estimated_blood_loss` int NULL DEFAULT NULL COMMENT 'სისხლის სავარაუდო დანაკარგი',
  `blood_circulation_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლის მიმოქცევის სიტემა დამატებითი ინფორმაცია',
  `pulse_at_rest` int NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `pulse_after_loading` int NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `pulse_after_3_minutes` int NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `rhythm` int NULL DEFAULT NULL COMMENT 'რითმი 1 რითმული,2 არითმიული;',
  `fill_in` int NULL DEFAULT NULL COMMENT 'ავსება 1 კარგი 2 საშუალო 3 სუსტი;',
  `pulse_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'პულსი დამატებითი ინფორმაცია',
  `pressure_at_rest` int NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `pressure_after_loading` int NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `pressure_after_3_minutes` int NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `functional_test_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  `pure_tones` int NULL DEFAULT NULL COMMENT 'მოსვენებისას (მჯდომარე) წუთში',
  `curved_tones` int NULL DEFAULT NULL COMMENT 'დატვირთვის შემდეგ (30 წმ-ის განმავლობაში)',
  `clear_tones` int NULL DEFAULT NULL COMMENT '3 წუთის შემდეგ',
  `heart_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  `boundaries_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა ფუნქციური სინჯი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_blood_circulation_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_digestive_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_digestive_system`;
CREATE TABLE `patient_digestive_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `breathing_act` int NULL DEFAULT NULL COMMENT 'მუცელი მონაწილეობს სუნთქვის აქტში',
  `soft_abdomen` int NULL DEFAULT NULL COMMENT 'რბილი',
  `abdomen_painless` int NULL DEFAULT NULL COMMENT 'უმტკივნეულო',
  `abdomen_painful` int NULL DEFAULT NULL COMMENT 'მტკივნეული 1 მარჯვენა ფერდქვეშა მიდამო; 2 მარცხენა ფერდქვეშა მიდამო; 3 ეპიგასტრიუმის მიდამო; 4 ჰიპოგასტრიუმის მიდამო; 5 მარჯვენა ილიოცეკალური მიდამო;',
  `abdomen_deformation` int NULL DEFAULT NULL COMMENT 'დეფორმაცია',
  `abdomen_ascites` int NULL DEFAULT NULL COMMENT 'ასციტი',
  `abdomen_liver` int NULL DEFAULT NULL COMMENT 'ღვიძლი სცილდება საზღვრებს სმ',
  `abdomen_spleen` int NULL DEFAULT NULL COMMENT 'ელენთა ისინჯება 1 კი; 2 არა;',
  `Language_dry` int NULL DEFAULT NULL COMMENT 'მშრალი',
  `Language_nadebit` int NULL DEFAULT NULL COMMENT 'ნადებით',
  `Language_unadebo` int NULL DEFAULT NULL COMMENT 'უნადებო',
  `Language_hyperemic` int NULL DEFAULT NULL COMMENT 'ჰიპერემიული',
  `Language_wet` int NULL DEFAULT NULL COMMENT 'სველი',
  `shield_irritation` int NULL DEFAULT NULL COMMENT 'ფარის გაღიზიანების ნიშნები 1 არა; 2 კი D; 3 კი S; 4 კი D,S;',
  `carey` int NULL DEFAULT NULL COMMENT 'კერი',
  `murphy` int NULL DEFAULT NULL COMMENT 'მერფი',
  `ortner` int NULL DEFAULT NULL COMMENT 'ორტნერი',
  `bloomberg` int NULL DEFAULT NULL COMMENT 'ბლუმბერგი',
  `obraztsov` int NULL DEFAULT NULL COMMENT 'ობრაზცოვი',
  `voskresensky` int NULL DEFAULT NULL COMMENT 'ვოსკრესენსკი',
  `sitkovsky` int NULL DEFAULT NULL COMMENT 'სიტკოვსკი',
  `nausea` int NULL DEFAULT NULL COMMENT 'გულისრევა 1 კი; 2 არა;',
  `vomiting` int NULL DEFAULT NULL COMMENT 'ღებინება 1 კი; 2 არა;',
  `vomiting_frequency` int NULL DEFAULT NULL COMMENT 'ღებინება (ჯერადობა)',
  `defecation_regular` int NULL DEFAULT NULL COMMENT 'რეგულარული',
  `defecation_irregular` int NULL DEFAULT NULL COMMENT 'არარეგულარული',
  `defecation_involuntary` int NULL DEFAULT NULL COMMENT 'უნებლიე',
  `defecation_multiplicity` int NULL DEFAULT NULL COMMENT 'ჯერადობა',
  `rectum_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სწორი ნაწლავი დამატებითი ინფორმაცია',
  `feces_formed` int NULL DEFAULT NULL COMMENT 'ფორმირებული',
  `feces_unformed` int NULL DEFAULT NULL COMMENT 'არაფორმირებული',
  `feces_mucous` int NULL DEFAULT NULL COMMENT 'ლორწოვანი',
  `feces_bloody` int NULL DEFAULT NULL COMMENT 'სისხლიანი',
  `feces_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'განავალი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_digestive_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_genital_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_genital_system`;
CREATE TABLE `patient_genital_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `urination` int NULL DEFAULT NULL COMMENT 'შარდვა 1. თავისუფალი; 2. გაძნელებული; 3. მტკივნეული; 4. უნებლიე; 5. ჰემატურია; 6. ანურია;',
  `kidney` int NULL DEFAULT NULL COMMENT 'თირკმელი 1. ისინჯება D; 2. ისინჯება S; 3. ისინჯება DS; 4. არ ისინჯება D; 5. არ ისინჯება S; 6. არ ისინჯება DS;',
  `shock_syndrome` int NULL DEFAULT NULL COMMENT 'დარტყმის სინდრომი 1. დადებითი D; 2. დადებითი S; 3. დადებითი DS; 4. უარყოფითი D; 5. უარყოფითი S; 6. უარყოფითი DS;',
  `pregnancy` int NULL DEFAULT NULL COMMENT 'ორსულობა 1. კი; 2. არა;',
  `discharge_from_genitals` int NULL DEFAULT NULL COMMENT 'გამონადენი სასქესო ორგანოდან 1. ლორწოვანი; 2. სისხლიანი; 3. ჩირქოვანი; 4. სეროზული; 5. არ არის;',
  `genital_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შარდ-სასქესო სისტემა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_genital_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_history
-- ----------------------------
DROP TABLE IF EXISTS `patient_history`;
CREATE TABLE `patient_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `gender` int NULL DEFAULT NULL COMMENT '1 მამრობითი , 2 მდედრობითი',
  `blood_group` int NULL DEFAULT NULL,
  `rhesus` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `status` int NULL DEFAULT 1 COMMENT '1 აქტიური , დახურული',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_history
-- ----------------------------
INSERT INTO `patient_history` VALUES (1, 'HIS0001', 'გიორგი', 'მელელაშვილი', '01019074079', '1994-10-04', 1, 2, 1, '2021-10-18 11:49:42', 1);
INSERT INTO `patient_history` VALUES (2, NULL, 'sadasdasd', 'asdasd', '01019074070', '2021-10-21', 1, 2, 2, '2021-10-21 17:09:41', 1);

-- ----------------------------
-- Table structure for patient_nervous_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_nervous_system`;
CREATE TABLE `patient_nervous_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ ნორმის ფარგლებში',
  `excited` int NULL DEFAULT NULL COMMENT 'აგზნებული',
  `aggressive` int NULL DEFAULT NULL COMMENT 'აგრესიული',
  `aggression_cannot_revealed` int NULL DEFAULT NULL COMMENT 'აგრესია ვერ ვლინდება',
  `aggression_physical` int NULL DEFAULT NULL COMMENT 'აგრესია ფიზიკური',
  `orientation_time` int NULL DEFAULT NULL COMMENT 'ორიენტაცია დროში: 1. კი ,2. არა',
  `orientation_space` int NULL DEFAULT NULL COMMENT 'ორიენტაცია სივრცეში:: 1. კი ,2. არა',
  `orientation_environment` int NULL DEFAULT NULL COMMENT 'ორიენტაცია გარემოში:: 1. კი ,2. არა',
  `facial_asymmetry` int NULL DEFAULT NULL COMMENT 'სახის ასიმეტრია',
  `speech_difficulty` int NULL DEFAULT NULL COMMENT 'მეტყველების გაძნელება',
  `disruption_coordination` int NULL DEFAULT NULL COMMENT 'კოორდინაციის მოშლა',
  `skull_nerves` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ქალა-ტვინის ნერვები',
  `reflective_sphere` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფლექტურული სფერო',
  `driving_field` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მამოძრავებლი სფერო',
  `romberg_pose` int NULL DEFAULT NULL COMMENT 'რომბერგის პოზა: 1. მყარი, 2. არამყარი',
  `nose_finger_test` int NULL DEFAULT NULL COMMENT 'ცხვირ-თითის სინჯი: 1. ასრულებს, 2. ვერ ასრულებს',
  `nervous_system_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნერვული სისტემა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_nervous_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight`;
CREATE TABLE `patient_organ_sight`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ნორმის ფარგლებში',
  `sharpness_of_sight_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მხედველობის სიმახვილე D (VIS)',
  `sharpness_of_sight_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მხედველობის სიმახვილე S (VIS)',
  `ophthalmometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოფთალმომეტრია D',
  `ophthalmometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ოფთალმომეტრია S',
  `refractometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფრაქტომეტრია D',
  `refractometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფრაქტომეტრია S',
  `tonometry_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტონომეტრია D',
  `tonometry_s` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ტონომეტრია S',
  `within_norm` int NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `deep` int NULL DEFAULT NULL COMMENT 'ღრმა 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `narrow` int NULL DEFAULT NULL COMMENT 'ვიწრო 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `precipitate` int NULL DEFAULT NULL COMMENT 'პრეციპიტატი 2. კი დიდი D; 3. კი დიდი S; 4. კი დიდი DS; 5. კი საშუალო D; 6. კი საშუალო S; 7. კი საშუალო DS; 8. კი პიგმენტური D; 9. კი პიგმენტური S; 10. კი პიგმენტური DS;',
  `endothermic_dust` int NULL DEFAULT NULL COMMENT 'ენდოთერმული მტვერი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `cells` int NULL DEFAULT NULL COMMENT 'უჯრედები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyphema` int NULL DEFAULT NULL COMMENT 'ჰიფემა  1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `sinecia` int NULL DEFAULT NULL COMMENT 'სინექია 1. არ არის, 2. კი - წინა D, 3. კი - წინა S, 4. კი - წინა DS, 5. კი - უკანა D, 6. კი - უკანა S, 7. კი - უკანა DS, 8. კი - D, 9. კი - S, 10. კი - DS',
  `structural` int NULL DEFAULT NULL COMMENT 'სტრუქტურული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `atrophic` int NULL DEFAULT NULL COMMENT 'ატროფიული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyperemic` int NULL DEFAULT NULL COMMENT 'ჰიპერემიული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `swollen` int NULL DEFAULT NULL COMMENT 'შეშუპებული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `posterior_sinuses` int NULL DEFAULT NULL COMMENT 'უკანა სინექიები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `coloboma` int NULL DEFAULT NULL COMMENT 'კოლობომა 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `rubeoz` int NULL DEFAULT NULL COMMENT 'რუბეოზი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `iridosis` int NULL DEFAULT NULL COMMENT 'ირიდოშიზისი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_pigmented` int NULL DEFAULT NULL COMMENT 'კვანძები - პიგმენტური 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_koeppe` int NULL DEFAULT NULL COMMENT 'კვანძები - koeppe 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nodes_busacca` int NULL DEFAULT NULL COMMENT 'კვანძები - busacca 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `aniridia` int NULL DEFAULT NULL COMMENT 'ანირიდია 1. არა; 2. სრული D; 3. სრული S; 4. სრული DS; 5. არასრული D; 6. არასრული S; 7. არასრული DS;',
  `round` int NULL DEFAULT NULL COMMENT 'მრგვალი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `correct` int NULL DEFAULT NULL COMMENT 'სწორი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `wrong` int NULL DEFAULT NULL COMMENT 'არასწორი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `anisocoria` int NULL DEFAULT NULL COMMENT 'ანიზოქორია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `correctopia` int NULL DEFAULT NULL COMMENT 'კორექტოპია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `pseudocoria` int NULL DEFAULT NULL COMMENT 'ფსევდოკორია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `mydriasis` int NULL DEFAULT NULL COMMENT 'მიდრიაზი 1. არ არის; 2. სპაზმური D; 3. სპაზმური S; 4. სპაზმური DS; 5. პარალიზური D; 6. პარალიზური S; 7. პარალიზური DS;',
  `miosis` int NULL DEFAULT NULL COMMENT 'მიოზი  1. არ არის; 2. სპაზმური D; 3. სპაზმური S; 4. სპაზმური DS; 5. პარალიზური D; 6. პარალიზური S; 7. პარალიზური DS;',
  `light_reaction_stored` int NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე შენახულია  1. კი D; 2. კი S; 3. კი DS;',
  `light_reaction_dunea` int NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე დუნეა  1. კი D; 2. კი S; 3. კი DS;',
  `light_reaction_is_not` int NULL DEFAULT NULL COMMENT 'რეაქცია სინათლეზე არ არის  1. კი D; 2. კი S; 3. კი DS;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_broli
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_broli`;
CREATE TABLE `patient_organ_sight_broli`  (
  `id` int NOT NULL,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `broli` int NULL DEFAULT NULL COMMENT 'ბროლი 1. გამჭვირვალე; 2. შემღვრეული; 3. შემღვრევა; 4. მდებარეობა; 5. სხვა;',
  `transparent;` int NULL DEFAULT NULL COMMENT 'გამჭვირვალე 1. კი; 2. არა;',
  `distribution_turbidity` int NULL DEFAULT NULL COMMENT 'შემღვრევის გავრცელება 1. კაფსულირებული; 2. შრეობრივი; 3. ქერქოვანი ; 4. ბირთვოვანი ; 5. ტოტალური ;',
  `type_turbulence` int NULL DEFAULT NULL COMMENT 'შემღვრევის ტიპი 1. დაწყებითი; 2. ინტენსიური; 3. დიფუზური; 4. რუხი; 5. რძისფერი;',
  `place` int NULL DEFAULT NULL COMMENT 'მდებარეობა 1. ეტოპია ; 2. სუბლუქსაცია; 3. აფაკია; 4. არტიფაკია ;',
  `location` int NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `bruli_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ბროლი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_broli
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_retina
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_retina`;
CREATE TABLE `patient_organ_sight_retina`  (
  `id` int NOT NULL,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retina` int NULL DEFAULT NULL COMMENT 'ბადურა 1. მხედველობის ნერვის დვრილი; 2. საზღვრები; 3. არტერიები; 4. ვენები; 5. სისხლჩაქცევები; 6. დისტროფიები; 7. ექსუდატები; 8. გახლეჩა; 9. ლოკალიზაცია; 10. სხვა;',
  `optic_nerve` int NULL DEFAULT NULL COMMENT 'მხედველობის ნერვის დვრილი 1. ვარდისფერი; 2. ჰიპერემიული; 3. მოთეთრო-მორუხო; 4. შეშუპებული ; 5. პრომინირებული ;',
  `boundaries` int NULL DEFAULT NULL COMMENT 'საზღვრები 1. მკაფიო; 2. წაშლილი ;',
  `arteries` int NULL DEFAULT NULL COMMENT 'არტერიები 1. ნორმის ფარგლებში ; 2. შევიწროებული ; 3. გაფართოებული);',
  `veins` int NULL DEFAULT NULL COMMENT 'ვენები 1. ნორმის ფარგლებში; 2. შევიწროებული; 3. გაფართოებული;',
  `bruises` int NULL DEFAULT NULL COMMENT 'სისხლჩაქცევები 1. რეტინალური ; 2. პრერეტინალური; 3. სუბრეტინალური;',
  `dystrophies` int NULL DEFAULT NULL COMMENT 'დისტროფიები 1. ბადისებური ; 2. ეკვატორიალური ; 3. ’’ლოკოკინას კვალი’’ ; 4. ფიფქები ; 5. ‘’სპილენძის მავთულის ფენომენი’’; 6. ‘’ვერცხლის მავთულის ფენომენი’’; 7. რეტინოშიზისი ; 8. დრუზები;',
  `exudates` int NULL DEFAULT NULL COMMENT 'ექსუდატები 1. მყარი ; 2. თხევადი ; 3. ჰემორაგიული;',
  `rupture` int NULL DEFAULT NULL COMMENT 'გახლეჩვა 1. სარქვლისებური ; 2. ნალისებური ; 3. ხვრელოვანი მრგვალი; 4. ხვრელოვანი ოვალური ; 5. ატიპური ;',
  `localization` int NULL DEFAULT NULL COMMENT 'ლოკალიზაცია 1. დაკბილულ ხაზზე ; 2. დაკბილული ხაზის უკან ; 3. ეკვატორზე; 4. ეკვატორის უკან ; 5. მაკულაზე ;',
  `retina_location` int NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `retina_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ბადურა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_retina
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_sclera
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_sclera`;
CREATE TABLE `patient_organ_sight_sclera`  (
  `id` int NOT NULL,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sclera_type` int NULL DEFAULT NULL COMMENT 'სკლერა 1. სკლერა; 2. დისკოლორაცია კეროვანი; 3. დისკოლორაცია დიფუზური; 4. სხვა;',
  `sclera` int NULL DEFAULT NULL COMMENT 'სკლერა 1. უცვლელი ; 2. ჰიპერემიული; 3. მუქი იისფერი; 4. მორუხო; 5. კვანძოვანი სიწითლე; 6. სტაფილომა;',
  `discoloration_focal` int NULL DEFAULT NULL COMMENT 'დისკოლორაცია კეროვანი 1. ჩამოშლა; 2. ჰემოქრომატოზი;',
  `discoloration_diffuse` int NULL DEFAULT NULL COMMENT 'დისკოლორაცია დიფუზური 1. ყვითელი; 2. ცისფერი;',
  `sclera_location` int NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `sclera_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სკლერა დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_sclera
-- ----------------------------

-- ----------------------------
-- Table structure for patient_organ_sight_vitreous_body
-- ----------------------------
DROP TABLE IF EXISTS `patient_organ_sight_vitreous_body`;
CREATE TABLE `patient_organ_sight_vitreous_body`  (
  `id` int NOT NULL,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vitreous_body` int NULL DEFAULT NULL COMMENT 'მინისებრი სხეული 1. გამჭვირვალე; 2. ერთეული შემღვრევები; 3. ანთებადი ინფილტრატი; 4. ჰემოფთალმი; 5. შვარტა; 6. თიაქარი; 7. სხვა;',
  `vitreous_body_location` int NULL DEFAULT NULL COMMENT 'ლოკაცია 1. D; 2. S; 3. DS;',
  `vitreous_body_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'მინისებრი სხეული დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_organ_sight_vitreous_body
-- ----------------------------

-- ----------------------------
-- Table structure for patient_reflex_attemps
-- ----------------------------
DROP TABLE IF EXISTS `patient_reflex_attemps`;
CREATE TABLE `patient_reflex_attemps`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე/ ნორმის ფარგლებში',
  `kernig` int NULL DEFAULT NULL COMMENT 'კერნიგი 1. D, 2. S, 3. D.S',
  `babinski` int NULL DEFAULT NULL COMMENT 'ბაბინსკი 1. D, 2. S, 3. D.S',
  `muscle_tone` int NULL DEFAULT NULL COMMENT 'კუნთების ტონუსი 1. მომატება D, 2. მომატება S, 3. მომატება DS, 4. დაქვეითება D,5. დაქვეითება S, 6. დაქვეითება DS',
  `neck_muscle_rigidity` int NULL DEFAULT NULL COMMENT 'კისრის კუნთების რიგიდობა',
  `nystagmus` int NULL DEFAULT NULL COMMENT 'ნისტაგმი 1. ვერტიკალური - D, 2. ჰორიზონტალური -D, 3. ვერტიკალური - S, 4. ჰორიზონტალური - S, 5. ვერტიკალური - DS, 6. ჰორიზონტალური -DS',
  `tonic_seizures` int NULL DEFAULT NULL COMMENT 'ტონური კრუნჩხვები',
  `clonic_seizures` int NULL DEFAULT NULL COMMENT 'კლონური კრუნჩხვები',
  `hypokinesia` int NULL DEFAULT NULL COMMENT 'ჰიპოკინეზია',
  `hyperemic` int NULL DEFAULT NULL COMMENT 'ჰიპერემიული',
  `miosis` int NULL DEFAULT NULL COMMENT 'მიოზი',
  `mydriasis` int NULL DEFAULT NULL COMMENT 'მიდრიაზი',
  `anisocoria` int NULL DEFAULT NULL COMMENT 'ანიზოკორია 1. D, 2. S, 3. D.S',
  `trism` int NULL DEFAULT NULL COMMENT 'ტრიზმი',
  `photo_reaction_d` int NULL DEFAULT NULL COMMENT 'ფოტორეაქცია D 1. ნორმის ფარგლებში, 2. შესუსტებული, 3. არ არის',
  `photo_reaction_s` int NULL DEFAULT NULL COMMENT 'ფოტორეაქცია S 1. ნორმის ფარგლებში, 2. შესუსტებული, 3. არ არის',
  `reflex_attemps_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'რეფლექსები და ცდები დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_reflex_attemps
-- ----------------------------

-- ----------------------------
-- Table structure for patient_respiratory_system
-- ----------------------------
DROP TABLE IF EXISTS `patient_respiratory_system`;
CREATE TABLE `patient_respiratory_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pneumothorax` int NULL DEFAULT NULL COMMENT 'პნევმოთორაქსი',
  `floating_chest` int NULL DEFAULT NULL COMMENT 'მცურავი გულმკერდი',
  `passage` int NULL DEFAULT NULL COMMENT 'გამავლობა 1 ნორმის ფარგლებში ,2 დარღვეული;',
  `aspiration` int NULL DEFAULT NULL COMMENT 'ასპირაცია 1 კი, 2 არა',
  `foreign_body` int NULL DEFAULT NULL COMMENT 'უცხო სხეული 1 კი D, 2 კი S, 3 კი DS, 4 არა',
  `respiratory_disorders` int NULL DEFAULT NULL COMMENT 'სუნთქვის დარღვევა 1 სპონტანური; 2 ტაქიპნოე; 3 გაგრძელებული; 4 აგონალური; 5 არ არის;',
  `chest_excursion` int NULL DEFAULT NULL COMMENT 'გულმკერდის ექსკურსია 1 სიმეტრიული; 2 ასიმეტრიული D; 3 ასიმეტრიული S; 4 ასიმეტრიული D,S;',
  `spirometry` int NULL DEFAULT NULL COMMENT 'სპირომეტრია',
  `cough` int NULL DEFAULT NULL COMMENT 'ხველა 1 კი, 2 არა',
  `vesicular` int NULL DEFAULT NULL COMMENT 'ვეზიკულური 1 D; 2 S; 3 D,S;',
  `bronchial` int NULL DEFAULT NULL COMMENT 'ბრონქული 1 D; 2 S; 3 D,S;',
  `weakened` int NULL DEFAULT NULL COMMENT 'შესუსტებული 1 D; 2 S; 3 D,S;',
  `pueruli` int NULL DEFAULT NULL COMMENT 'პუერული 1 კი',
  `dry` int NULL DEFAULT NULL COMMENT 'მშრალი 1 D; 2 S; 3 D,S;',
  `wet` int NULL DEFAULT NULL COMMENT 'სველი 1 D; 2 S; 3 D,S;',
  `thin_vesicular` int NULL DEFAULT NULL COMMENT 'წვრილ ბუშტუკოვანი 1 D; 2 S; 3 D,S;',
  `large_vesicular` int NULL DEFAULT NULL COMMENT 'მსხვილ ბუშტუკოვანი 1 D; 2 S; 3 D,S;',
  `crepitation` int NULL DEFAULT NULL COMMENT 'კრეპიტაცია 1 კი',
  `inspirational` int NULL DEFAULT NULL COMMENT 'ინსპირაციული',
  `expiratory` int NULL DEFAULT NULL COMMENT 'ექსპირაციული',
  `whistling` int NULL DEFAULT NULL COMMENT 'მსტვინავი',
  `breath_crepitation` int NULL DEFAULT NULL COMMENT 'კრეპიტაცია',
  `stridor` int NULL DEFAULT NULL COMMENT 'სტრიდორი',
  `nadebi` int NULL DEFAULT NULL COMMENT 'სასის რკალები ნადებით',
  `unadebo` int NULL DEFAULT NULL COMMENT 'სასის რკალები უნადებო',
  `hyperemic` int NULL DEFAULT NULL COMMENT 'სასის რკალები ჰიპერემიული',
  `tonsils_hyperemic` int NULL DEFAULT NULL COMMENT 'ტონზილები ჰიპერემიული',
  `tonsils_hyperplastic` int NULL DEFAULT NULL COMMENT 'ტონზილები ჰიპერპლაზიური',
  `sputum` int NULL DEFAULT NULL COMMENT 'ნახველი',
  `sputum_color` int NULL DEFAULT NULL COMMENT 'ფერი',
  `sputum_consistency` int NULL DEFAULT NULL COMMENT 'კონსისტენცია',
  `sputum_composition` int NULL DEFAULT NULL COMMENT 'შემადგენლობა',
  `sputum_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნახველი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_respiratory_system
-- ----------------------------

-- ----------------------------
-- Table structure for patient_throat_ear_nose
-- ----------------------------
DROP TABLE IF EXISTS `patient_throat_ear_nose`;
CREATE TABLE `patient_throat_ear_nose`  (
  `id` int NOT NULL,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `without_pathology` int NULL DEFAULT NULL COMMENT 'პათოლოგიის გარეშე',
  `ear_ache` int NULL DEFAULT NULL COMMENT 'ყურის ტკივილი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `noise_in_ears` int NULL DEFAULT NULL COMMENT 'ხმაური ყურებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `itching_in_ears` int NULL DEFAULT NULL COMMENT 'ქავილი ყურებში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hyperemia` int NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `swelling` int NULL DEFAULT NULL COMMENT 'შეშუპება 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `hemorrhage` int NULL DEFAULT NULL COMMENT 'სისხლჩაქცევა 1. არა; 2. კი ნიჟარა D; 3. კი ნიჟარა S; 4. კი ნიჟარა DS; 5. კი გარეთა სასმენი მილი D; 6. კი გარეთა სასმენი მილი S; 7. კი გარეთა სასმენი მილი DS; 8. ნიჟარა და გარეთა სასმენი მილი D; 9. ნიჟარა და გარეთა სასმენი მილი S; 10. ნიჟარა და გარეთა სასმენი მილი DS;',
  `abnormal_discharge` int NULL DEFAULT NULL COMMENT 'პათოლოგიური გამონადენი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `sulfur_plug` int NULL DEFAULT NULL COMMENT 'გოგირდოვანი საცობი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `outer_ear_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'გარეთა ყური დამატებითი ინფორმაცია',
  `perforation_of_plaque` int NULL DEFAULT NULL COMMENT 'დაფის აპკის პერფორაცია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `light_reflex` int NULL DEFAULT NULL COMMENT 'სინათლის რეფლექსი 1. არა; 2. კი სრული D; 3. კი სრული S; 4. კი სრული DS; 5. კი არასრული D; 6. კი არასრული S; 7. კი არასრული DS;',
  `fluid_cavity_board` int NULL DEFAULT NULL COMMENT 'სითხე დაფის ღრუში 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `granulations` int NULL DEFAULT NULL COMMENT 'გრანულაციები 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `middle_ear_hyperemia` int NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `middle_ear_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'შუა ყური დამატებითი ინფორმაცია',
  `within_norm` int NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში',
  `whispered` int NULL DEFAULT NULL COMMENT 'ჩურჩულით მეტყველება',
  `hearing_loss_conductive` int NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა კონდუქტიური 1. D; 2. S; 3. DS;',
  `hearing_loss_neurosensory` int NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა ნეიროსენსორული 1. D; 2. S; 3. DS;',
  `hearing_loss_mixed` int NULL DEFAULT NULL COMMENT 'სმენაჩლუნგობა შერეული 1. D; 2. S; 3. DS;',
  `hearing_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სმენა დამატებითი ინფორმაცია',
  `narrowed` int NULL DEFAULT NULL COMMENT 'შევიწროვებული 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `breathe_free` int NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა თავისუფალი 1. D; 2. S; 3. DS;',
  `breathe_weakened` int NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა შესუსტებული 1. D; 2. S; 3. DS;',
  `breathe_blocked` int NULL DEFAULT NULL COMMENT 'ცხვირით სუნთქვა ბლოკირებული 1. D; 2. S; 3. DS;',
  `nose_discharge` int NULL DEFAULT NULL COMMENT 'გამონადენი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `nose_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ცხვირი დამატებითი ინფორმაცია',
  `sinks_hyperemia` int NULL DEFAULT NULL COMMENT 'ჰიპერემია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `hypertrophy` int NULL DEFAULT NULL COMMENT 'ჰიპერტროფია 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `dzgide_curved` int NULL DEFAULT NULL COMMENT 'ძგიდე  გამრუდებული 1. გამრუდებული - კი; 2. გამრუდებული - არა;',
  `sinks_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ნიჟარები დამატებითი ინფორმაცია',
  `polyposis_tissue` int NULL DEFAULT NULL COMMENT 'პოლიპოზური ქსოვილი 1. არა; 2. კი D; 3. კი S; 4. კი DS;',
  `vascular_picture_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სისხლძარღვოვანი სურათი',
  `smell_within_norm` int NULL DEFAULT NULL COMMENT 'ნორმის ფარგლებში',
  `hypoosmia` int NULL DEFAULT NULL COMMENT 'ჰიპოოსმია',
  `anosmia` int NULL DEFAULT NULL COMMENT 'ანოსმია',
  `barofunction_valsalva_attempt` int NULL DEFAULT NULL COMMENT 'ბაროფუნქცია / ვალსალვას ცდა',
  `barofunction_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `audiometry` int NULL DEFAULT NULL COMMENT 'აუდიომეტრია',
  `other_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `file_id` int NULL DEFAULT NULL COMMENT 'მიმაგრებული ფაილი',
  `additional_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `vestibular_apparatus` int NULL DEFAULT NULL COMMENT 'ვესტიბულური აპარატი / ნორმის ფარგლებში 1. არა; 2. კი;',
  `vestibular_other` int NULL DEFAULT NULL COMMENT 'სხვა',
  `smell_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყნოსვა დამატებითი ინფორმაცია',
  `adrenal_glands` int NULL DEFAULT NULL COMMENT 'ნუშურა ჯირკვლები 1. არის; 2. არ არის;',
  `throat` int NULL DEFAULT NULL COMMENT 'ხახა 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `throat_other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სხვა',
  `voice_yogis` int NULL DEFAULT NULL COMMENT 'სახმო იოგები 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `voice_yogis_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'დამატებითი ინფორმაცია',
  `voice_yogis_movement` int NULL DEFAULT NULL COMMENT 'სახმო იოგების მოძრაობა 1. სრული; 2. არასრული D; 3. არასრული S; 4. არასრული DS;',
  `larynx` int NULL DEFAULT NULL COMMENT 'ხორხი 1. ნორმის ფარგლებში; 2. ჰიპერემია; 3. შეშუპება; 4. პათოლოგიური ნადები;',
  `throat_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ყელი დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_throat_ear_nose
-- ----------------------------

-- ----------------------------
-- Table structure for patient_throat_ear_nose_files
-- ----------------------------
DROP TABLE IF EXISTS `patient_throat_ear_nose_files`;
CREATE TABLE `patient_throat_ear_nose_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_throat_id` int NULL DEFAULT NULL COMMENT 'patient_throat_ear_nose ის იდ ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_throat_ear_nose_files
-- ----------------------------

-- ----------------------------
-- Table structure for patient_vital_options
-- ----------------------------
DROP TABLE IF EXISTS `patient_vital_options`;
CREATE TABLE `patient_vital_options`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NULL DEFAULT NULL,
  `reg_date` datetime NULL DEFAULT current_timestamp,
  `reg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature` int NULL DEFAULT NULL COMMENT 'ტემპერატურა',
  `system_pressure` int NULL DEFAULT NULL COMMENT 'სისტ.წნევა მმ/ვწყ.სვ',
  `diast_pressure` int NULL DEFAULT NULL COMMENT 'დიასტ. წნევა მმ/ვწყ.სვ',
  `pulse` int NULL DEFAULT NULL COMMENT 'პულსი',
  `heart_rate` int NULL DEFAULT NULL COMMENT 'გულისცემის სიხშირე',
  `oxygen_saturation` int NULL DEFAULT NULL COMMENT 'ჟანგბადით სატურაცია %',
  `respiratory_rate` int NULL DEFAULT NULL COMMENT 'სუნთქვის სიხშირე',
  `patient_weight` int NULL DEFAULT NULL COMMENT 'პაციენტის წონა (კგ)',
  `defecation` int NULL DEFAULT NULL COMMENT 'დეფეკაცია 24 სთ-ში',
  `fluid_released` int NULL DEFAULT NULL COMMENT 'დრენაჟიდან გამოყოფილი სითხის რაოდენობა (მლ)',
  `urine_excreted` int NULL DEFAULT NULL COMMENT 'გამოყოფილი შარდის რაოდენობა (მლ)',
  `fluid_taken` int NULL DEFAULT NULL COMMENT 'მიღებული სითხის რაოდენობა (მლ)',
  `vital_options_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'სასიცოცხლო პარამეტრები დამატებითი ინფორმაცია',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_vital_options
-- ----------------------------

-- ----------------------------
-- Table structure for rhesus_types
-- ----------------------------
DROP TABLE IF EXISTS `rhesus_types`;
CREATE TABLE `rhesus_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
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

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visit_number` int NULL DEFAULT NULL,
  `register_date` date NULL DEFAULT NULL,
  `history` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `doctor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `doctor_structure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'ნიკა', 'ჯიბლაძე', '01019074070', 2147483647, '2021-09-07', NULL, '3', NULL, 1);
INSERT INTO `users` VALUES (2, 'გიორგი', 'მამულაშვილი', '0111214125', 113223223, '2021-09-07', NULL, '2', NULL, 3);
INSERT INTO `users` VALUES (26, 'ნიკა', 'ჯიბლაძე', '01019074070', 1634552040, '2021-10-18', NULL, '1', NULL, 2);

SET FOREIGN_KEY_CHECKS = 1;
