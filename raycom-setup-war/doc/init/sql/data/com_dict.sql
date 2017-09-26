delete from com_dict;

insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'PM10','设备故障维修工单','applicationServiceType','服务申请子类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'PM20','设备长期保修工单','applicationServiceType','服务申请子类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'PM30','设备保修记录工单','applicationServiceType','服务申请子类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'PM40','预防性维修工单','applicationServiceType','服务申请子类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ZX01','采购申请协和服务','applicationType','服务申请类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','手动','applyDistinct','申领方式类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','自动','applyDistinct','申领方式类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','库存品采购','applyType','申领类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','非库存品采购','applyType','申领类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'00','待审批','approveStatus','MST|DTL;初始状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','审批中','approveStatus','MST','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','审批通过','approveStatus','MST|DTL;审批通过后续还有审批','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审批拒绝','approveStatus','MST|DTL;审批拒绝','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'approveType.vendor','供应商审批','approveType','审批类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'approveType.material','物资审批','approveType','审批类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'approveType.inventory','盘点审批','approveType','审批类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'approveType.cancelStock','退库审批','approveType','审批类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'approveType.materialApprove','申请新物资审批','approveType','审批类型','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','使用率','arithmeticType','算法类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','订货点','arithmeticType','算法类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','固定值','arithmeticType','算法类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','预测订货','arithmeticType','算法类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'N','未使用','AuthCodeStatus','授权码状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'Y','已使用','AuthCodeStatus','授权码状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'O','已过期','AuthCodeStatus','授权码状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'00','未生成申领单','autoApplyStatus','自动申领状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','未入库','autoApplyStatus','自动申领状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','已入库','autoApplyStatus','自动申领状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','固定资产','billsType','报账单类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','低值易耗','billsType','报账单类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'00','待审批','cancelStockStatus','退库单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','审批通过','cancelStockStatus','退库单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','审批拒绝','cancelStockStatus','退库单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'vendor','供应商资质','certificateName','资质证类别 ','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'manufacture','生产厂家资质','certificateName','资质证类别','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'author','授权资质','certificateName','资质证类别','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'businessLicense','营业执照','certificateType','资质证类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'taxId','税务登记号','certificateType','资质证类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'orgCode','组织机构号','certificateType','资质证类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'instruRegLicense','器械注册证','certificateType','资质证类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'businessCert','经营许可证','certificateType','资质证类型','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'productLicense','生产许可证','certificateType','资质证类型','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'salesmanAuthor','业务员授权','certificateType','资质证类型','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'agencyAuthor','代理授权书','certificateType','资质证类型','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'merge','三证合一','certificateType','资质证类型','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'merge51','五证合一','certificateType','资质证类型','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'other','其他证件','certificateType','资质证类型','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','不可收费','chargeType','物资收费类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','单独收费','chargeType','物资收费类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','打包收费','chargeType','物资收费类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'soe','国有企业','companyType','公司性质','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'collective','集体企业','companyType','公司性质','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'stock','股份制合作制企业','companyType','公司性质','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'private','私营企业','companyType','公司性质','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'liability','有限责任公司','companyType','公司性质','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'limited','股份有限公司','companyType','公司性质','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'joint','联营企业','companyType','公司性质','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'foreign-owned','外商独资','companyType','公司性质','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'self-employed','个体','companyType','公司性质','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'liability_owned','有限责任公司（自然人独资）','companyType','公司性质','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待审批','contractStatus','合同状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','审批通过','contractStatus','合同状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审批拒绝','contractStatus','合同状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','已打印','contractStatus','合同状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','复核通过','contractStatus','合同状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','复核拒绝','contractStatus','合同状态','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','已完成','contractStatus','合同状态','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','设备合同','contractType','合同类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','高值耗材合同','contractType','合同类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','低值耗材合同','contractType','合同类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'RMB','人民币','currency','币种','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'USD','美元','currency','币种','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'HKD','港币','currency','币种','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'GBP','英镑','currency','币种','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'CHF','瑞士法郎','currency','币种','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'SGD','新加坡元','currency','币种','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'NLG','荷兰盾','currency','币种','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'BEF','比利时法郎','currency','币种','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ITL','意大利里拉','currency','币种','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'JPY','日元','currency','币种','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'CAD','加拿大元','currency','币种','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AUD','澳大利亚元','currency','币种','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ESP','西班牙比塞塔','currency','币种','13','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'EUR','欧元','currency','币种','14','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'FIM','芬兰马克','currency','币种','15','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'NZD','新西兰元','currency','币种','16','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ATS','奥地利先令','currency','币种','17','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'NOK','挪威克朗','currency','币种','18','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'THB','泰国铢','currency','币种','19','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'DKK','丹麦克朗','currency','币种','20','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'PHP','菲律宾比索','currency','币种','21','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'SEK','瑞士克朗','currency','币种','22','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'MOP','澳门元','currency','币种','23','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AFA','阿富汗尼','currency','币种','24','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'DZD','阿尔及利亚第纳尔','currency','币种','25','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ANG','安第列斯群岛吨','currency','币种','26','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ATS','奥地利先令','currency','币种','27','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AWF','阿鲁巴岛弗罗林','currency','币种','28','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'BAK','波斯尼亚和黑塞哥维那','currency','币种','29','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'BBD','巴巴多斯元','currency','币种','30','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'BEF','比利时法郎','currency','币种','31','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AZM','阿塞拜疆','currency','币种','32','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'XCD','安提瓜和巴布达岛东加勒比海元','currency','币种','33','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'XCD','安圭拉东加勒比海元','currency','币种','34','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ARP','阿根廷比索','currency','币种','35','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AON','安哥拉','currency','币种','36','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AMD','亚美尼亚','currency','币种','37','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'FRF','安道尔法郎','currency','币种','38','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'AED','阿联酋迪拉姆','currency','币种','39','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ALL','阿尔巴尼亚','currency','币种','40','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','暂存','deviceApplyType','设备采购申请','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待审批','deviceApplyType','设备采购申请','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','科室审批通过','deviceApplyType','设备采购申请','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','审批拒绝','deviceApplyType','设备采购申请','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','器材处审批通过','deviceApplyType','设备采购申请','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','OA审批通过','deviceApplyType','设备采购申请','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','处理完成','deviceApplyType','设备采购申请','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'A','甲类设备','emtAbcflag','设备等级','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'B','乙类设备','emtAbcflag','设备等级','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'C','丙类设备','emtAbcflag','设备等级','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待勾选','emtAccStatus','设备安装验收单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待OA审核','emtAccStatus','设备安装验收单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审核通过','emtAccStatus','设备安装验收单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','审核拒绝','emtAccStatus','设备安装验收单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'A','通用设备','emtType','设备种类','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'B','专用设备','emtType','设备种类','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'Z','无形资产','emtType','设备种类','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','自筹','fundSourceType','自筹','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','混合经费','fundSourceType','混合经费','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'1','男','gender','性别','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'2','女','gender','性别','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','Ⅰ类','instrumentType','器械分类等级','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','Ⅱ类','instrumentType','器械分类等级','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','Ⅲ类','instrumentType','器械分类等级','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','无','instrumentType','器械分类等级','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待盘点','inventoryStatus','盘点状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','盘点中','inventoryStatus','盘点状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','待确认结果','inventoryStatus','盘点状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','已关闭','inventoryStatus','盘点状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','盘点完成','inventoryStatus','盘点状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','确认中','inventoryStatus','盘点状态','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','确认有误','inventoryStatus','盘点状态','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','未校验','invoiceStatus','发票状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','校验通过','invoiceStatus','发票状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','校验异常','invoiceStatus','发票状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','拒收','invoiceStatus','发票状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'vat','增值税专用发票','invoiceType','发票类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'general','增值税普通发票','invoiceType','发票类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'payment','非税收入一般缴款书','invoiceType','发票类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','允许登录','loginStatus','登录状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','禁止登录','loginStatus','登录状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','暂存','materialApplyStatus','','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待审批 ','materialApplyStatus','','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','科室审核通过','materialApplyStatus','','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','科室审核拒绝','materialApplyStatus','','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','器材处审核通过','materialApplyStatus','','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','器材处审核拒绝 ','materialApplyStatus','','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','处理中 ','materialApplyStatus','','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'08','处理完成 ','materialApplyStatus','','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','暂存','materialDictApplyStatus','','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待审批 ','materialDictApplyStatus','','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','科室审核通过','materialDictApplyStatus','','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','科室审核拒绝','materialDictApplyStatus','','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','器材处审核通过','materialDictApplyStatus','','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','器材处审核拒绝 ','materialDictApplyStatus','','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'00','待审核','materialSuplyStauts','物资供应关系审核状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','审核通过','materialSuplyStauts','物资供应关系审核状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审核拒绝','materialSuplyStauts','物资供应关系审核状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','冻结','materialSuplyStauts','物资供应关系审核状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','低值医用耗材','materialType','物资类别','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','高值医用耗材','materialType','物资类别','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','五金','materialType','物资类别','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','文具','materialType','物资类别','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','被服','materialType','物资类别','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','试剂','materialType','物资类别','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'18','家具','materialType','code列值“18”是与sap的对照值，必须是此值','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'11','专用设备','materialType','专用设备>1500 使用年限超过1年','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'12','通用设备','materialType','通用设备>1000 使用年限超过1年','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'13','维修备件','materialType','物资类别','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'14','维修服务','materialType','物资类别','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'16','手术器械','materialType','物资类别','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'15','其它','materialType','物资类别','13','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','不区分','materialUseType','耗材用后区分','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','植入','materialUseType','耗材用后区分','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','毁型','materialUseType','耗材用后区分','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','医院通知','noticeClassify','公告分类','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','合同','noticeClassify','公告分类','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','订单','noticeClassify','公告分类','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','其他','noticeClassify','公告分类','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'#','付款:网上银行支付','payment','支付方式','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'C','付款:转帐支票','payment','支付方式','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'I','付款:T/T电汇','payment','支付方式','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'J','付款:现金支票','payment','支付方式','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'L','付款:贷记凭证','payment','支付方式','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'M','付款:其他','payment','支付方式','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'N','付款:信汇','payment','支付方式','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'O','付款:银行汇票','payment','支付方式','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'P','付款:托收承付','payment','支付方式','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'Q','付款:委托付款','payment','支付方式','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'R','付款:银行本票','payment','支付方式','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'S','付款:现金','payment','支付方式','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T','付款:内部银行','payment','支付方式','13','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'U','付款:电传','payment','支付方式','14','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'V','付款:L/C信用证 ','payment','支付方式','15','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'W','付款:信用卡 ','payment','支付方式','16','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'X','付款:通知付款','payment','支付方式','17','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'Y','付款:银行承兑汇票','payment','支付方式','18','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'Z','付款:商业汇票','payment','支付方式','19','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'{','付款:D/A承兑交单票 ','payment','支付方式','20','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'}','付款:D/P付款交单','payment','支付方式','21','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'~','付款:保函','payment','支付方式','22','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T001','立即应付的 净到期','paymentCondition','付款条件','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T002','2 天之内 净到期','paymentCondition','付款条件','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T003','3 天之内 净到期','paymentCondition','付款条件','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T004','4 天之内 净到期','paymentCondition','付款条件','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T005','5 天之内 净到期','paymentCondition','付款条件','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T006','6天之内 净到期','paymentCondition','付款条件','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T007','7天之内 净到期','paymentCondition','付款条件','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T010','10 天之内 净到期','paymentCondition','付款条件','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T012','12 天之内 净到期','paymentCondition','付款条件','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T014','14 天之内 净到期','paymentCondition','付款条件','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T015','15 天之内 净到期','paymentCondition','付款条件','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T018','18 天之内 净到期','paymentCondition','付款条件','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T020','20 天之内 净到期','paymentCondition','付款条件','13','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T022','22 天之内 净到期','paymentCondition','付款条件','14','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T025','25 天之内 净到期','paymentCondition','付款条件','15','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T027','27 天之内 净到期','paymentCondition','付款条件','16','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T028','28 天之内 净到期','paymentCondition','付款条件','17','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T029','29 天之内 净到期','paymentCondition','付款条件','18','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T030','30 天之内 净到期','paymentCondition','付款条件','19','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T034','34 天之内 净到期','paymentCondition','付款条件','20','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T040','40 天之内 净到期','paymentCondition','付款条件','21','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T045','45 天之内 净到期','paymentCondition','付款条件','22','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T050','50 天之内 净到期','paymentCondition','付款条件','23','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T055','55 天之内 净到期','paymentCondition','付款条件','24','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T060','60 天之内 净到期','paymentCondition','付款条件','25','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T090','90 天之内 净到期','paymentCondition','付款条件','26','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T100','100 天之内 净到期','paymentCondition','付款条件','27','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T120','120 天之内 净到期','paymentCondition','付款条件','28','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T150','150 天之内 净到期','paymentCondition','付款条件','29','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T180','180 天之内 净到期','paymentCondition','付款条件','30','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T210','210 天之内 净到期','paymentCondition','付款条件','31','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T240','240 天之内 净到期','paymentCondition','付款条件','32','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T270','270 天之内 净到期','paymentCondition','付款条件','33','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T365','365 天','paymentCondition','付款条件','34','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'T540','18个月','paymentCondition','付款条件','35','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','全额付款','paymentMethod','付款方式','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','分批付款 ','paymentMethod','付款方式','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','已配货','poImportType','','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','配送中 ','poImportType','','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','已验收','poImportType','','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','拒收','poImportType','','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','已入库','poImportType','','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','医生','positionCategory','岗位分类','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','护士','positionCategory','岗位分类','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','研究','positionCategory','岗位分类','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','技术 ','positionCategory','岗位分类','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','管理','positionCategory','岗位分类','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','工人','positionCategory','岗位分类','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','未打印','printStatus','出库单(库存转移)状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','拣货出库单已打印','printStatus','出库单(库存转移)状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','出库单已打印','printStatus','出库单(库存转移)状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'1','国产','producedArea','产地','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'2','港澳台','producedArea','产地','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'3','进口','producedArea','产地','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待审批','purchaseType','采购订单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','审批通过','purchaseType','采购订单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审批拒绝','purchaseType','采购订单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','订单已接收','purchaseType','采购订单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','处理中','purchaseType','采购订单状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','处理完成','purchaseType','采购订单状态','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','退货单生成','revokeType','退货状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','退货完成','revokeType','退货状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','退货单取消','revokeType','退货状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待处理','serviceOrderStatus','服务订单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','处理中','serviceOrderStatus','服务订单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','待付款','serviceOrderStatus','服务订单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','待付款审核','serviceOrderStatus','服务订单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','待关联发票','serviceOrderStatus','服务订单状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','已完成','serviceOrderStatus','服务订单状态','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','保修服务(业务科室)','servicePaymentApprove','OA审批线标识','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','保修服务(器材处)','servicePaymentApprove','OA审批线标识','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待确认','servicePaymentStatus','服务付款状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待审核','servicePaymentStatus','服务付款状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','审核通过','servicePaymentStatus','服务付款状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','审核拒绝','servicePaymentStatus','服务付款状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'department','科室经费','sourceCode','经费来源','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'research','科研经费','sourceCode','经费来源','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'education','教育经费','sourceCode','经费来源','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'project','项目经费','sourceCode','经费来源','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'personal','个人经费','sourceCode','经费来源','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'A','自筹','sourceCode2','经费来源','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'B','财政','sourceCode2','经费来源','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'C','科研','sourceCode2','经费来源','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'D','教育','sourceCode2','经费来源','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'E','捐赠','sourceCode2','经费来源','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'F','配套','sourceCode2','经费来源','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待配货','sparesDelStatus','备件入库单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','已关联发票','sparesDelStatus','备件入库单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','配送中','sparesDelStatus','备件入库单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','已接收','sparesDelStatus','备件入库单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','拒收','sparesDelStatus','备件入库单状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待处理','sparesOrderType','备件采购订单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','处理中','sparesOrderType','备件采购订单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','处理完成','sparesOrderType','备件采购订单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待处理','sparesStatus','备件状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','处理中','sparesStatus','备件状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','已完成','sparesStatus','备件状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'110','北京','state','地区','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'120','天津','state','地区','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'130','河北','state','地区','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'140','山西','state','地区','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'150','内蒙古','state','地区','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'210','辽宁','state','地区','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'220','吉林','state','地区','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'230','黑龙江','state','地区','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'240','云南','state','地区','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'310','上海','state','地区','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'320','江苏','state','地区','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'330','浙江','state','地区','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'340','安徽','state','地区','13','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'350','福建','state','地区','14','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'360','江西','state','地区','15','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'370','山东','state','地区','16','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'410','河南','state','地区','17','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'420','湖北','state','地区','18','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'430','湖南','state','地区','19','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'440','广东','state','地区','20','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'450','广西','state','地区','21','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'460','海南','state','地区','22','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'500','重庆','state','地区','23','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'510','四川','state','地区','24','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'520','贵州','state','地区','25','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'530','云南','state','地区','26','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'540','西藏','state','地区','27','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'610','陕西','state','地区','28','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'620','甘肃','state','地区','29','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'630','青海','state','地区','30','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'640','宁夏','state','地区','31','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'650','新疆','state','地区','32','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'710','台湾','state','地区','33','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'810','香港','state','地区','34','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'820','澳门','state','地区','35','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待拣货','stockTransferType','库存转移单状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','待出库','stockTransferType','库存转移单状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','配送中','stockTransferType','库存转移单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','已入库','stockTransferType','库存转移单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','部分确认','stockTransferType','科室多次接收出库单物资中间状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','待收货','storagelistStatus','设备入库状态','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','已接收','storagelistStatus','设备入库状态','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','拒收','storagelistStatus','设备入库状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','待验收','storagelistStatus','设备入库状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'05','待关联发票','storagelistStatus','设备入库状态','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'06','待OA审核','storagelistStatus','设备入库状态','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','待缴纳质保金','storagelistStatus','设备入库状态','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'08','已结算','storagelistStatus','设备入库状态','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'09','待退还质保金','storagelistStatus','设备入库状态','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'10','科室待确认','storagelistStatus','设备入库状态','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','已同步','syncStatus','已同步默认供应商','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','未同步','syncStatus','未同步默认供应商','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'A','正式员工','userCategory','人员类别','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'B','临时合同工','userCategory','人员类别','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'C','退休人员','userCategory','人员类别','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'D','离休人员','userCategory','人员类别','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'E','外包人员','userCategory','人员类别','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'F','实习生','userCategory','人员类别','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'G','学生','userCategory','人员类别','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'H','进修人员','userCategory','人员类别','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'I','住院医师','userCategory','人员类别','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'J','劳务派遣人员','userCategory','人员类别','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'K','协作人员','userCategory','人员类别','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'lv1','一级库','whType','库等级','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'lv2','二级库','whType','库等级','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'lv0','逻辑库','whType','库等级','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'01','有效（过期）','certValidityType','资质有效类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'02','有效（1月内）','certValidityType','资质有效类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','有效（1-3月）','certValidityType','资质有效类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','有效（3-6月）','certValidityType','资质有效类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'中招国际招标有限公司','中招国际招标有限公司','tenderAgent','招标公司','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'中技国际招标有限公司','中技国际招标有限公司','tenderAgent','招标公司','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'中化国际招标有限责任公司','中化国际招标有限责任公司','tenderAgent','招标公司','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'中央国家机关政府采购中心','中央国家机关政府采购中心','tenderAgent','招标公司','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'其他','其他','tenderAgent','招标公司','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'无','无','tenderAgent','招标公司','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'11','待设定保管人','storagelistStatus','设备入库状态','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'12','待填写计量证书号','storagelistStatus','设备入库状态','12','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'1','一类','emtRisk','风险等级','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'2','二类','emtRisk','风险等级','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'3','三类','emtRisk','风险等级','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'03','待提交验收单','serviceOrderStatus','服务订单状态','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'04','验收单待审核','serviceOrderStatus','服务订单状态','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'07','发票待审核','serviceOrderStatus','服务订单状态','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'jpe','image/jpeg','mimeType','MIME类型','1','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'jpeg','image/jpeg','mimeType','MIME类型','2','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'jpg','image/jpeg','mimeType','MIME类型','3','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'gif','image/gif','mimeType','MIME类型','4','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'bmp','image/bmp','mimeType','MIME类型','5','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ico','image/x-icon','mimeType','MIME类型','6','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'xls','application/vnd.ms-excel','mimeType','MIME类型','7','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'doc','application/msword','mimeType','MIME类型','8','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','mimeType','MIME类型','9','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','mimeType','MIME类型','10','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'ppt','application/vnd.ms-powerpoint','mimeType','MIME类型','11','N');
insert into COM_DICT (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, DEL_FLAG) values (SEQ_COM_DICT.NEXTVAL,'pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation','mimeType','MIME类型','12','N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, 'approveType.salesReturn', '退货审批', 'approveType', '审批类型', 6, '10000001', to_date('16-02-2017 17:16:09', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-02-2017 17:16:30', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '06', '审批拒绝', 'revokeType', '退货状态', 6, '10000001', to_date('16-02-2017 13:49:56', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-02-2017 13:49:56', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '05', '审批通过', 'revokeType', '退货状态', 5, '10000001', to_date('16-02-2017 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-02-2017 13:49:32', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '04', '退货审批中', 'revokeType', '退货状态', 4, '10000001', to_date('16-02-2017 13:48:38', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-02-2017 13:48:55', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '01', '待审批', 'revokeType', '退货状态', 1, '', null, '10000001', to_date('16-02-2017 13:43:36', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001274, '00', '待审批', 'cancelStockStatus', 'MST|DTL;初始状态', 1, '10000001', to_date('30-12-2016 09:50:39', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('30-12-2016 09:50:39', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001275, '01', '审批中', 'cancelStockStatus', '	MST', 2, '10000001', to_date('30-12-2016 10:04:02', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('30-12-201610:04:02', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001276, '02', '审批通过', 'cancelStockStatus', 'MST|DTL;审批通过后续还有审批', 3, '10000001', to_date('30-12-2016 10:05:56', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('30-12-2016 10:05:56', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001278, '04', '退库成功', 'cancelStockStatus', '成功退库之后的状态', 5, '10000001', to_date('30-12-2016 10:08:09', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('30-12-2016 10:08:09', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001277, '03', '审批拒绝', 'cancelStockStatus', 'MST|DTL;审批拒绝', 4, '10000001', to_date('30-12-2016 10:06:30', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('30-12-2016 10:06:30', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '07', '订单取消中', 'purchaseType', '采购订单状态', 4, '10000001', to_date('18-04-2016 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '08', '订单已取消', 'purchaseType', '采购订单状态', 5, '10000001', to_date('23-02-2017 11:03:22', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('23-02-2017 11:03:37', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001442, '06', '已取消', 'stockTransferType', '库存转移单状态', 6, '10000001', to_date('31-03-2017 14:09:42', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('31-03-2017 14:09:56', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '01', '待审批', 'moveType', '移库单状态', 1, '10000001', to_date('21-03-2017 18:00:56', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('21-03-2017 18:00:56', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '02', '审批通过', 'moveType', '移库单状态', 2, '10000001', to_date('21-03-2017 18:02:05', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('21-03-2017 18:02:05', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '03', '审批拒绝', 'moveType', '移库单状态', 3, '10000001', to_date('21-03-2017 18:02:23', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('21-03-2017 18:02:23', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001449, '09', '已取消', 'materialApplyStatus', '申领单状态', 9, '10000001', to_date('06-04-2017 09:42:27', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('06-04-2017 09:42:27', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001307, '01', '待清点', 'checkStatus', '待清点', 1, '10000001', to_date('16-01-2017 14:53:36', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-01-2017 14:53:36', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001308, '02', '清点中', 'checkStatus', '清点中', 2, '10000001', to_date('16-01-2017 14:54:18', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-01-2017 14:56:01', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001309, '03', '待确认结果', 'checkStatus', '待确认结果', 3, '10000001', to_date('16-01-2017 14:54:54', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-01-2017 15:15:33', 'dd-mm-yyyy hh24:mi:ss'), 'Y');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001310, '04', '清点完成', 'checkStatus', '清点完成', 4, '10000001', to_date('16-01-2017 14:56:32', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-01-2017 14:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001311, '05', '已关闭', 'checkStatus', '清点单关闭', 5, '10000001', to_date('16-01-2017 14:56:59', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('16-01-2017 14:56:59', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001448, '03', '采购', 'emtRemarks', '设备采购处理备注', 3, '10000001', to_date('31-03-2017 17:43:43', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('31-03-2017 17:43:43', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001446, '01', '科室取消', 'emtRemarks', '设备采购处理备注', 1, '10000001', to_date('31-03-2017 17:06:29', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('31-03-2017 17:06:29', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (1001447, '02', '暂缓执行', 'emtRemarks', '设备采购处理备注', 2, '10000001', to_date('31-03-2017 17:07:31', 'dd-mm-yyyy hh24:mi:ss'), '10000001', to_date('31-03-2017 17:07:31', 'dd-mm-yyyy hh24:mi:ss'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (SEQ_COM_DICT.NEXTVAL, '00', '暂存', 'orderType', '设备订单状态', 1, null, null, null, null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (SEQ_COM_DICT.NEXTVAL, '01', '待处理', 'orderType', '设备采购订单状态', 2, null, null, null, null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (SEQ_COM_DICT.NEXTVAL, '02', '处理中', 'orderType', '设备采购订单状态', 3, null, null, null, null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (SEQ_COM_DICT.NEXTVAL, '03', '处理完成', 'orderType', '设备采购订单状态', 4, null, null, null, null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (SEQ_COM_DICT.NEXTVAL, '04', '订单已取消', 'orderType', '设备采购订单状态', 5, null, null, null, null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG) 
values (seq_com_dict.nextval, '01', '直接采购', 'negotiationWay', '谈判方式', 1, '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG) 
values (seq_com_dict.nextval, '02', '院内磋商', 'negotiationWay', '谈判方式', 2, '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG) 
values (seq_com_dict.nextval, '03', '公开招标', 'negotiationWay', '谈判方式', 3, '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), '10000001', to_date('10-01-2017', 'dd-mm-yyyy'), 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100560', '卫生材料库(无菌)', 'firstLibraryOutReport', '一级库出库查询排序', 1, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100109', '卫生材料库(低值)', 'firstLibraryOutReport', '一级库出库查询排序', 2, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100561', '卫生材料库(高值)', 'firstLibraryOutReport', '一级库出库查询排序', 3, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100012', '卫生材料库(试点)', 'firstLibraryOutReport', '一级库出库查询排序', 4, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100563', '卫生材料库(西院)', 'firstLibraryOutReport', '一级库出库查询排序', 5, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100001', '文具库', 'firstLibraryOutReport', '一级库出库查询排序', 6, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100004', '被服库', 'firstLibraryOutReport', '一级库出库查询排序', 7, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100110', '家具库', 'firstLibraryOutReport', '一级库出库查询排序', 8, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

insert into com_dict (DICT_ID, CODE, LABEL, TYPE, REMARK, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, DEL_FLAG)
values (seq_com_dict.nextval, '100108', '五金库', 'firstLibraryOutReport', '一级库出库查询排序', 9, '10000001', to_date('18-04-2017 17:31:07', 'dd-mm-yyyy hh24:mi:ss'), '', null, 'N');

delete from com_dict where type = 'serviceOrderStatus' and code in ('03','04');

update com_dict t 
set t.label = '保管人确认收货'
where t.type = 'storagelistStatus'
and t.sort = 10;
commit;



