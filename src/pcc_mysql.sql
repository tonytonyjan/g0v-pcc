CREATE DATABASE
  IF NOT EXISTS pcc CHARACTER SET = 'utf8';
    USE pcc;
    DROP TABLE tender;
    CREATE TABLE tender
      (
        entity_code                  VARCHAR(100) COMMENT '機關代碼',
        entity_name                  VARCHAR(100) COMMENT '機關名稱',
        entity_unit_name             VARCHAR(100) COMMENT '單位名稱',
        entity_address               VARCHAR(100) COMMENT '機關地址',
        entity_contact               VARCHAR(100) COMMENT '聯絡人',
        entity_phone                 VARCHAR(100) COMMENT '聯絡電話',
        entity_fax                   VARCHAR(100) COMMENT '傳真號碼',
        tender_code                  VARCHAR(100) COMMENT '標案案號',
        tender_type                  VARCHAR(100) COMMENT '招標方式',
        award_type                   VARCHAR(100) COMMENT '決標方式',
        publication_number           VARCHAR(100) COMMENT '新增公告傳輸次數',
        publication_amendment_number VARCHAR(100) COMMENT '公告更正序號',
        tender_name                  VARCHAR(100) COMMENT '標案名稱',
        award_data_type              VARCHAR(100) COMMENT '決標資料類別',
        inter_entity_supply_contract VARCHAR(100) COMMENT '是否屬共同供應契約採購',
        multiple_award               BOOLEAN COMMENT '是否複數決標',
        joint_tendering              BOOLEAN COMMENT '是否共同投標',
        subject_category             VARCHAR(100) COMMENT '標的分類',
        -- amending  BOOLEAN  COMMENT '是否屬契約變更',
        turnkey                    BOOLEAN COMMENT '是否屬統包',
        professional_certified     BOOLEAN COMMENT '是否應依公共工程專業技師簽證規則實施技師簽證',
        opening                    VARCHAR(100) COMMENT '開標時間',
        amount_range               VARCHAR(100) COMMENT '採購金額級距',
        budget_revealed            BOOLEAN COMMENT '預算金額是否公開',
        took_grant                 BOOLEAN COMMENT '是否受機關補助',
        delivery_location          VARCHAR(100) COMMENT '履約地點',
        delivery_location_inc_area VARCHAR(100) COMMENT '履約地點（含地區）',
        disabled_priority          VARCHAR(100) COMMENT '是否屬優先採購身心障礙福利機構產品或勞務',
        special_budget             BOOLEAN COMMENT '是否含特別預算',
        special_project            VARCHAR(100) COMMENT '歸屬計畫類別',
        standard_contract          BOOLEAN COMMENT '本案採購契約是否採用主管機關訂定之範本',
        conduct                    VARCHAR(100) COMMENT '辦理方式 (自辦|...)',
        no_of_tenderer             VARCHAR(100) COMMENT '投標廠商家數',
        awarding_pub_serial        VARCHAR(100) COMMENT '決標公告序號',
        awarding_date DATE COMMENT '決標日期',
        awarding_pub_date DATE COMMENT '決標公告日期',
        publish_on_info_network      BOOLEAN COMMENT '是否刊登公報',
        estimated_cost               INTEGER COMMENT '底價金額',
        estimated_cost_open          BOOLEAN COMMENT '底價金額是否公開',
        awarded_value                INTEGER COMMENT '總決標金額',
        awarded_value_open           BOOLEAN COMMENT '總決標金額是否公開',
        adjustment_with_cpi          BOOLEAN COMMENT '契約是否訂有依物價指數調整價金規定',
        not_adjustment_with_cpi_desc VARCHAR(1000) COMMENT '未列物價調整規定說明',
        preforming_entity            VARCHAR(100) COMMENT '履約執行機關',
        additional_desc              VARCHAR(100) COMMENT '附加說明',
        number_of_award              INTEGER COMMENT '決標品項數',
        PRIMARY KEY(tender_code)
      );
    DROP TABLE tenderer;
    CREATE TABLE tenderer
      (
        tender_code                    VARCHAR(100) COMMENT '標案案號',
        tenderer                       INTEGER COMMENT '投標廠商1',
        supplier_code                  VARCHAR(100) COMMENT '　廠商代碼',
        supplier_name                  VARCHAR(100) COMMENT '　廠商名稱',
        awarded                        BOOLEAN COMMENT '　是否得標',
        supplier_org_type              VARCHAR(100) COMMENT '　組織型態',
        supplier_qualification         VARCHAR(100) COMMENT '　廠商資格',
        supplier_address               VARCHAR(100) COMMENT '　廠商地址',
        supplier_phone                 VARCHAR(100) COMMENT '　廠商電話',
        awarded_amount                 VARCHAR(100) COMMENT '　決標金額',
        supplier_country               VARCHAR(100) COMMENT '　得標廠商國別',
        product_origin_country         VARCHAR(100) COMMENT '　原產地國別',
        supplier_is_sme                VARCHAR(100) COMMENT '　是否為中小企業',
        delivery_duration              VARCHAR(100) COMMENT '　履約起迄日期',
        supplier_employee_over_hundred INTEGER COMMENT '　雇用員工總人數是否超過100人',
        supplier_employee_number       VARCHAR(100) COMMENT '　僱用員工總人數',
        supplier_no_of_aboriginal      VARCHAR(100) COMMENT '　已僱用原住民人數',
        supplier_no_of_disabled        VARCHAR(100) COMMENT '　已僱用身心障礙者人數',
        PRIMARY KEY(tender_code)
      );
    DROP TABLE awarded_items;
    CREATE TABLE awarded_items
      (
        tender_code                     VARCHAR(100) COMMENT '標案案號',
        item                            VARCHAR(100) COMMENT '第1品項',
        item_name                       VARCHAR(100) COMMENT '品項名稱',
        budget_by_unit_price_and_amount VARCHAR(100) COMMENT '　是否以單價及預估需求數量之乘積決定最低標',
        supplier                        INTEGER COMMENT '得標廠商',
        supplier_awarded                BOOLEAN COMMENT '是否得標',
        supplier_name                   VARCHAR(100) COMMENT '得標廠商/未得標廠商',
        supplied_amount                 VARCHAR(100) COMMENT '預估需求數量',
        awarded_value                   VARCHAR(100) COMMENT '決標金額',
        estimated_cost                  VARCHAR(100) COMMENT '底價金額',
        qualified_supplier              BOOLEAN COMMENT '是否合格(未得標)',
        tendered_value                  INTEGER COMMENT '標價金額(未得標)',
        why_unawarded                   VARCHAR(100) COMMENT '未得標原因',
        PRIMARY KEY(tender_code,item,supplier)
      );
