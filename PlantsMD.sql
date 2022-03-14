#-- Copyright 2022 Google LLC
#--
#-- Licensed under the Apache License, Version 2.0 (the "License");
#-- you may not use this file except in compliance with the License.
#-- You may obtain a copy of the License at
#--
#--     https://www.apache.org/licenses/LICENSE-2.0
#--
#-- Unless required by applicable law or agreed to in writing, software
#-- distributed under the License is distributed on an "AS IS" BASIS,
#-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#-- See the License for the specific language governing permissions and
#-- limitations under the License.
CREATE OR REPLACE VIEW `{{ project_id_tgt }}.{{ dataset_reporting_tgt }}.PlantsMD`
OPTIONS(
  description = "Plants Master Data"
)
AS
SELECT T001W.MANDT AS Client_MANDT, T001W.WERKS AS Plant_WERKS,
  T001W.NAME1 AS Name_NAME1, T001W.BWKEY AS ValuationArea_BWKEY,
  T001W.KUNNR AS CustomerNumberOfPlant_KUNNR, T001W.LIFNR AS VendorNumberOfPlant_LIFNR,
  T001W.FABKL AS FactoryCalendarKey_FABKL, T001W.NAME2 AS Name2_NAME2,
  T001W.STRAS AS StreetAndHouseNumber_STRAS, T001W.PFACH AS PoBox_PFACH,
  T001W.PSTLZ AS PostalCode_PSTLZ, T001W.ORT01 AS City_ORT01,
  T001W.EKORG AS PurchasingOrganization_EKORG,
  T001W.VKORG AS SalesOrganizationForIntercompanyBilling_VKORG,
  T001W.CHAZV AS Indicator_BatchStatusManagementActive_CHAZV,
  T001W.KKOWK AS Indicator_ConditionsAtPlantLevel_KKOWK,
  T001W.KORDB AS Indicator_SourceListRequirement_KORDB,
  T001W.BEDPL AS ActivatingRequirementsPlanning_BEDPL, T001W.LAND1 AS CountryKey_LAND1,
  T001W.REGIO AS Region_County__REGIO, T001W.COUNC AS CountyCode_COUNC,
  T001W.CITYC AS CityCode_CITYC, T001W.ADRNR AS Address_ADRNR,
  T001W.IWERK AS MaintenancePlanningPlant_IWERK,
  T001W.TXJCD AS TaxJurisdiction_TXJCD,
  T001W.VTWEG AS DistributionChannelForIntercompanyBilling_VTWEG,
  T001W.SPART AS DivisionForIntercompanyBilling_SPART,
  T001W.SPRAS AS Language_SPRAS,
  T001W.WKSOP AS SopPlant_WKSOP, T001W.AWSLS AS VarianceKey_AWSLS,
  T001W.CHAZV_OLD AS Indicator_BatchStatusManagementActive_CHAZV_OLD,
  T001W.VLFKZ AS PlantCategory_VLFKZ, T001W.BZIRK AS SalesDistrict_BZIRK,
  T001W.ZONE1 AS SupplyRegion__regionSupplied___ZONE1,
  T001W.TAXIW AS TaxIndicator_Plant__purchasing___TAXIW,
  T001W.BZQHL AS TakeRegularVendorIntoAccount_BZQHL,
  T001W.LET01 AS NumberOfDaysForFirstReminderexpediter_LET01,
  T001W.LET02 AS NumberOfDaysForSecondReminderexpediter_LET02,
  T001W.LET03 AS NumberOfDaysForThirdReminderexpediter_LET03,
  T001W.TXNAM_MA1 AS TextNameOf1stDunningOfVendorDeclarations_TXNAM_MA1,
  T001W.TXNAM_MA2 AS TextNameOfThe2ndDunningOfVendorDeclarations_TXNAM_MA2,
  T001W.TXNAM_MA3 AS TextNameOf3rdDunningOfVendorDeclarations_TXNAM_MA3,
  T001W.BETOL AS NumberOfDaysForPoToleranceCompressInfoRecordsSu_BETOL,
  T001W.J_1BBRANCH AS BusinessPlace_J_1BBRANCH,
  T001W.VTBFI AS RuleForDeterminingTheSalesAreaForStockTransfers_VTBFI,
  T001W.FPRFW AS DistributionProfileAtPlantLevel_FPRFW,
  T001W.ACHVM AS CentralArchivingMarkerForMasterRecord_ACHVM,
  T001W.DVSART AS BatchRecord_TypeOfDmsUsed_DVSART,
  T001W.NODETYPE AS NodeType_SupplyChainNetwork_NODETYPE,
  T001W.NSCHEMA AS StructureForNameFormation_NSCHEMA,
  T001W.PKOSA AS CostObjectControllingLinkingActive_PKOSA,
  T001W.MISCH AS UpdatingIsActiveForMixedCosting_MISCH,
  T001W.MGVUPD AS UpdatingIsActiveInActualCosting_MGVUPD,
  T001W.VSTEL AS ShippingPointreceivingPoint_VSTEL,
  T001W.MGVLAUPD AS UpdateOfActivityConsumptionInTheQuantityStructure_MGVLAUPD,
  T001W.MGVLAREVAL AS ControlOfCreditOfCostCenters_MGVLAREVAL,
  T001W.SOURCING AS InvokeAddedFunctionSourceDeterminationViaAtp_SOURCING,
  --   T001W.FSH_MG_ARUN_REQ AS OrderAllocationRun_FSH_MG_ARUN_REQ,
  --   T001W.FSH_SEAIM AS Indicator_SeasonActiveInInventoryManagement_FSH_SEAIM,
  --   T001W.FSH_BOM_MAINTENANCE AS ControlDataForFashionBomMaintenance_FSH_BOM_MAINTENANCE,
  --   T001W.OILIVAL AS ExchangeValuationIndicator_OILIVAL,
  --   T001W.OIHVTYPE AS VendorType__refinerymillother_brazil_OIHVTYPE,
  --   T001W.OIHCREDIPI AS IpiCreditAllowed_OIHCREDIPI,
  T001W.STORETYPE AS StoreCategoryToDifferentiateStoreShop_STORETYPE,
  T001W.DEP_STORE AS SuperiorDepartmentStore_DEP_STORE
FROM `{{ project_id_src }}.{{ dataset_cdc_processed }}.t001w` AS T001W